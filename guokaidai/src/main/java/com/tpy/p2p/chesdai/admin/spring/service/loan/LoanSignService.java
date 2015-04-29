package com.tpy.p2p.chesdai.admin.spring.service.loan;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;

/**
 * <p>
 * Title:LoanSignService
 * </p>
 * <p>
 * Description: 普通标服务层
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author LongYang
 *         <p>
 *         date 2014年2月14日
 *         </p>
 */
@Service
public class LoanSignService {
	/** dao */
	@Resource
	private HibernateSupport dao;

	/** loanSignQuery */
	@Resource
	private LoanSignQuery loanSignQuery;

	/** baseLoansignService */
	@Resource
	private BaseLoansignService baseLoansignService;

	/** loansignQueryConditions */
	private String loansignQueryConditions = "";

	/**
	 * 普通标条数
	 * 
	 * @param loansignbasics
	 *            借款标查询对象
	 * @return 条数
	 */
	public int getLoansignCount(Loansignbasics loansignbasics,String loanType) {
		StringBuffer sb = new StringBuffer(
				"SELECT COUNT(1) FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.loansign_id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id WHERE loansign.loanType = 1");
		sb.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		return loanSignQuery.queryCount(sb.toString());
	}

	/**
	 * 普通标列表
	 * 
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	public List loanSignPage(PageModel page, Loansignbasics loansignbasics,String loanType) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"SELECT loansign.id, loansignbasics.loanNumber, loansignbasics.loanTitle, ");
		sb.append(" userbasicsinfo.NAME, loansign.loanUnit, loansign.issueLoan, loansign.`month`,");
		sb.append(" loansign_type.typename,CASE WHEN loansign.subType = 1 THEN '富担标' WHEN loansign.subType = 2 THEN '担保' WHEN loansign.subType = 3 THEN '抵押' WHEN loansign.subType = 4 THEN '信用' WHEN loansign.subType = 5 THEN '实地' ELSE '未知' END,");
		sb.append(" loansignbasics.mgtMoney,loansign.shouldPmfee, loansign.publishTime, loansign.rate * 100, loansignbasics.reward * 100 ,");
		sb.append(" round ( IFNULL(( SELECT SUM(tenderMoney) / loansign.loanUnit FROM loanrecord WHERE isSucceed = 1 AND loanrecord.loanSign_id = loansign.id ), 0 )), ");
		sb.append(" round ((SELECT ( loansign.issueLoan - IFNULL(SUM(tenderMoney), 0)) / loansign.loanUnit FROM loanrecord WHERE isSucceed = 1 AND loanrecord.loanSign_id = loansign.id)),");
		sb.append(" CASE WHEN loansign.refundWay = 1 THEN '按月等额本息' WHEN loansign.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END,");
		sb.append(" CASE WHEN loansign.loanstate = 1 THEN '未发布' WHEN loansign.loanstate = 2 THEN '进行中' WHEN loansign.loanstate = 3 THEN '回款中' ELSE '已完成' END, ");
		sb.append(" CASE WHEN loansign.loanstate = 3 OR loansign.loanstate = 4 THEN '已放款' ELSE '未放款' END, ");
		sb.append(" loansignbasics.creditTime, CASE WHEN loansign.isShow = 1 THEN '显示' ELSE '不显示' END, CASE WHEN loansign.isRecommand = 1 THEN '推荐' ELSE '不推荐' END");
		sb.append(" FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id INNER JOIN loansign_type ON loansign.loansignType_id=loansign_type.id WHERE loansign.loanType = 1");
		sb.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		sb.append("   ORDER BY loansign.id DESC ,loansign.loanstate asc"); 
		/*sb.append(" LIMIT ").append(page.getPageNum()).append(" , ").append(page.getNumPerPage());*/
		/*list = dao.findBySql(sb.toString());*/	
		StringBuffer sbl= new StringBuffer(
				"SELECT count(loansign.id) FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id  INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id INNER JOIN loansign_type ON loansign.loansignType_id=loansign_type.id WHERE loansign.loanType = 1  ");
		sbl.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		sbl.append("   ORDER BY loansign.loanstate asc ,loansign.id DESC ");
		list=dao.pageListBySql(page, sbl.toString(), sb.toString(),null);
		return list;
	}

	/**
	 * 普通标列表
	 *
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	public List dcbLoanSignPage(PageModel page, Loansignbasics loansignbasics,String loanType) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"SELECT loansign.id, loansignbasics.loanNumber, loansignbasics.loanTitle, ");
		sb.append(" userbasicsinfo.NAME, loansign.loanUnit, loansign.issueLoan, loansign.`month`,");
		sb.append(" loansign_type.typename,CASE WHEN loansign.subType = 1 THEN '富担标' WHEN loansign.subType = 2 THEN '担保' WHEN loansign.subType = 3 THEN '抵押' WHEN loansign.subType = 4 THEN '信用' WHEN loansign.subType = 5 THEN '实地' ELSE '未知' END,");
		sb.append(" loansignbasics.mgtMoney,loansign.shouldPmfee, loansign.publishTime, loansign.rate * 100, loansignbasics.reward * 100 ,");
		sb.append(" round ( IFNULL(( SELECT SUM(tenderMoney) / loansign.loanUnit FROM loanrecord WHERE isSucceed = 1 AND loanrecord.loanSign_id = loansign.id ), 0 )), ");
		sb.append(" round ((SELECT ( loansign.issueLoan - IFNULL(SUM(tenderMoney), 0)) / loansign.loanUnit FROM loanrecord WHERE isSucceed = 1 AND loanrecord.loanSign_id = loansign.id)),");
		sb.append(" CASE WHEN loansign.refundWay = 1 THEN '按月等额本息' WHEN loansign.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END,");
		sb.append(" CASE WHEN loansign.loanstate = 1 THEN '未发布' WHEN loansign.loanstate = 2 THEN '进行中' WHEN loansign.loanstate = 3 THEN '回款中' ELSE '已完成' END, ");
		sb.append(" CASE WHEN loansign.loanstate = 3 OR loansign.loanstate = 4 THEN '已放款' ELSE '未放款' END, ");
		sb.append(" loansignbasics.creditTime, CASE WHEN loansign.isShow = 1 THEN '显示' ELSE '不显示' END, CASE WHEN loansign.isRecommand = 1 THEN '推荐' ELSE '不推荐' END");
		sb.append(" FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id INNER JOIN loansign_type ON loansign.loansignType_id=loansign_type.id WHERE loansign.loanType = 1 and product=1");
		sb.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		sb.append("   ORDER BY loansign.id DESC ,loansign.loanstate asc");
		/*sb.append(" LIMIT ").append(page.getPageNum()).append(" , ").append(page.getNumPerPage());*/
		/*list = dao.findBySql(sb.toString());*/
		StringBuffer sbl= new StringBuffer(
				"SELECT count(loansign.id) FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id  INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id INNER JOIN loansign_type ON loansign.loansignType_id=loansign_type.id WHERE loansign.loanType = 1 and product=1  ");
		sbl.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		sbl.append("   ORDER BY loansign.loanstate asc ,loansign.id DESC ");
		list=dao.pageListBySql(page, sbl.toString(), sb.toString(),null);
		return list;
	}
	
	/**
	 * 普通标列表转为JSONArray
	 * 
	 * @param list
	 *            集合
	 * @return JSONArray 对象
	 */
	public JSONArray queryJSONByList(List list) {
		JSONObject json = null;
		JSONArray jsonlist = new JSONArray();

		// 给每条数据添加标题
		for (Object obj : list) {
			json = new JSONObject();
			Object[] str = (Object[]) obj;
			json.element("id", str[0]);
			json.element("loanNumber", str[1]);
			json.element("loanTitle", str[2]);
			json.element("name", str[3]);
			json.element("loanUnit", str[4]);
			json.element("issueLoan",
					Arith.round(new BigDecimal(str[5].toString()), 2) + "元");
			json.element("month", str[6] + "个月");
			json.element("loancategory", str[7]);
//			json.element("mgtMoneyScale",
//					Arith.round(new BigDecimal(str[8].toString()), 2) + "%");
			json.element("mgtMoney", str[8]);
			json.element("publishTime", str[9]);
			json.element("rate",
					Arith.round(new BigDecimal(str[10].toString()), 2) + "%");
			json.element("reward",
					Arith.round(new BigDecimal(str[11].toString()), 2) + "%");
			json.element("successfulLending", str[12]);
			json.element("remainingCopies",
					Double.valueOf(str[13].toString()) > 0 ? str[13] : "满标");
			json.element("refundWay", str[14]);
			json.element("loanstate", str[15]);
			json.element("iscredit", str[16]);
			json.element("creditTime", str[17]);
			json.element("isShow", str[18]);
			json.element("isRecommand", str[19]);
			jsonlist.add(json);
		}
		return jsonlist;
	}
	
	
	/**
	 * 优金理财json 
	 * @param list
	 * @return
	 */
	public JSONArray queryJSONByLists(List list) {
		JSONObject json = null;
		JSONArray jsonlist = new JSONArray();

		// 给每条数据添加标题
		for (Object obj : list) {
			json = new JSONObject();
			Object[] str = (Object[]) obj;
			json.element("id", str[0]);
			json.element("loanNumber", str[1]);
			json.element("loanTitle", str[2]);
			json.element("name", str[3]);
			json.element("loanUnit", str[4]);
			json.element("issueLoan",
					Arith.round(new BigDecimal(str[5].toString()), 2) + "元");
			json.element("month", str[6] + "个月");
			json.element("loancategory", "太平洋理财理财");
//			json.element("mgtMoneyScale",
//					Arith.round(new BigDecimal(str[8].toString()), 2) + "%");
			json.element("mgtMoney", str[7]);
			json.element("publishTime", str[8]);
			json.element("rate",
					Arith.round(new BigDecimal(str[9].toString()), 2) + "%");
			if(str[10]==null){
			json.element("reward",0);
			}else{
				json.element("reward",
						Arith.round(new BigDecimal(str[10].toString()), 2) + "%");
			}
			json.element("successfulLending", str[11]);
			json.element("remainingCopies",
					Double.valueOf(str[12].toString()) > 0 ? str[12] : "满标");
			json.element("refundWay", str[13]);
			json.element("loanstate", str[14]);
			json.element("iscredit", str[15]);
			json.element("creditTime", str[16]);
			json.element("isShow", str[17]);
			json.element("isRecommand", str[18]);
			jsonlist.add(json);
		}
		return jsonlist;
	}
	
	

	
	/**
	 * 优金标总条数
	 * @param loansignbasics
	 * @param loanType
	 * @return
	 */
	public int getLoansignCount1(Loansignbasics loansignbasics,String loanType) {
		StringBuffer sb = new StringBuffer(
				"SELECT COUNT(1) FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.loansign_id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id WHERE loansign.loanType = 7");
		sb.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		return loanSignQuery.queryCount(sb.toString());
	}
	
	/**
	 * 优金标列表
	 * @param loansignbasics
	 * @param loanType
	 * @return
	 */
	public List loanSignPage1(PageModel page, Loansignbasics loansignbasics,String loanType) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"SELECT loansign.id, loansignbasics.loanNumber, loansignbasics.loanTitle, ");
		sb.append(" userbasicsinfo. NAME, loansign.loanUnit, loansign.issueLoan, loansign.`month`, ");
		sb.append(" loansignbasics.mgtMoney, loansign.publishTime, loansign.rate * 100, loansignbasics.reward * 100 ,");
		sb.append(" round ( IFNULL(( SELECT SUM(tenderMoney) / loansign.loanUnit FROM loanrecord WHERE isSucceed = 1 AND loanrecord.loanSign_id = loansign.id ), 0 )), ");
		sb.append(" round ((SELECT ( loansign.issueLoan - IFNULL(SUM(tenderMoney), 0)) / loansign.loanUnit FROM loanrecord WHERE isSucceed = 1 AND loanrecord.loanSign_id = loansign.id)),");
		sb.append(" CASE WHEN loansign.refundWay = 1 THEN '按月等额本息' WHEN loansign.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END,");
		sb.append(" CASE WHEN loansign.loanstate = 1 THEN '未发布' WHEN loansign.loanstate = 2 THEN '进行中' WHEN loansign.loanstate = 3 THEN '回款中' ELSE '已完成' END, ");
		sb.append(" CASE WHEN loansign.loanstate = 3 OR loansign.loanstate = 4 THEN '已放款' ELSE '未放款' END, ");
		sb.append(" loansignbasics.creditTime, CASE WHEN loansign.isShow = 1 THEN '显示' ELSE '不显示' END, CASE WHEN loansign.isRecommand = 1 THEN '推荐' ELSE '不推荐' END");
		sb.append(" FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id  WHERE loansign.loanType = 7");
		sb.append(baseLoansignService.getQueryConditions(loansignbasics,loanType));
		sb.append("   ORDER BY loansign.loanstate asc ,loansign.id DESC ");

		loansignQueryConditions = sb.toString();
		/*System.out.println(sb.toString());
		sb.append(" LIMIT ").append(start).append(" , ").append(limit);
		list = dao.findBySql(sb.toString());*/
		StringBuffer sbl= new StringBuffer("SELECT count(loansign.id) FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id  INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id WHERE loansign.loanType = 7 ");
		list=dao.pageListBySql(page, sbl.toString(), sb.toString(),null);
		return list;
	}
	
	/**
	 * 优金计划申请条件
	 * @param username
	 * @param cardno
	 * @return
	 */
	public Object queryBorroweryouxuancount(String username, String cardno) {
		StringBuffer sb = new StringBuffer("SELECT count(u.id) FROM borrowers_apply b, borrowersbase s, userbasicsinfo u, userrelationinfo f WHERE b.base_id = s.id AND s.userbasicinfo_id = u.id AND u.id = f.id AND b.`status` = 1 AND b.state = 0 AND b.type=7");
		if (!username.trim().equals("")) {
			sb.append(" and u.name like '%").append(username)
					.append("%'");
		}
		if (!cardno.equals("")) {
			sb.append(" and f.cardId like '%").append(cardno)
					.append("%'");
		}
		return dao.findObjectBySql(sb.toString());

	}
	
	/**
	 *优金借款人
	 * @param page
	 * @param username
	 * @param cardno
	 * @return
	 */
	public Object queryBorroweryouxuanList(PageModel page, String username,
			String cardno) {
		StringBuffer sb = new StringBuffer("SELECT b.id,u.name, u.userName, f.cardId FROM borrowers_apply b, userbasicsinfo u, userrelationinfo f,userfundinfo uf WHERE  u.id = f.id AND b.user_id=u.id AND uf.id=u.id  AND b.`status` = 1 AND b.state = 0 AND b.type =7 and uf.pIdentNo is not NULL");
		if (!username.trim().equals("")) {
			sb.append(" and u.name like '%").append(username)
					.append("%'");
		}
		if (!cardno.equals("")) {
			sb.append(" and f.cardId like '%").append(cardno)
					.append("%'");
		}
		sb.append(" LIMIT ").append(page.firstResult()).append(",")
				.append(page.getNumPerPage());
		return dao.findBySql(sb.toString(), null);

	}
	
	/***
	 * 要导出的借款列表数据
	 * 
	 * @return List
	 */
	public List outPutList() {
		return dao.findBySql(loansignQueryConditions.toString());
	}

	/**
	 * <p>
	 * Title: updateRepaymentRecord
	 * </p>
	 * <p>
	 * Description: 逾期已还款的时候调用改信息
	 * </p>
	 * 
	 * @param repaymentrecord
	 *            还款记录
	 * @param repayTime
	 *            还款时间
	 * @return 是否成功
	 */
	public boolean updateRepaymentRecord(Repaymentrecord repaymentrecord,
			String repayTime) {
		// try {
		// 写入实际还款时间和状态=4,并计算出实际的还款金额=本该还的利息和逾期的手续费
		repaymentrecord.setRepayState(4);
		repaymentrecord.setRepayTime(repayTime);
		repaymentrecord.setRealMoney(repaymentrecord.getPreRepayMoney()
				+ (repaymentrecord.getMoney() + repaymentrecord
						.getPreRepayMoney()) * Constant.OVERDUE_INTEREST);
		dao.update(repaymentrecord);
		return true;
		// } catch (Exception e) {
		// return false;
		// }
	}

	/**
	 * 根据用户编号查询用户在当前时间以前购买的所有标的本息和
	 * 
	 * @param id
	 *            用户编号
	 * @return 返回所有本息和
	 */
	public Double getLoanRecordMoney(Long id) {
		String sql = "SELECT l.issueLoan, loan.tenderMoney, SUM(DISTINCT r.money), SUM(DISTINCT r.preRepayMoney), loan.tenderMoney / l.issueLoan * SUM(DISTINCT r.preRepayMoney), loan.tenderMoney / l.issueLoan * SUM(DISTINCT r.money) + loan.tenderMoney / l.issueLoan * SUM(DISTINCT r.preRepayMoney) FROM loanrecord loan INNER JOIN loansign l ON loan.loanSign_id = l.id INNER JOIN repaymentrecord r ON l.id = r.loanSign_id WHERE loan.userbasicinfo_id IN(SELECT b.userbasicinfo_id from borrowersbase b , borrowers_apply a WHERE b.id = a.base_id AND a.id=?) AND l.loanstate = 3 AND loan.tenderTime < ? AND r.repayState = 1 GROUP BY r.loanSign_id";
		List<Object[]> loanList = (List<Object[]>) dao.findBySql(sql,id, DateUtils.format("yyyy-MM-dd"));
		//得到当前用户当前时间之前为完成标的本息和
		Double moneyAndInterest = 0.00;
		if(loanList.size() > 0&&null != loanList){
			for (int i = 0; i < loanList.size(); i++) {
				Object[] obj = loanList.get(0);
				moneyAndInterest+=Double.parseDouble(obj[5].toString());
			}
		}
		return moneyAndInterest;
	}
	
	/**
	 * 查询该用户是否还有未完成的净值标
	 * @param id 用户编号
	 * @return 返回标的个数
	 */
	public Integer getNetLabel(Long id){
		String sql = "select count(*) from loansign l where l.loansignType_id=4 and l.loanType=1 and l.userbasicinfo_id=? and l.loanstate!=4";
		int num = dao.queryNumberSql(sql,id).intValue();
		return num;
	}
	/**
	 * 返回指定的借款申请BorrowersApply数据
	 * @param uid
	 * @return
	 */
	public Long getBorrowersApply(Long uid) {
		String sql="select id from borrowers_apply as ba where user_id=" +uid;
		List<BigInteger> list=(List<BigInteger>) dao.findBySql(sql);
		return (Long) list.get(0).longValue();
	}
}
