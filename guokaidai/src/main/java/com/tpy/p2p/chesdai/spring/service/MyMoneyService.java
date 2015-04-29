package com.tpy.p2p.chesdai.spring.service;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import com.tpy.p2p.core.service.LoanrecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import com.tpy.p2p.core.service.LoanrecordService;

/**
 * 资金统计
 * 
 * @author ransheng
 * 
 */
@Service
@SuppressWarnings(value = { "rawtypes" })
public class MyMoneyService {

	/**
	 * 数据库接口
	 */
	@Resource
	private HibernateSupport commonDao;

	@Autowired
	private LoanSignFund loanSignFund;

	@Resource
	private LoanrecordService loanrecordService;

	/**
	 * 用户的待收本金金额
	 * 
	 * @param id
	 * @return 待收本金金额
	 */
	public Object toBeClosed(Long id) {
		String sql = "SELECT b.loanSign_id,IFNULL(SUM(tenderMoney),0) FROM loanrecord b "
				+ "WHERE b.userbasicinfo_id=? AND b.loanSign_id IN "
				+ "(SELECT a.id FROM loansign a WHERE  a.loanstate=2 OR a.loanstate=3)"
				+ " GROUP BY b.loanSign_id";
		List list = commonDao.findBySql(sql, id);
		BigDecimal tobenum = new BigDecimal(0);
		// 认购金额
		BigDecimal loanrecordSum = new BigDecimal(0);
		// 未还款的金额
		BigDecimal alSoDum = new BigDecimal(0);
		Object object = null;
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			if (obj[0] != null) {

				// 总未还款还金额
				sql = "select IFNULL(SUM(money),0) from repaymentrecord where repayState=1 AND loanSign_id="
						+ obj[0];

				alSoDum = (BigDecimal) commonDao.findObjectBySql(sql);
				if (alSoDum.doubleValue() <= 0) {
					continue;
				}
				// 总投资额
				int investTotal = loanrecordService.getLoanrecordSum(Long
						.parseLong(String.valueOf(obj[0])));
				loanrecordSum = (BigDecimal) obj[1];
				if (loanrecordSum.compareTo(BigDecimal.valueOf(0)) == 0
						|| loanrecordSum.compareTo(BigDecimal.valueOf(0)) == -1) {
					continue;
				}
				// 认购金额跟标的总金额比例
				BigDecimal percent = new BigDecimal(investTotal).divide(
						loanrecordSum, 4, BigDecimal.ROUND_HALF_EVEN);
				// 比例不能为空
				if (percent.compareTo(BigDecimal.valueOf(0)) == 0
						|| percent.compareTo(BigDecimal.valueOf(0)) == -1) {
					continue;
				}
				tobenum = alSoDum
						.divide(percent, 4, BigDecimal.ROUND_HALF_EVEN).add(
								tobenum);
			}
		}

