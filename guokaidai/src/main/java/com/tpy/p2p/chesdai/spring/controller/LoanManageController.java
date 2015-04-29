package com.tpy.p2p.chesdai.spring.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.exception.ResponseException;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.enums.ENUM_FINANCIAL_EXCEPTION;
import com.tpy.p2p.chesdai.exception.FinancialExceptionNotes;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.BorrowerFundService;
import com.tpy.p2p.chesdai.spring.service.ProcessingService;
import com.tpy.p2p.chesdai.spring.util.Arith;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.ExpensesInfo;
import com.tpy.p2p.pay.entity.RepaymentInvestor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baofoo.p2p.dto.receive.ResultDto;
import com.baofoo.p2p.dto.request.p2p.Action;
import com.baofoo.p2p.dto.request.p2p.P2pRequestDto;
import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.tpy.p2p.chesdai.admin.spring.service.loan.LoanSignService;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.pay.util.ParameterIps;

/**
 * 借款人的借款标管理
 * 
 * @author RanQiBing 2014-03-30
 * 
 */
@Controller
@CheckLogin(value = CheckLogin.WEB)
@RequestMapping("/loanManage")
public class LoanManageController {

	@Resource
	private LoanSignService loanSignService;

	@Resource
	private BaseLoansignService baseLoansignService;

	@Resource
	private LoanManageService loanManageService;

	@Resource
	private BorrowerFundService borrowerFundService;

	/** loanSignQuery 公用借款标的查询 */
	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private UserInfoQuery userInfoQuery;

	@Resource
	private RequestService bfService;

	@Resource
	private ReceiveService receiveService;

	@Resource
	private ProcessingService processingService;

	@Resource
	private FinancialExceptionNotes financialExceptionNotes;

	private DecimalFormat df = new DecimalFormat("0.0000");

	/**
	 * 得到发布中的借款标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@RequestMapping("achieveLoan.htm")
	public String achieveLoan(
			HttpServletRequest request,
			String beginTime,
			String endTime,
			@RequestParam(value = "no", required = false, defaultValue = "1") Integer no) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(no);
		page = loanManageService.getAchieveLoan(request, user.getId(),
				beginTime, endTime, page);
		request.setAttribute("page", page);
		request.setAttribute("beginTime", beginTime);
		request.setAttribute("endTime", endTime);
		return "WEB-INF/views/member/loanmanagement/achieveloan";
	}

	/**
	 * 得到还款中的借款给标
	 */
	@RequestMapping("repaymentLoanOpen.htm")
	public String repaymentLoanOpen(HttpServletRequest request) {
		return "WEB-INF/views/member/loanmanagement/repaymentloan";
	}

