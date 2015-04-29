package com.tpy.p2p.APP.admin.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.pay.entity.BidAssignment;
import com.tpy.p2p.pay.entity.BidInfo;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cddgg.commons.log.LOG;
import com.tpy.p2p.chesdai.entity.Accountinfo;
import com.tpy.p2p.chesdai.entity.Loanrecord;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.BorrowerFundService;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.PlankService;
import com.tpy.p2p.chesdai.spring.service.PresetService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.tpy.p2p.pay.payservice.RegisterService;

import freemarker.template.TemplateException;

/**
 * 用户购标
 * 
 * @author lsy 2014-09-10
 * 
 */
@Controller
@CheckLogin(value = CheckLogin.WEB)
@RequestMapping("/appplank")
public class APPPlankController {

	@Resource
	private PlankService plankService;

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private UserInfoQuery userInfoQuery;
	@Resource
	private LoanInfoService infoService;

	@Resource
	private BorrowerFundService borrowerFundService;

	@Resource
	private PresetService presetService;

	private DecimalFormat df = new DecimalFormat("0.00");

	/**
	 * 立即投标
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@CheckFundsSafe
	@RequestMapping(value = "getLoaninfo.htm", method = RequestMethod.POST)
	@ResponseBody
	public synchronized JSONObject getLoanInfo(Long id, Double money,
			String uid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> message = new HashMap<String, Object>();
		// 格式化金额为xxx.xx
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取当前用户的最新信息
		Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(uid);
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());

		// 测试时判断借款人是否已经注册环讯，如果没有，直接返回，避免500错误
		String loanUserpIdentNo = loan.getUserbasicsinfo().getUserfundinfo()
				.getpIdentNo();
		if (loanUserpIdentNo == null || loanUserpIdentNo.equals("")) {
			// 没有注册环讯调到注册环讯页面
			message.put("msg", "0");
			return JSONObject.fromObject(message);
			// return "WEB-INF/views/member/safetycenter/safetycenter";
		}
		// 获取用户的最大购买份数
		int count = infoService.getCount(loan, userinfo);

		if (money > count * loan.getLoanUnit()) {
			// 跳回原来的投标页面
			message.put("msg", "1");
			return JSONObject.fromObject(message);
			// return "WEB-INF/views/member/loan/loaninfo";
		}
		/*
		 * if(yuding==1){ Preset preset=new Preset();
		 * preset.setLoanMoney(money); money=money *0.01;
		 * preset.setBargainMoney(money);
		 * preset.setLoanSignId(Integer.parseInt(String.valueOf(loan.getId())));
		 * SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 * String date=sdf.format(new Date()); preset.setPresetTime(date);
		 * preset.setState(0); presetService.save(preset); }
		 */
		try {

			// "1" 代表手动投标
			BidInfo bid = new BidInfo(userinfo, loan, "1", money);

			/*
			 * if (infoService.isVip(userinfo)) { // vip费用=vip费用比率*投资金额 vip费用有上限
			 * bid.setpFee(String.valueOf(df.format(loan.getMfeetop() * money >=
			 * loan .getHighLines() ? loan.getHighLines() : loan .getMfeetop() *
			 * money))); } else { // 普通费用=费用比率*投资金额
			 * bid.setpFee(String.valueOf(df.format(loan.getMfeeratio()
			 * money))); }
			 */
			bid.setpFee(String.valueOf(df.format(0.00)));
			bid.setpMemo3(bid.getpFee());

			Map<String, String> map = plankService.encryption(bid);

			// map存放提交到环讯的地址和参数收到直接提交到对应参数的服务器
			message.put("map", map);
			// return "WEB-INF/views/bid_news";
			return JSONObject.fromObject(map);

		} catch (ParseException | IOException | TemplateException e) {
			message.put("msg", "2");
			LOG.error("数据加密失败");
			e.printStackTrace();
		}
		message.put("msg", "1");
		// return "WEB-INF/views/member/loan/loaninfo";
		return JSONObject.fromObject(message);
	}

	/**
	 * 环迅返回投标数据处理
	 * 
	 * @param pMerCode
	 *            平台账号
	 * @param pErrCode
	 *            充值状态(0000成功，9999失败)
	 * @param pErrMsgao
	 *            返回信息
	 * @param p3DesXmlPara
	 *            3des加密报文
	 * @param pSign
	 *            返回报文
	 * @param request
	 *            request
	 * @return 返回页面路径
	 */
	@RequestMapping("returnBid.htm")
	public synchronized String getBidInfo(ReturnInfo info,
			HttpServletRequest request) {
		// 判断是否成功
		if (info.getpErrCode().equals(Constant.SUCCESS)) {
			BidInfo bid = null;
			try {
				bid = (BidInfo) RegisterService.decryption(
						info.getP3DesXmlPara(), new BidInfo());
				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(bid.getpMemo2());

				// 获取该用户的账户资金
				BalanceInquiryInfo money = RegisterService
						.accountBalance(userinfo.getUserfundinfo()
								.getpIdentNo());
				// 获取标的详细信息
				Loansign loan = loanSignQuery.getLoansignById(bid.getpMemo1());
				Loanrecord loanrecord = new Loanrecord();
				// 投标时，记录该投资者是否vip
				loanrecord
						.setIsPrivilege(userInfoQuery.isPrivilege(userinfo) ? Constant.STATUES_ONE
								: Constant.STATUES_ZERO);
				loanrecord.setIsSucceed(Constant.STATUES_ONE);
				loanrecord.setLoansign(loan);
				loanrecord.setpMerBillNo(bid.getpMerBillNo());
				loanrecord.setTenderMoney(Double.parseDouble(bid.getpTrdAmt()));
				loanrecord.setTenderTime(DateUtils
						.format("yyyy-MM-dd HH:mm:ss"));
				loanrecord.setUserbasicsinfo(userinfo);
				// 记录用户流水账
				Accountinfo account = new Accountinfo();
				account.setAccounttype(null);
				account.setExpenditure(Double.parseDouble(bid.getpTrdAmt()));
				account.setExplan("购标");
				account.setIncome(0.00);
				account.setIpsNumber(bid.getpMerBillNo());
				account.setLoansignId(loan.getId());
				account.setMoney(Double.parseDouble(money.getpBalance()));
				account.setTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
				account.setUserbasicsinfo(userinfo);
				account.setAccounttype(plankService.accounttype(3L));
				Loansignbasics loanbase = loan.getLoansignbasics();
				if (null != loanbase.getMgtMoney()) {
					loanbase.setMgtMoney(loanbase.getMgtMoney()
							+ Double.parseDouble(bid.getpMemo3()));
				} else {
					loanbase.setMgtMoney(Double.parseDouble(bid.getpMemo3()));
				}
				plankService.update(loanrecord, account,
						Double.parseDouble(money.getpBalance()), loanbase);

				request.setAttribute("url", "member_index/member_center");
				return "WEB-INF/views/success";
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
				request.setAttribute("error", "数据处理失败");
				return "WEB-INF/views/failure";
			}

		} else {
			LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
			request.setAttribute("error", info.getpErrMsg());
			return "WEB-INF/views/failure";
		}

	}

	/**
	 * 债权转让立即投标
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@CheckFundsSafe
	@RequestMapping(value = "getLoanAssignmentinfo.htm", method = RequestMethod.POST)
	public synchronized JSONObject getLoanAssignmentInfo(Long id, Double money,
			String uid, HttpServletRequest request, HttpServletResponse response) {
		// 格式化金额为xxx.xx
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取当前用户的最新信息
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());

		// 测试时判断借款人是否已经注册环讯，如果没有，直接返回，避免500错误
		String loanUserpIdentNo = loan.getUserbasicsinfo().getUserfundinfo()
				.getpIdentNo();
		Map<String, Object> message = new HashMap<String, Object>();
		if (loanUserpIdentNo == null || loanUserpIdentNo.equals("")) {
			message.put("msg", "0");
			return JSONObject.fromObject(message);
			// return "WEB-INF/views/member/safetycenter/safetycenter";
		}
		// 获取用户的最大购买份数
		int count = infoService.getCount(loan, user);

		if (money > count * loan.getLoanUnit()) {
			message.put("msg", "1");
			return JSONObject.fromObject(message);
			// return "WEB-INF/views/member/loan/debtinfo";
		}
		String loanId = loanSignQuery.getLoanId(id.toString());
		// 获取原标的详细信息
		Loansign loanInfo = loanSignQuery.getLoansignById(loanId.toString());

		String userId = loanSignQuery.getUserDebt(id.toString());
		// 获取原标用户的信息
		Userbasicsinfo userInfo = userInfoServices.queryBasicsInfoById(userId
				.toString());
		// 获取原标的pMerBillNo
		String pMerBillNo = loanSignQuery.getpMerBillNo(loanId, userId);

		String flowid = loanSignQuery.getflowId(id.toString(), userId);
		Loansignflow loanSignflow = loanSignQuery.getLoansignflow(flowid
				.toString());

		double payMoney = 0.00;
		if (loanSignflow.getDistype().equals("1")) { // 折扣
			payMoney = money - money * loanSignflow.getAppreciation();
		} else if (loanSignflow.getDistype().equals("2")) { // 升值
			payMoney = money + money * loanSignflow.getAppreciation();
		} else {
			payMoney = money;
		}
		try {

			BidAssignment bidAssignment = new BidAssignment(userInfo, user,
					loanInfo, id.toString(), pMerBillNo, loanSignflow
							.getPcrettype().toString(), money, payMoney);
			// 当前用户受让方手续费
			// if (infoService.isVip(user)) {
			// // vip费用=vip费用比率*投资金额 vip费用有上限
			// bidAssignment.setpToFee(String.valueOf(df.format(loan
			// .getMfeetop() * payMoney >= loan.getHighLines() ? loan
			// .getHighLines() : loan.getMfeetop() * payMoney)));
			// } else {
			// // 普通费用=费用比率*投资金额
			// bidAssignment.setpToFee(String.valueOf(df.format(loan
			// .getMfeeratio() * payMoney)));
			// }
			bidAssignment.setpToFee(String.valueOf(df.format(0.00)));
			// 出让方手续费
			// if (infoService.isVip(userInfo)) {
			// // vip费用=vip费用比率*投资金额
			// bidAssignment.setpFromFee(String.valueOf(df.format(loan
			// .getMfeetop() * money >= loan.getHighLines() ? loan
			// .getHighLines() : loan.getMfeetop() * money)));
			// } else {
			// // 普通费用=费用比率*投资金额
			// bidAssignment.setpFromFee(String.valueOf(df.format(loan
			// .getMfeeratio() * money)));
			// }
			bidAssignment.setpFromFee(String.valueOf(df.format(0.00)));
			bidAssignment.setpMemo3(loanInfo.getId().toString());
			Map<String, String> map = plankService
					.encryptionAssignment(bidAssignment);
			return JSONObject.fromObject(map);
			// return "WEB-INF/views/bid_news";

		} catch (ParseException | IOException | TemplateException e) {
			message.put("msg", "2");
			LOG.error("数据加密失败");
			e.printStackTrace();
		}
		message.put("msg", "1");
		return JSONObject.fromObject(message);
	}

	/**
	 * 环迅返回债权转让投标数据处理
	 * 
	 * @param pMerCode
	 *            平台账号
	 * @param pErrCode
	 *            充值状态(0000成功，9999失败)
	 * @param pErrMsg
	 *            返回信息
	 * @param p3DesXmlPara
	 *            3des加密报文
	 * @param pSign
	 *            返回报文
	 * @param request
	 *            request
	 * @return 返回页面路径
	 */
	@RequestMapping(value = "returnBidAssignment.htm", method = RequestMethod.POST)
	public synchronized String getBidAssignment(ReturnInfo info,
			HttpServletRequest request) {
		// 判断是否成功
		if (info.getpErrCode().equals(Constant.SUCCESS)) {
			BidAssignment assignment = null;
			try {
				assignment = (BidAssignment) RegisterService.decryption(
						info.getP3DesXmlPara(), new BidAssignment());
				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(assignment.getpMemo2());
				// 获取该用户的账户资金
				BalanceInquiryInfo money = RegisterService
						.accountBalance(userinfo.getUserfundinfo()
								.getpIdentNo());
				// 获取标的详细信息
				Loansign loan = loanSignQuery.getLoansignById(assignment
						.getpMemo1());

				// 原标
				Loansign loansign = loanSignQuery.getLoansignById(assignment
						.getpMemo3());

				Loanrecord loanrecord = new Loanrecord();

				// 记录用户流水账
				Accountinfo account = new Accountinfo();
				account.setAccounttype(null);
				account.setExpenditure(Double.parseDouble(assignment
						.getpCretAmt()));
				account.setExplan("债权转让购标");
				account.setIncome(0.00);
				account.setIpsNumber(assignment.getpMerBillNo());
				account.setLoansignId(loan.getId());
				account.setMoney(Double.parseDouble(money.getpBalance()));
				account.setTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
				account.setUserbasicsinfo(userinfo);
				account.setAccounttype(plankService.accounttype(3L));

				String flowid = loanSignQuery.getflowId(assignment.getpMemo1());
				Loansignflow loanSignFlow = loanSignQuery
						.getLoansignflow(flowid);
				loanSignFlow
						.setUserAuth(Long.parseLong(assignment.getpMemo2()));
				loanSignFlow.setDiscountMoney(Double.parseDouble(assignment
						.getpPayAmt())); // 折扣金额

				// 获取原标的最新信息
				Userbasicsinfo userinfoLoan = userInfoServices
						.queryBasicsInfoById(loanSignFlow.getUserDebt()
								.toString());
				// 获取该用户的账户资金
				BalanceInquiryInfo moneyLoan = RegisterService
						.accountBalance(userinfoLoan.getUserfundinfo()
								.getpIdentNo());

				String id = loanSignQuery.getloanRecordId(loanSignFlow);
				Loanrecord loanrecordLoan = loanSignQuery.getLoanRecord(id);
				Integer pcrettype = loanSignFlow.getPcrettype();
				if (pcrettype == 1) { // 全部转让
					loanrecordLoan.setLoanId(loan.getId()); // 债权转让标ID
					loanrecordLoan.setUserbasicsinfo(userinfo);
					loanrecordLoan.setpMerBillNo(assignment.getpMerBillNo());
					loanrecordLoan.setTenderTime(DateUtils
							.format("yyyy-MM-dd HH:mm:ss"));
				} else { // 部分转让
					Double tenderMoney = loanrecordLoan.getTenderMoney()
							- Double.parseDouble(assignment.getpCretAmt()); // 原购买金额-债权面额
					loanrecordLoan.setTenderMoney(tenderMoney);
					loanrecord.setIsPrivilege(Constant.STATUES_ZERO);
					loanrecord.setIsSucceed(Constant.STATUES_ONE);
					loanrecord.setLoansign(loansign);// 原标ID
					loanrecord.setpMerBillNo(assignment.getpMerBillNo());
					loanrecord.setTenderMoney(Double.parseDouble(assignment
							.getpCretAmt()));
					loanrecord.setTenderTime(DateUtils
							.format("yyyy-MM-dd HH:mm:ss"));
					loanrecord.setUserbasicsinfo(userinfo);
					loanrecord.setLoanId(loan.getId()); // 债权转让标ID
				}
				Loansignbasics loanbase = loan.getLoansignbasics();
				if (null != loanbase.getMgtMoney()) {
					loanbase.setMgtMoney(loanbase.getMgtMoney()
							+ Double.parseDouble(assignment.getpToFee()));
				} else {
					loanbase.setMgtMoney(Double.parseDouble(assignment
							.getpToFee()));
				}
				plankService.update(loanrecord, account,
						Double.parseDouble(money.getpBalance()), loanSignFlow,
						loanrecordLoan,
						Double.parseDouble(moneyLoan.getpBalance()), loanbase);
				request.setAttribute("url", "member_index/member_center");
				return "WEB-INF/views/success";
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
				request.setAttribute("error", "数据处理失败");
				return "WEB-INF/views/failure";
			}

		} else {
			LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
			request.setAttribute("error", info.getpErrMsg());
			return "WEB-INF/views/failure";
		}

	}
}