		return tobenum;
	}

	/**
	 * 逾期总额
	 * 
	 * @param id
	 *            用户编号
	 * @return 逾期总额
	 */
	public Object overude(Long id) {
		String sql = "SELECT IFNULL(SUM(preRepayMoney)+SUM(money),0) FROM loansign a "
				+ "INNER JOIN repaymentrecord b ON a.id=b.loanSign_id WHERE b.repayState=3 AND a.userbasicinfo_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 待付本息金额
	 * 
	 * @param id
	 *            用户编号
	 * @return 待付本息金额
	 */
	public Object colltionPrinInterest(Long id) {
		String sql = "SELECT IFNULL(SUM(b.preRepayMoney),0)+IFNULL(SUM(b.money),0) FROM "
				+ "loansign a, repaymentrecord b WHERE a.userbasicinfo_id = ? AND "
				+ "b.loanSign_id = a.id AND (a.loanstate=2 OR a.loanstate=3) "
				+ "AND (b.repayState=1 OR b.repayState=3)";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 净值标总额 （冻结金额）
	 * 
	 * @param id
	 *            用户编号
	 * @return 净值标总额
	 */
	public Object netMark(Long id) {
		String sql = "SELECT IFNULL(SUM(issueLoan),0) FROM loansign WHERE userbasicinfo_id=? AND loanType=5";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 待确认提现
	 * 
	 * @param id
	 *            用户编号
	 * @return 待确认提现
	 */
	public Object withdrawTobe(Long id) {
		String sql = "SELECT IFNULL(SUM(withdrawAmount),0)+IFNULL(SUM(deposit),0) FROM withdraw "
				+ "WHERE user_id=? AND (withdrawstate=0 OR withdrawstate=1)";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 待确认充值
	 * 
	 * @param id
	 *            用户编号
	 * @return 待确认充值
	 */
	public Object rechargeTobe(Long id) {
		String sql = "SELECT IFNULL(SUM(rechargeAmount),0) FROM recharge "
				+ "WHERE user_id=? AND status=0 ";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 累计奖励
	 * 
	 * @param id
	 *            用户编号
	 * @return 累计奖励
	 */
	public Object accumulative(Long id) {
		String sql = "SELECT IFNULL(SUM(income),0) FROM accountinfo WHERE accounttype_id=9 AND userbasic_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 平台累计支付
	 * 
	 * @param id
	 *            用户编号
	 * @return 平台累计支付
	 */
	public Object adminAccumulative(Long id) {
		String sql = "SELECT IFNULL(SUM(b.money),0)+IFNULL(SUM(b.preRepayMoney),0) FROM "
				+ "loansign a,repaymentrecord b WHERE a.id=b.loanSign_id AND "
				+ "a.userbasicinfo_id=? AND b.repayState=3";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 投资收入
	 * 
	 * @param id
	 *            用户编号
	 * @return 投资收入
	 */
	public Object getInterest(Long id) {
		String sql1 = "SELECT IFNULL(SUM(a.income),0) FROM "
				+ "accountinfo a WHERE a.userbasic_id=? AND "
				+ "a.accounttype_id=7 ";
		// 获得投资人利息
		Object obj1 = commonDao.findObjectBySql(sql1, id);
		String sql2 = "SELECT IFNULL(SUM(a.expenditure),0) FROM "
				+ "accountinfo a WHERE a.userbasic_id=? AND "
				+ "a.accounttype_id=5 ";
		// 获得投资人管理费
		Object obj2 = commonDao.findObjectBySql(sql2, id);
		return Arith.sub(new BigDecimal(obj1.toString()),
                new BigDecimal(obj2.toString()));
	}

	/**
	 * 净赚利息
	 * 
	 * @param id
	 *            用户编号
	 * @return 净赚利息
	 */
	public Object netInterest(Long id) {
		String sql = "SELECT b.loanSign_id,IFNULL(SUM(tenderMoney),0) FROM loanrecord b "
				+ "WHERE b.userbasicinfo_id=? AND b.loanSign_id IN "
				+ "(SELECT a.id FROM loansign a WHERE  a.loanstate=3 OR a.loanstate=4)"
				+ " GROUP BY b.loanSign_id";
		List list = commonDao.findBySql(sql, id);
		// 认购金额
		BigDecimal loanrecordSum = new BigDecimal(0);
		// 个人利息
		BigDecimal personal = new BigDecimal(0);
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			loanrecordSum = (BigDecimal) obj[1];
			BigDecimal inverstTotal = new BigDecimal(0);
			if (obj[0] != null) {
				sql = "SELECT count(*) FROM repaymentrecord WHERE  repayState!=1 AND repayState!=3  AND loanSign_id="
						+ obj[0];
				Integer count = Integer.parseInt(commonDao.findObjectBySql(sql)
						.toString());
				if (count > 0) {
					// sql = "SELECT issueLoan FROM loansign WHERE id=" +
					// obj[0];
					// BigDecimal loansign = (BigDecimal) commonDao
					// .findObjectBySql(sql);
					// loansignSum = loansignSum.add(loansign);
					// loanrecordSum = loanrecordSum.add((BigDecimal) obj[1]);
					inverstTotal = new BigDecimal(
							loanrecordService.getLoanrecordSum(Long
									.parseLong(String.valueOf(obj[0]))));
				}
			} else {
				continue;
			}
			if (loanrecordSum.compareTo(BigDecimal.valueOf(0)) == 0
					|| loanrecordSum.compareTo(BigDecimal.valueOf(0)) == -1) {
				continue;
			}
			// 认购金额跟标的总金额比例
			BigDecimal percent = inverstTotal.divide(loanrecordSum, 4,
					BigDecimal.ROUND_HALF_EVEN);

			if (percent.compareTo(BigDecimal.valueOf(0)) == 0
					|| percent.compareTo(BigDecimal.valueOf(0)) == -1) {
				continue;
			}
			sql = "SELECT SUM(preRepayMoney) FROM repaymentrecord WHERE repayState!=1 AND repayState!=3 AND loanSign_id="
					+ obj[0];
			List intrestList = commonDao.findBySql(sql);
			// 总还款利息
			BigDecimal repayMoney = new BigDecimal(0);
			if (intrestList != null && intrestList.size() > 0) {
				repayMoney = repayMoney.add(new BigDecimal(String
						.valueOf(intrestList.get(0))));
			} else {
				repayMoney = repayMoney.add(new BigDecimal(0));
			}
			// 个人利息=总还款利息/(总金额/认购金额)
			personal = personal.add(repayMoney.divide(percent, 4,
					BigDecimal.ROUND_HALF_EVEN));
		}

		// 佣金
		// BigDecimal comm = (BigDecimal) commission(id);

		// 净赚利息=利息-佣金
		return personal;
	}

	/**
	 * 借款支出
	 * 
	 * @param id
	 *            用户编号
	 * @return 借款支出
	 */
	public Object netInterestPaid(Long id) {
		String sql1 = "SELECT IFNULL(SUM(a.expenditure),0) FROM "
				+ "accountinfo a WHERE a.userbasic_id=? AND "
				+ "a.accounttype_id=4 ";
		// 获得借款人利息
		Object obj1 = commonDao.findObjectBySql(sql1, id);
		String sql2 = "SELECT IFNULL(SUM(a.expenditure),0) FROM "
				+ "accountinfo a WHERE a.userbasic_id=? AND "
				+ "a.accounttype_id=2 ";
		// 获得借款人管理费
		Object obj2 = commonDao.findObjectBySql(sql2, id);
		return Arith.add(Double.parseDouble(obj1.toString()),
				Double.parseDouble(obj2.toString()));
	}

	/**
	 * <p>
	 * Title: latePayment
	 * </p>
	 * <p>
	 * Description: 逾期还款违约金
	 * </p>
	 * 
	 * @param id
	 *            用户编号
	 * @return 逾期还款违约金(借款者才有)
	 */
	public Object latePayment(Long id) {
		String sql = "SELECT IFNULL(SUM(a.expenditure),0) FROM "
				+ "accountinfo a WHERE a.userbasic_id=? AND "
				+ "a.accounttype_id=13 ";
		return commonDao.findObjectBySql(sql, id);
	}

	/**
	 * <p>
	 * Title: latePayment
	 * </p>
	 * <p>
	 * Description: 提前还款违约金
	 * </p>
	 * 
	 * @param id
	 *            用户编号
	 * @return 提前还款违约金
	 */
	public Object prepayment(Long id) {
		String sql = "SELECT IFNULL(SUM(a.expenditure),0) FROM "
				+ "accountinfo a WHERE a.userbasic_id=? AND "
				+ "a.accounttype_id=12 ";
		return commonDao.findObjectBySql(sql, id);
	}

	/**
	 * 累计支付会员费
	 * 
	 * @param id
	 *            用户编号
	 * @return 累计支付会员费
	 */
	public Object vipSum(Long id) {
		String sql = "SELECT IFNULL(SUM(a.money),0) FROM accountinfo a WHERE a.userbasic_id=? and a.accounttype_id=1";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 累计提现手续费
	 * 
	 * @param id
	 *            用户编号
	 * @return 累计提现手续费
	 */
	public Object witharwDeposit(Long id) {
		String sql = "SELECT IFNULL(SUM(deposit),0) FROM withdraw a "
				+ "WHERE a.user_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 累计充值手续费
	 * 
	 * @param id
	 *            编号
	 * @return 充值手续费
	 */
	public Object rechargeDeposit(Long id) {
		String sql = "SELECT IFNULL(SUM(expenditure),0) FROM accountinfo WHERE accounttype_id=16 AND userbasic_id=?";
		return commonDao.findObjectBySql(sql, id);
	}

	/**
	 * 累计投资金额
	 * 
	 * @param id
	 *            会员编号
	 * @return 累计投资金额
	 */
	public Object investmentRecords(Long id) {
		String sql = "SELECT IFNULL(SUM(a.tenderMoney),0) FROM loanrecord a "
				+ "WHERE a.userbasicinfo_id=? AND a.isSucceed=1";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 累计借入金额 1未发布、2进行中、3回款中、4已完成
	 * 
	 * @param id
	 *            会员编号
	 * 
	 * @return 累计借入金额
	 */
	public Object borrowing(Long id) {
		String sql = "SELECT IFNULL(sum(lr.tenderMoney),0) FROM loanrecord lr,loansign ls WHERE "
				+ " lr.loanSign_id=ls.id AND ls.userbasicinfo_id=? AND  ls.loanstate>2";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 累计充值金额
	 * 
	 * @param id
	 *            用户编号
	 * @return 累计充值金额
	 */
	public Object rechargeSuccess(Long id) {
		String sql = "SELECT IFNULL(SUM(a.rechargeAmount),0) FROM "
				+ "recharge a WHERE user_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 累计提现金额
	 * 
	 * @param id
	 *            用户编号
	 * @return 累计提现金额
	 */
	public Object withdrawSucess(Long id) {
		String sql = "SELECT IFNULL(SUM(withdrawAmount),0)+IFNULL(SUM(deposit),0) FROM withdraw "
				+ "WHERE user_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 投资人累计支付佣金
	 * 
	 * @param id
	 *            用户编号
	 * @return 投资人累计支付佣金
	 */
	public Object commission(Long id) {
		String sql = "SELECT IFNULL(SUM(a.expenditure),0) FROM accountinfo a "
				+ "WHERE a.accounttype_id=5 AND userbasic_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 借款管理费
	 * 
	 * @param id
	 *            会员编号
	 * @return 借款人管理费
	 */
	public Object borrowersFee(Long id) {
		// 借款人管理费在放款后收取
		// String sql =
		// "SELECT IFNULL(SUM(shouldPmfee),0) FROM loansign WHERE loanstate>2 AND userbasicinfo_id=? ";
		String sql = "SELECT IFNULL(SUM(expenditure),0) FROM accountinfo WHERE accounttype_id=2 AND userbasic_id=?";
		Object obj = commonDao.findObjectBySql(sql, id);
		return obj;
	}

	/**
	 * 待收利息总额（未扣除佣金）
	 * 
	 * @param id
	 *            编号
	 * @return 待收利息总额
	 */
	public Object interestToBe(Long id) {
		String sql = "SELECT b.loanSign_id,IFNULL(SUM(tenderMoney),0) FROM loanrecord b "
				+ "WHERE b.userbasicinfo_id=? AND b.loanSign_id IN "
				+ "(SELECT a.id FROM loansign a WHERE  a.loanstate=2 OR a.loanstate=3)"
				+ " GROUP BY b.loanSign_id";
		List list = commonDao.findBySql(sql, id);

		BigDecimal interestToBe = new BigDecimal(0);
		// 认购金额
		BigDecimal loanrecordSum = new BigDecimal(0);

		// 未还款的利息
		BigDecimal alSoDum = new BigDecimal(0);

		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			if (obj[0] != null) {

				sql = "select IFNULL(SUM(preRepayMoney),0) from repaymentrecord where (repayState=1 or repayState=3) AND loanSign_id="
						+ obj[0];

				alSoDum = (BigDecimal) commonDao.findObjectBySql(sql);
				if (alSoDum.doubleValue() <= 0) {
					continue;
				}
				// 总投资额
				int investTotal = loanrecordService.getLoanrecordSum(Long
						.parseLong(String.valueOf(obj[0])));

				// 该用户的总认购金额
				loanrecordSum = (BigDecimal) obj[1];
				// 认购金额不能为空
				if (loanrecordSum.compareTo(BigDecimal.valueOf(0)) == 0
						|| loanrecordSum.compareTo(BigDecimal.valueOf(0)) == -1) {
					continue;
				}
				// 认购金额跟标的总金额比例
				BigDecimal percent = new BigDecimal(investTotal).divide(
						loanrecordSum, 4, BigDecimal.ROUND_HALF_EVEN);
				// 认购金额跟标的总金额比例

				if (percent.compareTo(BigDecimal.valueOf(0)) == 0
						|| percent.compareTo(BigDecimal.valueOf(0)) == -1) {
					continue;
				}

				interestToBe = alSoDum.divide(percent, 4,
						BigDecimal.ROUND_HALF_EVEN).add(interestToBe);
			}
		}

		return interestToBe;
	}

	// 待扣借出服务费
	public double lendingFees(Long id) {

		StringBuffer sb = new StringBuffer(
				"select IFNULL(SUM(ln.shouldPmfee),0) from loansign ln where ln.loanState=2 and ln.userbasicinfo_id=?");
		List list = commonDao.findBySql(sb.toString(), id);
		double lendingFees = 0.00;
		if (list != null) {
			lendingFees = Double.parseDouble(String.valueOf(list.get(0)));
		}

		return lendingFees;
	}

	/**
	 * 待付利息金额
	 * 
	 * @param id
	 *            用户编号
	 * @return 待付利息金额
	 */
	public Object colltionInterest(Long id) {
		String sql = "SELECT IFNULL(SUM(b.preRepayMoney),0) FROM "
				+ "loansign a, repaymentrecord b WHERE a.userbasicinfo_id = ? AND "
				+ "b.loanSign_id = a.id AND (a.loanstate=2 OR a.loanstate=3) "
				+ "AND (b.repayState=1 OR b.repayState=3)";
		return commonDao.findObjectBySql(sql, id);
	}

	/**
	 * 查询流水类型
	 * 
	 * @return 流水类型
	 */
	public List queryAccountType() {
		String sql = "select id,name from accounttype";
		List list = commonDao.findBySql(sql);
		return list;
	}

	/**
	 * 查询资金历史记录条数
	 * 
	 * @param id
	 *            用户编号
	 * @param typeId
	 *            类型编号
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @return 金历史记录条数
	 */
	public Integer fundCount(Long id, String typeId, String beginDate,
			String endDate) {
		String sql = "SELECT count(*) FROM accountinfo a INNER JOIN accounttype b ON a.accounttype_id=b.id "
				+ "AND a.userbasic_id=?"
				+ connectionSql(beginDate, endDate, typeId, "a.accounttype_id",
						"a.time");
		Object obj = commonDao.findObjectBySql(sql, id);
		return Integer.parseInt(obj.toString());
	}

	/**
	 * 分页查询资金历史记录
	 * 
	 * @param page
	 *            分页对象
	 * @param id
	 *            用户编号
	 * @param typeId
	 *            类型编号
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @return list
	 */
	public List queryFund(PageModel page, Long id, String typeId,
			String beginDate, String endDate) {
		String sql = "SELECT a.time,b.name,IFNULL(expenditure,0),IFNULL(income,0),IFNULL(money,0),remark "
				+ "FROM accountinfo a INNER JOIN accounttype b ON a.accounttype_id=b.id "
				+ "AND a.userbasic_id=?"
				+ connectionSql(beginDate, endDate, typeId, "a.accounttype_id",
						"a.time")
				+ " ORDER BY a.id DESC LIMIT "
				+ page.firstResult() + "," + page.getNumPerPage();
		List list = commonDao.findBySql(sql, id);
		return list;
	}

	/**
	 * sql语句拼接
	 * 
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @param fieldName
	 *            字段名称
	 * @return 拼接过后的sql语句
	 */
	public String connectionSql(String beginDate, String endDate,
			String typeId, String typeName, String fieldName) {
		String sql = "";
		if (beginDate != null && !"".equals(beginDate.trim())) {
			sql = sql + " AND DATE_FORMAT(" + fieldName
					+ ", '%Y-%m-%d %H:%i:%s')>=DATE_FORMAT('" + beginDate
					+ "', '%Y-%m-%d %H:%i:%s') ";
		}
		if (endDate != null && !"".equals(endDate.trim())) {
			sql = sql + " AND DATE_FORMAT(" + fieldName
					+ ", '%Y-%m-%d %H:%i:%s')<=DATE_FORMAT('" + endDate
					+ "', '%Y-%m-%d %H:%i:%s') ";
		}
		if (typeId != null && !"".equals(typeId.trim())) {
			sql = sql + " AND " + typeName + "=" + typeId;
		}
		return sql;
	}
}
