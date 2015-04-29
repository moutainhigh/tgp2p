package com.tpy.p2p.chesdai.spring.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.sms.SmsResult;
import com.tpy.base.spring.exception.ResponseException;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.admin.spring.service.MessagesettingService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.enums.ENUM_FINANCIAL_EXCEPTION;
import com.tpy.p2p.chesdai.exception.FinancialExceptionNotes;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.core.service.RepaymentrecordService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.payservice.RegisterService;
import org.jfree.util.Log;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baofoo.p2p.dto.receive.FoChargePageDto;
import com.baofoo.p2p.dto.receive.RechargeDto;
import com.baofoo.p2p.dto.receive.ResultDto;
import com.baofoo.p2p.service.ReceiveService;
import com.ips.security.utility.IpsCrypto;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.entity.Accountinfo;
import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.chesdai.entity.Loanrecord;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Loansignflow;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.entity.WithdrawApply;
import com.tpy.p2p.chesdai.spring.service.AdminService;
import com.tpy.p2p.chesdai.spring.service.BorrowerFundService;
import com.tpy.p2p.chesdai.spring.service.EmailService;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.chesdai.spring.service.PlankService;
import com.tpy.p2p.chesdai.spring.service.ProcessingService;
import com.tpy.p2p.chesdai.spring.service.SmsService;
import com.tpy.p2p.chesdai.spring.service.WithdrawServices;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.BidAssignment;
import com.tpy.p2p.pay.entity.BidInfo;
import com.tpy.p2p.pay.entity.RechargeInfo;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.tpy.p2p.pay.entity.Transfer;
import com.tpy.p2p.pay.entity.WithdrawalInfo;
import com.tpy.p2p.pay.util.XmlParsingBean;

import freemarker.template.TemplateException;

/**
 * 处理宝付返回的信息
 * 
 * @author zhuangwenbo 2014-12-23
 * 
 */
@Controller
@RequestMapping("/return")
public class ReturnController {

	@Resource
	private HibernateSupport dao;

	@Resource
	private ProcessingService processingService;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private FinancialExceptionNotes financialExceptionNotes;

	@Resource
	private AdminService adminService;

	@Resource
	private WithdrawServices withdrawServices;

	@Resource
	private BaseLoansignService baseLoansignService;

	@Resource
	private LoanManageService loanManageService;

	@Resource
	private BorrowerFundService borrowerFundService;

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private PlankService plankService;

	@Resource
	private UserInfoQuery infoQuery;

	@Resource
	private LoanInfoService infoService;

	@Resource
	private UserInfoQuery userInfoQuery;

	@Resource
	private UserInfoServices infoServices;
	@Resource
	private RepaymentrecordService repaymentrecordService;

	@Resource
	private SmsService smsService;

	@Resource
	private EmailService emailService;
	@Resource
	private MessagesettingService messagesettingService;
	/**
	 * 宝付接受请求类
	 */
	@Resource
	private ReceiveService receiveService;

	@Resource
	private RegisterService registerService;

	/**
	 * 用户注册信息处理
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
	 * 
	 */
	@RequestMapping("registration.htm")
	public synchronized String registration(HttpServletRequest request) {
		request.setAttribute("url", "member_index/member_center");
		return "WEB-INF/views/success";
	}

	/**
	 * 注册异步处理
	 * 
	 * @param returnInfo
	 *            宝付返回信息
	 */
	@RequestMapping("asynchronismRegistration.htm")
	public synchronized void asynchronismRegistration(String result,
			String sign, HttpServletRequest request) {
		// if ((Constant.SUCCESS).equals(returnInfo.getpErrCode())) {

		try {
			ResultDto dto = receiveService
					.page_BindBaoofooAccount(result, sign);
			if (Constant.BF_SUCCESS.equals(dto.getCode())) {
				// RegisterInfo registerInfo = (RegisterInfo)
				// RegisterService.decryption(returnInfo.getP3DesXmlPara(), new
				// RegisterInfo());
				// 得到当前用户信息
				Userbasicsinfo userbasics = userInfoServices
						.queryBasicsInfoById(dto.getUser_id());
				if (StringUtil.isBlank(userbasics.getUserfundinfo().getpIdentNo())) {
					boolean bool = processingService.registrationBF(userbasics);
					if (!bool) {
						LOG.error("宝付注册成功->平台数据处理失败->开户宝付账号:"
								+ userbasics.getUserrelationinfo().getPhone()
								+ " 开户时间:"
								+ DateUtils.format("yyyy-MM-dd hh:mm:ss"));
					}
				}
			} else {
				LOG.error("宝付注册失败->失败原因:" + dto.getMsg() + dto.getCode());
			}
		} catch (Exception e) {

			LOG.error("宝付注册->返回数据解析失败->返回数据为:" + result, e);
		}

		// } else {
		// LOG.error("环讯注册失败->失败原因:" + returnInfo.getP3DesXmlPara());
		// }
	}

	/**
	 * 用户充值返回处理
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
	 * @return 返回页面路径
	 */
	@RequestMapping("recharge.htm")
	public synchronized String recharge(ReturnInfo returnInfo,
			HttpServletRequest request) {
		request.setAttribute("url", "member_index/member_center");
		return "WEB-INF/views/success";
	}

