package com.tpy.p2p.core.loanquery;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.entity.Loanrecord;
import com.tpy.p2p.chesdai.entity.LoansignType;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.chesdai.util.DateUtil;
import com.tpy.p2p.core.loansignfund.LoanSignFund;

/**
 * <p>
 * Title:LoanSignQuery
 * </p>
 * <p>
 * Description: 标的通用查询
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author longyang
 *         <p>
 *         date 2014年2月14日
 *         </p>
 */
@Service
public class LoanSignQuery {

    /**
     * 通用dao
     */
    @Resource
    HibernateSupport dao;

    /**
     * 通用标查询
     */
    @Autowired
    private LoanSignFund loanSignFund;

    /**
     * 根据sql语句查询出条数
     * 
     * @param sql
     *            执行的sql语句
     * @return 执行结果
     */
    public int queryCount(String sql) {
        Object object = dao.findObjectBySql(sql, null);
        return object != null ? Integer.parseInt(object.toString()) : 0;
    }

    /**
     * 查询到该标的剩余份数
     * 
     * @param loansign
     *            借款标对象
     * @return 剩余份数
     */
    public int queryCopies(Loansign loansign) {
        StringBuffer sb = new StringBuffer(
                "SELECT (ls.issueLoan-(SELECT IFNULL(sum(tenderMoney),0) from loanrecord where isSucceed=1 and  loanSign_id=ls.id))/ls.loanUnit from loansign ls where ls.id=")
                .append(loansign.getId());
        Object obje = dao.findObjectBySql(sb.toString(), null);
        return obje != null ? Integer.parseInt(obje.toString()) : 0;
    }

    /**
     * 求到该用户这期该收多少钱=所得利息
     * 
     * @param repaymentRecord
     *            还款记录对象
     * @param tenderMoney
     *            借款总额
     * @param loansign
     *            借款标对象
     * @param reallyDay
     *            实际使用天数
     * @return 所得利息
     */
    public BigDecimal queryInterest(Repaymentrecord repaymentRecord,
            double tenderMoney, Loansign loansign, Integer reallyDay) {
        BigDecimal interest = new BigDecimal(0.00);
        if (loansign.getLoanType() == Constant.STATUES_ONE
                && loansign.getRefundWay() == Constant.STATUES_ONE) {
            interest = Arith.div(repaymentRecord.getPreRepayMoney()
                    * tenderMoney, loansign.getIssueLoan());
        } else if (loansign.getLoanType() == Constant.STATUES_ONE
                && loansign.getRefundWay() == Constant.STATUES_THERE) {
            if (repaymentRecord.getRepayState() == Constant.STATUES_FIVE) {
                interest = loanSignFund.advanceInterest(new BigDecimal(
                        tenderMoney), loansign.getRate(), reallyDay, loansign
                        .getLoanType());
            } else {
                interest = loanSignFund.instalmentInterest(new BigDecimal(
                        tenderMoney), loansign.getRate(), loansign.getMonth(),
                        loansign.getLoanType());
            }
        } else {
            interest = loanSignFund.instalmentInterest(new BigDecimal(
                    tenderMoney), loansign.getRate(), reallyDay, loansign
                    .getLoanType());
        }
        return interest;
    }

    /**
     * 求到该用户这期该收多少钱=认购金额+所得利息
     * 
     * @param repaymentRecord
     *            回款记录对象
     * @param tenderMoney
     *            借款金额
     * @param loansign
     *            借款标对象
     * @param reallyDay
     *            实际使用天数
     * @return 本息
     */
    public BigDecimal queryMoney(Repaymentrecord repaymentRecord,
            double tenderMoney, Loansign loansign, Integer reallyDay) {
        BigDecimal money = new BigDecimal(0.00);
        if (loansign.getLoanType() == Constant.STATUES_ONE
                && loansign.getRefundWay() == Constant.STATUES_ONE) {
            money = loanSignFund.total(new BigDecimal(tenderMoney),
                    loansign.getRate(), loansign.getMonth());
        } else {
            money = queryInterest(repaymentRecord, tenderMoney, loansign,
                    reallyDay);
            if (repaymentRecord.getPeriods() == loansign.getMonth()
                    || loansign.getLoanType() == Constant.STATUES_TWO
                    || loansign.getLoanType() == Constant.STATUES_THERE) {
                money = money.add(new BigDecimal(tenderMoney));
            }
        }
        return money;
    }