	/**
	 * 得到还款中的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@RequestMapping("repaymentLoan.htm")
	public String repaymentLoan(HttpServletRequest request, String beginTime,
			String endTime, String month, Integer no) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(no);
		if (null != beginTime && !"".equals(beginTime) && null != endTime
				&& !"".equals(endTime)) {
			month = "0";
		}
		try {
			page = loanManageService.getRepaymentLoan(request, user.getId(),
					beginTime, endTime, page, month);
			List<Object[]> list = new ArrayList<Object[]>();
			for (int i = 0; i < page.getList().size(); i++) {
				Object[] obj = (Object[]) page.getList().get(i);
				int num = DateUtils.differenceDate("yyyy-MM-dd",
						DateUtils.format("yyyy-MM-dd"), obj[9].toString());
				if (Integer.parseInt(obj[11].toString()) == 2
						|| Integer.parseInt(obj[11].toString()) == 5) {
					obj[11] = 1;
				} else if (Integer.parseInt(obj[11].toString()) == 1 && num < 0) {
					obj[11] = 2;
				} else if (Integer.parseInt(obj[11].toString()) == 3) {
					obj[11] = 3;
				} else {
					obj[11] = 4;
				}

				list.add(obj);
			}
			page.setList(list);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		request.setAttribute("page", page);
		return "WEB-INF/views/member/loanmanagement/repaymenttable";
	}

	// /**
	// * 得到逾期中的借款给标
	// * @param request
	// * @beginTime 开始时间
	// * @endTime 结束时间
	// * @return 返回页面路径
	// */
	// @RequestMapping("overdueLoan.htm")
	// public String overdueLoan(HttpServletRequest request,String
	// beginTime,String endTime){
	// Userbasicsinfo user = (Userbasicsinfo)
	// request.getSession().getAttribute(Constant.SESSION_USER);
	// PageModel page = new PageModel();
	// page = loanManageService.getOverdueLoan(request, user.getId(), beginTime,
	// endTime, page);
	// List<Object[]> list = new ArrayList<Object[]>();
	// if(null!=page.getList()&&page.getList().size()>0){
	// for(int i=0;i<page.getList().size();i++){
	// Object [] obj = new Object [15];
	// Object[] objs = (Object[]) page.getList().get(i);
	// obj[0] = objs[0];
	// obj[1] = objs[1];
	// obj[2] = objs[2];
	// obj[3] = objs[3];
	// obj[4] = objs[4];
	// obj[5] = objs[5];
	// obj[6] = objs[6];
	// obj[7] = objs[7];
	// obj[8] = objs[8];
	// obj[9] = objs[9];
	// obj[10] = objs[10];
	// int day = 0;
	// try {
	// day =
	// DateUtils.differenceDate("yyyy-MM-dd",obj[9].toString(),DateUtils.format("yyyy-MM-dd"));
	// obj[11] = day;
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// obj[12] =
	// loanManageService.overdueRepayment(Double.parseDouble(obj[3].toString()),day);
	// list.add(obj);
	// }
	// }
	// page.setList(list);
	// request.setAttribute("beginTime",beginTime);
	// request.setAttribute("endTime",endTime);
	// request.setAttribute("page",page);
	// return "WEB-INF/views/member/loanmanagement/overdueloan";
	// }
	// /**
	// * 得到已还款借款标
	// * @param request
	// * @beginTime 开始时间
	// * @endTime 结束时间
	// * @return 返回页面路径
	// */
	// @RequestMapping("hasTheRepaymentLoan.htm")
	// public String hasTheRepaymentLoan(HttpServletRequest request,String
	// beginTime,String endTime){
	// Userbasicsinfo user = (Userbasicsinfo)
	// request.getSession().getAttribute(Constant.SESSION_USER);
	// PageModel page = new PageModel();
	// try {
	// page = loanManageService.getHasTheRepaymentLoan(request, user.getId(),
	// beginTime, endTime, page);
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// request.setAttribute("beginTime",beginTime);
	// request.setAttribute("endTime",endTime);
	// request.setAttribute("page",page);
	// return "WEB-INF/views/member/loanmanagement/hastherepaymentloan";
	// }
	/**
	 * 得到已完成的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@RequestMapping("underwayLoan.htm")
	public String underwayLoan(HttpServletRequest request, String beginTime,
			String endTime) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page = loanManageService.getUnderwayLoan(request, user.getId(),
				beginTime, endTime, page);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/loanmanagement/underwayloan";
	}

	/**
	 * 借款人进行还款操作
	 * 
	 * @param id
	 *            还款编号
	 * @return 返回提交ips地址
	 */
	@RequestMapping("repayment_bak.htm")
	public String repayment_bak(String id, HttpServletRequest request,
			HttpServletResponse response) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		// 得到还款信息
		Repaymentrecord repaymentrecord = baseLoansignService
				.getRepaymentId(Long.parseLong(id));

		// 得到投资人还款的所有信息
		List<RepaymentInvestor> investorList = loanManageService
				.listRepayment(repaymentrecord);
		
		// 获取借款人还款资金信息=====还需要得到该用户是否为特权用户
		Loansign loan = repaymentrecord.getLoansign();
		
