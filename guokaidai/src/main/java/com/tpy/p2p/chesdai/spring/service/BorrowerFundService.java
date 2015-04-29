package com.tpy.p2p.chesdai.spring.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.spring.util.Arith;
import com.tpy.p2p.core.entity.CalculateLoan;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import com.tpy.p2p.core.service.RepaymentrecordService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.ExpensesInfo;
import com.tpy.p2p.pay.entity.RepaymentInvestor;

/**
 * 对还款信息资金进行封装(针对借款人)
 * 
 * @author hsq 2018-8-26
 * 
 */
@Service
public class BorrowerFundService {

	@Resource
	private LoanSignFund loanSignFund;

	@Resource
	private LoanManageService loanManageService;

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private UserInfoQuery userInfoQuery;

	private DecimalFormat df = new DecimalFormat("0.00");

	@Resource
	private RepaymentrecordService repaymentrecordService;

	/**
	 * 计算得到借款人还款的本金、利息、违约金
	 * 
	 * @param repaymentInfo
	 *            还款对象
	 * @return 返回资金对象
	 */
	public ExpensesInfo getBorrowerFund(Repaymentrecord repaymentInfo,
			boolean isVip) {
		int refundWay = repaymentInfo.getLoansign().getRefundWay();
		// 还款方式：1按月等额本息、2按月付息到期还本、3到期一次性还本息
		if (refundWay == 1) {
			return this.averageInterest(repaymentInfo, isVip);
		} else if (refundWay == 2) {
			return this.getMonthlyInterest(repaymentInfo, isVip);
		} else {
			return this.getDisposable(repaymentInfo, isVip);
		}
	}

	/**
	 * 计算等额本息
	 * 
	 * @param repaymentInfo
	 *            还款对象
	 * @return 返回资金对象
	 */
	public ExpensesInfo averageInterest(Repaymentrecord repaymentInfo,
			boolean isVip) {
		ExpensesInfo expensesInfo = new ExpensesInfo();
		// 年利率
		Double interestRate = repaymentInfo.getLoansign().getRate();
		// 违约金
		Double penalty = 0.00;
		// 当前距离还款日期的天数
		int timeNum = 0;
		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentInfo.getPreRepayDate());
			// 总的需还款金额
			double totalRepayAmt = 0.00;
			// 未还款金额
			double unrepayAmt = 0.00;
			Set<Repaymentrecord> repaymentrecords = repaymentInfo.getLoansign()
					.getRepaymentrecords();
			for (Repaymentrecord record : repaymentrecords) {
				totalRepayAmt += (record.getMoney() + record.getPreRepayMoney());
				int state = record.getRepayState();
				if (state == 1 || state == 3) {
					// 获取未还款本金
					unrepayAmt += (record.getMoney() + record
							.getPreRepayMoney());
				}
			}
			// 未还款金额 所占借款金额
			double unrepayRatioAmt = Arith.mul(Arith.div(unrepayAmt,
					totalRepayAmt), repaymentInfo.getLoansign().getIssueLoan());
			// 日期格式，放款时间，当前日期
			if (timeNum > 0) { // 提前还款
				// 提前还款的违约金
				penalty = Arith.mul(Arith.mul(unrepayRatioAmt, repaymentInfo
						.getLoansign().getPrepaymentRate()), timeNum);
				expensesInfo.setState(Constant.STATUES_FIVE);
			} else if (timeNum < 0) { // 逾期还款
				// 逾期违约的金额
				penalty = Arith.mul(Arith.mul(unrepayRatioAmt, repaymentInfo
						.getLoansign().getPrepaymentRate()), Math.abs(timeNum));
				expensesInfo.setState(Constant.STATUES_FOUR);
			} else { // 按时还款
				expensesInfo.setState(Constant.STATUES_TWO);
			}
			List<CalculateLoan> calcuList = loanSignFund.loanCalculate(
					new BigDecimal(repaymentInfo.getLoansign().getIssueLoan()),
					interestRate, repaymentInfo.getLoansign().getMonth());
			CalculateLoan calcu = calcuList.get(repaymentInfo.getPeriods() - 1);
			expensesInfo.setInterest(calcu.getLixi().doubleValue());
			expensesInfo.setIpsNumber(repaymentInfo.getLoansign()
					.getUserbasicsinfo().getUserfundinfo().getpIdentNo());
			expensesInfo.setLoanid(repaymentInfo.getLoansign().getId());
			Double management = loanSignFund.managementFee(
					repaymentInfo.getLoansign(), isVip).doubleValue();
			expensesInfo.setManagement(management);
			expensesInfo.setPenalty(penalty);
			expensesInfo.setMoney(calcu.getBenjin().doubleValue());
			expensesInfo.setUserId(repaymentInfo.getLoansign()
					.getUserbasicsinfo().getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expensesInfo;
	}

