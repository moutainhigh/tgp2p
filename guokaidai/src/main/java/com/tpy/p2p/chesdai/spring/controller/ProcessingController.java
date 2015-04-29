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
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.admin.spring.service.MessagesettingService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.enums.ENUM_FINANCIAL_EXCEPTION;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.exception.FinancialExceptionNotes;
import com.tpy.p2p.chesdai.spring.service.*;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.payservice.RegisterService;
import org.jfree.util.Log;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ips.security.utility.IpsCrypto;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.entity.Accountinfo;
import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Loansignflow;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.spring.service.AdminService;
import com.tpy.p2p.chesdai.spring.service.BorrowerFundService;
import com.tpy.p2p.chesdai.spring.service.EmailService;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.chesdai.spring.service.ProcessingService;
import com.tpy.p2p.chesdai.spring.service.WithdrawServices;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.RepaymentrecordService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.BidAssignment;
import com.tpy.p2p.pay.entity.BidInfo;
import com.tpy.p2p.pay.entity.RechargeInfo;
import com.tpy.p2p.pay.entity.RegisterInfo;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.Repayment;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.tpy.p2p.pay.entity.Transfer;
import com.tpy.p2p.pay.entity.WithdrawalInfo;
import com.tpy.p2p.pay.util.ParameterIps;
import com.tpy.p2p.pay.util.ParseXML;
import com.tpy.p2p.pay.util.XmlParsingBean;

import freemarker.template.TemplateException;

/**
 * 处理环讯返回的信息
 * 
 * @author RanQiBing 2014-01-26
 * 
 */
@Controller
@RequestMapping("/processing")
public class ProcessingController {

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
	public synchronized String registration(ReturnInfo returnInfo,
			HttpServletRequest request) {
		if ((Constant.SUCCESS).equals(returnInfo.getpErrCode())) {

			try {
				RegisterInfo registerInfo = (RegisterInfo) RegisterService
						.decryption(returnInfo.getP3DesXmlPara(),
								new RegisterInfo());
				Userbasicsinfo userbasics = userInfoServices
						.queryBasicsInfoById(registerInfo.getpMemo1());
				boolean bool = processingService.registration(registerInfo,
						userbasics);
				if (bool) {
					LOG.error("注册环讯账号成功");
					request.setAttribute(
							Constant.SESSION_USER,
							userInfoServices.queryBasicsInfoById(registerInfo
									.getpMemo1()));
					request.setAttribute("url", "member_index/member_center");
					return "WEB-INF/views/success";
				} else {
					LOG.error("环讯注册成功->平台数据处理失败->用户开户流水号:"
							+ registerInfo.getpMerBillNo() + " 开户环讯账号:"
							+ registerInfo.getpIpsAcctNo() + " 开户时间:"
							+ DateUtils.format("yyyy-MM-dd hh:mm:ss") + "");
					request.setAttribute("error", "保存失败");
					return "WEB-INF/views/failure";
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环讯注册成功->返回数据解析失败->返回数据为:"
						+ returnInfo.getP3DesXmlPara());
				request.setAttribute("error", "解析失败");
				return "WEB-INF/views/failure";
			}

		} else {
			LOG.error("环讯注册失败->失败原因:" + returnInfo.getP3DesXmlPara());
			request.setAttribute("error", returnInfo.getpErrMsg());
			return "WEB-INF/views/failure";
		}
	}