    /**
     * <p>
     * Title: getLoansignById
     * </p>
     * <p>
     * Description: 通过loansign编号查询Loansign
     * </p>
     * 
     * @param loanSignId
     *            借款编号
     * @return 借款标对象
     */
    public Loansign getLoansignById(String loanSignId) {
        try {
            return dao.get(Loansign.class, Long.valueOf(loanSignId));
        } catch (DataAccessException e) {
            return null;
        }
    }
    
    
    /**
     * 查询所有的借款标类型
     * @return 借款标集合
     */
    public List<LoansignType> queryLoanType(){
    	List<LoansignType> list = dao.find("from LoansignType");
    	return list;
    }
    /**
     * 统计购买记录
     * @param loanSignId
     * @return
     */
    public Integer getBuyCount(String loanSignId){
    	StringBuffer sql=new StringBuffer("select count(id) from (SELECT * from loanrecord l where l.loanSign_id=").append(StringUtil.replaceAll(loanSignId)).append(" GROUP BY l.userbasicinfo_id)aa");
        Object count=dao.findObjectBySql(sql.toString()).toString();
    	return Integer.parseInt(count.toString());
    }

    /**
     * 通过借款状态查询
     * @param state
     * @return
     */
    public Loansign getLoansignByState(String state) {
        try {
            return dao.get(Loansign.class, Long.valueOf(state));
        } catch (DataAccessException e) { 
            return null;
        }
    }
    
    /**
     * 查询理财计划详情
     * @return
     */
    @SuppressWarnings("unchecked")
    public Loansign getYouxuan(){
    	StringBuffer sb = new StringBuffer(
                "From Loansign l where l.loanType =7 AND l.loanstate =2 ");	
		List<Loansign> list=dao.find(sb.toString());
    	return list.size()>0?list.get(0):null;
    }
    
    /**查询上期理财产品
     * @return
     */
    @SuppressWarnings("unchecked")
    public Loansign getYouxuanlast(){
    	StringBuffer sb = new StringBuffer(
                "From Loansign l where l.loanType =7 AND l.loanstate =3 ORDER BY publishTime  DESC ");	
		List<Loansign> list=dao.find(sb.toString());
    	return list.size()>0?list.get(0):null;
    }
    /**查询优金当前期
     * @return
     */
    @SuppressWarnings("unchecked")
    public Loansign getyouxuaning(){
    	StringBuffer sb = new StringBuffer(
                "From Loansign l where l.loanType =7 AND l.loanstate=2 ");	
		List<Loansign> list=dao.find(sb.toString());
    	return list.size()>0?list.get(0):null;
    }
   
    @SuppressWarnings("unchecked")
    public Loansign getyouxuanById(Long loanid){
    	StringBuffer sb = new StringBuffer(
                "From Loansign l where l.loanType =7 and l.id=").append(loanid);	
		List<Loansign> list=dao.find(sb.toString());
    	return list.size()>0?list.get(0):null;
    }
    /**
     * <p>
     * Title: getcreditTime
     * </p>
     * <p>
     * Description: 得到该标的放款时间
     * </p>
     * 
     * @param loansignId
     *            借款id
     * @return 放款时间
     */
    public String getcreditTime(Long id) {
        StringBuffer sb = new StringBuffer(
                "SELECT creditTime from loansignbasics where id=")
                .append(id);
        return dao.findObjectBySql(sb.toString()).toString();
    }

    /**
     * <p>
     * Title: getLoansignbasicsById
     * </p>
     * <p>
     * Description: 通过loansign编号查询Loansignbasics
     * </p>
     * 
     * @param loanSignId
     *            借款id
     * @return 借款标基础信息
     */
    public Loansignbasics getLoansignbasicsById(String loanSignId) {
        StringBuffer sb = new StringBuffer(
                "From Loansignbasics where loansign.id=").append(StringUtil.replaceAll(loanSignId));
        List<Loansignbasics> lsbList = dao.find(sb.toString());
        return lsbList.size() > 0 ? lsbList.get(0) : null;
    }
    

