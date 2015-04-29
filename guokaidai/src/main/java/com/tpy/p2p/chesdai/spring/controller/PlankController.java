package com.tpy.p2p.chesdai.spring.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.service.*;
import com.tpy.p2p.chesdai.util.Arith;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.BidAssignment;
import com.tpy.p2p.pay.entity.BidInfo;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.tpy.p2p.pay.payservice.RegisterService;
import com.tpy.p2p.pay.util.XmlParsingBean;

import freemarker.template.TemplateException;

/**
 * 用户购标
 * 
 * @author RanQiBing 2014-04-10
 * 
 */
@Controller
@CheckLogin(value = CheckLogin.WEB)
@RequestMapping("/plank")
public class PlankController {

	@Resource
	HibernateSupport dao;
	
	@Resource
	private PlankService plankService;

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private AccountService accountService;

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
	
	@Resource
	private RequestService bfService;
	
	@Resource 
	private ReceiveService receiveService;

	@Resource
	private LoanInfoService loanInfoService;

	public static ConcurrentHashMap<String,BidInfo> p2pRequestMap = new  ConcurrentHashMap<String,BidInfo>();


	/**
	 * @param id	标编号
	 * @param money		投标金额
	 * @param request
	 * @param response
	 * @return	返回标详细信息页面
	 *
	 */

	@RequestMapping("getLoaninfo.htm")
	public synchronized String  getLoanInfo(Long id, Double money,HttpServletRequest request, HttpServletResponse response) {
		LOG.info("PlankController getLoanInfo start");
		// 格式化金额为xxx.xx
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取当前用户
		Userbasicsinfo userinfo = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		// 获取当前用户的最新信息
		userinfo = userInfoServices.queryBasicsInfoById(userinfo.getId().toString());
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());

		// 获取用户的最大购买份数
		int count = infoService.getCount(loan, userinfo);

		if (money > count * loan.getLoanUnit()) {
			request.setAttribute("err_info","金额己超出最大购买份数!");
			return "WEB-INF/views/member/loan/loaninfo";
		}
		String order_id ="BID"+ StringUtil.pMerBillNo();

		/**
		 * 购标处理
		 */
		try {
			// 获取标的详细信息
			BidInfo bid = new BidInfo(userinfo, loan, "1", money);
			bid.setpFee("0");
			bid.setpMemo3("0");

			if( userinfo.getUserfundinfo().getCashBalance()>money) {
				if ( null != bid) {
					// 获取该用户的资金账户余额
					Double accountBalance = userinfo.getUserfundinfo().getCashBalance();
					//冻结资金
					Double frozenAmtN = money;
					if (userinfo != null) {
						plankService.update(userinfo.getUserfundinfo(), frozenAmtN);
						Loanrecord loanrecord = new Loanrecord();
						boolean isVIP = infoService.isVip(userinfo);
						if (isVIP) {
							loanrecord.setIsPrivilege(1);
						} else {
							loanrecord.setIsPrivilege(0);
						}
						loanrecord.setIsSucceed(Constant.STATUES_ONE);
						loanrecord.setLoansign(loan);
						//投标订单号
						loanrecord.setpMerBillNo(order_id);
						loanrecord.setTenderMoney(Double.parseDouble(bid.getpTrdAmt()));
						loanrecord.setTenderTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
						loanrecord.setUserbasicsinfo(userinfo);
						// 1.手动投标 2.自动投标(目前无自动投标)
						loanrecord.setIsAutomatic(1);

						// 记录用户流水账
						Accountinfo account = new Accountinfo();
						account.setAccounttype(null);
						account.setExpenditure(Double.parseDouble(bid.getpTrdAmt()));
						account.setExplan("投标");
						account.setIncome(0.00);
						account.setIpsNumber(bid.getpP2PBillNo());
						account.setLoansignId(loan.getId());
						account.setMoney(accountBalance);
						account.setTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
						account.setUserbasicsinfo(userinfo);
						account.setAccounttype(plankService.accounttype(21L));

						//更新借款标基础信息表（Loansignbasics）
						Loansignbasics loans = loan.getLoansignbasics();
						if (loan.getLoanType() != 7 && !loan.getLoanType().equals("7")) {
							if (null != loans.getMgtMoney()) {
								loans.setMgtMoney(loans.getMgtMoney() + Double.parseDouble(bid.getpFee()));
							} else {
								loans.setMgtMoney(0.00);
							}
						} else {
							loans.setMgtMoney(0.00);
						}
						plankService.update(loanrecord, account, accountBalance, loans);
						//更新SESSION_USER

						Userfundinfo ufi = userInfoQuery.getUserFundInfoBybasicId(userinfo.getId());
						userinfo.setUserfundinfo(ufi);
						request.getSession().setAttribute(Constant.SESSION_USER, userinfo);
						request.setAttribute("plankState", "1");
					} else {
						LOG.error("购标失败->失败原因:不能获取用户登录信息");
					}
				}else{
					LOG.error("购标失败->失败原因:标的信息有误" );
					request.setAttribute("plankState","0");
				}
			}else {
				LOG.error("购标失败->失败原因:你的帐户余额小于投资金额,请充值！" );
				LOG.error(userinfo.getUserfundinfo().getCashBalance()+":"+money);
				request.setAttribute("plankState","0");
			}
		} catch (Exception e) {
			LOG.error("购标失败->失败原因:" + e.getMessage(), e);
			request.setAttribute("plankState","0");
		} finally {
			// 防止内存溢出
//			if (null != resultDto) {
//				PlankController.p2pRequestMap.remove(resultDto.getOrder_id());
//			}
		}