	/**
	 * 宝付充值异步返回
	 * 
	 * @param returnInfo
	 * @param request
	 */
	@RequestMapping("asynchronismRecharge.htm")
	public synchronized void asynchronismRecharge(String result, String sign,
			HttpServletRequest request) {

		// LOG.info("接受到宝付的返回请求result = "+
		// result+";sign="+sign+";"+request.getRemoteHost());

		try {
			RechargeDto rechargeDto = receiveService
					.page_Recharge(result, sign);
			String code = rechargeDto.getCode();
			if (!Constant.BF_SUCCESS.equals(code)) {// 如果充值不成功
				LOG.error("宝付充值失败--》失败原因:" + code + "--》充值用户ID:"
						+ rechargeDto.getAdditional_info());
			}
			RechargeInfo recharge = new RechargeInfo();
			Userbasicsinfo user = userInfoServices
					.queryBasicsInfoById(rechargeDto.getAdditional_info());
			LOG.info("返回的充值CODE=" + rechargeDto.getCode());

			recharge.setpTrdAmt(rechargeDto.getIncash_money());
			recharge.setpMemo1(rechargeDto.getAdditional_info());
			recharge.setpMemo2(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			.format(new Date()));
			recharge.setpIpsBillNo(rechargeDto.getOrder_id());
			recharge.setpMerBillNo(rechargeDto.getOrder_id());
			boolean bool = processingService.recharge(recharge);
			if (!bool) {
				try {
					financialExceptionNotes
							.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,
									"充值[S]-->宝付确认充值[S]-->添加充值记录及修改用户账户余额[F];MSG:宝付充值已成功,我方提现数据处理失败,回滚宝付资金！;ERR:",
									user,
									String.valueOf(recharge.getpTrdAmt()),
									null, null);
					LOG.error("宝付充值成功->平台充值数据保存失败->充值金额:"
							+ recharge.getpTrdAmt() + " 平台充值订单号:"
							+ recharge.getpMerBillNo() + " 宝付充值订单号:"
							+ recharge.getpIpsBillNo() + " 充值时间:"
							+ recharge.getpMemo2() + "当前充值用户编号:"
							+ recharge.getpMemo1());
				} catch (ResponseException e) {
					LOG.error("接受到宝付返回值处理出现异常", e);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOG.error("接受到宝付返回值处理出现异常", e);
		}
	}

	/**
	 * 用户提现返回处理
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
	@RequestMapping("withdrawal.htm")
	public synchronized String withdrawal(String result, String sign,
			HttpServletRequest request, String info) {

		request.setAttribute("url", "member_index/member_center");
		return "WEB-INF/views/success";
	}

	/**
	 * 宝付充值异步返回
	 * 
	 * @param returnInfo
	 * @param request
	 */
	@RequestMapping("withdrawAsynchronous.htm")
	public synchronized void withdrawAsynchronous(String result, String sign,
			HttpServletRequest request) {
		FoChargePageDto focharge1 = null;
		try {
			focharge1 = receiveService.page_foCharge(result, sign);
		} catch (Exception e) {
			LOG.error("宝付提现失败->失败原因(" + e.getMessage() + ")");
		}
		WithdrawalInfo withInfo = new WithdrawalInfo();
		withInfo.setpDwDate(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		Userbasicsinfo userbasicsinfo = null;
		WithdrawApply withdrawApply = null;
		if (null != focharge1
				&& Constant.BF_SUCCESS.equals(focharge1.getCode())) {
			String withdrawApplyID = focharge1.getOrder_id().split("_")[0];
			withdrawApply = withdrawServices
					.queryWithdrawApply(withdrawApplyID).get(0);
			userbasicsinfo = withdrawApply.getUserbasicsinfo();
			withInfo.setpIdentNo(userbasicsinfo.getUserfundinfo().getpIdentNo());
			withInfo.setpIpsAcctNo(userbasicsinfo.getUserfundinfo()
					.getpIdentNo());
			withInfo.setpIpsBillNo(focharge1.getOrder_id());
			withInfo.setpIpsFeeType(focharge1.getFee_taken_on());
			withInfo.setpMemo2(userbasicsinfo.getId() + "");
			withInfo.setpMerBillNo(focharge1.getOrder_id());
			withInfo.setpTrdAmt(focharge1.getAmount());
			withInfo.setpMerFee(focharge1.getFee());
		}
		if (null != withInfo) {
			try {
				int num = processingService.accountInfoNum(withInfo
						.getpIpsBillNo());

				if (num <= 0) {
					processingService.withdrlwal(withInfo, userbasicsinfo);
					boolean bool = processingService.withdrlRecordByBF(
							withInfo, withdrawApply);
					if (!bool) {
						try {
							financialExceptionNotes
									.note(ENUM_FINANCIAL_EXCEPTION.EXTRACT,
											"提现[S]-->宝付确认提现[S]-->添加提现记录及修改用户账户余额[F];MSG:宝付提现已成功,我方提现数据处理失败,回滚宝付资金！;ERR:",
											userbasicsinfo, String
													.valueOf(withInfo
															.getpTrdAmt()),
											null, null);
							LOG.error("宝付提现成功->平台提现数据保存失败->提现金额:"
									+ withInfo.getpTrdAmt() + " 平台提现订单号:"
									+ withInfo.getpMerBillNo() + " 宝付提现订单号:"
									+ withInfo.getpIpsBillNo() + " 提现时间:"
									+ withInfo.getpDwDate() + "当前提现用户编号:"
									+ withInfo.getpMemo2());
						} catch (ResponseException e) {
							LOG.info(e);
						}
						withdrawApply.setResult(1);
						withdrawServices.update(withdrawApply);
					}
					LOG.error("宝付提现成功");

				}
			} catch (Exception e) {
				e.printStackTrace();
				LOG.info(e);
				withdrawApply.setResult(1);
				withdrawServices.update(withdrawApply);
			}

		}

	}

	/**
	 * 还款返回处理(同步处理) 同步下只返回受理状态结果，而将结果异步返回
	 * 
	 * @param pMerCode
	 *            平台账号
	 * @param pErrCode
	 *            MG00008F IPS 受理中
	 * @param pErrMsg
	 *            状态非MG00000F 时，反馈实际原因。
	 * @param p3DesXmlPara
	 *            3des加密报文
	 * @param pSign
	 *            返回报文
	 * @return 返回充值成功的页面
	 */
	@RequestMapping("repayment.htm")
	public synchronized String repayment(String result, String sign,
			HttpServletRequest request) {
		ResultDto resultDto;
		try {
			resultDto = receiveService.page_p2pRequest(result);

			if ((Constant.BF_SUCCESS).equals(resultDto.getCode())) {

				// 获取借款人还款资金信息=====还需要得到该用户是否为特权用户
				// ExpensesInfo expensesInfo =
				// borrowerFundService.getBorrowerFund(repaymentrecord, 1);
				// ---------------------修改当前期的还款情况
				// repaymentrecord.setRealMoney(expensesInfo.getInterest());
				// repaymentrecord.setRepayTime(DateUtils
				// .format("yyyy-MM-dd HH:mm:ss"));
				String[] ids = resultDto.getOrder_id().split("_");
				// 得到还款信息
				Repaymentrecord repaymentrecord = baseLoansignService
						.getRepaymentId(Long.parseLong(ids[0]));
				repaymentrecord.setpIpsBillNo(ids[1]);
				repaymentrecord.setpMerBillNo(ids[1]);
				repaymentrecord.setpIpsTime1(DateUtils
						.format("yyyy-MM-dd HH:mm:ss"));
				processingService.updateRayment(repaymentrecord);
				// ----------------------
				request.getSession()
						.setAttribute(
								Constant.SESSION_USER,
								repaymentrecord.getLoansign()
										.getUserbasicsinfo());
				request.setAttribute("url", "/member_index/member_center");

				return "WEB-INF/views/success";
			} else {
				LOG.error("宝付还款失败->失败原因:(" + resultDto.getCode() + ")");
				request.setAttribute("error", resultDto.getMsg());
				return "WEB-INF/views/failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			return "WEB-INF/views/failure";
		}
	}

	/**
	 * 发送自动还款通知
	 * 
	 * @param repaymentrecord
	 * @param loan
	 * @param result
	 */
	private void sendAutoRepayAdvice(Repaymentrecord repaymentrecord,
			Loansign loan, String result, String errMsg) {
		Object[] obj = repaymentrecordService.getContact(repaymentrecord
				.getId());
		final StringBuilder content = new StringBuilder(obj[0] == null ? ""
				: obj[0].toString().concat(":"));
		StringBuilder adviceClient = new StringBuilder();
		adviceClient.append("标号为:").append(obj[6].toString());
		adviceClient.append("标题为:").append(obj[7].toString()).append(" ");
		adviceClient.append("期限为:").append(obj[10].toString()).append(" ");
		adviceClient.append(loan.getLoansignType().getTypename());
		adviceClient.append(",第").append(obj[12].toString()).append("期自动还款");
		content.append("您好!您在太平洋理财的").append(adviceClient).append(result);
		LOG.info(content.toString());
		repaymentrecord.setAutoRepayAdvice(1);
		if (!errMsg.equals("")) {
			adviceClient.append(",").append(errMsg);
			messagesettingService.alertAdminuser(loan.getUserbasicsinfo(),
					adviceClient.toString(), "自动还款异常");
		}
		LOG.info(content.toString());
		final String phone = obj[2].toString();
		final String address = obj[5].toString();
		new Thread(new Runnable() {
			@Override
			public void run() {
				// 三次发送失败就不发送
				for (int i = 0; i <= 3; i++) {
					try {
						SmsResult sms = smsService.sendSMS(content.toString(),
								phone);
						if (sms.isSuccess())
							return;
					} catch (Exception e) {
						LOG.error("发送自动还款通知短信失败".concat(e.getMessage()));
					}
				}
			}
		}).start();
		new Thread(new Runnable() {
			@Override
			public void run() {
				// 三次发送失败就不发送
				for (int i = 0; i <= 3; i++) {
					try {
						emailService.sendEmail("自动还款通知", content.toString(),
								address);
						return;
					} catch (Exception e) {
						LOG.error("发送自动还款通知短信失败".concat(e.getMessage()));
					}
				}
			}
		}).start();

	}

	/**
	 * 放款异步处理
	 * 
	 * @param returnInfo
	 *            返回信息
	 * @param request
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 */
	@RequestMapping("loans.htm")
	public synchronized void asynchronismLoans(ReturnInfo returnInfo,
			HttpServletRequest request) throws FileNotFoundException,
			UnsupportedEncodingException {
		// if(Constant.SUCCESS.equals(returnInfo.getpErrCode())||Constant.Transfer_Accepted.equals(returnInfo.getpErrCode())){
		if (Constant.SUCCESS.equals(returnInfo.getpErrCode())) {
			// if(ParameterIps.pianText(returnInfo)){
			Transfer transfer = null;
			String xml = com.tpy.p2p.pay.util.XmlParsingBean.md52Xml(returnInfo.getP3DesXmlPara());
			transfer = (Transfer) com.tpy.p2p.pay.util.XmlParsingBean.xml2Transfer(xml);
			// 获取标的情况
			String[] ids = transfer.getpMemo3().split(":");

			Loansign loan = loanSignQuery.getLoansignById(ids[0]);
			// 判断数据是否已处理
			int num = processingService
					.accountInfoNum(transfer.getpIpsBillNo());
			if (num <= 0) {

				// 对借款人账户的处理
				boolean bool = processingService.tenderAudit(loan
						.getUserbasicsinfo(), transfer, request, loan
						.getLoansignbasics().getMgtMoney());
				if (!bool) {
					Log.error("环迅放款成功-->我方放款失败-->数据处理失败-->还款ips编号:"
							+ transfer.getpIpsBillNo() + "还款标号:" + loan.getId());
				}

			}
			// 当标的类型不为流转标的时候生成还款计划
			if (!loan.getLoanType().equals(
					Constant.STATUES_FOUR)) {
				// 生成还款计划
				try {
					int nums = processingService.repaymentNum(loan.getId());
					if (nums <= 0) {
						baseLoansignService.repaymentRecords(loan);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			// }
		}
	}

	/**
	 * 债权转让放款异步处理
	 * 
	 * @param returnInfo
	 *            返回信息
	 * @param request
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 */
	@RequestMapping("loansAssignment.htm")
	public synchronized void asynchronismLoansAssignment(ReturnInfo returnInfo,
			HttpServletRequest request) throws FileNotFoundException,
			UnsupportedEncodingException, Exception {
		if (Constant.SUCCESS.equals(returnInfo.getpErrCode())) {
			Transfer transfer = null;
			String xml = com.tpy.p2p.pay.util.XmlParsingBean.md52Xml(returnInfo.getP3DesXmlPara());
			transfer = (Transfer) com.tpy.p2p.pay.util.XmlParsingBean.xml2TransferOne(xml);
			// 获取标的情况
			String[] ids = transfer.getpMemo3().split(":");
			Loansign loan = loanSignQuery.getLoansignById(ids[0]);
			if (loan.getLoanstate() != 4) {
				// 判断数据是否已处理
				int num = processingService.accountInfoNum(transfer
						.getpIpsBillNo());
				if (num <= 0) {
					// 对借款人账户的处理
					boolean bool = processingService.tenderAudit(loan
							.getUserbasicsinfo(), transfer, request, loan
							.getLoansignbasics().getMgtMoney());
					if (!bool) {
						Log.error("环迅放款成功-->我方放款失败-->数据处理失败-->还款ips编号:"
								+ transfer.getpIpsBillNo() + "还款标号:"
								+ loan.getId());
					}
				}
				loan.setLoanstate(4);
				processingService.updateLoan(loan);
			}
		}
	}

	/**
	 * 投标异步处理
	 * 
	 * @param info
	 *            返回异步信息
	 */
	@RequestMapping("asynchronismBid.htm")
	public synchronized void asynchronismBid(String result,
			HttpServletRequest request) {
		LOG.error("接受到宝付投标处理的业务" + result);
		ResultDto resultDto = null;
		try {
			resultDto = receiveService.page_p2pRequest(result);
			// 获取标的详细信息
			BidInfo bid = PlankController.p2pRequestMap.get(resultDto
					.getOrder_id());
			if (null != resultDto && null != bid) {
				// 获取标的详细信息
				Loansign loan = loanSignQuery.getLoansignById(bid.getpMemo1());

				if (resultDto.getCode().equals(Constant.BF_SUCCESS)) {
					asynchronismAuto(resultDto, bid, loan);
				} else {
					LOG.error("宝付购标失败->失败原因:" + resultDto.getCode());
				}
			}

		} catch (Exception e) {
			LOG.error("宝付购标失败->失败原因:" + e.getMessage(), e);
		} finally {
			// 防止内存溢出
			if (null != resultDto) {
				PlankController.p2pRequestMap.remove(resultDto.getOrder_id());
			}

		}

	}

	private synchronized void asynchronismAuto(ResultDto resultDto,
			BidInfo bid, Loansign loan) {
		// String[] ids=bid.getpMemo2().split("_");
		String[] ids = bid.getpMemo2().split("_");

		// 获取当前用户的最新信息
		Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(ids[0]);
		// 获取该用户的账户资金
		String money = registerService.accountBFBalance(ids[0]);

		Loanrecord loanrecord = new Loanrecord();
		boolean isVIP = infoService.isVip(userinfo);
		if (isVIP) {
			loanrecord.setIsPrivilege(1);
		} else {
			loanrecord.setIsPrivilege(0);
		}

		loanrecord.setIsSucceed(Constant.STATUES_ONE);
		loanrecord.setLoansign(loan);
		loanrecord.setpMerBillNo(resultDto.getOrder_id());
		loanrecord.setTenderMoney(Double.parseDouble(bid.getpTrdAmt()));
		loanrecord.setTenderTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		loanrecord.setUserbasicsinfo(userinfo);
		if (ids[1].trim().equals("1")) {
			loanrecord.setIsAutomatic(1); // 手动投标
		}
		if (ids[1].trim().equals("2")) {
			loanrecord.setIsAutomatic(2);// 自动动投标
		}
		// 记录用户流水账
		Accountinfo account = new Accountinfo();
		account.setAccounttype(null);
		account.setExpenditure(Double.parseDouble(bid.getpTrdAmt()));
		account.setExplan("投标");
		account.setIncome(0.00);
		account.setIpsNumber(bid.getpP2PBillNo());
		account.setLoansignId(loan.getId());
		account.setMoney(Double.parseDouble(money));
		account.setTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		account.setUserbasicsinfo(userinfo);
		account.setAccounttype(plankService.accounttype(21L));

		Loansignbasics loans = loan.getLoansignbasics();
		if (loan.getLoanType() != 7 && !loan.getLoanType().equals("7")) {
			if (null != loans.getMgtMoney()) {
				loans.setMgtMoney(loans.getMgtMoney()
						+ Double.parseDouble(bid.getpFee()));
			} else {
				loans.setMgtMoney(0.00);
			}

		} else {
			loans.setMgtMoney(0.00);
		}
		plankService.update(loanrecord, account, Double.parseDouble(money),
				loans);

	}

	/**
	 * 环迅返回投标数据处理
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
	@RequestMapping("returnBid.htm")
	public synchronized String returnBid(String result, String orderId,
			HttpServletRequest request) {
		request.setAttribute("orderId", orderId);
		return "WEB-INF/views/returnBid_news";
	}

	@RequestMapping("ifAsynchronismBid.htm")
	public String ifAsynchronismBid(String orderId, HttpServletRequest request) {
		int time = 10;
		while (null != PlankController.p2pRequestMap.get(orderId) && time > 0) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			time--;
		}
		request.setAttribute("url", "member_index/member_center");
		return "WEB-INF/views/success";
	}

	/**
	 * 债权转让投标异步处理
	 * 
	 * @param info
	 *            返回异步信息
	 */
	@RequestMapping("asynchronismBidAssignment.htm")
	public synchronized void asynchronismBidAssignment(ReturnInfo info) {
		// 判断是否成功
		if (info.getpErrCode().equals(Constant.SUCCESS)) {
			BidAssignment assignment = null;
			try {
				assignment = (BidAssignment) RegisterService.decryption(
						info.getP3DesXmlPara(), new BidAssignment());
				// 判断数据是否已处理
				int num = processingService.accountInfoNum(assignment
						.getpP2PBillNo());
				if (num > 0) {
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
					Loansign loansign = loanSignQuery
							.getLoansignById(assignment.getpMemo3());

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

					String flowid = loanSignQuery.getflowId(assignment
							.getpMemo1());
					Loansignflow loanSignFlow = loanSignQuery
							.getLoansignflow(flowid);
					loanSignFlow.setUserAuth(Long.parseLong(assignment
							.getpMemo2()));
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
						loanrecordLoan
								.setpMerBillNo(assignment.getpMerBillNo());
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
							Double.parseDouble(money.getpBalance()),
							loanSignFlow, loanrecordLoan,
							Double.parseDouble(moneyLoan.getpBalance()),
							loanbase);
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
			}
		} else {
			LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
		}

	}

	/***
	 * 环迅自动投标规则设置
	 * 
	 * @param info返回异步信息
	 */
	@RequestMapping("asynchronismAutomatic.htm")
	public void asynchronismAutomatic(ReturnInfo info,
			HttpServletRequest request) {
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
					Userbasicsinfo userbasicsinfo = userInfoServices
							.queryBasicsInfoById(userId.toString());
					automatic.setUserbasicsinfo(userbasicsinfo);
					automatic.setEntrytime(ids[1]);
					automatic.setpSigningDate(ids[2]);

					String[] idsTwo = automatic.getpMemo2().split("_");
					automatic.setpTrdCycleType(idsTwo[0]);
					automatic.setpValidType(idsTwo[1]);
					automatic.setState(1);
					automatic.setpIdentNo(userbasicsinfo.getUserrelationinfo()
							.getCardId());
					automatic.setpRealName(userbasicsinfo.getName());
					automatic.setpIpsAcctNo(userbasicsinfo.getUserfundinfo()
							.getpIdentNo());

					String[] idsThree = automatic.getpMemo3().split("_");
					automatic.setpSTrdCycleValue(Integer.parseInt(idsThree[0]));
					automatic.setpETrdCycleValue(Integer.parseInt(idsThree[1]));
					plankService.saveAutomatic(automatic);
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环迅自动投标规则->失败原因:" + info.getP3DesXmlPara());
			}
		} else {
			LOG.error("环迅自动投标规则->失败原因:" + info.getP3DesXmlPara());
		}
	}

	/**
	 * 
	 * 异步接收IPS返回标的注册信息
	 * 
	 * @param info
	 *            返回的数据
	 * @param request
	 * @return
	 * @throws
	 */
	@RequestMapping("pubback.htm")
	public void pubBack(ReturnInfo info, HttpServletRequest request,
			HttpServletResponse response) {
		Loansign loansign = null;
		RegisterSubject subject = null;
		if (info.getpErrCode() == null)
			return;
		// ips返回标的募集中的标志。收到消息后，修改数据库数据，同时发布到首页
		if (info.getpErrCode().equals(
				Constant.OP_LOANSIGN)) {
			try {
				subject = (RegisterSubject) XmlParsingBean.simplexml1Object(
						info.getP3DesXmlPara(), new RegisterSubject());
				loansign = loanSignQuery.getLoansignById(subject.getpMemo1());
				Loansignbasics lb = loansign.getLoansignbasics();
				// IPS会异步尝试5次数据返回。如果前面的返回已经接收并处理过，就不必再继续了
				if (lb.getpIpsTime() == null) {

					lb.setpIpsBillNo(subject.getpIpsBillNo());
					lb.setpIpsTime(subject.getpIpsTime());
					lb.setpMerBillNo(subject.getpMerBillNo());
					loansign.setLoansignbasics(lb);
					boolean bool = baseLoansignService.publish(loansign);
					if (loansign.getLoanType() != 7) {
						automaticRelease(loansign, request);
					}
				} else {
					return;
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		// 标结束，异步返回。收到结束标记后，修改数据
		else if (info.getpErrCode().equals(
				Constant.ENDED_LOANSIGN)) {
			try {
				subject = (RegisterSubject) com.tpy.p2p.pay.util.XmlParsingBean.simplexml1Object(
                        info.getP3DesXmlPara(), new RegisterSubject());
				loansign = loanSignQuery.getLoansignById(subject.getpMemo1());
				if (loansign.getEndTime() == null) {
					Loansignbasics lb = loansign.getLoansignbasics();
					lb.setpIpsBillNo(subject.getpIpsBillNo());
					loansign.setLoansignbasics(lb);
					loansign.setLoanstate(4);
					loansign.setEndTime(DateUtils.formatSimple());
					baseLoansignService.endLoan(loansign);
				} else {
					return;
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 自动投标
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	public void getLoanInfoAutomatic(Long userId, Long id, Double money,
			String pAuthNo, HttpServletRequest request,
			HttpServletResponse response) {
		// 格式化金额为xxx.xx
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取当前用户的最新信息
		Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(userId
				.toString());
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());

		try {
			// "2" 代表自动投标
			BidInfo bid = new BidInfo(userinfo, loan, "2", money, pAuthNo);

			if (infoService.isVip(userinfo)) {
				// vip费用=vip费用比率*投资金额 vip费用有上限
				bid.setpFee(String.valueOf(df.format(loan.getVipMfeeratio()
						* money >= loan.getVipMfeetop() ? loan.getVipMfeetop()
						: loan.getVipMfeeratio() * money)));
			} else {
				// 普通费用=费用比率*投资金额
				bid.setpFee(String.valueOf(df.format(loan.getMfeeratio()
						* money)));
			}
			bid.setpMemo3(bid.getpFee());
			String bidxml = com.tpy.p2p.pay.util.ParseXML.bidXml(bid);
			String desede = IpsCrypto.triDesEncrypt(bidxml,
					com.tpy.p2p.pay.util.ParameterIps.getDes_algorithm(),
					com.tpy.p2p.pay.util.ParameterIps.getDesedevector());
			request.setAttribute("desede", desede);
			RegisterCreditorServlet registerCreditor = new RegisterCreditorServlet();
			registerCreditor.doPost(request, response);

		} catch (Exception e) {
			LOG.error("数据加密失败");
			e.printStackTrace();
		}
	}

	/***
	 * 自动投标
	 * 
	 * @param loansign
	 * @return
	 */
	public boolean automaticRelease(Loansign loansign,
			HttpServletRequest request) {
		// 获取当前有效的自动设置参数
		StringBuffer sql = new StringBuffer(
				"select * from automatic a where a.state=1 ");
		List<Automatic> automList = dao.findBySql(sql.toString(),
				Automatic.class);
		try {
			Object obj = null;
			List list = new ArrayList();
			Integer loanUnit = 0;
			for (Automatic automatic : automList) {
				// 1、自己的借款标不能投
				if (loansign.getLoanType() != 3
						&& automatic.getUserbasicsinfo().getId()
								.equals(loansign.getUserbasicsinfo().getId())) {
					continue;
				}
				String newDate = DateUtils.format("yyyy-MM-dd"); // 获得当前时间
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				// 2、有效期，自动投标规则参数中，根据新增时间判断，最终不在有效期里的时间不能投标
				String pValidDate = automatic.getpValidDate();
				Date d1 = df.parse(pValidDate);
				Date d2 = df.parse(newDate);
				if (d1.getTime() < d2.getTime()) {
					continue;
				}
				// 3、判断借款标的借款周期是否在标的借款周期最小值，最大值里
				if (automatic.getpTrdCycleType().trim().equals("D")) { // 标的借款周期为D-天
					if (loansign.getMonth() * 30 < automatic
							.getpSTrdCycleValue()) {
						continue;
					}

					if (loansign.getMonth() * 30 > automatic
							.getpETrdCycleValue()) {
						continue;
					}

				} else if (automatic.getpTrdCycleType().trim().equals("M")) {// 标的借款周期为M-月

					if (loansign.getMonth() < automatic.getpSTrdCycleValue()) { //
						continue;
					}

					if (loansign.getMonth() > automatic.getpETrdCycleValue()) {
						continue;
					}
				}
				// 4、判断借款标的借款额度限额是否在标的借款额度限额最小值，最大值里
				if (loansign.getLoanUnit() < Double.parseDouble(automatic
						.getpSAmtQuota())) {
					continue;
				}

				if (loansign.getIssueLoan() > Double.parseDouble(automatic
						.getpEAmtQuota())) {
					continue;
				}

				// 5、判断借款标的利率是否在标的利率限额最小值，最大值里
				if (loansign.getRate() < Double.parseDouble(automatic
						.getpSIRQuota()) / 100) {
					continue;
				}
				if (loansign.getRate() > Double.parseDouble(automatic
						.getpEIRQuota()) / 100) {
					continue;
				}

				// 6、判断用户账户金额是否小于借款标的最小投标金额
				Userfundinfo userfundinfo = userInfoQuery
						.getUserFundInfoBybasicId(automatic.getUserbasicsinfo()
								.getId());

				if (loansign.getLoanUnit() > userfundinfo.getCashBalance()) {
					continue;
				}

				// 7、判断借款标是否满标了
				sql = new StringBuffer(
						"SELECT ls.issueLoan-IFNULL(SUM(lr.tenderMoney),0) FROM loanrecord lr,loansign ls where lr.loanSign_id=ls.id and lr.isSucceed=1 and ls.id=")
						.append(loansign.getId());
				obj = (Object) dao.findObjectBySql(sql.toString());
				if (obj != null && Double.parseDouble(obj.toString()) < 1.00) {
					continue;
				}

				// 8、判断用户是否已经投标
				sql = new StringBuffer(
						"SELECT COUNT(1) from loanrecord where userbasicinfo_id=")
						.append(automatic.getUserbasicsinfo().getId())
						.append(" and loanSign_id=").append(loansign.getId());
				obj = (Object) dao.findObjectBySql(sql.toString());
				if (obj != null && Integer.parseInt(obj.toString()) > 0) {
					continue;
				}
				// 9、测试时判断借款人是否已经注册环讯，如果没有，直接返回，避免500错误
				String loanUserpIdentNo = loansign.getUserbasicsinfo()
						.getUserfundinfo().getpIdentNo();
				if (loanUserpIdentNo == null || loanUserpIdentNo.equals("")) {
					continue;
				}
				// 10、判断用户是否已经投标
				if (list.contains(automatic.getUserbasicsinfo().getId())) {
					continue;
				} else {
					list.add(automatic.getUserbasicsinfo().getId());
				}

				// 11、获取用户的最大购买份数
				int count = infoService.getCount(loansign,
						loansign.getUserbasicsinfo());

				if (loansign.getLoanUnit() > count * loansign.getLoanUnit()) {
					continue;
				}

				// 12、判断借款标是否满标了
				loanUnit = loanUnit + loansign.getLoanUnit();
				if (loansign.getIssueLoan() < loanUnit) {
					continue;
				}
				// this.getLoanInfoAutomatic(automatic.getUserbasicsinfo().getId(),
				// loansign.getId(),Double.parseDouble(loansign.getLoanUnit().toString())
				// , automatic.getpIpsAuthNo(),request,response);
				AutoBid(automatic.getUserbasicsinfo().getId(),
						loansign.getId(),
						Double.parseDouble(loansign.getLoanUnit().toString()),
						automatic.getpIpsAuthNo());
			}
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	/***
	 * 自动投标
	 * 
	 * @param loansign
	 * @return
	 */
	public void AutoBid(Long userId, Long id, Double money, String pAuthNo)
			throws IOException, TemplateException, Exception {
		// 格式化金额为xxx.xx
		DecimalFormat df = new DecimalFormat("0.00");
		// 获取当前用户的最新信息
		Userbasicsinfo userinfo = infoServices.queryBasicsInfoById(userId
				.toString());
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		try {
			// "2" 代表自动投标
			BidInfo bid = new BidInfo(userinfo, loan, "2", money, pAuthNo);
			if (infoService.isVip(userinfo)) {
				// vip费用=vip费用比率*投资金额 vip费用有上限
				bid.setpFee(String.valueOf(df.format(loan.getVipMfeeratio()
						* money >= loan.getVipMfeetop() ? loan.getVipMfeetop()
						: loan.getVipMfeeratio() * money)));
			} else {
				// 普通费用=费用比率*投资金额
				bid.setpFee(String.valueOf(df.format(loan.getMfeeratio()
						* money)));
			}
			bid.setpMemo3(bid.getpFee());
			String bidxml = com.tpy.p2p.pay.util.ParseXML.bidXml(bid);
			String desede = IpsCrypto.triDesEncrypt(bidxml,
					com.tpy.p2p.pay.util.ParameterIps.getDes_algorithm(),
					com.tpy.p2p.pay.util.ParameterIps.getDesedevector());
			desede = desede.replaceAll("\r\n", "");
			StringBuffer argSign = new StringBuffer(com.tpy.p2p.pay.util.ParameterIps.getCert())
					.append(desede).append(com.tpy.p2p.pay.util.ParameterIps.getMd5ccertificate());
			// 将argSign进行MD5加密
			String md5 = IpsCrypto.md5Sign(argSign.toString());
			URL url = new URL(PayURL.BIDTESTURL);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setRequestMethod("POST");
			connection.setConnectTimeout(5000);
			connection.setReadTimeout(5000);
			StringBuffer params = new StringBuffer();
			params.append("pMerCode").append("=");
			params.append(URLEncoder.encode(com.tpy.p2p.pay.util.ParameterIps.getCert(), "UTF-8"))
					.append("&");
			params.append("p3DesXmlPara").append("=");
			params.append(URLEncoder.encode(desede, "UTF-8")).append("&");
			params.append("pSign").append("=");
			params.append(URLEncoder.encode(md5, "UTF-8"));
			connection.setDoOutput(true);
			byte[] b = params.toString().getBytes();
			connection.getOutputStream().write(b, 0, b.length);
			connection.getOutputStream().flush();
			connection.getOutputStream().close();
			printResponseHeader(connection);
		} catch (Exception e) {
			LOG.error("数据加密失败");
			e.printStackTrace();
		}
	}

	private static void printResponseHeader(HttpURLConnection http)
			throws UnsupportedEncodingException {
		Map<String, String> header = getHttpResponseHeader(http);
		for (Map.Entry<String, String> entry : header.entrySet()) {
			String key = entry.getKey() != null ? entry.getKey() + ":" : "";
			System.out.println(key + entry.getValue());
		}
	}

	private static Map<String, String> getHttpResponseHeader(
			HttpURLConnection http) throws UnsupportedEncodingException {
		Map<String, String> header = new LinkedHashMap<String, String>();
		for (int i = 0;; i++) {
			String mine = http.getHeaderField(i);
			if (mine == null)
				break;
			header.put(http.getHeaderFieldKey(i), mine);
		}
		return header;
	}

	//=================================================================================================================//
	/**
	 * 丰付充值异步返回
	 *
	 * @param
	 * @param request
	 */
	@RequestMapping("ffAsynchronismRecharge.htm")
	public synchronized void ffAsynchronismRecharge(String result, String sign,HttpServletRequest request) {
		try {
			RechargeDto rechargeDto = receiveService.page_Recharge(result, sign);
			String code = rechargeDto.getCode();
			if (!Constant.BF_SUCCESS.equals(code)) {// 如果充值不成功
				LOG.error("充值失败--》失败原因:" + code + "--》充值用户ID:" + rechargeDto.getAdditional_info());
			}
			RechargeInfo recharge = new RechargeInfo();
			Userbasicsinfo user = userInfoServices.queryBasicsInfoById(rechargeDto.getAdditional_info());
			LOG.info("返回的充值CODE=" + rechargeDto.getCode());

			recharge.setpTrdAmt(rechargeDto.getIncash_money());
			recharge.setpMemo1(rechargeDto.getAdditional_info());
			recharge.setpMemo2(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			recharge.setpIpsBillNo(rechargeDto.getOrder_id());
			recharge.setpMerBillNo(rechargeDto.getOrder_id());
			boolean bool = processingService.recharge(recharge);
			if (!bool) {
				try {
					String info = "充值[S]-->丰付确认充值[S]-->添加充值记录及修改用户账户余额[F];MSG:丰付充值已成功,我方提现数据处理失败,回滚宝付资金！;ERR:";
					financialExceptionNotes.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,info,user,String.valueOf(recharge.getpTrdAmt()),null, null);
					LOG.error("丰付充值成功->平台充值数据保存失败->充值金额:"
							+ recharge.getpTrdAmt() + " 平台充值订单号:"
							+ recharge.getpMerBillNo() + " 丰付充值订单号:"
							+ recharge.getpIpsBillNo() + " 充值时间:"
							+ recharge.getpMemo2() + "当前充值用户编号:"
							+ recharge.getpMemo1());
				} catch (ResponseException e) {
					LOG.error("接受到丰付返回值处理出现异常", e);
				}

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOG.error("接受到丰付返回值处理出现异常", e);
		}
	}
//-----------------------------------------------------丰付------------------------------------------------------//
	/**
	 * 丰付支付返回（同步）
	 * @param requestId
	 * @param payId
	 * @param fiscalDate
	 * @param description
	 * @param resultSignature
	 * @param payType
	 * @param bankCode
	 * @param totalPrice
	 * @param tradeAmount
	 * @param tradeFee
	 * @param status
	 * @param userIdIdentity
	 * @return
	 */
	@RequestMapping("ff_return")
	public String rechargeReturn(String requestId,
								 String payId,
								 String fiscalDate,
								 String description,
								 String resultSignature,
								 String payType,
								 String bankCode,
								 String totalPrice,
								 String tradeAmount,
								 String tradeFee,
								 String status,
								 String userIdIdentity,
								 HttpServletRequest request,
								 HttpServletResponse response){

		System.out.println("requestId:"+requestId);
		System.out.println("payId	:"+payId);
		System.out.println("fiscalDate:"+fiscalDate);
		System.out.println("description:"+description);
		System.out.println("resultSignature:"+resultSignature);
		System.out.println("payType	:"+payType);
		System.out.println("bankCode:"+bankCode);
		System.out.println("totalPrice:"+totalPrice);
		System.out.println("tradeAmount:"+tradeAmount);
		System.out.println("tradeFee:"+tradeFee);
		System.out.println("status	:"+status);
		System.out.println("userIdIdentit:"+userIdIdentity);

		if(status!=null&&status.length()>0){
			request.setAttribute("status",status);
		}

		try{
			RechargeInfo recharge = new RechargeInfo();
			Userbasicsinfo user =(Userbasicsinfo) request.getSession().getAttribute( Constant.SESSION_USER);
			LOG.info("返回的充值CODE=" + status);
			recharge.setpTrdAmt(totalPrice);
			System.out.println("===============================================>"+user.getId());
			if(user.getId()==null){
				recharge.setpMemo1("7");
			}else {
				recharge.setpMemo1(String.valueOf(user.getId()));
			}
			recharge.setpMemo2(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			recharge.setpIpsBillNo(payId );
			recharge.setpMerBillNo(requestId);
			boolean bool = processingService.recharge(recharge);
			if (!bool) {
				try {
					String info = "充值[S]-->丰付确认充值[S]-->添加充值记录及修改用户账户余额[F];MSG:丰付充值已成功,我方提现数据处理失败,回滚宝付资金！;ERR:";
					financialExceptionNotes.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,info,user,String.valueOf(recharge.getpTrdAmt()),null, null);
					LOG.error("丰付充值成功->平台充值数据保存失败->充值金额:"
							+ recharge.getpTrdAmt() + " 平台充值订单号:"
							+ recharge.getpMerBillNo() + " 丰付充值订单号:"
							+ recharge.getpIpsBillNo() + " 充值时间:"
							+ recharge.getpMemo2() + "当前充值用户编号:"
							+ recharge.getpMemo1());
				} catch (ResponseException e) {
					LOG.error("接受到丰付返回值处理出现异常", e);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOG.error("接受到丰付返回值处理出现异常", e);
		}
		return "WEB-INF/views/member/recharge/recharge";
	}

	/**
	 * 丰付支付返回(异步)
	 * @param requestId
	 * @param payId
	 * @param fiscalDate
	 * @param description
	 * @param resultSignature
	 * @param payType
	 * @param bankCode
	 * @param totalPrice
	 * @param tradeAmount
	 * @param tradeFee
	 * @param status
	 * @param userIdIdentity
	 * @return
	 */
	@RequestMapping("ff_notify")
	public String rechargeNotify(String requestId,
								 String payId,
								 String fiscalDate,
								 String description,
								 String resultSignature,
								 String payType,
								 String bankCode,
								 String totalPrice,
								 String tradeAmount,
								 String tradeFee,
								 String status,
								 String userIdIdentity,
								 HttpServletRequest request,
								 HttpServletResponse response){
		System.out.println("requestId:"+requestId);
		System.out.println("payId	:"+payId);
		System.out.println("fiscalDate:"+fiscalDate);
		System.out.println("description:"+description);
		System.out.println("resultSignature:"+resultSignature);
		System.out.println("payType	:"+payType);
		System.out.println("bankCode:"+bankCode);
		System.out.println("totalPrice:"+totalPrice);
		System.out.println("tradeAmount:"+tradeAmount);
		System.out.println("tradeFee:"+tradeFee);
		System.out.println("status	:"+status);
		System.out.println("userIdIdentit:"+userIdIdentity);

		if(status!=null&&status.length()>0){
			request.setAttribute("status",status);
		}

		try{
			RechargeInfo recharge = new RechargeInfo();
			Userbasicsinfo user =(Userbasicsinfo) request.getSession().getAttribute( Constant.SESSION_USER);
			LOG.info("返回的充值CODE=" + status);
			recharge.setpTrdAmt(totalPrice);
			System.out.println("===============================================>"+user.getId());
			if(user.getId()==null){
				recharge.setpMemo1("7");
			}else {
				recharge.setpMemo1(String.valueOf(user.getId()));
			}

			recharge.setpMemo2(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			recharge.setpIpsBillNo(payId );
			recharge.setpMerBillNo(requestId);
			boolean bool = processingService.recharge(recharge);
			if (!bool) {
				try {
					String info = "充值[S]-->丰付确认充值[S]-->添加充值记录及修改用户账户余额[F];MSG:丰付充值已成功,我方提现数据处理失败,回滚丰付资金！;ERR:";
					financialExceptionNotes.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,info,user,String.valueOf(recharge.getpTrdAmt()),null, null);
					LOG.error("丰付充值成功->平台充值数据保存失败->充值金额:"
							+ recharge.getpTrdAmt() + " 平台充值订单号:"
							+ recharge.getpMerBillNo() + " 丰付充值订单号:"
							+ recharge.getpIpsBillNo() + " 充值时间:"
							+ recharge.getpMemo2() + "当前充值用户编号:"
							+ recharge.getpMemo1());
				} catch (ResponseException e) {
					LOG.error("接受到丰付返回值处理出现异常", e);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOG.error("接受到丰付返回值处理出现异常", e);
		}
		return "WEB-INF/views/member/recharge/recharge";
	}
}
