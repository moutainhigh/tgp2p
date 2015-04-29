package com.tpy.p2p.chesdai.spring.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.util.Arith;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import com.tpy.p2p.pay.entity.ExpensesInfo;
import com.tpy.p2p.pay.entity.RepaymentInvestor;
import org.springframework.stereotype.Service;

import com.tpy.base.util.DateUtils;

/**
 * 对还款信息封装成对象(只封装了投资者信息)
 * 
 * @author RanQiBing 2014-03-30
 * 
 */
@Service
public class LoanManageService {

	@Resource
	private HibernateSupport dao;

	@Resource
	private LoanSignFund loanSignFund;

	@Resource
	private LoanInfoService infoService;

	@Resource
	private UserBaseInfoService userBaseInfoService;

	private DecimalFormat df = new DecimalFormat("0.00");

	/**
	 * 根据标编号查询标的所有购买信息
	 * 
	 * @param id
	 *            标编号
	 * @return 返回一个需要还款给借款人的信息集合
	 */
	public List<RepaymentInvestor> listRepayment(Repaymentrecord repaymentrecord) {

		Loansign ls = repaymentrecord.getLoansign();
		// 得到一个标的所有购买记录
		List<ExpensesInfo> expensList = this.investorInteest(repaymentrecord);

		// 创建一个ips还款给投资人的利息
		List<RepaymentInvestor> list = new ArrayList<RepaymentInvestor>();
		// 借款人是否是vip
		// double borrowFee=0.00;
		// 管理费率
		// double
		// pmfeeratio=Arith.div(ls.getShouldPmfee(),ls.getIssueLoan()).doubleValue();
		// 借款费
		// borrowFee=Arith.mul(pmfeeratio,repaymentrecord.getPreRepayMoney()).doubleValue();
		for (ExpensesInfo ex : expensList) {
			RepaymentInvestor repayInfo = new RepaymentInvestor();
			repayInfo.setpCreMerBillNo(ex.getpMerBillNo());
			repayInfo.setpInAcctNo(ex.getIpsNumber());
			Double amt = ex.getInterest() + ex.getMoney();
			repayInfo.setpInAmt(df.format(amt));
			repayInfo.setpInFee(String.valueOf(df.format(ex.getManagement())));
			repayInfo
					.setpOutInfoFee(String.valueOf(df.format(ex.getPenalty())));
			repayInfo.setUserID(ex.getUserId());
			list.add(repayInfo);
		}

		return list;
	}

	/**
	 * 获取该标该期所有投资人的还款本金和利息
	 * 
	 * @param user
	 *            用户集合
	 * @param repaymentInfo
	 *            该标的该期的还款信息
	 * @return 用户所要还款的本金和利息集合
	 */
	@SuppressWarnings("unchecked")
	public List<ExpensesInfo> investorInteest(Repaymentrecord repaymentInfo) {

		List<ExpensesInfo> expensesList = new ArrayList<ExpensesInfo>();
		// 得到借款标的出借记录(相同投资人金额合并)
		String sql = "SELECT SUM(tenderMoney), u.id, f.pIdentNo, l.pMerBillNo, l.isPrivilege, s.id FROM loanrecord l, loansign s, userbasicsinfo u, userfundinfo f WHERE l.loanSign_id = s.id AND l.userbasicinfo_id = u.id AND u.id = f.id AND loanSign_id = ? GROUP BY l.userbasicinfo_id";
		List<Object[]> recordList = dao.findBySql(sql, repaymentInfo
				.getLoansign().getId());
		// 得到标的借款记录所有信息
		List<ExpensesInfo> list = this.getExpenses(repaymentInfo);
		Object[] obj = null;
		Loansign ls = repaymentInfo.getLoansign();
		int type = ls.getLoanType();
		for (int i = 0; i < recordList.size(); i++) {
			obj = recordList.get(i);
			ExpensesInfo expenses =null;
			if (type == 1 || type == 7) {
				if (ls.getRefundWay() == 1) {
					expenses = this.averageInterest(repaymentInfo,
							Double.parseDouble(String.valueOf(obj[0])),
							Integer.parseInt(String.valueOf(obj[4])));
				} else if (ls.getRefundWay() == 2) {
					expenses = this.monthlyPayInterest(repaymentInfo,
							Double.parseDouble(String.valueOf(obj[0])),
							Integer.parseInt(String.valueOf(obj[4])));
				} else {
					expenses = this.interestOnPrincipal(repaymentInfo,
							Double.parseDouble(String.valueOf(obj[0])),
							Integer.parseInt(String.valueOf(obj[4])));
				}
			} else {
				expenses = this.dayLoan(repaymentInfo,
						Double.parseDouble(String.valueOf(obj[0])),
						Integer.parseInt(String.valueOf(obj[4])));
			}
			expenses.setUserId(Long.parseLong(String.valueOf(obj[1])));
			expenses.setIpsNumber(String.valueOf(obj[2]));
			expenses.setLoanid(Long.parseLong(obj[5].toString()));
			expenses.setUserId(Long.parseLong(obj[1].toString()));
			expenses.setVip(Integer.parseInt(obj[4].toString()));
			expenses.setpMerBillNo(obj[3].toString());
			expensesList.add(expenses);
		}
		return expensesList;
	}

