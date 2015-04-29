package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import org.springframework.stereotype.Service;

import com.tpy.base.util.DateUtils;

/**
 * 还款业务处理
 * @author RanQiBing 2014-05-14
 *
 */
@Service
public class RepayMentServices {
	
	 @Resource
	 private HibernateSupport dao;
		@Resource
		private UserBaseInfoService userBaseInfoService;
	/**
	 * 提前还款
	 * @param userId 用户编号
	 * @return 返回还款记录
	 */
	public List<Repaymentrecord> advanceRepayment(Long userId){
		String sql = "SELECT * from repaymentrecord,loansign WHERE repaymentrecord.loanSign_id=loansign.id AND loansign.loanstate=3 AND loansign.userbasicinfo_id=? AND repaymentrecord.preRepayDate>? AND repaymentrecord.repayState=1 GROUP BY loansign.id";
		//String hql = "from Repaymentrecord r where r.preRepayDate>? and r.repayState=1 and r.loansign.userbasicsinfo.id=?";
		List<Repaymentrecord> list = dao.findBySql(sql, Repaymentrecord.class, userId,DateUtils.format("yyyy-MM-dd"));
		return list;
	}
	
	/**
	 * 按时还款
	 * @param userId 用户编号
	 * @return 返回还款记录
	 */
	public List<Repaymentrecord> scheduleRepayment(Long userId){
		String sql = "SELECT * from repaymentrecord,loansign WHERE repaymentrecord.loanSign_id=loansign.id AND loansign.loanstate=3 AND loansign.userbasicinfo_id=? AND repaymentrecord.preRepayDate=? AND repaymentrecord.repayState=1 GROUP BY loansign.id";
//		String hql = "from Repaymentrecord r where r.preRepayDate=? and r.repayState=1 and r.loansign.userbasicsinfo.id=?";
		List<Repaymentrecord> list = dao.findBySql(sql, Repaymentrecord.class, userId,DateUtils.format("yyyy-MM-dd"));
		return list;
	}
	
	/**
	 * 逾期还款
	 * @param userId 用户编号
	 * @return 返回还款记录
	 */
	public List<Repaymentrecord> overdueRepayment(Long userId){
		String sql = "SELECT * from repaymentrecord,loansign WHERE repaymentrecord.loanSign_id=loansign.id AND loansign.loanstate=3 AND loansign.userbasicinfo_id=? AND repaymentrecord.preRepayDate<? AND repaymentrecord.repayState=1 GROUP BY loansign.id";
//		String hql = "from Repaymentrecord r where r.preRepayDate<? and r.repayState=1 and r.loansign.userbasicsinfo.id=?";
		List<Repaymentrecord> list = dao.findBySql(sql, Repaymentrecord.class, userId,DateUtils.format("yyyy-MM-dd"));
		return list;
	}
	/**
	 * 获取用户借款总额
	 * @param userId 用户编号
	 * @return 用户借款总额
	 */
	public Double getMoney(Long userId){
		String sql = "SELECT SUM(repaymentrecord.money) as k from repaymentrecord,loansign where repaymentrecord.loanSign_id=loansign.id AND repaymentrecord.repayState=1 and loansign.userbasicinfo_id=?";
		return dao.queryNumberSql(sql, userId);
	}
	/**
	 * 获取用户借款标信息
	 * @param userId 用户编号
	 * @return 条数
	 */
	public int getNum(Long userId){
		String sql = "select count(*) from loansign where loanstate=3 and userbasicinfo_id=?";
		return dao.queryNumberSql(sql, userId).intValue();
	}
}