		//Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		Double reMoney = 0.0000;
		Double tenderMoney = 0.0000;
		// 更新浏览数
		loanInfoService.save(loan);

		int days=loan.getLoansignbasics().getBidTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Long bidEndTime=0L;
		try {
			bidEndTime=sdf.parse(loan.getPublishTime()).getTime();
			bidEndTime+=days*24*60*60*1000;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("bidEndTime", bidEndTime);

		// 获取标的认购金额
		request.setAttribute("scale",Arith.div(loanSignQuery.getLoanrecordMoneySum(id),loan.getIssueLoan(), 2));
		request.setAttribute("loan", loan);

		// 得到结束时间
		// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		request.setAttribute("attachment",loanInfoService.getAttachment(id));
		// 得到还款记录
		request.setAttribute("creditRating", loanInfoService.getCreditRating(loan.getUserbasicsinfo().getId()));

		// 查询购买该标的人数
		Integer countNum = loanSignQuery.getBuyCount(id.toString());
		request.setAttribute("buyCount", countNum);
		// 查询剩余金额
		tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
		reMoney = loan.getIssueLoan() - tenderMoney;
		if (null != userinfo) {
			// 判断当前用户最大认购份数
			int maxcount = loanInfoService.getCount(loan, userinfo);
			request.setAttribute("maxMoney", maxcount * loan.getLoanUnit());
			request.setAttribute("maxCopies", maxcount);
			request.setAttribute("money", userinfo.getUserfundinfo().getMoney());
			request.setAttribute("logo", "logo");
		} else {
			request.setAttribute("maxMoney", 0);
			request.setAttribute("maxCopies", 0);
			request.setAttribute("money", 0);
			request.setAttribute("logo", "logoNot");
		}
		request.setAttribute("reMoney", reMoney);

		return "WEB-INF/views/member/loan/loaninfo";
	}