	/**
	 * 获取当前还款的所有投资人本金利息和违约金
	 * 
	 * @param repaymentrecord
	 *            当期还款信息
	 * @return 当期还款给所有投资人的资金信息
	 */
	@SuppressWarnings("unchecked")
	public List<ExpensesInfo> getExpenses(Repaymentrecord repaymentrecord) {
		List<ExpensesInfo> listRxpenses = new ArrayList<ExpensesInfo>();
		// 得到标的借款记录所有信息
		String hql = "from Loanrecord l where l.loansign.id=?";
		List<Loanrecord> recordLists = dao.find(hql, repaymentrecord
				.getLoansign().getId());
		int type = repaymentrecord.getLoansign().getLoanType();
		ExpensesInfo expenses = null;
		for (Loanrecord record : recordLists) {
			if (type == 1 || type == 7) {
				if (repaymentrecord.getLoansign().getRefundWay() == 1) {
					expenses = this.averageInterest(repaymentrecord,
							record.getTenderMoney(), record.getIsPrivilege());
				} else if (repaymentrecord.getLoansign().getRefundWay() == 2) {
					expenses = this.monthlyPayInterest(repaymentrecord,
							record.getTenderMoney(), record.getIsPrivilege());
				} else {
					expenses = this.interestOnPrincipal(repaymentrecord,
							record.getTenderMoney(), record.getIsPrivilege());
				}
			} else {
				expenses = this.dayLoan(repaymentrecord,
						record.getTenderMoney(), record.getIsPrivilege());
			}
			expenses.setUserId(record.getUserbasicsinfo().getId());
			expenses.setIpsNumber(record.getUserbasicsinfo().getUserfundinfo()
					.getpIdentNo());

			listRxpenses.add(expenses);
		}
		return listRxpenses;
	}

