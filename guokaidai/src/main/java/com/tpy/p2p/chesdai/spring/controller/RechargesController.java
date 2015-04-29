package com.tpy.p2p.chesdai.spring.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.systemset.ExpenseRatioService;
import com.tpy.p2p.chesdai.entity.Recharge;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.pay.entity.RechargeInfo;
import com.tpy.p2p.pay.util.SumaPayUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.RechargesService;
import com.tpy.p2p.chesdai.spring.util.Arith;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baofoo.p2p.dto.request.RechargeDto;
import com.baofoo.p2p.service.RequestService;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Costratio;
import freemarker.template.TemplateException;

/**
 * 在线充值
 * 
 * @author RanQiBing 2014-01-26
 * 
 */
@Controller
@RequestMapping("recharge")
@CheckLogin(value = CheckLogin.WEB)
public class RechargesController {

	@Resource
	private RechargesService rechargesService;

	@Resource
	private ExpenseRatioService expenseRatioService;

	@Resource
	private UserInfoQuery infoQuery;

	@Resource
	private RequestService bfService;

	/**
	 * 打开在线支付页面
	 * 
	 * @param request
	 *            request
	 * @return 返回充值页面
	 */
	@RequestMapping("openRecharge")
	@CheckFundsSafe
	public String openRecharge(HttpServletRequest request) {
		// 获取银行信息列表

		// List<BankInfo> bank = RegisterService.bankList(); 银行信息直接从宝付页面列取
		// request.setAttribute("banks", bank);
		return "WEB-INF/views/member/recharge/recharge";
	}

	/**
	 * 打开在线充值记录查询页面
	 * 
	 * @param beginTime
	 *            开始时间
	 * @param endTime
	 *            结束时间
	 * @param request
	 *            request
	 * @return 返回页面地址
	 */
	@RequestMapping("openRechargeRecord")
	public String openRechargeRecord(String beginTime, String endTime,
			HttpServletRequest request, Integer pageNum) {
		// 获取当前登录用户的信息
		Userbasicsinfo userbasic = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(pageNum == null ? 1 : pageNum);
		// 获取提现信息列表
		List<Recharge> recharges = rechargesService.rechargeList(
				userbasic.getId(), beginTime, endTime, page);
		page.setTotalCount(Integer.parseInt(rechargesService.count(
				userbasic.getId()).toString()));
		request.setAttribute("total",
				rechargesService.totalAmount(userbasic.getId()));
		request.setAttribute("list", recharges);
		request.setAttribute("beginTime", beginTime);
		request.setAttribute("endTime", endTime);
		request.setAttribute("page", page);
		request.setAttribute("cur_date",
				DateUtils.format(DateUtils.DEFAULT_TIME_FORMAT));
		return "WEB-INF/views/member/recharge/recharge_record";
	}

