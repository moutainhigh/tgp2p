package com.tpy.base.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.HibernateSupportTemplate;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.util.DateUtil;


@Service("autoAssignmentService")
public class AutoAssignmentService {
	private Loansign loansign;
	
	@Resource
	private HibernateSupportTemplate dao;

	/**
	 * 获取债权转让记录，一次最多处理五笔
	 * 
	 * @return
	 */
	public List<Loansign> getAutoLoansignList() {
	/*	StringBuilder hql = new StringBuilder(
				" FROM Loansign r WHERE r.loanType=6 AND r.loanstate!=4 ");
		hql.append(" AND r.endTime<='")
				.append(DateUtil.format("yyyy-MM-dd")).append("'");
		hql.append(" ORDER BY r.id ASC");
		Session session = dao.getSession();
		List<Loansign> loansignrecords = (List<Loansign>) dao
				.fillQuery(session.createQuery(hql.toString()), new Object[] {})
				.setFirstResult(0).setMaxResults(5).list();*/
		String newDate=DateUtil.format("yyyy-MM-dd");
		String sql="select * from  loansign r WHERE r.loanType=6 AND r.loanstate!=4 AND r.endTime<='"+newDate+"' ORDER BY r.id ASC LIMIT 0,1";
		List<Loansign > loansignrecords=dao.findBySql(sql, Loansign.class);
		return loansignrecords;
	}
	
	/***
	 * 更改标的状态为4已完成
	 * @param loansign
	 */
	public void uptLoansign(){
		Loansign uptloansign=getLoansign(loansign.getId());
		uptloansign.setLoanstate(4);
		Loansignbasics loansignbasics=getLoansignbasics(loansign.getId());
		loansignbasics.setCreditTime(DateUtils.format(Constant.DEFAULT_TIME_FORMAT));
		dao.update(loansignbasics);
		dao.update(uptloansign);
	}

	public Loansign getLoansign() {
		return loansign;
	}

	public void setLoansign(Loansign loansign) {
		this.loansign = loansign;
	}
	
	public Loansignbasics getLoansignbasics(Long id) {
	        try {
	            return dao.get(Loansignbasics.class, Long.valueOf(id));
	        } catch (DataAccessException e) {
	            return null;
	        }
	    }
	
	public Loansign getLoansign(Long id) {
        try {
            return dao.get(Loansign.class, Long.valueOf(id));
        } catch (DataAccessException e) {
            return null;
        }
    }

}
