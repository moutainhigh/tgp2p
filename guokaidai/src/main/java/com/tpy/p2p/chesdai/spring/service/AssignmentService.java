package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tpy.base.util.DateUtils;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Loansignflow;

@Service
public class AssignmentService {
	 /** 引入log4j日志打印类 */
    private static final Logger LOGGER = Logger.getLogger(UserInfoServices.class);
    
    
    /** 注入数据库操作层 */
    @Resource
    private HibernateSupport dao;
    
    
	
	/***
	 * 审核修改状态的sql语句
	 * @param id
	 * @param auditStatus
	 * @param auditResult
	 * @return
	 */
	public  boolean updateSql(String id,int auditStatus,int auditResult){
		
		boolean flag=false;
		if(StringUtil.isNotBlank(id)){
	         // 根据“，”拆分字符串
	            String[] newids = id.split(",");
	            // 要修改状态的编号
	            String delstr = "";
	            for (String idstr : newids) {
	                // 将不是空格和非数字的字符拼接
	                if (StringUtil.isNotBlank(idstr)
	                        && StringUtil.isNumberString(idstr)) {
	                    delstr += idstr + ",";
	                }
	            }
	            if(StringUtil.isNotBlank(delstr)){
	            	String sql="update loansignflow set auditStatus="+auditStatus+",auditResult="+auditResult+" where flowid="+delstr.substring(0,delstr.length()-1);
	            	//修改状态 
	                if(dao.executeSql(sql)>0){
	                    flag=true;
	                }
	            }
	        }
		 return flag;
	}
	
	public void save(Loansignflow loansignflow){
		 dao.save(loansignflow);
	}
  
	/***
	 * 查询逾期还款的记录
	 * @param loanId
	 * @return
	 */
	public Integer selOverdueRepayment(String loanId){
		String sql="SELECT * from repaymentrecord,loansign WHERE repaymentrecord.loanSign_id=loansign.id AND loansign.loanstate=3 AND loansign.id=? AND repaymentrecord.preRepayDate<? AND repaymentrecord.repayState=1 GROUP BY loansign.id";
		List<Repaymentrecord> list = dao.findBySql(sql, Repaymentrecord.class, loanId,DateUtils.format("yyyy-MM-dd"));
		return list.size();
	}
	
	/***
	 * 计算剩余个人转让金额
	 * @param loanId
	 * @return
	 */
	public Double getOverdueMoney(String loanId,String userId){
		//剩余未还本金
		String sqlRepaymentrecord="select SUM(money) from  repaymentrecord where repayState=1 and loanSign_id="+loanId.trim();
		Object overdueMoeny=dao.findObjectBySql(sqlRepaymentrecord);
		//个人购买金额
		String sqlLoanreocrd="select SUM(tenderMoney) from loanrecord where loanSign_id="+loanId.trim()+" and userbasicinfo_id= "+userId.trim();
		Object loanMoeny=dao.findObjectBySql(sqlLoanreocrd);
		
		//总标份数
		Loansign loansign=dao.get(Loansign.class, Long.valueOf(loanId));
		Integer SumIssueLoan=(int)(loansign.getIssueLoan()/loansign.getLoanUnit());
	
		//个人购买份数
		Integer issueLoan=(int)Double.parseDouble(loanMoeny.toString())/loansign.getLoanUnit();
		
		//剩余个人转让金额=剩余本金/总份数*个人购买份数
		Double money=Double.parseDouble(overdueMoeny.toString())/SumIssueLoan*issueLoan;
		return money;
	}
	
	
}
