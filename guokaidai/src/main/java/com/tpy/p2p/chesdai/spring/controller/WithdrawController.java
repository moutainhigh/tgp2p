package com.tpy.p2p.chesdai.spring.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.fund.WithdrawApplyAdminService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.exception.FinancialExceptionNotes;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.ProcessingService;
import com.tpy.p2p.chesdai.spring.service.UserBankService;
import com.tpy.p2p.chesdai.spring.service.WithdrawServices;
import com.tpy.p2p.chesdai.spring.util.Arith;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.WithdrawalInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baofoo.p2p.dto.request.FoChargePage;
import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.cddgg.commons.log.LOG;
import com.tpy.p2p.chesdai.admin.spring.service.MessagesettingService;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.admin.spring.service.systemset.ExpenseRatioService;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Validcodeinfo;
import com.tpy.p2p.chesdai.entity.Withdraw;
import com.tpy.p2p.chesdai.entity.WithdrawApply;

/**
 * 用户提现操作
 * 
 * @author frank 2014-09-3
 * 
 */
@Controller
@RequestMapping("/withdraw")
@CheckLogin(value = CheckLogin.WEB)
public class WithdrawController {

	@Resource
	private HibernateSupport dao;

	/** 提现sercices **/
	@Resource
	private WithdrawServices withdrawServices;

	@Resource
	private WithdrawApplyAdminService withdrawApplyAdminService;

	/** 用户银行卡信息services **/
	@Resource
	private UserBankService userBankService;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private MessagesettingService messagesettingService;

	@Resource
	private UserInfoQuery infoQuery;

	@Resource
	UserBankService bankService;

	@Resource
	private ExpenseRatioService expenseRatioService;

	@Resource
	private RequestService bfService;

	@Resource
	private ReceiveService receiveService;

	@Resource
	private ProcessingService processingService;

	@Resource
	private FinancialExceptionNotes financialExceptionNotes;

