package com.tpy.p2p.chesdai.spring.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.pay.constant.PayURL;
import org.springframework.stereotype.Service;

import com.ips.security.utility.IpsCrypto;
import com.tpy.p2p.pay.entity.BidAssignment;
import com.tpy.p2p.pay.entity.BidInfo;
import com.tpy.p2p.pay.util.ParameterIps;
import com.tpy.p2p.pay.util.ParseXML;

import freemarker.template.TemplateException;

/**
 * 购标
 * @author RanQiBing 
 * 2014-04-10
 */
@Service
public class PlankService {
	
	@Resource
	private HibernateSupport dao;
	/**
	 * 
	 * @param loanrecord
	 * @param accountinfo
	 * @param money
	 */
	public void update(Loanrecord loanrecord,Accountinfo accountinfo,Double money,Loansignbasics loansignbasics){
		dao.save(loanrecord);
		dao.save(accountinfo);
		dao.save(loansignbasics);
//		String sql = "UPDATE userfundinfo SET userfundinfo.cashBalance=? where id =?";
//		dao.executeSql(sql,money,loanrecord.getUserbasicsinfo().getId());
	}

	/**
	 * 更新资金帐户
	 * @param userfundinfo
	 * @param loanMoney
	 */
	public void update(Userfundinfo userfundinfo,Double loanMoney){
		String sql = "UPDATE userfundinfo SET cashBalance=?, money=? ,frozenAmtN=? where id=?";
//		String sql = "UPDATE userfundinfo SET frozenAmtN=? where id=?";
		Double frozenAmt = userfundinfo.getFrozenAmtN()+loanMoney;
		Double newCashBalance = userfundinfo.getCashBalance() - loanMoney;
		Double newMoney = userfundinfo.getMoney() - loanMoney;

		int rst = dao.executeSql(sql,  newCashBalance,newMoney, frozenAmt, userfundinfo.getId());
//		int rst = dao.executeSql(sql,  frozenAmt, userfundinfo.getId());
	}

	/**
	 * 
	 * @param loanrecord
	 * @param accountinfo
	 * @param money
	 */
	public void update(Loanrecord loanrecord,Accountinfo accountinfo,Double money,Loansignflow loansignflow,Loanrecord loanrecordLoan,Double moneyLoan,Loansignbasics loansignbasics){
		if(loanrecord.getTenderMoney()!=null){
			dao.save(loanrecord);
		}
		dao.save(accountinfo);
		dao.update(loanrecordLoan);
		dao.update(loansignflow);
		dao.save(loansignbasics);
		
		String sql = "UPDATE userfundinfo SET userfundinfo.cashBalance=? where id =?";
		if(loanrecord.getTenderMoney()!=null){
			dao.executeSql(sql,money,loanrecord.getUserbasicsinfo().getId());
		}else{
			dao.executeSql(sql,money,loansignflow.getUserAuth());
		}
		dao.executeSql(sql,moneyLoan,loanrecordLoan.getUserbasicsinfo().getId()); //原购买人
	}
	/**
	 * 获取类型
	 * @param id 类型编号
	 * @return
	 */
	public Accounttype accounttype(Long id){
		return dao.get(Accounttype.class, id);
	}
	
	/**
	 * 加密投标信息
	 * @param bid
	 * @return
	 * @throws java.io.IOException
	 * @throws TemplateException
	 */
    public Map<String, String> encryption(BidInfo bid)
            throws IOException, TemplateException {
        // 将充值信息转换成xml文件
        String bidxml = ParseXML.bidXml(bid);
        // 加密后的信息
        Map<String, String> map = regSubCall(bidxml);
        // 将访问地址放在map里
        map.put("url", PayURL.BIDTESTURL);
        return map;
    }
    
	public Map<String,String> regSubCall(String bidxml){
	
		//生成xml文件字符串
		//String  = ParseXML.registration(entity);
		//将生成的xml文件进行3des加密
		String desede = IpsCrypto.triDesEncrypt(bidxml,ParameterIps.getDes_algorithm(),ParameterIps.getDesedevector());
		//将加密后的字符串不换行
		desede = desede.replaceAll("\r","");
		desede = desede.replaceAll("\n","");
		//将“ 平台 ”账号 、用户注册信息、证书拼接成一个字符串
		StringBuffer argSign = new StringBuffer(ParameterIps.getCert()).append(desede).append(ParameterIps.getMd5ccertificate());
		//将argSign进行MD5加密
		String md5 = IpsCrypto.md5Sign(argSign.toString());
		//将参数装进map里面
		Map<String,String> map = new HashMap<String, String>();
		map.put("pMerCode",ParameterIps.getCert());
		map.put("p3DesXmlPara", desede);
		map.put("pSign",md5);
		return map;
	}

	/**
	 * 债权转让投标信息
	 * @param assignment
	 * @return
	 * @throws java.io.IOException
	 * @throws TemplateException
	 */
    public Map<String, String> encryptionAssignment(BidAssignment assignment)
            throws IOException, TemplateException {
        // 将充值信息转换成xml文件
        String bidxml = ParseXML.bidAssignmentXml(assignment);
        // 加密后的信息
        Map<String, String> map = regSubCall(bidxml);
        // 将访问地址放在map里
        map.put("url", PayURL.BIDASSIGNMENTTESTURL);
        return map;
    }
    /***
     * 自动投标规则
     * @param automatic
     * @return
     * @throws java.io.IOException
     * @throws TemplateException
     */
    public Map<String, String> automaitcBid(Automatic automatic)
            throws IOException, TemplateException {
        // 将充值信息转换成xml文件
        String bidxml = ParseXML.automaitcXml(automatic);
        // 加密后的信息
        Map<String, String> map = regSubCall(bidxml);
        // 将访问地址放在map里
        map.put("url", PayURL.AUTOMATICTESTURL);
        return map;
    }
    
    /***
     * 保存自动投标规则数据
     * @param automatic
     */
    public void saveAutomatic(Automatic automatic){
    	dao.save(automatic);
    }
    
    /***
     * 根据pP2PBillNo查询automatic是否存在
     * @param pP2PBillNo
     * @return
     */
    public String getAutomaticId(String pP2PBillNo){
    	if(!pP2PBillNo.equals("")&&pP2PBillNo!=null){
    		String sql="select id from automatic where pP2PBillNo='"+pP2PBillNo+"'";
        	Object id=this.dao.findBySql(sql);
        	return id.toString().substring(1, id.toString().length()-1);
    	}else{
    		return null;
    	}
    }
	
}