	/**
	 * 在线充值提交(环迅支付)
	 * 
	 * @param rechargeType   充值类型
	 * @param tranAmt    在线充值金额
	 * @param bankinfo   银行名称
	 * @return 返回充值页面
	 */
	@RequestMapping("sign")
	public String onlineRecharge(String rechargeType, String tranAmt,
			String bankinfo, HttpServletRequest request) {
		// 格式化金额
		DecimalFormat df = new DecimalFormat("0.00");
		tranAmt = df.format(Float.parseFloat(tranAmt)).toString();
		// 获取当前登录用户的信息
		Userbasicsinfo userbasic = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		Costratio costratio = expenseRatioService.findCostratio();
		// 优惠期,手续费由平台出
		boolean isVip = infoQuery.isPrivilege(userbasic);
		// 将需要提交的信息放在一个实体对象里
		RechargeInfo rechargeInfo = new RechargeInfo();
		rechargeInfo.setpIpsFeeType(Constant.STATUES_ONE.toString());// 设置手续费为平台观
		if (isVip) {
			if (costratio.getViprecharge() <= 0) {
				rechargeInfo.setpTrdAmt(tranAmt);// 充值种类
			} else {
				// 手续费
				double rechargeFee = Arith.mul(Double.parseDouble(tranAmt),
                        costratio.getViprecharge());
				rechargeInfo.setpTrdAmt(df.format(Arith.sub(
						Double.parseDouble(tranAmt), rechargeFee)));// 充值种类
				rechargeInfo.setpMerFee(df.format(rechargeFee));// 手续费
			}
		} else {
			if (costratio.getRecharge() <= 0) {// 优惠期平台出手续费
				rechargeInfo.setpTrdAmt(tranAmt);// 充值种类
			} else {
				// 手续费
				double rechargeFee = Arith.mul(Double.parseDouble(tranAmt),
						costratio.getRecharge());
				rechargeInfo.setpTrdAmt(df.format(Arith.sub(
						Double.parseDouble(tranAmt), rechargeFee)));// 充值种类
				rechargeInfo.setpMerFee(df.format(rechargeFee));// 手续费
			}
		}
		rechargeInfo.setpIdentNo(userbasic.getUserrelationinfo().getCardId()); // 用户身份证号码
		rechargeInfo.setpRealName(userbasic.getName()); // 用户真实姓名
		rechargeInfo.setpIpsAcctNo(userbasic.getUserfundinfo().getpIdentNo()); // 用户从ips注册获得的账号

		rechargeInfo.setPChannelType(rechargeType); // 充值方式
		rechargeInfo.setpTrdBnkCode(bankinfo); // 充值银行
		rechargeInfo.setpMemo1(userbasic.getId().toString());
		rechargeInfo.setpMemo2(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		try {
			request.setAttribute("map",
					rechargesService.encryption(rechargeInfo));
			return "WEB-INF/views/recharge_news";
		} catch (freemarker.core.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 在线充值提交宝付
	 * 
	 * @param rechargeType
	 *            充值类型
	 * @param tranAmt
	 *            在线充值金额
	 * @param bankCode
	 *            银行编号
	 * @param bankinfo
	 *            银行名称
	 * @return 返回充值页面
	 */
	@RequestMapping("bfsign")
	public String onlineBFRecharge(String rechargeType, String tranAmt,
			String bankinfo, HttpServletRequest request,
			HttpServletResponse response) {
		// 格式化金额
		DecimalFormat df = new DecimalFormat("0.00");
		tranAmt = df.format(Float.parseFloat(tranAmt)).toString();
		// 获取当前登录用户的信息
		Userbasicsinfo userbasic = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		Costratio costratio = expenseRatioService.findCostratio();
		// 优惠期,手续费由平台出
		boolean isVip = infoQuery.isPrivilege(userbasic);
		// 将需要提交的信息放在一个实体对象里
		RechargeDto entity = new RechargeDto();
		entity.setAmount(tranAmt);
		double rechargeFee = new Double("0.00");
		if (isVip) {
			if (costratio.getViprecharge() > 0) {
				// 手续费
				rechargeFee = Arith.mul(Double.parseDouble(tranAmt),costratio.getViprecharge());
			}
		} else {
			if (costratio.getRecharge() > 0) {// 优惠期平台出手续费
				// 手续费
				rechargeFee = Arith.mul(Double.parseDouble(tranAmt),costratio.getRecharge());
			}
		}
		entity.setFee(df.format(rechargeFee));
		entity.setMerchant_id(com.tpy.p2p.pay.util.ParameterIps.getMercode());// 商户号
		entity.setUser_id(userbasic.getId().toString());// 用户编号
		String order_id = "CZ" + StringUtil.pMerBillNo();
		entity.setOrder_id(order_id);
		entity.setAdditional_info(userbasic.getId().toString());
		entity.setFee_taken_on("1");// 平台承担手续费
		entity.setPage_url(Constant.RECHARGEURL);
		entity.setReturn_url(Constant.ASYNCHRONISMRECHARGE);

		try {
			// request.setAttribute("map",
			// rechargesService.encryption(rechargeInfo));
			// return "WEB-INF/views/recharge_news";
			bfService.page_Recharge(entity, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/***
	 * 丰付充值接口
	 * @param bankcode  银行代码
	 * @param tranAmt	充值金额
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("ffsign")
	public String ffsign( String bankcode,
						  String tranAmt,
						  HttpServletRequest request,
						  HttpServletResponse response){

		System.out.println("bankcode::"+bankcode+"|tranAmt::"+tranAmt);

		Userbasicsinfo userbasicsinfo = (Userbasicsinfo)request.getSession().getAttribute(Constant.SESSION_USER);
		SumaPayUtils payUtil = new SumaPayUtils();
		String payurl = payUtil.doRecharge(tranAmt, bankcode,Integer.parseInt(String.valueOf(userbasicsinfo.getId())));

		//return payUrl;
		request.setAttribute("payurl", payurl);
		return "WEB-INF/views/member/recharge/recharge";
	}
}