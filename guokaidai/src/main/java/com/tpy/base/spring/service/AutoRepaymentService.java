package com.tpy.base.spring.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.HibernateSupportTemplate;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.spring.service.BorrowerFundService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.chesdai.util.DateUtil;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.Repayment;
import com.tpy.p2p.pay.entity.RepaymentInvestor;
import com.tpy.p2p.pay.payservice.RegisterService;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import freemarker.template.TemplateException;
/**
 * 用于自动还款处理
 * @time 2014-09-17
 * @author yu
 *
 */
@Service("autoRepaymentService")
public class AutoRepaymentService {

	private Repaymentrecord repaymentrecord;

	@Resource
	private LoanManageService loanManageService;
	@Resource
	private BorrowerFundService borrowerFundService;
	/**
	 * HibernateSupportTemplate
	 */
	@Resource
	private HibernateSupportTemplate dao;

	/**
	 * 获取自动还款记录，一次最多五笔还款
	 * 
	 * @return
	 */
	public List<Repaymentrecord> getAutoRepaymentRecordList() {
		StringBuilder hql = new StringBuilder(
				"SELECT r FROM Repaymentrecord r WHERE r.loansign.userbasicsinfo.repaySignStatus=1 ");
		hql.append(" AND (r.repayState=1 or r.repayState=3) ");
		hql.append(" AND r.preRepayDate='")
				.append(DateUtil.format("yyyy-MM-dd")).append("'");
		hql.append(" ORDER BY r.id ASC");
		Session session = dao.getSession();
		List<Repaymentrecord> repaymentrecords = (List<Repaymentrecord>) dao
				.fillQuery(session.createQuery(hql.toString()), new Object[] {})
				.setFirstResult(0).setMaxResults(5).list();
		return repaymentrecords;
	}

	/**
	 * 获取自动还款记录，一次还款
	 * 
	 * @return
	 */
	public Repaymentrecord getAutoRepaymentRecord() {
		StringBuilder hql = new StringBuilder(
				"SELECT r, FROM Repaymentrecord r WHERE r.loansign.userbasicsinfo.repaySignStatus=1 ");
		hql.append(" AND (r.repayState=1 or r.repayState=3) ");
		hql.append(" AND r.preRepayDate='")
				.append(DateUtil.format("yyyy-MM-dd")).append("'");
		hql.append(" ORDER BY r.id ASC");
		Session session = dao.getSession();
		Repaymentrecord repaymentrecord = (Repaymentrecord) dao
				.fillQuery(session.createQuery(hql.toString()), new Object[] {})
				.setFirstResult(0).setMaxResults(1).list().get(0);
		return repaymentrecord;
	}

	/**
	 * 自动还款执行方法
	 * @throws TemplateException
	 * @throws java.io.IOException
	 * 
	 */
	public void AutoRepayment() throws IOException, TemplateException {
		String hql=" FROM Repaymentrecord r where r.loansign.id="+ repaymentrecord.getLoansign().getId();
		List<Repaymentrecord> recordList=dao.find(hql);
		repaymentrecord.getLoansign().setRepaymentrecords(new HashSet<Repaymentrecord>(
				recordList));
		// 得到投资人还款的所有信息
		List<RepaymentInvestor> investorList = loanManageService
				.listRepayment(repaymentrecord);
		// //得到借款人的还款信息
		String pOutAmt = borrowerFundService.getRepmentSumMoney(investorList); // 还款金额
		String pOutFee = borrowerFundService.getRepmentSumFee(investorList);// 手续费
		Repayment info = new Repayment(repaymentrecord, repaymentrecord
				.getLoansign().getUserbasicsinfo(), "2", pOutAmt, pOutFee,
				investorList);
		info.setpMemo2("auto");
		info.setpIpsAuthNo(repaymentrecord.getLoansign().getUserbasicsinfo()
				.getRepayAuthNo());
		String xml = com.tpy.p2p.pay.util.ParseXML.repaymentXml(info);
		Map<String, String> map = RegisterService.registerCall(xml);
		URL url = new URL(PayURL.REPAYMRNTTESTURL);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("POST");
		connection.setConnectTimeout(5000);
		connection.setReadTimeout(5000);
		StringBuffer params = new StringBuffer();
		params.append("pMerCode").append("=");
		params.append(URLEncoder.encode(map.get("argMerCode"), "UTF-8"))
				.append("&");
		params.append("p3DesXmlPara").append("=");
		params.append(URLEncoder.encode(map.get("arg3DesXmlPara"), "UTF-8"))
				.append("&");
		params.append("pSign").append("=");
		params.append(URLEncoder.encode(map.get("argSign"), "UTF-8"));
		connection.setDoOutput(true);
		byte[] b = params.toString().getBytes();
		connection.getOutputStream().write(b, 0, b.length);
		connection.getOutputStream().flush();
		connection.getOutputStream().close();
		BufferedReader rd = new BufferedReader(new InputStreamReader(
				connection.getInputStream(), "UTF-8"));
		rd.readLine();
		rd.close();

	}

	public Repaymentrecord getRepaymentrecord() {
		return repaymentrecord;
	}

	public void setRepaymentrecord(Repaymentrecord repaymentrecord) {
		this.repaymentrecord = repaymentrecord;
	}

}
