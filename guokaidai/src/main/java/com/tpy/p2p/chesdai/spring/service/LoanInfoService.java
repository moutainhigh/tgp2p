package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.service.BaseLoansignService;
import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Borrowersbase;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.core.userinfo.UserInfoQuery;

/**
 * 借款标详细信息
 * @author frank
 * 2014-08-11
 *
 */
@Service
public class LoanInfoService {
	
	@Resource
	private HibernateSupport dao;
	
	@Resource
	private UserInfoQuery userInfoQuery;
	
	@Resource
	private BaseLoansignService baseLoansignService;
	/**
	 * 查询并判断用户的信用等级
	 * @param userid 用户编号
	 * @return 返回用户信用等级
	 */
	public Integer getCreditRating(Long userid){
		Integer creditRating = 0;
		//查询用户的总积分
		String hql = "from Borrowersbase b where b.userbasicsinfo.id=?";
		Borrowersbase base = (Borrowersbase) dao.findObject(hql, userid);
		//得到用户的总积分
		Integer suminte = 0;
		if(null!=base.getSuminte()){
			suminte = base.getSuminte();
		}
		//判断用户的信用等级
		if(Constant.STATUES_ONE<=suminte && Constant.SRSRUES_TEN>=suminte){
			creditRating = Constant.STATUES_ONE;  //表示半颗星
		}else if(11<=suminte && suminte<=20){
			creditRating = Constant.STATUES_TWO;  //表示一颗星
		}else if(21<=suminte && suminte<=30){
			creditRating = Constant.STATUES_THERE;  //表示一颗半星
		}else if(31<=suminte && suminte<=40){
			creditRating = Constant.STATUES_FOUR;  //表示二颗星
		}else if(41<=suminte && suminte<=50){
			creditRating = Constant.STATUES_FIVE;  //表示二颗半星
		}else if(51<=suminte && suminte<=60){
			creditRating = Constant.STATUES_SIX;  //表示三颗星
		}else if(61<=suminte && suminte<=80){
			creditRating = Constant.STATUES_SEVEN;  //表示三颗半星
		}else if(81<=suminte && suminte<=110){
			creditRating = Constant.STATUES_EIGHT;  //表示四颗星
		}else if(111<=suminte && suminte<=180){
			creditRating = Constant.STATUES_NINE;  //表示四颗半星
		}else if(suminte>180){
			creditRating = Constant.SRSRUES_TEN;  //表示五颗星
		}else{
			creditRating = Constant.STATUES_ZERO;  //表示零颗星
		}
		
		return creditRating;
	}
	/**
	 * 查询一个标的所有认购记录
	 * @param id 标编号 
	 * @return 返回查询结果
	 */
	public PageModel getLoanRecord(Long id,PageModel page){
		String sql = "SELECT u.name,l.rate,r.tenderMoney,CASE WHEN r.isSucceed=1 THEN '成功' else '失败' END,date_format(r.tenderTime,'%Y-%m-%d'),u.userName,l.loanType,l.id,r.userbasicinfo_id from loanrecord r,userbasicsinfo u,loansign l where r.userbasicinfo_id=u.id AND r.loanSign_id=l.id AND r.loanSign_id=?";
		String sqls = "select count(r.id) from loanrecord r,userbasicsinfo u,loansign l where r.userbasicinfo_id=u.id AND r.loanSign_id=l.id AND r.loanSign_id=?";
		page.setTotalCount(dao.queryNumberSql(sqls, id).intValue());
		sql=sql+" LIMIT "+(page.getPageNum()-1)*10+","+page.getNumPerPage()+"";
		List<Object[]> list = dao.findBySql(sql, id); 
		page.setList(list);
		return page;
	}
	/**
	 * 获取当前借款标的借款人的所有借款记录
	 * @param id 借款标编号
	 * @param pageNo 当前页数
	 * @return 返回分页内容
	 */
	public PageModel getLoanSignRecord(Long id,PageModel page){
		//获取当前标的信息
		Loansign loan = (Loansign) dao.findObject("from Loansign l where l.id=?",id);
		String sql = "SELECT b.loanNumber,b.loanTitle,l.issueLoan,l.rate,l.refundWay,l.`month`,l.useDay FROM loansign l,loansignbasics b WHERE l.id=b.id AND l.userbasicinfo_id=? AND l.id!=?";
		String sqlCount = "SELECT count(l.id) FROM loansign l,loansignbasics b WHERE l.id=b.id AND l.userbasicinfo_id=? AND l.id!=?";
		page.setTotalCount(dao.queryNumberSql(sqlCount,loan.getUserbasicsinfo().getId(),id).intValue());
		sql=sql+" LIMIT "+(page.getPageNum()-1)*10+","+page.getNumPerPage()+"";
		List<Object[]> list = dao.findBySql(sql,loan.getUserbasicsinfo().getId(),id); 
		page.setList(list);
		return page;
	}
	/**
	 * 查询该标所有的附件信息
	 * @param id 标编号
	 * @return 返回所有标信息
	 */
	public List<Attachment> getAttachment(long id){
		String hql = "from Attachment a where a.loansign.id=? and a.attachmentType=2";
		List<Attachment> list = dao.find(hql,id);
		return list;
	}
	/**
	 * 获取用户还能购买多少份
	 * @param loan 标信息
	 * @param userinfo 用户信息
	 * @return 返回最大购买份数
	 */
	public Integer getCount(Loansign loan,Userbasicsinfo userinfo){
		int maxcount = 0;
		boolean bool = userInfoQuery.isPrivilege(userinfo);
		int vip = 0;
		if(bool){
			vip = loan.getVipCounterparts();
		}else{
			vip = loan.getCounterparts();
		}
		//获取当前标的剩余份数
		double moneyLoan = baseLoansignService.sumLoanMoney(loan.getId());
		double myloan=baseLoansignService.sumMyLoanMoney(loan.getId(), userinfo.getId());
		if(loan.getIssueLoan()-moneyLoan > vip*loan.getLoanUnit()-myloan){
			/*if(userinfo.getUserfundinfo().getMoney()>=vip*loan.getLoanUnit()){
				maxcount=vip;
			}else{
				maxcount = Arith.div(userinfo.getUserfundinfo().getMoney(), loan.getLoanUnit()).intValue();
				//maxcount=vip;
			}*/
			maxcount= Arith.div(vip * loan.getLoanUnit() - myloan, loan.getLoanUnit()).intValue();
		}else{
			/*if(loan.getIssueLoan()-moneyLoan>userinfo.getUserfundinfo().getMoney()){
				maxcount = Arith.div(userinfo.getUserfundinfo().getMoney(), loan.getLoanUnit()).intValue();
			}else{
				maxcount = Arith.div(loan.getIssueLoan()-moneyLoan, loan.getLoanUnit()).intValue();
			}*/
			maxcount = Arith.div(loan.getIssueLoan()-moneyLoan, loan.getLoanUnit()).intValue();
		}
		return maxcount;
	}
	/**
	 * 记录浏览次数
	 * @param loansign
	 */
	public void save(Loansign loansign){
		Long l=loansign.getLoansignbasics().getViews();
		if(l==null){
			l=(long) 0;
			l++;
		}else{
			l++;
		}
		loansign.getLoansignbasics().setViews(l);
		dao.save(loansign);
	}
	
	public void update(Loansign loansign){
		dao.update(loansign);
	}
	
	/**
	 * 检查是否是vip
	 * @param userinfo
	 * @return
	 */
	public boolean isVip(Userbasicsinfo userinfo){
		boolean bool = userInfoQuery.isPrivilege(userinfo);
		return bool;
	}
	
	/**
	 * 查询投资人数
	 * @return
	*/
	public int getloanRecordCount(){
		String sql="select count(*) from (select * from loanrecord l group by l.userbasicinfo_id)aa";
		int count=dao.queryNumberSql(sql).intValue();
		return count;
	}
	
	/**
	 * 查询借款人数
	 * @return
	 */
	public int getloanBorrowCount(){
		String sql="select count(*) from (select * from loansign l group by l.userbasicinfo_id)aa";
		int count =dao.queryNumberSql(sql).intValue();
		return count;
	}
	
	/**
	 * 查询成交金额
	 * @return
	 */
	public Double getloanRecordSum(){
		String sql="select sum(tenderMoney) from loanrecord";
		Double money=dao.queryNumberSql(sql);
		return money;
	}
}