	/**
	 * 获取等额本息每一期的本金、利息、管理费
	 * 
	 * @param repaymentrecord
	 *            每一期的还款记录
	 * @param investorMoney
	 *            购买的金额
	 * @param vipNumber
	 *            会员类型(普通会员、特权会员)
	 * @return 返回 ExpensesInfo
	 * @throws java.text.ParseException
	 */
	public ExpensesInfo averageInterest(Repaymentrecord repaymentrecord,
			Double investorMoney, int vipNumber) {
		ExpensesInfo info = new ExpensesInfo();
		// 得到该用户购买的金额和标金额的比例
		double big = Arith.div(investorMoney, repaymentrecord.getLoansign()
                .getIssueLoan(), 4);
		info.setInterest(Arith.mul(repaymentrecord.getPreRepayMoney(), big));
		info.setLoanid(repaymentrecord.getLoansign().getId());
		info.setMoney(Arith.mul(repaymentrecord.getMoney(), big));
		// 不需要管理费
		Double management = loanSignFund.managementCost(
				new BigDecimal(Arith.mul(repaymentrecord.getPreRepayMoney(),
						big)), repaymentrecord.getLoansign(), vipNumber)
				.doubleValue();
		info.setManagement(management);
		int timeNum;
		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentrecord.getPreRepayDate());
			// 总的还款金额
			double totalRepayAmt = 0.00;
			// 已还款金额
			double unrepayAmt = 0.00;
			// 查需所有还款记录
			Set<Repaymentrecord> repaymentrecords = repaymentrecord
					.getLoansign().getRepaymentrecords();
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
			double unrepayRatioAmt = Arith.mul(
					Arith.div(unrepayAmt, totalRepayAmt), repaymentrecord
							.getLoansign().getIssueLoan().doubleValue());
			// 此比投资所占份额
			double insteretRatioAmt = Arith.mul(big, unrepayRatioAmt);
			double penalty = 0.0;
			// TODO 还款违约金设定为0,
			if (timeNum > 0) {// 提前还款
				penalty = Arith.mul(Arith.mul(insteretRatioAmt, repaymentrecord
						.getLoansign().getPrepaymentRate()), Math.abs(timeNum));
			} else {
				penalty = Arith.mul(Arith.mul(insteretRatioAmt, repaymentrecord
						.getLoansign().getOverdueRepayment()), Math
						.abs(timeNum));
			}
			info.setPenalty(penalty);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return info;
	}

	/**
	 * 得到相关购买信息的还款本金、利息、管理费(每月付息到期还本)
	 * 
	 * @param repaymentrecord
	 *            还款记录
	 * @param investorMoney
	 *            投资金额
	 * @param vipNumber
	 *            会员类型(普通会员、特权会员)
	 * @return 返回 ExpensesInfo
	 */
	public ExpensesInfo monthlyPayInterest(Repaymentrecord repaymentrecord,
			Double investorMoney, int vipNumber) {
		ExpensesInfo info = new ExpensesInfo();
		// 得到该用户购买的金额和标金额的比例
		double big = Arith.div(investorMoney, repaymentrecord.getLoansign()
				.getIssueLoan(), 4);
		info.setInterest(Arith.mul(repaymentrecord.getPreRepayMoney(), big));
		info.setLoanid(repaymentrecord.getLoansign().getId());
		info.setMoney(Arith.mul(repaymentrecord.getMoney(), big));
		Double management = loanSignFund.managementCost(
				new BigDecimal(Arith.mul(repaymentrecord.getPreRepayMoney(),
						big)), repaymentrecord.getLoansign(), vipNumber)
				.doubleValue();
		info.setManagement(management);
		// TODO 违约金设置为 0
		info.setPenalty(0.00);
		return info;
	}

	/**
	 * 得到相关购买信息的还款本金、利息、管理费(到期一次性付本息)
	 * 
	 * @param repaymentrecord
	 *            还款记录
	 * @param investorMoney
	 *            投资金额
	 * @param vipNumber
	 *            会员类型(普通会员、特权会员)
	 * @return 返回 ExpensesInfo
	 */
	public ExpensesInfo interestOnPrincipal(Repaymentrecord repaymentrecord,
			Double investorMoney, int vipNumber) {
		// 得到当前标的利率
		double interestRate = repaymentrecord.getLoansign().getRate();
		// //得到比例
		// BigDecimal big =
		// Arith.div(repaymentrecord.getLoansign().getIssueLoan(),
		// investorMoney, 4);
		ExpensesInfo expenses = new ExpensesInfo();
		// 实际利息
		Double interest = 0.00;
		// 违约金
		Double penalty = 0.00;
		// 管理费
		Double managementCost = 0.00;
		int timeNum = 0;
		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentrecord.getPreRepayDate());
			// 提前还款
			// 得到所有利息
			BigDecimal surplus = loanSignFund.instalmentInterest(
					new BigDecimal(investorMoney), interestRate,
					repaymentrecord.getLoansign().getMonth(), 1);
			interest = surplus.doubleValue();
			if (timeNum > 0) {
				String beginTime = repaymentrecord.getLoansign()
						.getLoansignbasics().getCreditTime();
				int time = DateUtils.differenceDate("yyyy-MM-dd", beginTime,
						DateUtils.format("yyyy-MM-dd"));
				// 得到天利率
				double rate = Arith.div(interestRate, 365);
				// 实际所得利息
				interest = Arith.mul(Arith.mul(investorMoney, rate), time);
				// 提前违约的金额
				penalty = this.advanceRepayment(interest.doubleValue());
				// 计算管理费
				managementCost = loanSignFund.managementCost(
						new BigDecimal(interest),
						repaymentrecord.getLoansign(), vipNumber).doubleValue();
			} else if (timeNum < 0) { // 逾期还款
				// 逾期违约的金额
				penalty = this.overdueRepayment(investorMoney,
						Math.abs(timeNum));
				// // 计算管理费
				managementCost = loanSignFund.managementCost(
						new BigDecimal(interest),
						repaymentrecord.getLoansign(), vipNumber).doubleValue();
			} else { // 按时还款
				managementCost = loanSignFund.managementCost(surplus,
						repaymentrecord.getLoansign(), vipNumber).doubleValue();
			}
			expenses.setInterest(interest);
			expenses.setLoanid(repaymentrecord.getLoansign().getId());
			expenses.setManagement(managementCost);
			expenses.setMoney(investorMoney);
			expenses.setPenalty(penalty);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expenses;
	}

	/**
	 * 天标的利息、违约金、管理费的算法
	 * 
	 * @param repaymentrecord
	 *            还款记录
	 * @param investorMoney
	 *            还款本金
	 * @param vipNumber
	 *            会员类型(0普通会员、1特权会员)
	 * @return 返回资金信息
	 */
	public ExpensesInfo dayLoan(Repaymentrecord repaymentrecord,
			Double investorMoney, int vipNumber) {
		ExpensesInfo expensesInfo = new ExpensesInfo();
		// 利率
		Double interestRate = repaymentrecord.getLoansign().getRate();
		// 预计使用天数
		// int day = repaymentrecord.getLoansign().getUseDay();
		// 利息
		Double interest = 0.00;
		// 管理费
		Double managementCost = 0.00;
		//
		Double penalty = 0.00;
		int timeNum = 0;
		try {
			timeNum = DateUtils.differenceDate("yyyy-MM-dd",
					DateUtils.format("yyyy-MM-dd"),
					repaymentrecord.getPreRepayDate());

			// 得到实际使用天数
			int rt = DateUtils.differenceDate("yyyy-MM-dd", repaymentrecord
					.getLoansign().getLoansignbasics().getCreditTime(),
					DateUtils.format("yyyy-MM-dd"));
			interest = loanSignFund
					.instalmentInterest(
							new BigDecimal(investorMoney),
							interestRate,
							repaymentrecord.getLoansign().getRealDay() != null ? repaymentrecord
									.getLoansign().getRealDay() : rt, 2)
					.doubleValue();
			if (timeNum > 0) { // 提前还款
				// 得到实际使用天数
				int time = DateUtils.differenceDate("yyyy-MM-dd",
						repaymentrecord.getLoansign().getLoansignbasics()
								.getCreditTime(),
						DateUtils.format("yyyy-MM-dd"));
				// 得到实际的利息
				interest = loanSignFund.instalmentInterest(
						new BigDecimal(investorMoney), interestRate, time, 2)
						.doubleValue();
				// 提前还款的违约金
				penalty = this.advanceAndOverdue(interest);
				// 得到管理费
				managementCost = loanSignFund.managementCost(
						new BigDecimal(interest),
						repaymentrecord.getLoansign(), vipNumber).doubleValue();
			} else if (timeNum < 0) { // 逾期还款
				// 逾期违约的金额
				penalty = this.overdueRepayment(investorMoney,
						Math.abs(timeNum));
				// 计算管理费
				managementCost = loanSignFund.managementCost(
						new BigDecimal(interest),
						repaymentrecord.getLoansign(), vipNumber).doubleValue();
			} else { // 按时还款
						// 计算管理费
				managementCost = loanSignFund.managementCost(
						new BigDecimal(interest),
						repaymentrecord.getLoansign(), vipNumber).doubleValue();
			}

			expensesInfo.setInterest(interest);
			expensesInfo.setManagement(managementCost);
			expensesInfo.setLoanid(repaymentrecord.getLoansign().getId());
			expensesInfo.setMoney(investorMoney);
			expensesInfo.setPenalty(penalty);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expensesInfo;
	}

	/**
	 * 计算天标提前的利息 (提前利息=未支付利息*50%)
	 * 
	 * @param interest
	 *            未支付的利息
	 * @return 返回利息
	 */
	public Double advanceAndOverdue(Double interest) {
		return Arith.mul(interest, 0.05);
	}

	/**
	 * 普通标的提前还款违约利息 (提前还款违约金 = 剩余未支付利息*提前还款比例)
	 * 
	 * @param interest
	 *            剩余未支付利息
	 * @param scale
	 *            提前还款比例
	 * @return 返回逾期违约金额
	 */
	@SuppressWarnings("unchecked")
	public Double advanceRepayment(Double interest) {
		String hql = "from Costratio c";
		List<Costratio> list = dao.find(hql);
		Costratio costratio = list.get(0);
		return Arith.mul(interest, costratio.getPrepaymentRate());
	}

	/**
	 * 普通标逾期还款违约利息 (逾期违约金额 = 借款金额*逾期利率*逾期天数)
	 * 
	 * @param money
	 *            借款金额
	 * @param scale
	 *            逾期利率
	 * @param day
	 *            逾期天数
	 * @return 返回逾期违约金额
	 */
	public Double overdueRepayment(Double money, int day) {
		String hql = "from Costratio c";
		List<Costratio> list = dao.find(hql);
		Costratio costratio = list.get(0);
		return Arith
				.mul(Arith.mul(money, costratio.getOverdueRepayment()), day);
	}

	/**
	 * 查找指定id的标
	 * 
	 * @return
	 */
	public List<Loansign> getList(Long id) {
		String hql = "from Loansign l WHERE ((l.loanType=1 AND l.refundWay=3) OR l.loanType=2 and l.loanType=3) AND l.loanstate=3 AND l.userbasicsinfo.id=?";
		List<Loansign> loanList = dao.find(hql, id);
		return loanList;
	}

	/**
	 * 得到发布中的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	public PageModel getAchieveLoan(HttpServletRequest request, Long userid,
			String beginTime, String endTime, PageModel page) {
		String sqlCount = "select count(l.id)";
		StringBuffer achieveSql = new StringBuffer(
				"SELECT s.loanNumber, s.loanTitle, l.issueLoan, l.rate, CASE WHEN l.refundWay = 1 THEN '按月等额本息' WHEN l.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END, l.`month`, l.publishTime, IFNULL(( SELECT sum(tenderMoney) FROM loanrecord WHERE loanrecord.loanSign_id = l.id ), 0 ) / issueLoan ");
		StringBuffer sql = new StringBuffer(
				" FROM loansign l,loansignbasics s WHERE l.id = s.id "
						+ "AND l.loanstate = 2 AND l.userbasicinfo_id = ")
				.append(userid);
		if (null != beginTime && !"".equals(beginTime)) {
			sql.append(" AND l.publishTime>='").append(StringUtil.replaceAll(beginTime)).append("'");
		}
		if (null != endTime && !"".equals(endTime)) {
			sql.append(" AND l.publishTime<='").append(StringUtil.replaceAll(endTime)).append("'");
		}
		sqlCount = sqlCount + sql.toString();
		achieveSql = achieveSql.append(sql);
		achieveSql
				.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.SRSRUES_TEN).append(",")
				.append(Constant.SRSRUES_TEN);
		page.setTotalCount(dao.queryNumberSql(sqlCount).intValue());
		List<Object[]> list = dao.findBySql(achieveSql.toString());
		page.setList(list);
		return page;
	}

	/**
	 * 得到还款中的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 * @throws java.text.ParseException
	 */
	@SuppressWarnings("unchecked")
	public PageModel getRepaymentLoan(HttpServletRequest request, Long userid,
			String beginTime, String endTime, PageModel page, String month)
			throws ParseException {
		String sqlCount = "select count(r.id) ";
		StringBuffer repaymentSql = new StringBuffer(
				"SELECT l.id, s.loanNumber, s.loanTitle, l.issueLoan, l.rate, CASE WHEN l.refundWay = 1"
						+ " THEN '按月等额本息' WHEN l.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END, l.`month`,"
						+ " l.useDay, s.creditTime, r.preRepayDate, SUM(r.money + r.preRepayMoney),r.repayState,r.id ");
		StringBuffer sql = new StringBuffer(
				"FROM loansign l, repaymentrecord r, loansignbasics s WHERE l.id = r.loanSign_id AND l.id = s.id AND"
						+ " l.loanstate = 3  AND l.userbasicinfo_id = ")
				.append(userid);
		if (null != month && !"".equals(month)) {
			if (Integer.parseInt(month) > 0) {
				String date = DateUtils.add("yyyy-MM-dd", Calendar.MONTH,Integer.parseInt(month));
				sql.append(" and r.preRepayDate<='").append(StringUtil.replaceAll(date)).append("'");
			}
		}
		if (null != beginTime && !"".equals(beginTime)) {
			sql.append(" and r.preRepayDate>='").append(StringUtil.replaceAll(beginTime)).append("'");
		}
		if (null != endTime && !"".equals(endTime)) {
			sql.append(" and r.preRepayDate<='").append(StringUtil.replaceAll(endTime)).append("'");
		}

		sqlCount = sqlCount + sql.toString();
		sql.append(" GROUP BY r.id");
		repaymentSql.append(sql);
		repaymentSql
				.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.SRSRUES_TEN).append(",")
				.append(Constant.SRSRUES_TEN);
		page.setTotalCount(dao.queryNumberSql(sqlCount).intValue());
		List<Object[]> list = dao.findBySql(repaymentSql.toString());
		page.setList(list);
		return page;
	}

	// /**
	// * 得到逾期中的借款给标
	// *
	// * @param request
	// * @beginTime 开始时间
	// * @endTime 结束时间
	// * @return 返回页面路径
	// */
	// @SuppressWarnings("unchecked")
	// public PageModel getOverdueLoan(HttpServletRequest request,Long userid,
	// String beginTime, String endTime,PageModel page) {
	// StringBuffer sqlCount = new StringBuffer("select count(r.id)");
	// StringBuffer oberdueSql = new
	// StringBuffer("SELECT r.id, s.loanNumber, s.loanTitle, l.issueLoan, l.rate, CASE WHEN l.refundWay = 1 THEN '按月等额本息' WHEN l.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END, l.`month`, l.useDay, s.creditTime, r.preRepayDate, SUM(r.money + r.preRepayMoney)");
	// StringBuffer sql = new
	// StringBuffer(" FROM loansign l, repaymentrecord r, loansignbasics s WHERE l.id = r.loanSign_id AND l.id = s.id AND ( r.repayState = 1 OR r.repayState = 3 ) AND r.preRepayDate < '").append(DateUtils.format("yyyy-MM-dd")).append("' AND l.userbasicinfo_id = ").append(userid);
	// if(null!=beginTime&&!"".equals(beginTime)){
	// sql.append(" and r.r.preRepayDate>='").append(beginTime).append("'");
	// }
	// if(null!=endTime&&!"".equals(endTime)){
	// sql.append(" and r.r.preRepayDate<='").append(endTime).append("'");
	// }
	// sql.append(" GROUP BY r.id");
	// sqlCount.append(sql);
	// oberdueSql.append(sql);
	// oberdueSql.append(" LIMIT ").append((page.getPageNum()-Constant.STATUES_ONE)*Constant.SRSRUES_TEN).append(",").append(Constant.SRSRUES_TEN);
	// page.setTotalCount(dao.queryNumberSql(sqlCount.toString()).intValue());
	// List<Object[]> list= dao.findBySql(oberdueSql.toString());
	// page.setList(list);
	// return page;
	// }

	/**
	 * 得到还款中的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 * @throws java.text.ParseException
	 */
	@SuppressWarnings("unchecked")
	public PageModel getHasTheRepaymentLoan(HttpServletRequest request,
			Long userid, String beginTime, String endTime, PageModel page)
			throws ParseException {
		String sqlCount = "select count(r.id)";
		StringBuffer repaymentSql = new StringBuffer(
				"SELECT r.id, s.loanNumber, s.loanTitle, l.issueLoan, l.rate, CASE WHEN l.refundWay = 1"
						+ " THEN '按月等额本息' WHEN l.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END, l.`month`,"
						+ " l.useDay, s.creditTime, r.preRepayDate, SUM(r.money + r.preRepayMoney), r.overdueInterest ");
		StringBuffer sql = new StringBuffer(
				"FROM loansign l, repaymentrecord r, loansignbasics s WHERE l.id = r.loanSign_id AND l.id = s.id AND"
						+ " l.loanstate!=4 and (r.repayState != 1 and r.repayState!=3) AND l.userbasicinfo_id = ")
				.append(userid);
		if (null != beginTime && !"".equals(beginTime)) {
			sql.append(" and r.preRepayDate>='").append(beginTime).append("'");
		}
		if (null != endTime && !"".equals(endTime)) {
			sql.append(" and r.preRepayDate<='").append(endTime).append("'");
		}
		sqlCount = sqlCount + sql.toString();

		repaymentSql.append(sql);
		sql.append(" GROUP BY r.id");
		repaymentSql
				.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.SRSRUES_TEN).append(",")
				.append(Constant.SRSRUES_TEN);
		page.setTotalCount(dao.queryNumberSql(sqlCount).intValue());
		List<Object[]> list = dao.findBySql(repaymentSql.toString());
		page.setList(list);
		return page;
	}

	/**
	 * 得到已完成的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@SuppressWarnings("unchecked")
	public PageModel getUnderwayLoan(HttpServletRequest request, Long userid,
			String beginTime, String endTime, PageModel page) {
		String sqlCount = "select count(l.id) from loansign l where l.loanstate=4 and l.userbasicinfo_id=?";
		StringBuffer sql = new StringBuffer(
				"SELECT s.loanNumber, s.loanTitle,l.issueLoan,l.rate,CASE WHEN l.refundWay = 1 THEN '按月等额本息' WHEN l.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END, l.`month`, l.useDay FROM loansign l,loansignbasics s WHERE l.id = s.id AND l.loanstate = 4 AND l.userbasicinfo_id=")
				.append(userid);
		sql.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.SRSRUES_TEN).append(",")
				.append(Constant.SRSRUES_TEN);
		page.setTotalCount(dao.queryNumberSql(sqlCount, userid).intValue());
		List<Object[]> list = dao.findBySql(sql.toString());
		page.setList(list);
		return page;
	}

	/**
	 * 获取标的所有信息
	 * 
	 * @param money
	 *            标的借款金额
	 * @param month
	 *            标的期限
	 * @param type
	 *            还款类型
	 * @param rank
	 *            借款者信用等级
	 * @param loanType
	 *            借款标类型
	 * @param page
	 *            分页对象
	 * @return 返回分页对象
	 */
	@SuppressWarnings("unchecked")
	public PageModel getLoanList(String money, String month, String loanstate,
			String rank, String loanType, PageModel page) {
		StringBuffer sql = new StringBuffer(
				"SELECT l.id,s.loanTitle,l.userbasicinfo_id,l.issueLoan,l.rate,l.MONTH,l.useDay,l.loanstate,ROUND(IFNULL((SELECT SUM(loanrecord.tenderMoney) FROM loanrecord WHERE loanrecord.loanSign_id = l.id),0) / l.issueLoan,2),(SELECT typename FROM loansign_type where loansign_type.id=l.loansignType_id),l.loansignType_id,l.loanType,s.views,l.refundWay,ROUND(l.issueLoan/l.loanUnit),(SELECT sum(tenderMoney) as tenderMoney FROM loanrecord where loanrecord.loanSign_id=l.id),l.publishTime,l.endTime,l.loanType,l.loanstate,l.subtype");
		StringBuffer sqlCount = new StringBuffer("select count(l.id) ");
		StringBuffer sqlsb = new StringBuffer(
				" FROM loansign l,loansignbasics s,borrowersbase b WHERE l.id = s.id and l.userbasicinfo_id=b.userbasicinfo_id AND l.loanstate!=1 AND l.loanType != 7 AND l.loanType != 6 AND l.isShow=1");
		// 判断金额
		if (null != money && !"".equals(money)) {
			if (Integer.parseInt(money) == 1) { // 10万以内
				sqlsb.append(" and l.issueLoan<=").append(100000);
			}
			if (Integer.parseInt(money) == 2) {// 10万到100万
				sqlsb.append(" and l.issueLoan>").append(100000)
						.append(" and l.issueLoan>").append(1000000);
			}
			if (Integer.parseInt(money) == 3) {// 100万到200万
				sqlsb.append(" and l.issueLoan>").append(1000000)
						.append(" and l.issueLoan>").append(2000000);
			}
			if (Integer.parseInt(money) == 4) {// 200万以上
				sqlsb.append(" and l.issueLoan>").append(2000000);
			}
		}

		// 判断标的还款类型
		if (null != loanstate && !"".equals(loanstate)) {
			if (Integer.parseInt(loanstate) == 1) {
				sqlsb.append(" and (l.loanstate =2) ");
			}
			if (Integer.parseInt(loanstate) == 2) {
				sqlsb.append(" and (l.loanstate =2) ");
			}
			if (Integer.parseInt(loanstate) == 3) {
				sqlsb.append(" and (l.loanstate =3) ");
			}
			if (Integer.parseInt(loanstate) == 4) {
				sqlsb.append(" and (l.loanstate =4) ");
			}
		}
		// 判断标的期限
		if (null != month && !"".equals(month)) {
			if (Integer.parseInt(month) == 1) {
				sqlsb.append(" and (l.`month` <=3) ");
			}
			if (Integer.parseInt(month) == 2) {
				sqlsb.append(" and ((l.`month` > 3 and l.`month`<= 6) ) ");
			}
			if (Integer.parseInt(month) == 3) {
				sqlsb.append(" and ((l.`month` > 6 and l.`month`<= 9)) ");
			}
			if (Integer.parseInt(month) == 4) {
				sqlsb.append(" and ((l.`month` > 9 and l.`month`<= 12)) ");
			}
			if (Integer.parseInt(month) == 5) {
				sqlsb.append(" and (l.`month` >12) ");
			}
		}
		// 借款标类型
		if (null != loanType && !"".equals(loanType)) {
			if (Integer.parseInt(loanType) == 1) {
				sqlsb.append(" and l.loanType = 2");
			} else if (Integer.parseInt(loanType) > 1) {
				sqlsb.append(" and l.loanType = 1 and l.loansignType_id=")
						.append(Integer.parseInt(loanType) - 1);
			}
		}
		// 借款者信用等级
		if (null != rank && !"".equals(rank)) {
			if (Integer.parseInt(rank) == 1) {
				sqlsb.append(" and b.suminte > 10 and b.suminte <=20");
			} else if (Integer.parseInt(rank) == 2) {
				sqlsb.append(" and b.suminte > 30 and b.suminte <=40");
			} else if (Integer.parseInt(rank) == 3) {
				sqlsb.append(" and b.suminte > 50 and b.suminte <=60");
			} else if (Integer.parseInt(rank) == 4) {
				sqlsb.append(" and b.suminte > 80 and b.suminte <=110");
			} else if (Integer.parseInt(rank) == 5) {
				sqlsb.append(" and b.suminte > 180");
			}
		}

		sqlsb.append(" order by l.id desc,l.loanState asc,l.publishTime desc");
		page.setTotalCount(dao
				.queryNumberSql(sqlCount.append(sqlsb).toString()).intValue());
		sqlsb.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.STATUES_SIX).append(",")
				.append(page.getNumPerPage());
		List<Loansign> list = dao.findBySql(sql.append(sqlsb).toString());
		page.setList(list);
		return page;
	}

	/**
	 * 获取债权转让
	 * 
	 * @param money
	 *            标的借款金额
	 * @param month
	 *            标的期限
	 * @param type
	 *            还款类型
	 * @param rank
	 *            借款者信用等级
	 * @param loanType
	 *            借款标类型
	 * @param page
	 *            分页对象
	 * @return 返回分页对象
	 */
	@SuppressWarnings("unchecked")
	public PageModel getLoanListCir(String money, String month,
			String loanstate, String rank, String loanType, PageModel page) {
		StringBuffer sql = new StringBuffer(
				"SELECT l.id,s.loanTitle,l.userbasicinfo_id,l.issueLoan,l.rate,l. MONTH,l.useDay,l.loanstate,ROUND(IFNULL((SELECT SUM(loanrecord.tenderMoney) FROM loanrecord WHERE loanrecord.loanSign_id = l.id),0) / l.issueLoan,2),(SELECT typename FROM loansign_type where loansign_type.id=l.loansignType_id),l.loansignType_id,l.loanType,s.views,l.refundWay,ROUND(l.issueLoan/l.loanUnit),(SELECT sum(tenderMoney) as tenderMoney FROM loanrecord where loanrecord.loanSign_id=l.id),l.subtype");

		StringBuffer sqlCount = new StringBuffer("select count(l.id) ");
		StringBuffer sqlsb = new StringBuffer(
				" FROM loansign l,loansignbasics s,borrowersbase b WHERE l.id = s.id and l.userbasicinfo_id=b.userbasicinfo_id AND l.loanstate!=1 AND l.loanType = 6 AND l.isShow=1");
		// 判断金额
		if (null != money && !"".equals(money)) {
			if (Integer.parseInt(money) == 1) { // 10万以内
				sqlsb.append(" and l.issueLoan<=").append(100000);
			}
			if (Integer.parseInt(money) == 2) {// 10万到100万
				sqlsb.append(" and l.issueLoan>").append(100000)
						.append(" and l.issueLoan>").append(1000000);
			}
			if (Integer.parseInt(money) == 3) {// 100万到200万
				sqlsb.append(" and l.issueLoan>").append(1000000)
						.append(" and l.issueLoan>").append(2000000);
			}
			if (Integer.parseInt(money) == 4) {// 200万以上
				sqlsb.append(" and l.issueLoan>").append(2000000);
			}
		}

		// 判断标的还款类型
		if (null != loanstate && !"".equals(loanstate)) {
			if (Integer.parseInt(loanstate) == 1) {
				sqlsb.append(" and (l.loanstate =2) ");
			}
			if (Integer.parseInt(loanstate) == 2) {
				sqlsb.append(" and (l.loanstate =2) ");
			}
			if (Integer.parseInt(loanstate) == 3) {
				sqlsb.append(" and (l.loanstate =3) ");
			}
			if (Integer.parseInt(loanstate) == 4) {
				sqlsb.append(" and (l.loanstate =4) ");
			}
		}
		// 判断标的期限
		if (null != month && !"".equals(month)) {
			if (Integer.parseInt(month) == 1) {
				sqlsb.append(" and (l.`month` <=3) ");
			}
			if (Integer.parseInt(month) == 2) {
				sqlsb.append(" and ((l.`month` > 3 and l.`month`< 6) ) ");
			}
			if (Integer.parseInt(month) == 3) {
				sqlsb.append(" and ((l.`month` > 6 and l.`month`< 9)) ");
			}
			if (Integer.parseInt(month) == 4) {
				sqlsb.append(" and ((l.`month` > 9 and l.`month`< 12)) ");
			}
			if (Integer.parseInt(month) == 5) {
				sqlsb.append(" and (l.`month` >12) ");
			}
		}
		// 借款标类型
		if (null != loanType && !"".equals(loanType)) {
			if (Integer.parseInt(loanType) == 1) {
				sqlsb.append(" and l.loanType = 2");
			} else if (Integer.parseInt(loanType) > 1) {
				sqlsb.append(" and l.loanType = 1 and l.loansignType_id=")
						.append(Integer.parseInt(loanType) - 1);
			}
		}
		// 借款者信用等级
		if (null != rank && !"".equals(rank)) {
			if (Integer.parseInt(rank) == 1) {
				sqlsb.append(" and b.suminte > 10 and b.suminte <=20");
			} else if (Integer.parseInt(rank) == 2) {
				sqlsb.append(" and b.suminte > 30 and b.suminte <=40");
			} else if (Integer.parseInt(rank) == 3) {
				sqlsb.append(" and b.suminte > 50 and b.suminte <=60");
			} else if (Integer.parseInt(rank) == 4) {
				sqlsb.append(" and b.suminte > 80 and b.suminte <=110");
			} else if (Integer.parseInt(rank) == 5) {
				sqlsb.append(" and b.suminte > 180");
			}
		}

		sqlsb.append(" order by l.id desc,l.loanState asc,l.publishTime desc");



		page.setTotalCount(dao.queryNumberSql(sqlCount.append(sqlsb).toString()).intValue());
		sqlsb.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.STATUES_SIX).append(",")
				.append(Constant.STATUES_SIX);

		System.out.println("###########################################"+sqlsb.toString());
		List<Loansign> list = dao.findBySql(sql.append(sqlsb).toString());
		page.setList(list);
		return page;
	}

	@SuppressWarnings("unchecked")
	public PageModel getAppLoanListCir(String money, String month,
			String loanstate, String rank, String loanType, PageModel page) {
		StringBuffer sql = new StringBuffer(
				"SELECT l.id,s.loanTitle,l.userbasicinfo_id,l.issueLoan,l.rate,l. MONTH,l.useDay,l.loanstate,ROUND(IFNULL((SELECT SUM(loanrecord.tenderMoney) FROM loanrecord WHERE loanrecord.loanSign_id = l.id),0) / l.issueLoan,2),(SELECT typename FROM loansign_type where loansign_type.id=l.loansignType_id),l.loansignType_id,l.loanType,s.views,l.refundWay,ROUND(l.issueLoan/l.loanUnit),(SELECT sum(tenderMoney) as tenderMoney FROM loanrecord where loanrecord.loanSign_id=l.id)");
		StringBuffer sqlCount = new StringBuffer("select count(l.id) ");
		StringBuffer sqlsb = new StringBuffer(
				" FROM loansign l,loansignbasics s,borrowersbase b WHERE l.id = s.id and l.userbasicinfo_id=b.userbasicinfo_id AND l.loanstate!=1 AND l.loanType = 6 AND l.isShow=1");
		// 判断金额
		if (null != money && !"".equals(money)) {
			if (Integer.parseInt(money) == 1) { // 10万以内
				sqlsb.append(" and l.issueLoan<=").append(100000);
			}
			if (Integer.parseInt(money) == 2) {// 10万到100万
				sqlsb.append(" and l.issueLoan>").append(100000)
						.append(" and l.issueLoan>").append(1000000);
			}
			if (Integer.parseInt(money) == 3) {// 100万到200万
				sqlsb.append(" and l.issueLoan>").append(1000000)
						.append(" and l.issueLoan>").append(2000000);
			}
			if (Integer.parseInt(money) == 4) {// 200万以上
				sqlsb.append(" and l.issueLoan>").append(2000000);
			}
		}
		// 判断标的还款类型
		if (null != loanstate && !"".equals(loanstate)) {
			if (Integer.parseInt(loanstate) == 1) {
				sqlsb.append(" and (l.loanstate =2) ");
			}
			if (Integer.parseInt(loanstate) == 2) {
				sqlsb.append(" and (l.loanstate =2) ");
			}
			if (Integer.parseInt(loanstate) == 3) {
				sqlsb.append(" and (l.loanstate =3) ");
			}
			if (Integer.parseInt(loanstate) == 4) {
				sqlsb.append(" and (l.loanstate =4) ");
			}
		}
		// 判断标的期限
		if (null != month && !"".equals(month)) {
			if (Integer.parseInt(month) == 1) {
				sqlsb.append(" and (l.`month` <=3) ");
			}
			if (Integer.parseInt(month) == 2) {
				sqlsb.append(" and ((l.`month` > 3 and l.`month`< 6) ) ");
			}
			if (Integer.parseInt(month) == 3) {
				sqlsb.append(" and ((l.`month` > 6 and l.`month`< 9)) ");
			}
			if (Integer.parseInt(month) == 4) {
				sqlsb.append(" and ((l.`month` > 9 and l.`month`< 12)) ");
			}
			if (Integer.parseInt(month) == 5) {
				sqlsb.append(" and (l.`month` >12) ");
			}
		}
		// 借款标类型
		if (null != loanType && !"".equals(loanType)) {
			if (Integer.parseInt(loanType) == 1) {
				sqlsb.append(" and l.loanType = 2");
			} else if (Integer.parseInt(loanType) > 1) {
				sqlsb.append(" and l.loanType = 1 and l.loansignType_id=")
						.append(Integer.parseInt(loanType) - 1);
			}
		}
		// 借款者信用等级
		if (null != rank && !"".equals(rank)) {
			if (Integer.parseInt(rank) == 1) {
				sqlsb.append(" and b.suminte > 10 and b.suminte <=20");
			} else if (Integer.parseInt(rank) == 2) {
				sqlsb.append(" and b.suminte > 30 and b.suminte <=40");
			} else if (Integer.parseInt(rank) == 3) {
				sqlsb.append(" and b.suminte > 50 and b.suminte <=60");
			} else if (Integer.parseInt(rank) == 4) {
				sqlsb.append(" and b.suminte > 80 and b.suminte <=110");
			} else if (Integer.parseInt(rank) == 5) {
				sqlsb.append(" and b.suminte > 180");
			}
		}

		sqlsb.append(" order by l.id desc,l.loanState asc,l.publishTime desc");
		page.setTotalCount(dao
				.queryNumberSql(sqlCount.append(sqlsb).toString()).intValue());
		sqlsb.append(" LIMIT ")
				.append((page.getPageNum() - Constant.STATUES_ONE)
						* Constant.STATUES_SIX).append(",")
				.append(page.getNumPerPage());
		String sql_ = sql.append(sqlsb).toString();
		List<Loansign> list = dao.findBySql(sql.append(sqlsb).toString());
		page.setList(list);
		return page;
	}

	/**
	 * 还款操作
	 * @param user
	 * @param repaymentrecord
	 * @param loan
	 * @param investorList
	 * @return
	 */
	public boolean repayment(Userbasicsinfo user ,Repaymentrecord repaymentrecord,Loansign loan,List<RepaymentInvestor> investorList ){
		try {
			Long userid = user.getId();
			double amount = Arith.add(repaymentrecord.getPreRepayMoney(),repaymentrecord.getMoney());
			// 平台收取还款人手续费:借款金额*管理费比例
			double fee =Arith.mul(loan.getPmfeeratio(), loan.getIssueLoan());
			//扣除还款人帐户资金
			minusUserAmount(user, fee, amount);

			for (RepaymentInvestor inverstor : investorList) {
                //本金
                double inAmount = Double.parseDouble(inverstor.getpInAmt());
                // 平台手续费+违约金
                double inFee = Arith.add(Double.parseDouble(inverstor.getpInFee()),Double.parseDouble(inverstor.getpOutInfoFee()));
                inverstor.getUserID().toString();
                addUserAmount(inverstor.getUserID() ,inFee, inAmount);
            }
			return true;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 *
	 * @param user
	 * @param fee
	 * @param amount
	 * @return
	 */
	public boolean minusUserAmount(Userbasicsinfo user,double fee,double amount){
		String sql = "UPDATE userfundinfo SET cashBalance=?,money=? where id=?";

		int rst = dao.executeSql(sql, user.getUserfundinfo().getCashBalance() - (fee+amount),user.getUserfundinfo().getCashBalance() - (fee+amount), user.getId());
		if(rst>0) {
			return true;
		}else{
			return false;
		}
	}

	public boolean addUserAmount(long userid,double fee,double amount){
		Userbasicsinfo user = userBaseInfoService.queryUserById(userid);
		String sql = "UPDATE userfundinfo SET cashBalance=?,money=? where id=?";
		int rst = dao.executeSql(sql, user.getUserfundinfo().getCashBalance() + (fee+amount), user.getUserfundinfo().getMoney() + (fee+amount), user.getId());
		if(rst>0) {
			return true;
		}else{
			return false;
		}
	}
}