	/**
	 * 每月付息到期还本
	 * 
	 * @param repaymentInfo
	 *            还款对象
	 * @return 返回资金对象
	 */
	public ExpensesInfo getMonthlyInterest(Repaymentrecord repaymentInfo,
			boolean isPrivilege) {
		ExpensesInfo expensesInfo = new ExpensesInfo();
		Loansign loan = repaymentInfo.getLoansign();
		// 年利率
		Double interestRate = loan.getRate();
		// 违约金
		Double penalty = 0.00;
		// 当前距离还款日期的天数
		int timeNum = 0;

		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentInfo.getPreRepayDate());
			// 日期格式，放款时间，当前日期
			if (timeNum > 0) { // 提前还款
				int time = 0;
				if (repaymentInfo.getPeriods().intValue() == 1) {
					// 得到实际使用天数
					time = DateUtils.differenceDate("yyyy-MM-dd", loan
							.getLoansignbasics().getCreditTime(), DateUtils
							.format("yyyy-MM-dd"));
				} else {
					Set<Repaymentrecord> repaymentrecords = loan
							.getRepaymentrecords();
					for (Repaymentrecord record : repaymentrecords) {

						if (record.getPeriods() == repaymentInfo.getPeriods()
								.intValue() - 1) {
							time = DateUtils.differenceDate("yyyy-MM-dd",
									record.getPreRepayDate(),
									DateUtils.format("yyyy-MM-dd"));
							break;
						}
					}
				}
				// 得到实际的利息
				Double interest = loanSignFund.instalmentInterest(
						new BigDecimal(loan.getIssueLoan()), interestRate,
						time, loan.getLoanType()).doubleValue();
				// 提前还款的违约金
				penalty = Arith.mul(interest, loan.getPrepaymentRate());
				expensesInfo.setState(Constant.STATUES_FIVE);
			} else if (timeNum < 0) { // 逾期还款
				// 逾期违约的金额
				penalty = loanManageService.overdueRepayment(
						loan.getIssueLoan(), Math.abs(timeNum));
				expensesInfo.setState(Constant.STATUES_FOUR);
			} else { // 按时还款
				expensesInfo.setState(Constant.STATUES_TWO);
			}
			expensesInfo.setInterest(repaymentInfo.getPreRepayMoney());
			expensesInfo.setMoney(repaymentInfo.getMoney());
			expensesInfo.setIpsNumber(loan.getUserbasicsinfo()
					.getUserfundinfo().getpIdentNo());
			expensesInfo.setLoanid(loan.getId());
			Double management = loanSignFund.managementFee(loan, isPrivilege)
					.doubleValue();
			expensesInfo.setManagement(management);
			expensesInfo.setPenalty(penalty);
			expensesInfo.setUserId(repaymentInfo.getLoansign()
					.getUserbasicsinfo().getId());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return expensesInfo;
	}

	/**
	 * 到期一次性还本息
	 * 
	 * @param repaymentInfo
	 *            还款对象
	 * @return 返回资金对象
	 */
	public ExpensesInfo getDisposable(Repaymentrecord repaymentrecord,
			boolean isPrivilege) {
		// 得到当前标的利率
		Loansign loan = repaymentrecord.getLoansign();
		double interestRate = loan.getRate()
				+ loan.getLoansignbasics().getReward();
		// //得到比例
		// BigDecimal big = Arith.div(money, investorMoney, 4);
		ExpensesInfo expenses = new ExpensesInfo();
		// 实际利息
		Double interest = repaymentrecord.getPreRepayMoney();
		// 违约金
		Double penalty = 0.00;
		int timeNum = 0;
		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentrecord.getPreRepayDate());
			// 提前还款
			if (timeNum > 0) {
				String beginTime = repaymentrecord.getLoansign()
						.getLoansignbasics().getCreditTime();
				int time = DateUtils.differenceDate("yyyy-MM-dd", beginTime,
						DateUtils.format("yyyy-MM-dd"));
				// 得到天利率
				BigDecimal rate = new BigDecimal(Arith.div(interestRate, 365));
				// 实际所得利息
				interest = Arith.mul(
						Arith.mul(repaymentrecord.getMoney(),
								rate.doubleValue()), time);
				// 提前违约的金额
				penalty = loanManageService.advanceRepayment(interest
						.doubleValue());
				expenses.setState(Constant.STATUES_FIVE);
			} else if (timeNum < 0) { // 逾期还款
				// 逾期违约的金额
				penalty = loanManageService.overdueRepayment(
						repaymentrecord.getMoney(), Math.abs(timeNum));
				expenses.setState(Constant.STATUES_FOUR);
			} else { // 按时还款
				expenses.setState(Constant.STATUES_TWO);
			}

			expenses.setInterest(interest);
			expenses.setLoanid(repaymentrecord.getLoansign().getId());
			Double management = loanSignFund.managementFee(loan, isPrivilege)
					.doubleValue();
			expenses.setManagement(management);
			expenses.setMoney(repaymentrecord.getMoney());
			expenses.setPenalty(penalty);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expenses;
	}

	/**
	 * 天标、秒标
	 * 
	 * @param repaymentInfo
	 *            还款对象
	 * @return 返回资金对象
	 */
	public ExpensesInfo getDayAnd(Repaymentrecord repaymentrecord,
			Costratio costratio, int isPrivilege) {
		ExpensesInfo expensesInfo = new ExpensesInfo();
		// 利率
		Double interestRate = repaymentrecord.getLoansign().getRate()
				+ repaymentrecord.getLoansign().getLoansignbasics().getReward();
		// 预计使用天数
		int day = repaymentrecord.getLoansign().getUseDay();
		// 利息
		Double interest = 0.00;
		// 管理费
		Double managementCost = 0.00;
		//
		Double penalty = 0.00;
		// 当前距离还款日期的天数
		int timeNum = 0;
		// 放款到当前的天数
		int timeUse = 0;
		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentrecord.getPreRepayDate());
			BigDecimal bd = new BigDecimal(repaymentrecord.getLoansign()
					.getIssueLoan());
			// 日期格式，放款时间，当前日期
			timeUse = DateUtils.differenceDate("yyyy-MM-dd HH:mm:ss",
					repaymentrecord.getLoansign().getLoansignbasics()
							.getCreditTime(),
					DateUtils.format("yyyy-MM-dd HH:mm:ss"));
			int usedDay = repaymentrecord.getLoansign().getRealDay() != null ? repaymentrecord
					.getLoansign().getRealDay() : timeUse;
			interest = loanSignFund.instalmentInterest(bd, interestRate,
					usedDay, 2).doubleValue();
			if (timeNum > 0) { // 提前还款
				// 得到实际使用天数
				int time = DateUtils.differenceDate("yyyy-MM-dd",
						repaymentrecord.getLoansign().getLoansignbasics()
								.getCreditTime(),
						DateUtils.format("yyyy-MM-dd"));
				// 得到实际的利息
				interest = loanSignFund.instalmentInterest(
						new BigDecimal(repaymentrecord.getLoansign()
								.getIssueLoan()), interestRate, time, 2)
						.doubleValue();
				// 提前还款的违约金
				penalty = loanManageService.advanceAndOverdue(interest);
				expensesInfo.setState(Constant.STATUES_FIVE);
			} else if (timeNum < 0) { // 逾期还款
				// 逾期违约的金额
				penalty = loanManageService.overdueRepayment(repaymentrecord
						.getLoansign().getIssueLoan(), Math.abs(timeNum));
				expensesInfo.setState(Constant.STATUES_FOUR);
			} else { // 按时还款
				expensesInfo.setState(Constant.STATUES_TWO);
			}

			expensesInfo.setInterest(interest);
			expensesInfo.setManagement(managementCost);
			expensesInfo.setLoanid(repaymentrecord.getLoansign().getId());
			expensesInfo.setMoney(repaymentrecord.getLoansign().getIssueLoan());
			expensesInfo.setPenalty(penalty);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return expensesInfo;
	}

	/**
	 * 计算每笔借款借款者需要给平台的管理费
	 * 
	 * @param money
	 *            投资金额
	 * @param loan
	 *            借款标
	 * @return 返回管理费金额
	 */
	public Double getManagement(Double money, Loansign loan) {
		// 获取用户是否为vip会员
		boolean isPrivilege = userInfoQuery.isPrivilege(loan
				.getUserbasicsinfo());
		// 得到管理费
		Double managementCost = loanSignFund.managementFee(loan, isPrivilege)
				.doubleValue();
		return managementCost;
	}

	/**
	 * 得到借款人还款总额
	 * 
	 * @param repaymentInvestorInfos
	 * @return
	 */
	public String getRepmentSumMoney(List<RepaymentInvestor> infoList) {
		Double money = 0.0000;
		for (RepaymentInvestor info : infoList) {
			money += Double.parseDouble(info.getpInAmt());
		}
		return df.format(money);
	}

	/**
	 * 得到借款人总手续费
	 * 
	 * @param investorList
	 * @return
	 */
	public String getRepmentSumFee(List<RepaymentInvestor> investorList) {
		Double money = 0.0000;
		for (RepaymentInvestor info : investorList)
			for (int i = 0; i < investorList.size(); i++) {
				money += Double.parseDouble(info.getpOutInfoFee());
			}
		return df.format(money);
	}
}
