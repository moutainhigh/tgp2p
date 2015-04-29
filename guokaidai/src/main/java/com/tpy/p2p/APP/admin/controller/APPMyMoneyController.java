package com.tpy.p2p.APP.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.MemberCenterService;
import com.tpy.p2p.chesdai.spring.service.MyMoneyService;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 资金统计
 * 
 * @author lsy
 * 
 */
@Controller
@RequestMapping("/appmy_money")
@SuppressWarnings("rawtypes")
public class APPMyMoneyController {

	/**
	 * 用户基本信息接口
	 */
	@Resource
	private UserBaseInfoService userBaseInfoService;

	/**
	 * 部分资金接口
	 */
	@Resource
	private MemberCenterService memberCenterService;

	/**
	 * 资金统计接口
	 */
	@Resource
	private MyMoneyService myMoneyService;

	/**
	 * 资金统计
	 * 
	 * @param request
	 *            request
	 * @param response
	 *            response
	 * @return jsp
	 */
	@RequestMapping(value = "/my_money_sum", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject myMoneySum(HttpServletRequest request, Long uid,
			HttpServletResponse response) {
		Map<String, Object> meassage = new HashMap<String, Object>();
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		request.setAttribute("user", user);
		meassage.put("Money", user.getUserfundinfo().getMoney());
		meassage.put("FrozenAmtN", user.getUserfundinfo().getFrozenAmtN());
		// 用户的待收本金金额
		Object toBeClosed = myMoneyService.toBeClosed(user.getId());
		meassage.put("toBeClosed", toBeClosed);
		// 待付本息金额
		Object colltionPrinInterest = myMoneyService.colltionPrinInterest(user
				.getId());
		meassage.put("colltionPrinInterest", colltionPrinInterest);
		// 待确认投标
		Object lentBid = memberCenterService.investmentRecords(user.getId(), 2);
		meassage.put("lentBid", lentBid);
		// 逾期总额
		Object overude = myMoneyService.overude(user.getId());
		meassage.put("overude", overude);
		// 净值标总额（冻结金额）
		Object netMark = myMoneyService.netMark(user.getId());
		meassage.put("netMark", netMark);
		// 累计奖励
		Object accumulative = myMoneyService.accumulative(user.getId());
		meassage.put("accumulative", accumulative);
		// 平台累计支付
		Object adminAccumulative = myMoneyService.adminAccumulative(user
				.getId());
		meassage.put("adminAccumulative", adminAccumulative);

		// 净赚利息
		Object netInterest = myMoneyService.netInterest(user.getId());
		meassage.put("netInterest", netInterest);
		// 净付利息
		Object netInterestPaid = myMoneyService.netInterestPaid(user.getId());
		meassage.put("netInterestPaid", netInterestPaid);

		// 逾期还款违约金
		Object latePayment = myMoneyService.latePayment(user.getId());
		meassage.put("latePayment", latePayment);
		// 提前还款违约金
		Object prepayment = myMoneyService.prepayment(user.getId());
		meassage.put("prepayment", prepayment);

		// 累计支付会员费
		Object vipSum = myMoneyService.vipSum(user.getId());
		meassage.put("vipSum", vipSum);
		// 累计提现手续费
		Object witharwDeposit = myMoneyService.witharwDeposit(user.getId());
		meassage.put("witharwDeposit", witharwDeposit);
		// 累计充值手续费
		Object rechargeDeposit = myMoneyService.rechargeDeposit(user.getId());
		meassage.put("rechargeDeposit", rechargeDeposit);
		// 累计投资金额
		Object investmentRecords = myMoneyService.investmentRecords(user
				.getId());
		request.setAttribute("investmentRecords", investmentRecords);
		meassage.put("investmentRecords", investmentRecords);
		// 累计借入金额
		Object borrowing = myMoneyService.borrowing(user.getId());
		meassage.put("borrowing", borrowing);
		// 借款人管理费
		Object borrowersFee = myMoneyService.borrowersFee(user.getId());
		meassage.put("borrowersFee", borrowersFee);
		// 累计充值金额
		Object rechargeSuccess = myMoneyService.rechargeSuccess(user.getId());
		meassage.put("rechargeSuccess", rechargeSuccess);
		// 累计提现金额
		Object withdrawSucess = myMoneyService.withdrawSucess(user.getId());
		meassage.put("withdrawSucess", withdrawSucess);
		// 投资人累计支付佣金
		Object commission = myMoneyService.commission(user.getId());
		meassage.put("commission", commission);
		// 待收利息总额
		Object interestToBe = myMoneyService.interestToBe(user.getId());
		meassage.put("interestToBe", interestToBe);

		// 待扣借出服务费
		double lendingFees = myMoneyService.lendingFees(user.getId());
		meassage.put("lendingFees", lendingFees);
		// 待付利息总额
		Object colltionInterest = myMoneyService.colltionInterest(user.getId());
		meassage.put("colltionInterest", colltionInterest);
		return JSONObject.fromObject(meassage);
	}

	/**
	 * 查询流水类型
	 * 
	 * @param request
	 *            request
	 * @return jsp
	 */
	@RequestMapping("/my_money_sum_details")
	public JSONObject queryAccountType(HttpServletRequest request) {
		List list = myMoneyService.queryAccountType();
		request.setAttribute("list", list);
		return JSONObject.fromObject(list);

	}

	/**
	 * 分页查询资金历史记录
	 * 
	 * @param page
	 *            分页对象
	 * @param typeId
	 *            类型编号
	 * @param request
	 *            request
	 * @param response
	 *            response
	 * @return jsp
	 */
	@RequestMapping("/query_fund_page")
	public String queryFundPage(@ModelAttribute("PageModel") PageModel page,
			String typeId, Long uid, HttpServletRequest request,
			HttpServletResponse response) {
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		// 查询条数
		Integer count = myMoneyService.fundCount(user.getId(), typeId,
				beginDate, endDate);
		page.setTotalCount(count);
		// 查询记录
		List list = myMoneyService.queryFund(page, user.getId(), typeId,
				beginDate, endDate);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		return "/WEB-INF/views/member/myMoney/details";
	}
}