		String errMsg = "";// 记录错误信息
		try {
			P2pRequestDto entity = new P2pRequestDto();
			entity.setAction_type("4");
			entity.setBrw_id(user.getId().toString());
			entity.setCus_id(loan.getLoansignbasics().getpBidNo());
			entity.setCus_name(loan.getLoansignbasics().getLoanTitle());
			entity.setFee("0");
			entity.setMerchant_id(ParameterIps.getMercode());
			String order_id = id + "_" + System.currentTimeMillis();
			entity.setOrder_id(order_id);
			entity.setReq_time(String.valueOf(System.currentTimeMillis()));
			List<Action> actions = new ArrayList<Action>();
			// 多个收款人
			for (RepaymentInvestor inverstor : investorList) {
				Action action1 = new Action();
				action1.setAmount(inverstor.getpInAmt());
				// 平台手续费+违约金
				action1.setFee(String.valueOf(Arith.add(
                        Double.parseDouble(inverstor.getpInFee()),
                        Double.parseDouble(inverstor.getpOutInfoFee()))));
				action1.setUser_id(inverstor.getUserID().toString());
				actions.add(action1);
			}
			// 一个还款人
			Action action2 = new Action();
			action2.setSpecial("1");
			//本金+利息
			action2.setAmount(String.valueOf(Arith.add(
					repaymentrecord.getPreRepayMoney(),
					repaymentrecord.getMoney())));
			// 平台收取还款人手续费:借款金额*管理费比例
			action2.setFee(String.valueOf(Arith.mul(loan.getPmfeeratio(), loan.getIssueLoan())));
			action2.setUser_id(user.getId().toString());
			actions.add(action2);
			entity.setActions(actions);
			LOG.info("还款信息:order_id="+entity.getOrder_id()+",标名称="+entity.getCus_name()+",标ID="+entity.getCus_id());
			String xml = bfService.serv_p2pRequest(entity);
			LOG.info("还款发送的请求=" + entity.getRequestXml());
			LOG.info("还款返回的结果=" + xml);
			ResultDto resultDto = receiveService.serv_p2pRequest(xml);
			if (Constant.BF_SUCCESS.equals(resultDto.getCode())) {
				int num = processingService.accountInfoNum(order_id);
				if (num <= 0) {
					boolean isVip = userInfoQuery.isPrivilege(user);
					ExpensesInfo expensesInfo = borrowerFundService
							.getBorrowerFund(repaymentrecord,isVip);
					// 进行数字签名验证
					// if(ParameterIps.pianText(returnInfo)){
					// 得到还款信息
					// -----------begin判断该标是否还完 还完则修改状态----------
					// 普通标和净值标
					if (loan.getLoanType() == 1 || loan.getLoanType() == 7) {
						if (repaymentrecord.getLoansign().getRefundWay() == 3) {
							// 修改标的状态
							loan.setLoanstate(4);
							processingService.updateLoan(loan);
						} else {
							if (repaymentrecord.getLoansign().getMonth() == repaymentrecord
									.getPeriods()) {
								// 修改标的状态
								loan.setLoanstate(4);
								processingService.updateLoan(loan);
							}
						}
					} else { // 天标和秒标
						// 修改标的状态
						loan.setLoanstate(Constant.STATUES_FOUR);
						processingService.updateLoan(loan);
					}
					// ---------------end--------------------------
					// ---------------------修改当前期的还款情况
					repaymentrecord.setRealMoney(expensesInfo.getInterest());
					repaymentrecord.setRepayTime(DateUtils
							.format("yyyy-MM-dd HH:mm:ss"));
					repaymentrecord.setRepayState(expensesInfo.getState());
					repaymentrecord.setpIpsBillNo(order_id);
					repaymentrecord.setpMerBillNo(order_id);
					repaymentrecord.setpIpsTime2(DateUtils
							.format("yyyy-MM-dd HH:mm:ss"));
					repaymentrecord.setOverdueInterest(expensesInfo
							.getPenalty());
					processingService.updateRayment(repaymentrecord);
					// ----------------------
					try {
						processingService.getRepaymentBF(investorList,
								user.getpMerBillNo(), repaymentrecord,
								expensesInfo);
						LOG.error("宝付还款成功-->>>>");
						// 得到还款信息
						repaymentrecord.setpIpsTime1(DateUtils
								.format("yyyy-MM-dd HH:mm:ss"));
						processingService.updateRayment(repaymentrecord);
						// ----------------------
						request.getSession()
								.setAttribute(
										Constant.SESSION_USER,
										repaymentrecord.getLoansign()
												.getUserbasicsinfo());
						request.setAttribute("url",
								"/member_index/member_center");
						return "WEB-INF/views/success";
					} catch (Exception e) {
						try {
							financialExceptionNotes
									.note(ENUM_FINANCIAL_EXCEPTION.REPAYMENT,
											"还款[S]-->宝付确认还款[S]-->添加还款记录及修改用户账户余额[F];MSG:宝付还款已成功,我方提现数据处理失败,回滚宝付资金！;ERR:",
											repaymentrecord.getLoansign()
													.getUserbasicsinfo(),
											String.valueOf(expensesInfo
													.getMoney()
													+ expensesInfo
															.getInterest()),
											null, null);
							errMsg = "宝付还款成功,但太平洋理财个人账户更新失败,还款单号:"
									+ user.getpMerBillNo();
							LOG.error("宝付还款成功->平台数据处理失败->借款人编号:"
									+ repaymentrecord.getLoansign()
											.getUserbasicsinfo().getId()
									+ "还款流水号:" + user.getpMerBillNo()
									+ "宝付还款流水号:" + user.getpMerBillNo());
						} catch (ResponseException e1) {
							e1.printStackTrace();
						}
					}
				}
			} else {
				request.setAttribute("error", resultDto.getCode());
				return "WEB-INF/views/failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			return "WEB-INF/views/failure";
		}
		request.setAttribute("error", errMsg);
		return "WEB-INF/views/failure";

	}