    /**
     * <p>
     * Title: getRepaymentByLSId
     * </p>
     * <p>
     * Description: 通过loansign编号查询回款计划（适用于天标 ，秒标和到期一次性还款）
     * </p>
     * 
     * @param loanSignId
     *            借款标号
     * @return 还款计划对象
     */
    public Repaymentrecord getRepaymentByLSId(String loanSignId) {
        StringBuffer sb = new StringBuffer(
                "From Repaymentrecord where loansign.id=").append(StringUtil.replaceAll(loanSignId));
        List<Repaymentrecord> rmList = dao.find(sb.toString());
        return rmList.size() > 0 ? rmList.get(0) : null;
    };

    /**
    * <p>Title: checkRepayOrder</p>
    * <p>Description: 判断是否按期数还款，若未按期数依次还款，返回true，否则返回false</p>
    * @param repay 还款记录
    * @return  成功或失败
    */
    public boolean checkRepayOrder(Repaymentrecord repay) {
        StringBuffer sb = new StringBuffer(
                "select count(1) from repaymentrecord where periods<")
                .append(repay.getPeriods())
                .append(" and repayState=1 and  loanSign_id=")
                .append(repay.getLoansign().getId());
        Object object=dao.findObjectBySql(sb.toString()).toString();
        return Integer.parseInt(object.toString()) > 0?true:false;
    }

    /**
    * <p>Title: isFull</p>
    * <p>Description: 判断该借款标是否满标</p>
    * @param loansignId 借款编号
    * @return boolean
    */
    public boolean isFull(String loansignId) {
        StringBuffer sb = new StringBuffer(
                "SELECT  ls.issueLoan-(SELECT SUM(tenderMoney) from  loanrecord where isSucceed=1 and loansign_id=ls.id) FROM loansign ls where  ls.id=")
                .append(StringUtil.replaceAll(loansignId));
        Object object = dao.findObjectBySql(sb.toString());
        return object != null ? (Double.valueOf(object.toString()) == 0 ? true
                : false) : false;
    }
    
    /**
     * <p>Title: isFullAssigment</p>
     * <p>Description: 判断该债权转让标是否满标</p>
     * @param loansignId 借款编号
     * @return boolean
     */
     public boolean isFullAssigment(String loansignId) {
         StringBuffer sb = new StringBuffer(
                 "SELECT  ls.issueLoan-(SELECT SUM(tenderMoney) from  loanrecord where isSucceed=1 and loan_id=ls.id) FROM loansign ls where  ls.id=")
                 .append(StringUtil.replaceAll(loansignId));
         Object object = dao.findObjectBySql(sb.toString());
         return object != null ? (Double.valueOf(object.toString()) == 0 ? true
                 : false) : false;
     }

    /**
    * <p>Title: queryCostratio</p>
    * <p>Description:   查询到平台当前的费用比例</p>
    * @return  Costratio对象
    */
    public Costratio queryCostratio() {
        List<Costratio> costratioList = (List<Costratio>) dao
                .find("From Costratio");
        return costratioList.size() == 1 ? costratioList.get(0) : null;
    };

    /**
    * <p>Title: isExceed</p>
    * <p>Description:  判断该标是否逾期</p>
    * @param loansignId  借款编号
    * @return true or false
    */
    public boolean isExceed(long loansignId) {
        StringBuffer sb = new StringBuffer(
                "SELECT COUNT(1) from repaymentrecord where (repayState=3||repayState=4) and  loanSign_id=")
                .append(loansignId);
        Object object = dao.findObjectBySql(sb.toString());
        return object != null ? (Integer.parseInt(object.toString()) > 0 ? true
                : false) : false;
    }
    /**
     * 获取该标的购买金额的总和
     * @param id 标号
     * @return 借款金额
     */
    public Double getLoanrecordMoneySum(Long id){
    	String sql = "select SUM(tenderMoney) from loanrecord where loanSign_id=?";
    	Double money = dao.queryNumberSql(sql, id);
    	if(null!=money){
    		return money;
    	}
    	return 0.00;
    }
    
