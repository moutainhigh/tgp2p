package com.tpy.p2p.APP.admin.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.APP.admin.Util.MyUtil;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Validcodeinfo;
import com.tpy.p2p.chesdai.spring.service.WithdrawServices;
import net.sf.json.JSONObject;

import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cddgg.commons.log.LOG;
import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.MessagesettingService;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Withdraw;
import com.tpy.p2p.chesdai.entity.WithdrawApply;
import com.tpy.p2p.chesdai.spring.service.UserBankService;
import com.tpy.p2p.pay.entity.WithdrawalInfo;

import freemarker.template.TemplateException;

/**
 * 用户提现操作
 * 
 * @author lsy 2014-09-15
 * 
 */
@Controller
@RequestMapping("/appwithdraw")
public class APPWithdrawController {

	/** 提现sercices **/
	@Resource
	private WithdrawServices withdrawServices;

	/** 用户银行卡信息services **/
	@Resource
	private UserBankService userBankService;

	@Resource
	private UserInfoServices userInfoServices;
    @Resource
    private MessagesettingService messagesettingService;

	/**
	 * 打开提现页面
	 * 
	 * @return 返回url
	 */
	@RequestMapping(value = "openWithdraw", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject openWithdraw(HttpServletRequest request, String uid) {

		Userbasicsinfo u = userInfoServices.queryBasicsInfoById(uid);
		JSONObject res = new JSONObject();
		res.accumulate("userName", u.getUserName());
		res.accumulate("money", u.getUserfundinfo().getMoney());

		return res;
	}

	/**
	 * 提现申请
	 */
	@ResponseBody
	@RequestMapping(value = "withdrawApply", method = RequestMethod.POST)
	public JSONObject withdrawApply(double money, String uid,
			HttpServletRequest request) {
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
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
		return JSONObject.fromObject("succeed");
	}

	/**
	 * 查询用户当前的所有的提现信息 分页构造参数顺序int pageNum, int numPerPage
	 * 
	 * @return 返回提现记录数据
	 */
	@RequestMapping(value = "query.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject queryWithdraw(String beginTime, String endTime,
			String uid, int pageNum, int numPerPage, HttpServletRequest request) {
		// Userbasicsinfo user= (Userbasicsinfo)
		// request.getSession().getAttribute(Constant.SESSION_USER);
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		PageModel page = new PageModel(pageNum, numPerPage);
		Map<String, Object> message = new HashMap<String, Object>();
		List<Withdraw> bankList = withdrawServices.withdrawList(user.getId(),
				beginTime, endTime, page);
		List<Object> encrypBankList = new ArrayList<Object>();
		for (Withdraw vv : bankList) {
			encrypBankList.add(vv);
		}
		JSONObject jsonBankList = MyUtil.AllEntityValue(encrypBankList);
		message.put("banklist", jsonBankList);
		page.setTotalCount(Integer.parseInt(withdrawServices.count(
				user.getId(), beginTime, endTime).toString()));
		message.put("beginTime", beginTime);
		message.put("endTime", endTime);
		message.put("pageNum", page.getPageNum());
		message.put("numPerPage", page.getNumPerPage());
		return JSONObject.fromObject(message);
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
	@RequestMapping(value = "ipsWithdraw", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject ipsWithdraw(String money, String code, String uid,
			HttpServletRequest request) {
		// 获取当前登录账户信息
		Userbasicsinfo userbasic = userInfoServices.queryBasicsInfoById(uid);
		Map<String, Object> message = new HashMap<String, Object>();
		WithdrawalInfo withdraw = new WithdrawalInfo();
		// 格式化金额
		DecimalFormat df = new DecimalFormat("0.00");
		withdraw.setpIdentNo(userbasic.getUserrelationinfo().getCardId());
		withdraw.setpRealName(userbasic.getName());
		withdraw.setpIpsAcctNo(userbasic.getUserfundinfo().getpIdentNo());
		withdraw.setpDwDate(DateUtils.format("yyyyMMdd"));
		withdraw.setpTrdAmt(df.format(Double.parseDouble(money)));
		withdraw.setpMemo2(userbasic.getId().toString());
		try {
			request.setAttribute("map", withdrawServices.encryption(withdraw));
			LOG.info("用户提现操作提交环讯——>用户编号:" + withdraw.getpMemo2() + "用户提现金额:"
					+ money + "用户提现流水号:" + withdraw.getpMerBillNo() + "提现时间:"
					+ withdraw.getpMemo2());
			message.put("msg", "1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			message.put("msg", "0");
			e.printStackTrace();
		} catch (TemplateException e) {
			message.put("msg", "0");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return JSONObject.fromObject(message);
	}

	/**
	 * 判断用户输入的验证码和发送的验证码是否一致
	 * 
	 * @param code
	 *            用户输入的验证码
	 * @param request
	 *            request
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