	/**
	 * 打开提现页面
	 * 
	 * @return 返回url
	 */
	@RequestMapping("openWithdraw")
	@CheckFundsSafe
	public String openWithdraw(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "no", required = false, defaultValue = "1") Integer no) {

		// 获取当前登陆用户信息
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		// request.setAttribute("user",userInfoServices.queryBasicsInfoById(u.getId().toString()));
		// get all records
		int count = withdrawServices.queryWithdrawApp(u).size();
		model.addAttribute("count", count);
		if (no >= (count + 9) / 10 && count > 10) {
			no = (count + 9) / 10;
		}
		model.addAttribute("pager", getPager(no, count));
		no = (no - 1) <= 0 ? 0 : (no - 1);
		String hql = "from WithdrawApply w where w.userbasicsinfo.id="
				+ u.getId() + " order by w.applyTime desc limit " + (no * 10)
				+ ",10";
		List<WithdrawApply> applys = (List<WithdrawApply>) dao.query(hql, false);
		request.setAttribute("userbank",bankService.getUserBank(u.getId()));
		request.setAttribute("applylist", applys);
		return "WEB-INF/views/member/withdraw/userbank";
	}

	/**
	 * 得到分页对象
	 * 
	 * @param curPage
	 * @param total
	 * @return
	 */
	private PageModel getPager(int curPage, long total) {
		PageModel pager = new PageModel();
		pager.setPageNum(curPage);
		pager.setNumPerPage(Constant.PAGE_SIZE_RECHARGE_RECORD);
		pager.setTotalCount(Integer.parseInt(total + ""));
		return pager;
	}

	/**
	 * 打开提现页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("withdraw")
	public String open(HttpServletRequest request) {
		return "WEB-INF/views/member/withdraw/withdraw";
	}

	/**
	 * 查询用户当前的所有的提现信息
	 * 
	 * @return 返回提现记录页面
	 */
	@RequestMapping("query.htm")
	public String queryWithdraw(String beginTime, String endTime,
			HttpServletRequest request, Integer pageNum) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(pageNum == null ? 1 : pageNum);
		List<Withdraw> bankList = withdrawServices.withdrawList(user.getId(),
				beginTime, endTime, page);
		page.setTotalCount(Integer.parseInt(withdrawServices.count(
				user.getId(), beginTime, endTime).toString()));
		request.setAttribute("bankList", bankList);
		request.setAttribute("beginTime", beginTime);
		request.setAttribute("endTime", endTime);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/withdraw/withdraw_record";
	}

	/**
	 * 分页查询
	 * 
	 * @param page
	 *            分页对象
	 * @param request
	 *            request
	 * @return 返回分页对象
	 */
	@RequestMapping("queryList")
	@ResponseBody
	public Page query(Page page, HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		List<Withdraw> list = withdrawServices.queryList(page, user.getId());
		page.setData(list);
		return page;
	}

	/**
	 * 用户提现操作
	 * 
	 * @param money
	 *            用户提现金额
	 * @param request
	 *            request
	 * @return 返回地址
	 */
	@RequestMapping("ipsWithdraw")
	public String ipsWithdraw(String id, String code,
			HttpServletRequest request, HttpServletResponse response) {
		// 获取当前登录账户信息
		Userbasicsinfo userbasic = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);

		FoChargePage entity = new FoChargePage();

		WithdrawalInfo withdraw = new WithdrawalInfo();
		WithdrawApply withdrawApply = null;
		if (withdrawServices.queryWithdrawApply(id) == null) {
			request.setAttribute("error", "数据出错");
			return "WEB-INF/views/failure";
		}
		withdrawApply = withdrawServices.queryWithdrawApply(id).get(0);
		if (withdrawApply.getResult() != 1) {
			request.setAttribute("error", "数据出错");
			return "WEB-INF/views/failure";
		}
		double money = withdrawApply.getApplyNum();
		// 格式化金额
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取费率比例
		Costratio cost = expenseRatioService.findCostratio();
		// 获取用户类型
		boolean isvip = infoQuery.isPrivilege(userbasic);
		// 设置1为平台支付，2为个人支付
		withdraw.setpIpsFeeType("2");
		if (isvip) {// 如果是Vip用户

			if (cost.getVipwithdraw() <= 0) {// 如果是优惠期则免手续费
				withdraw.setpTrdAmt(df.format(money));
			} else {// 否则用户付手续费给平台
				double withdrawFee = Arith.mul(money, cost.getVipwithdraw());
				// 如果超上限，则手续费金额为上限金额
				if (withdrawFee > cost.getVipwithdrawtop()) {
					withdrawFee = cost.getVipwithdrawtop();
				}
				// 用户提现金额
				withdraw.setpTrdAmt(df.format(Arith.sub(money, withdrawFee)));
				// 平台手续费
				withdraw.setpMerFee(df.format(withdrawFee));
			}

		} else {
			if (cost.getWithdraw() <= 0) {// 如果是优惠期则免手续费
				withdraw.setpTrdAmt(df.format(money));
			} else {// 否则用户付手续费给平台
				double withdrawFee = Arith.mul(money, cost.getWithdraw());
				// 用户提现金额
				withdraw.setpTrdAmt(df.format(Arith.sub(money, withdrawFee)));
				// 平台手续费
				withdraw.setpMerFee(df.format(withdrawFee));
			}
		}

		withdraw.setpIdentNo(userbasic.getUserrelationinfo().getCardId());
		withdraw.setpRealName(userbasic.getName());
		withdraw.setpIpsAcctNo(userbasic.getUserfundinfo().getpIdentNo());
		withdraw.setpDwDate(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		withdraw.setpMemo2(userbasic.getId().toString());
		try {
			// request.setAttribute("map",
			// withdrawServices.encryption(withdraw));
			// order_id 提现订单号（唯一）
			// merchant_id 商户号
			// user_id 用户编号(唯一)
			// user_name 用户名
			// amount 金额，单位：元
			// fee 平台收取的手续费, 元
			// fee_taken_on 宝付手续费，收取方
			// return_url 提现后台资源请求url
			/*
			 * String order_id; String amount; String fee; String fee_taken_on;
			 * String mer_fee; String code;
			 */
			
			entity.setOrder_id(id + "_"
					+ withdraw.getpMerBillNo());

			entity.setMerchant_id(com.tpy.p2p.pay.util.ParameterIps.getMercode());
			entity.setUser_id(userbasic.getId().toString());
			entity.setUser_name(userbasic.getUserName());
			entity.setAmount(withdraw.getpTrdAmt());
			entity.setFee(withdraw.getpMerFee());
			entity.setFee_taken_on(withdraw.getpIpsFeeType());
			/*String info = "";
			info += withdrawApply.getId() + "_" + withdraw.getpMerBillNo();
			info += "~~" + withdraw.getpTrdAmt() ;			
			info += "~~" + withdraw.getpMerFee();			
			info += "~~" + withdraw.getpIpsFeeType();
			info += "~~" + Constant.BF_SUCCESS;*/
			entity.setPage_url(Constant.WITHDRAWAL);
			entity.setReturn_url(Constant.WITHDRAWASYNCHRONOUS);

			bfService.page_foCharge(entity, response);
			withdrawApply.setResult(3);
			withdrawServices.update(withdrawApply);
			// withdrawApplyAdminService.updateResult(id + ",", 2);
			LOG.info("用户提现操作提交宝付——>用户编号:" + withdraw.getpMemo2() + "用户提现金额:"
					+ money + "用户提现流水号:" + withdraw.getpMerBillNo() + "提现时间:"
					+ withdraw.getpDwDate());
			return null;
			// return "WEB-INF/views/withdraw_news";
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("error", "数据出错");
		return "WEB-INF/views/failure";
	}

	/**
	 * 提现申请
	 */
	@ResponseBody
	@RequestMapping("withdrawApply")
	public String withdrawApply(double money,
			HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		WithdrawApply apply = new WithdrawApply();
		apply.setApplyNum(money);
		apply.setUserbasicsinfo(user);
		apply.setCash(user.getUserfundinfo().getCashBalance());
		apply.setResult(-1);
		apply.setStatus(0);
		apply.setApplyTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		withdrawServices.saveWithdrawApply(apply);
		String context = user.getName() + "申请了一笔额度为" + money + "的提现";
		String title = "提现申请";
		messagesettingService.alertAdminuser(user, context, title);
		return "success";
	}

	/**
	 * 后台申请审核列表
	 * 
	 * @return
	 */
	@RequestMapping("open")
	public JSONArray list() {
		JSONArray jsonArray = new JSONArray();
		List<WithdrawApply> applies = withdrawServices.listAllApply();
		for (WithdrawApply apply : applies) {
			JSONObject json = new JSONObject();
			json.element("id", apply.getId());
			json.element("cash", apply.getCash());
			json.element("applyNum", apply.getApplyNum());
			json.element("result", apply.getResult());
			json.element("status", apply.getStatus());
			json.element("answerTime", apply.getAnswerTime());
			json.element("applyTime", apply.getApplyTime());
			json.element("userName", apply.getUserbasicsinfo().getUserName());
			json.element("realName", apply.getUserbasicsinfo().getName());
			jsonArray.add(json);
		}
		return jsonArray;
	}

	/**
	 * 判断用户输入的验证码和发送的验证码是否一致
	 * 
	 * @param code  用户输入的验证码
	 * @param request request
	 * @return 返回状态
	 */
	@RequestMapping("codeJudge")
	@ResponseBody
	public String codeJudge(String code, HttpServletRequest request) {
		// 获取当前登录账户信息
		Userbasicsinfo userbasic = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);

		Validcodeinfo validcode = userBankService.codeUserId(userbasic.getId());
		// 验证短信验证码是否失效
		if (System.currentTimeMillis() > validcode.getSmsagainTime()) {
			return Constant.STATUES_ONE.toString();
		}
		// 验证用户所填写的验证码是否和发送的验证码一致
		if (!code.equals(validcode.getSmsCode())) {
			return Constant.STATUES_TWO.toString();
		}

		return Constant.STATUES_ZERO.toString();
	}
}