	/**
	 * 借款人进行还款操作
	 *
	 * @param id  还款编号
	 * @return 返回提交ips地址
	 */
	@RequestMapping("repayment.htm")
	public String repayment(String id, HttpServletRequest request,HttpServletResponse response) {
		boolean flag = false;
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		// 得到还款信息
		Repaymentrecord repaymentrecord = baseLoansignService.getRepaymentId(Long.parseLong(id));

		// 得到投资人还款的所有信息
		List<RepaymentInvestor> investorList = loanManageService.listRepayment(repaymentrecord);

		// 获取借款人还款资金信息=====还需要得到该用户是否为特权用户
		Loansign loan = repaymentrecord.getLoansign();

		String errMsg = "";// 记录错误信息
		try {
			//扣除还款人金额
			//本金+利息
			loanManageService.repayment(user, repaymentrecord,loan,investorList);
			flag = true;

			if (flag) {
				//int num = processingService.accountInfoNum(order_id);
				int num = 0;
				if (num <= 0) {
					boolean isVip = userInfoQuery.isPrivilege(user);
					ExpensesInfo expensesInfo = borrowerFundService.getBorrowerFund(repaymentrecord,isVip);
					// 得到还款信息
					// -----------begin判断该标是否还完 还完则修改状态----------
					// 普通标和净值标
					if (loan.getLoanType() == 1 || loan.getLoanType() == 7) {
						if (repaymentrecord.getLoansign().getRefundWay() == 3) {
							// 修改标的状态
							loan.setLoanstate(4);
							processingService.updateLoan(loan);
						} else {
							if (repaymentrecord.getLoansign().getMonth() == repaymentrecord.getPeriods()) {
								// 修改标的状态
								loan.setLoanstate(4);
								processingService.updateLoan(loan);
							}
						}
					} else { // 天标和秒标
						// 修改标的状态
						loan.setLoanstate(Constant.STATUES_FOUR);
						processingService.updateLoan(loan);
					}
					// ---------------end--------------------------
					// ---------------------修改当前期的还款情况
					repaymentrecord.setRealMoney(expensesInfo.getInterest());
					repaymentrecord.setRepayTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
					repaymentrecord.setRepayState(expensesInfo.getState());
					String order_id = user.getpMerBillNo();
					repaymentrecord.setpIpsBillNo(order_id);
					repaymentrecord.setpMerBillNo(order_id);
					repaymentrecord.setpIpsTime2(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
					repaymentrecord.setOverdueInterest(expensesInfo	.getPenalty());
					processingService.updateRayment(repaymentrecord);

					// ----------------------
					try {
						processingService.getRepaymentBF(investorList,user.getpMerBillNo(), repaymentrecord,expensesInfo);
						LOG.error("还款成功-->>>>");
						// 得到还款信息
						repaymentrecord.setpIpsTime1(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
						processingService.updateRayment(repaymentrecord);
						// ----------------------
						request.getSession().setAttribute(Constant.SESSION_USER,repaymentrecord.getLoansign().getUserbasicsinfo());
						request.setAttribute("url","/member_index/member_center");
						return "WEB-INF/views/success";
					} catch (Exception e) {
						try {
							financialExceptionNotes.note(ENUM_FINANCIAL_EXCEPTION.REPAYMENT, "还款[S]-->确认还款[S]-->添加还款记录及修改用户账户余额[F];MSG:还款已成功,我方提现数据处理失败,回滚资金！;ERR:",
											repaymentrecord.getLoansign().getUserbasicsinfo(),
											String.valueOf(expensesInfo.getMoney()+ expensesInfo.getInterest()),null, null);
							errMsg = "还款成功,但太平洋理财个人账户更新失败,还款单号:" + user.getpMerBillNo();
							LOG.error("还款成功->平台数据处理失败->借款人编号:" + repaymentrecord.getLoansign().getUserbasicsinfo().getId() + "还款流水号:" + user.getpMerBillNo() + "还款流水号:" + user.getpMerBillNo());
						} catch (ResponseException e1) {
							e1.printStackTrace();
						}
					}
				}
			} else {
				request.setAttribute("error", "error");
				return "WEB-INF/views/failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			return "WEB-INF/views/failure";
		}
		request.setAttribute("error", errMsg);
		return "WEB-INF/views/failure";
	}


	/**
	 * 判断用户的金额是否可以偿还
	 * 
	 * @param id
	 *            还款编号
	 * @return
	 */
	@RequestMapping("judge.htm")
	@ResponseBody
	public String getJudge(Long id, HttpServletRequest request) {
		String alert = "";
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		// 得到还款信息
		Repaymentrecord repaymentrecord = baseLoansignService
				.getRepaymentId(id);
		boolean isVip = userInfoQuery.isPrivilege(user);
		// 得到借款人的还款信息
		ExpensesInfo ex = borrowerFundService.getBorrowerFund(repaymentrecord,isVip);
		Double money = ex.getInterest() + ex.getMoney() + ex.getPenalty();
		// 得到用户账户余额
		Userfundinfo userinfo = userInfoQuery.getUserFundInfoBybasicId(user
				.getId());
		// 判断用户的可用余额是可以偿还
		if (userinfo.getCashBalance() < money) {
			alert = "余额不足，请充值";
		} else {
			alert = "本金:" + df.format(ex.getMoney()) + ",利息:"
					+ df.format(ex.getInterest());
			if (ex.getPenalty() > 0) {
				alert = alert + ",违约金:" + df.format(ex.getPenalty());
			}
			if (ex.getManagement()> 0) {
				alert = alert + ",平台服务费:" + df.format(ex.getManagement());
			}
		}
		return alert;
	}
}