	/**
	 * 注册异步处理
	 * 
	 * @param returnInfo
	 *            环迅返回信息
	 */
	@RequestMapping("asynchronismRegistration.htm")
	public synchronized void asynchronismRegistration(ReturnInfo returnInfo) {
		if ((Constant.SUCCESS).equals(returnInfo.getpErrCode())) {

			try {
				RegisterInfo registerInfo = (RegisterInfo) RegisterService
						.decryption(returnInfo.getP3DesXmlPara(),
								new RegisterInfo());
				// 得到当前用户信息
				Userbasicsinfo userbasics = userInfoServices
						.queryBasicsInfoById(registerInfo.getpMemo1());
				if (null == userbasics.getUserfundinfo().getpIdentNo()) {
					boolean bool = processingService.registration(registerInfo,
							userbasics);
					if (!bool) {
						LOG.error("环讯注册成功->平台数据处理失败->用户开户流水号:"
								+ registerInfo.getpMerBillNo() + " 开户环讯账号:"
								+ registerInfo.getpIpsAcctNo() + " 开户时间:"
								+ DateUtils.format("yyyy-MM-dd hh:mm:ss") + "");
					}
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环讯注册成功->返回数据解析失败->返回数据为:"
						+ returnInfo.getP3DesXmlPara());
			}

		} else {
			LOG.error("环讯注册失败->失败原因:" + returnInfo.getP3DesXmlPara());
		}
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
		if ((Constant.SUCCESS).equals(returnInfo.getpErrCode())) {
			// 将还款信息解析成对象
			RechargeInfo info = null;
			try {
				info = (RechargeInfo) XmlParsingBean.simplexml1Object(
						returnInfo.getP3DesXmlPara(), new RechargeInfo());
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			request.setAttribute("url", "member_index/member_center");
			return "WEB-INF/views/success";

		} else if ((Constant.FAILURE).equals(returnInfo.getpErrCode())) {
			LOG.error("环讯充值->原因:(该数据不是有ips返回" + returnInfo.getpErrMsg() + ")");
			request.setAttribute("error", returnInfo.getpErrMsg());
			return "WEB-INF/views/failure";

		} else {
			LOG.error("环讯充值失败->失败原因:(" + returnInfo.getpErrMsg() + ")");
			request.setAttribute("error", returnInfo.getpErrMsg());
			return "WEB-INF/views/failure";
		}
	}

	/**
	 * 环迅支付充值异步返回
	 * 
	 * @param returnInfo
	 * @param request
	 */
	@RequestMapping("asynchronismRecharge.htm")
	public synchronized void asynchronismRecharge(ReturnInfo returnInfo,
			HttpServletRequest request) {
		if (returnInfo.getpErrCode().equals(Constant.SUCCESS)) {
			RechargeInfo recharge = null;
			try {
				recharge = (RechargeInfo) RegisterService.decryption(
                        returnInfo.getP3DesXmlPara(), new RechargeInfo());
				Userbasicsinfo user = userInfoServices
						.queryBasicsInfoById(recharge.getpMemo1());
				// 查询当前账号是否添加有流水账记录
				int num = processingService.accountInfoNum(recharge
						.getpIpsBillNo());
				if (num == 0) {
					boolean bool = processingService.recharge(recharge);
					if (!bool) {
						try {
							financialExceptionNotes
									.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,
											"充值[S]-->环讯确认充值[S]-->添加充值记录及修改用户账户余额[F];MSG:环讯充值已成功,我方提现数据处理失败,回滚环讯资金！;ERR:",
											user, String.valueOf(recharge
													.getpTrdAmt()), null, null);
							LOG.error("环讯充值成功->平台充值数据保存失败->充值金额:"
									+ recharge.getpTrdAmt() + " 平台充值订单号:"
									+ recharge.getpMerBillNo() + " 环讯充值订单号:"
									+ recharge.getpIpsBillNo() + " 充值时间:"
									+ recharge.getpMemo2() + "当前充值用户编号:"
									+ recharge.getpMemo1());
						} catch (ResponseException e) {
							e.printStackTrace();
						}
					}
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}

		} else {
			LOG.error("环迅充值失败--》失败原因:" + returnInfo.getpErrMsg() + "--》加密数据:"
					+ returnInfo.getP3DesXmlPara());
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
	public synchronized String withdrawal(ReturnInfo returnInfo,
			HttpServletRequest request) {
		// 判断操作是否成功
		if ("MG00000F".equals(returnInfo.getpErrCode())) {
			WithdrawalInfo withInfo = null;
			try {
				withInfo = (WithdrawalInfo) RegisterService.decryption(
						returnInfo.getP3DesXmlPara(), new WithdrawalInfo());

				Userbasicsinfo userbasicsinfo = userInfoServices
						.queryBasicsInfoById(withInfo.getpMemo2());

				int num = processingService.accountInfoNum(withInfo
						.getpIpsBillNo());

				if (num <= 0) {
					processingService.withdrlwal(withInfo, userbasicsinfo);
					boolean bool = processingService.withdrlRecord(withInfo,
							userbasicsinfo);
					if (!bool) {
						try {
							financialExceptionNotes
									.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,
											"提现[S]-->环讯确认提现[S]-->添加提现记录及修改用户账户余额[F];MSG:环讯提现已成功,我方提现数据处理失败,回滚环讯资金！;ERR:",
											userbasicsinfo, String
													.valueOf(withInfo
															.getpTrdAmt()),
											null, null);
							LOG.error("环讯提现成功->平台提现数据保存失败->提现金额:"
									+ withInfo.getpTrdAmt() + " 平台提现订单号:"
									+ withInfo.getpMerBillNo() + " 环讯提现订单号:"
									+ withInfo.getpIpsBillNo() + " 提现时间:"
									+ withInfo.getpMemo2() + "当前充值用户编号:"
									+ withInfo.getpMemo2());
						} catch (ResponseException e) {
							e.printStackTrace();
						}
					}
					LOG.error("环讯提现成功");
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "WEB-INF/views/success_withdraw";
			/*
			 * if(ParameterIps.pianText(returnInfo)){ return
			 * "WEB-INF/views/success"; }else{
			 * LOG.error("环讯提现成功->平台数据解析失败->返回提现需要解析数据:(该数据不是由环迅返回" +
			 * returnInfo.getP3DesXmlPara() + ")"); return
			 * "WEB-INF/views/failure"; }
			 */
		} else {
			LOG.error("环讯提现失败->失败原因:(" + returnInfo.getpErrMsg() + ")");
			request.setAttribute("error", returnInfo.getpErrMsg());
			return "WEB-INF/views/failure";
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
	public synchronized String repayment(ReturnInfo returnInfo,
			HttpServletRequest request) {
		if ((Constant.Transfer_Accepted).equals(returnInfo.getpErrCode())) {
			LOG.error("环讯还款->原因:(" + returnInfo.getpErrMsg() + ")");
			// 将还款信息解析成对象
			Repayment repay = null;
			try {
				repay = (Repayment) com.tpy.p2p.pay.util.XmlParsingBean.simplexml1Object(
                        returnInfo.getP3DesXmlPara(), new Repayment());

			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 得到还款信息
			Repaymentrecord repaymentrecord = baseLoansignService
					.getRepaymentId(Long.parseLong(repay.getpMemo1()));
			// 获取借款人还款资金信息=====还需要得到该用户是否为特权用户
			// ExpensesInfo expensesInfo =
			// borrowerFundService.getBorrowerFund(repaymentrecord, 1);
			// ---------------------修改当前期的还款情况
			// repaymentrecord.setRealMoney(expensesInfo.getInterest());
			// repaymentrecord.setRepayTime(DateUtils
			// .format("yyyy-MM-dd HH:mm:ss"));
			repaymentrecord.setpIpsBillNo(repay.getpIpsBillNo());
			repaymentrecord.setpMerBillNo(repay.getpMerBillNo());
			repaymentrecord.setpIpsTime1(repay.getpIpsDate());
			processingService.updateRayment(repaymentrecord);
			// ----------------------
			request.getSession().setAttribute(
					Constant.SESSION_USER,
					repaymentrecord.getLoansign().getUserbasicsinfo());
			request.setAttribute("url", "/member_index/member_center");

			return "WEB-INF/views/success";
		} else {
			LOG.error("环讯还款失败->失败原因:(" + returnInfo.getpErrMsg() + ")");
			request.setAttribute("error", returnInfo.getpErrMsg());
			return "WEB-INF/views/failure";
		}
	}

	/**
	 * 
	 * 环讯返回数据异步处理
	 * 
	 * 
	 * 
	 * 
	 */
	/**
	 * 提现的异步处理
	 * 
	 * @param pMerCode
	 * @param pErrCode
	 * @param pErrMsg
	 * @param p3DesXmlPara
	 * @param pSign
	 */
	@RequestMapping("withdrawAsynchronous.htm")
	public synchronized void withdrawAsynchronous(ReturnInfo returnInfo) {
		// 判断提现是否成功
		if ((Constant.SUCCESS).equals(returnInfo.getpErrCode())) {
			// 数字签名判断
			WithdrawalInfo withInfo = null;
			try {
				withInfo = (WithdrawalInfo) RegisterService.decryption(
						returnInfo.getP3DesXmlPara(), new WithdrawalInfo());

				Userbasicsinfo userbasicsinfo = userInfoServices
						.queryBasicsInfoById(withInfo.getpMemo2());

				int num = processingService.accountInfoNum(withInfo
						.getpIpsBillNo());

				if (num <= 0) {
					processingService.withdrlwal(withInfo, userbasicsinfo);
					boolean bool = processingService.withdrlRecord(withInfo,
							userbasicsinfo);
					if (!bool) {
						try {
							financialExceptionNotes
									.note(ENUM_FINANCIAL_EXCEPTION.RECHARGE,
											"提现[S]-->环讯确认提现[S]-->添加提现记录及修改用户账户余额[F];MSG:环讯提现已成功,我方提现数据处理失败,回滚环讯资金！;ERR:",
											userbasicsinfo, String
													.valueOf(withInfo
															.getpTrdAmt()),
											null, null);
							LOG.error("环讯提现成功->平台提现数据保存失败->提现金额:"
									+ withInfo.getpTrdAmt() + " 平台提现订单号:"
									+ withInfo.getpMerBillNo() + " 环讯提现订单号:"
									+ withInfo.getpIpsBillNo() + " 提现时间:"
									+ withInfo.getpMemo2() + "当前充值用户编号:"
									+ withInfo.getpMemo2());
						} catch (ResponseException e) {
							e.printStackTrace();
						}
					}
					LOG.error("环讯提现成功");
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			LOG.error("环讯还款失败->失败原因(" + returnInfo.getpErrMsg() + ")");
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
			String xml = XmlParsingBean.md52Xml(returnInfo.getP3DesXmlPara());
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
			transfer = (Transfer) XmlParsingBean.xml2TransferOne(xml);
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
	public synchronized void asynchronismBid(ReturnInfo info) {
		// 判断是否成功
		if (info.getpErrCode().equals(Constant.SUCCESS)) {
			BidInfo bid = null;
			try {
				bid = (BidInfo) RegisterService.decryption(
						info.getP3DesXmlPara(), new BidInfo());
				String[] ids = bid.getpMemo2().split("_");
				// 判断数据是否已处理
				int num = processingService.accountInfoNum(bid.getpP2PBillNo());
				if (ids[1].trim().equals("2") && num == 0) {
					asynchronismAuto(bid);
				}
				if (ids[1].trim().equals("1") && num == 0) {
					asynchronismAuto(bid);
				}
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
			}
		} else {
			LOG.error("环讯购标失败->失败原因:" + info.getP3DesXmlPara());
		}

	}

	public void asynchronismAuto(BidInfo bid) {
		String[] ids = bid.getpMemo2().split("_");
		// 获取当前用户的最新信息
		Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(ids[0]);
		// 获取该用户的账户资金
		BalanceInquiryInfo money = RegisterService.accountBalance(userinfo
				.getUserfundinfo().getpIdentNo());
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(bid.getpMemo1());
		Loanrecord loanrecord = new Loanrecord();
		loanrecord.setIsPrivilege(Constant.STATUES_ZERO);
		loanrecord.setIsSucceed(Constant.STATUES_ONE);
		loanrecord.setLoansign(loan);
		loanrecord.setpMerBillNo(bid.getpMerBillNo());
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
		account.setExplan("购标");
		account.setIncome(0.00);
		account.setIpsNumber(bid.getpP2PBillNo());
		account.setLoansignId(loan.getId());
		account.setMoney(Double.parseDouble(money.getpBalance()));
		account.setTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		account.setUserbasicsinfo(userinfo);
		account.setAccounttype(plankService.accounttype(3L));

		Loansignbasics loans = loan.getLoansignbasics();
		if (loan.getLoanType() != 7 && !loan.getLoanType().equals("7")) {
			if (loans.getMgtMoney().equals(null)
					&& loans.getMgtMoney().equals("")) {
				loans.setMgtMoney(0.00);
			}
			loans.setMgtMoney(loans.getMgtMoney()
					+ Double.parseDouble(bid.getpMemo3()));
		} else {
			loans.setMgtMoney(0.00);
		}
		plankService.update(loanrecord, account,
				Double.parseDouble(money.getpBalance()), loans);

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
				String xml = com.tpy.p2p.pay.util.XmlParsingBean.md52Xml(info.getP3DesXmlPara());
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
			String bidxml = ParseXML.bidXml(bid);
			String desede = IpsCrypto.triDesEncrypt(bidxml,
					com.tpy.p2p.pay.util.ParameterIps.getDes_algorithm(),
					ParameterIps.getDesedevector());
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
					ParameterIps.getDes_algorithm(),
					ParameterIps.getDesedevector());
			desede = desede.replaceAll("\r\n", "");
			StringBuffer argSign = new StringBuffer(com.tpy.p2p.pay.util.ParameterIps.getCert())
					.append(desede).append(ParameterIps.getMd5ccertificate());
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
			params.append(URLEncoder.encode(ParameterIps.getCert(), "UTF-8"))
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

}