    /**
     * 获取该标的用户购买金额
     * @param id 标号
     * @return 借款金额
     */
    public Double getLoanrecordMoneySumByUserId(Long id,Long userId){
    	String sql = "select SUM(tenderMoney) from loanrecord where loanSign_id=? and userbasicinfo_id=?";
    	Double money = dao.queryNumberSql(sql, id,userId);
    	if(null!=money){
    		return money;
    	}
    	return 0.00;
    }
   
    /**
     * 根据id获取name
     * @param id
     * @return
     */
    public String getName(String id){
    	if(!id.equals("")&&id!=null){
    		String sql="select name from userbasicsinfo u where u.id=(select l.user_debt from loansignflow l where l.loan_id="+id+")";
        	Object name=this.dao.findBySql(sql);
        	return name.toString();
    	}else{
    		return null;
    	}
    	
    }
    
    /**
     * 根据loanId获取Loansignflow数据
     * @param loanId
     * @return
     */
    public String getTenderMoney(String id,String userId) {
    	if(!id.equals("")&&id!=null){
    		String sql="select tenderMoney from loansignflow where loan_id="+id+" and user_debt="+userId;
        	Object tenderMoney=this.dao.findBySql(sql);
        	return tenderMoney.toString();
    	}else{
    		return null;
    	}
    }
    