	/**
	 * 债权转让立即投标
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@CheckFundsSafe
	@RequestMapping("getLoanAssignmentinfo.htm")
	public synchronized String getLoanAssignmentInfo(Long id, Double money,
			HttpServletRequest request, HttpServletResponse response) {
		// 格式化金额为xxx.xx
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取当前用户(受让方(第三方))
		Userbasicsinfo userBasicInfo = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		// 获取当前用户的最新信息
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(userBasicInfo.getId().toString());
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());

		// 测试时判断借款人是否已经注册环讯，如果没有，直接返回，避免500错误
		String loanUserpIdentNo = loan.getUserbasicsinfo().getUserfundinfo()
				.getpIdentNo();
		if (loanUserpIdentNo == null || loanUserpIdentNo.equals("")) {

			return "WEB-INF/views/member/safetycenter/safetycenter";
		}
		// 获取用户的最大购买份数
		int count = infoService.getCount(loan, user);

		if (money > count * loan.getLoanUnit()) {
			return "WEB-INF/views/member/loan/debtinfo";
		}
		String loanId = loanSignQuery.getLoanId(id.toString());
		// 获取原标的详细信息
		Loansign loanInfo = loanSignQuery.getLoansignById(loanId.toString());

		String userId = loanSignQuery.getUserDebt(id.toString());
		// 获取原标用户的信息
		Userbasicsinfo userInfo = userInfoServices.queryBasicsInfoById(userId.toString());
		// 获取原标的pMerBillNo
		String pMerBillNo = loanSignQuery.getpMerBillNo(loanId, userId);

		String flowid = loanSignQuery.getflowId(id.toString(), userId);
		Loansignflow loanSignflow = loanSignQuery.getLoansignflow(flowid.toString());

		double payMoney = 0.00;
		if (loanSignflow.getDistype() == 1) { // 折扣
			payMoney = money - money * loanSignflow.getAppreciation();
		} else if (loanSignflow.getDistype() == 2) { // 升值
			payMoney = money + money * loanSignflow.getAppreciation();
		} else {
			payMoney = money;
		}
		try {
			BidAssignment bidAssignment = new BidAssignment(userInfo, user,loanInfo, id.toString(), pMerBillNo, loanSignflow.getPcrettype().toString(), money, payMoney);
			// 受让方手续费（当出款投资人)
			if (infoService.isVip(user)) {
				bidAssignment.setpToFee(String.valueOf(df.format(loan.getVipMfeeratio() * payMoney >= loan.getVipMfeetop() ? loan.getVipMfeetop() : loan.getVipMfeeratio() * payMoney)));
			} else {
				bidAssignment.setpToFee(String.valueOf(df.format(loan.getMfeeratio() * payMoney)));
			}
			// 求出投资手续费
			Double pmfee = loan.getShouldPmfee() * 1.00 * money
					/ loan.getIssueLoan();
			// 出让方手续费即出让债权（当作借款处理)
			bidAssignment.setpFromFee(String.valueOf(df.format(pmfee)));
			bidAssignment.setpMemo3(loanInfo.getId().toString());
			Map<String, String> map = plankService
					.encryptionAssignment(bidAssignment);

			request.setAttribute("map", map);

			return "WEB-INF/views/bid_news";

		} catch (ParseException | IOException | TemplateException e) {
			LOG.error("数据加密失败");
			e.printStackTrace();
		}
		return "WEB-INF/views/member/loan/debtinfo";
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
	@RequestMapping("returnBidAssignment.htm")
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
				account.setIpsNumber(assignment.getpP2PBillNo());
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

	/***
	 * 环迅返回自动投标规则数据处理
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
	@RequestMapping("returnAutomatic.htm")
	public synchronized String returnAutomatic(ReturnInfo info,
			HttpServletRequest request) {
		// 判断是否成功
		if (info.getpErrCode().equals(Constant.SUCCESS)) {
			Automatic automatic = null;
			try {
				String xml = XmlParsingBean.md52Xml(info.getP3DesXmlPara());
				automatic = (Automatic) XmlParsingBean.xml2Automatic(xml);
				String id = plankService.getAutomaticId(automatic
						.getpP2PBillNo());
				if (id.equals("")) {
					// 获取自动投标规则的情况
					String[] ids = automatic.getpMemo1().split("_");
					String userId = ids[0];
					Userbasicsinfo userbasicsinfo = userInfoServices.queryBasicsInfoById(userId.toString());
					automatic.setUserbasicsinfo(userbasicsinfo);
					automatic.setEntrytime(ids[1]);
					automatic.setpSigningDate(ids[2]);
					String[] idsTwo = automatic.getpMemo2().split("_");
					automatic.setpTrdCycleType(idsTwo[0]);
					automatic.setpValidType(idsTwo[1]);
					automatic.setState(1);
					automatic.setpIdentNo(userbasicsinfo.getUserrelationinfo().getCardId());
					automatic.setpRealName(userbasicsinfo.getName());
					automatic.setpIpsAcctNo(userbasicsinfo.getUserfundinfo().getpIdentNo());
					String[] idsThree = automatic.getpMemo3().split("_");
					automatic.setpSTrdCycleValue(Integer.parseInt(idsThree[0]));
					automatic.setpETrdCycleValue(Integer.parseInt(idsThree[1]));
					plankService.saveAutomatic(automatic);
				}
				request.setAttribute("url", "member_index/member_center");
				return "WEB-INF/views/success";
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环迅自动投标规则->失败原因:" + info.getP3DesXmlPara());
				request.setAttribute("error", "数据处理失败");
				return "WEB-INF/views/failure";
			}
		} else {
			LOG.error("环迅自动投标规则->失败原因:" + info.getP3DesXmlPara());
			request.setAttribute("error", info.getpErrMsg());
			return "WEB-INF/views/failure";
		}
	}
}