    /**
     * 根据loanId获得userinfo的id
     * @param id
     * @return
     */
    public String getUserInfo(String id){
    	if(!id.equals("")&&id!=null){
    		String sql="select id from userbasicsinfo u where u.id=(select l.user_debt from loansignflow l where l.loan_id="+id+")";
        	Object userId=this.dao.findBySql(sql);
        	return userId.toString().substring(1, userId.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 根据name获得userinfo的id
     * @param id
     * @return
     */
    public String getID(String userName){
    	if(!userName.equals("")&&userName!=null){
    		String sql="select id from userbasicsinfo  where userName like'%"+userName.toString()+"%'";
        	Object id=this.dao.findBySql(sql);
        	return id.toString().substring(1, id.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 根据name获得userinfo的id
     * @param id
     * @return
     */
    public String getnameID(String name){
    	if(!name.equals("")&&name!=null){
    		String sql="select id from userbasicsinfo  where name ='"+name.trim().toString()+"'";
        	Object id=this.dao.findBySql(sql);
        	return id.toString().substring(1, id.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 判断loansignFlow是否存在
     * @param id
     * @return
     */
    public String getLoansignId(String id,String userId){
    	if(!id.equals("")&&id!=null){
    		String sql="select loansign_id from loansignflow where loan_id= ? and user_debt= ?";
        	Object loansign_id=this.dao.findBySql(sql,id,userId);
        	return loansign_id.toString().substring(1, loansign_id.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 获得原标Id
     * @param loanSignId
     * @return
     */
    public String getLoanId(String loanSignId){
    	if(!loanSignId.equals("")&&loanSignId!=null){
    		String sql="select loan_id from loansignflow where loansign_id="+loanSignId;
        	Object loan_id=this.dao.findBySql(sql);
        	return loan_id.toString().substring(1, loan_id.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 获得原标Id的用户ID
     * @param loanSignId
     * @return
     */
    public String getUserDebt(String loanSignId){
    	if(!loanSignId.equals("")&&loanSignId!=null){
    		String sql="select user_debt from loansignflow where loansign_id="+loanSignId;
        	Object user_debt=this.dao.findBySql(sql);
        	return user_debt.toString().substring(1, user_debt.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 获得原标Id的pMerBillNo
     * @param loanSignId
     * @return
     */
    public String getpMerBillNo(String loanSignId,String userId){
    	if(!loanSignId.equals("")&&loanSignId!=null){
    		String sql="select pMerBillNo from loanrecord where loanSign_id ="+loanSignId+"  and userbasicinfo_id="+userId;
        	Object pMerBillNo=this.dao.findBySql(sql);
        	return pMerBillNo.toString().substring(1, pMerBillNo.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 获得loansignflow
     * @param Id
     * @return
     */
    public String getflowId(String loanSignId,String userId){
    	if(!loanSignId.equals("")&&loanSignId!=null){
    		String sql="select flowid from loansignflow where loanSign_id= ? and user_debt= ?";
        	Object flowid=this.dao.findBySql(sql,loanSignId,userId);

            System.out.println("###############$$$$$$$$$$$$$"+loanSignId + ":" + userId);

        	return flowid.toString().substring(1, flowid.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 通过flowid
     * @param flowid
     * @return
     */
    public Loansignflow getLoansignflow(String flowid) {
        try {
            return dao.get(Loansignflow.class, Long.valueOf(flowid));
        } catch (DataAccessException e) {
            return null;
        }
    }
    
    /**
     * 获得loansignflow
     * @param Id
     * @return
     */
    public String getflowId(String loanSignId){
    	if(!loanSignId.equals("")&&loanSignId!=null){
    		String sql="select flowid from loansignflow where loanSign_id="+loanSignId;
        	Object flowid=this.dao.findBySql(sql);
        	return flowid.toString().substring(1, flowid.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    
    /**
     * 获得loanrecord
     * @param Id
     * @return
     */
    public String getloanRecordId(Loansignflow loansignflow){
    	if(!loansignflow.getId().equals("")&&loansignflow.getId()!=null){
    		String sql="select id from loanrecord where loanSign_id ="+loansignflow.getLoanId()+" and userbasicinfo_id ="+loansignflow.getUserDebt();
        	Object id=this.dao.findBySql(sql);
        	return id.toString().substring(1, id.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    /**
     * 通过id
     * @param id
     * @return
     */
    public Loanrecord getLoanRecord(String id) {
        try {
            return dao.get(Loanrecord.class, Long.valueOf(id));
        } catch (DataAccessException e) {
            return null;
        }
    }
    
    /**
     * 通过id
     * @param id
     * @return
     */
    public Userbasicsinfo getUserbasicsinfo(String id) {
        try {
            return dao.get(Userbasicsinfo.class, Long.valueOf(id));
        } catch (DataAccessException e) {
            return null;
        }
    }
    
    /**
     * 查询记录
     * @return
     */
    public Loanrecord getLoanrecordAssignment(String id,String userID){
    	String hql="from Loanrecord l where l.isSucceed=1 and loansign.id="+id.toString()+" and userbasicsinfo.id="+userID.toString();
    	List ls= dao.find(hql);
       if(ls.size()>0){
    	   Loanrecord loanrecord=(Loanrecord) ls.get(0);
    	   return loanrecord;
       }else{
    	   return null;
       }
    }
    
    /**
     * 查询记录
     * @return
     */
    public Loanrecord getLoanrecordLoanID(String id){
    	String hql="from Loanrecord l where l.isSucceed=1 and l.loanId="+id.toString();
    	List ls= dao.find(hql);
       if(ls.size()>0){
    	   Loanrecord loanrecord=(Loanrecord) ls.get(0);
    	   return loanrecord;
       }else{
    	   return null;
       }
    }
    
    /***
	 * 获取下一期还款时间
	 * @param loanId
	 * @return
	 */
	public String getRepaymentDate(String loanId){
		 String newDate= DateUtils.format("yyyy-MM-dd"); //获得当前时间
		 String dateOne=DateUtil.getSpecifiedDateAfter(newDate,30);
		 String sql="select preRepayDate from repaymentrecord where repayState=1 and loanSign_id="+loanId.trim()+" and preRepayDate >='"+newDate+"' and preRepayDate <='"+dateOne+"'";
		 Object date=dao.findObjectBySql(sql);
		 return date.toString();
	}
    
	public List getUserAndyouxuan(String userId,int no){
		
		 String sql="SELECT ls.id,ls.issueLoan,ls.loanstate,lsb.loanTitle,lr.tenderTime,lr.tenderMoney "
		 		+ "from loansign ls,loanrecord lr,userbasicsinfo u,loansignbasics lsb"
		 		+ " where ls.id=lr.loanSign_id and ls.id=lsb.id and lr.loanSign_id=ls.id and lr.userbasicinfo_id=u.id  and ls.loanType=7 and ls.loanstate=3 and u.id="+userId;
		 sql = sql + " LIMIT " + no + ",10";
		 List list= dao.findBySql(sql);
		 
		 return list;
	}
   
}
