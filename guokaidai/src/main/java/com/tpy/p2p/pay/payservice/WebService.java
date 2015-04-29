package com.tpy.p2p.pay.payservice;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.util.Map;

import com.tpy.p2p.chesdai.constant.Constant;

import com.ips.security.utility.IpsCrypto;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.BankList;
import com.tpy.p2p.pay.entity.MerUserInfo;
import com.tpy.p2p.pay.entity.RepaymentInfo;
import com.tpy.p2p.pay.entity.ReturnInfo;

/**
 * WebService请求并返回数据
 * @author frank 2014-07-14
 * 用getMercode()代替 getCert() 2014-7-24
 */
public class WebService {
	/**
	 * 查询平台或商户余额
	 * @param merchantNo 平台或商户账号
	 * @return 返回商户余额
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 * @throws java.rmi.RemoteException
	 */
	public static BalanceInquiryInfo accountBalance(String merchantNo) throws Exception{
		
		StringBuffer argSign = new StringBuffer(com.tpy.p2p.pay.util.ParameterIps.getCert()).append(merchantNo).append(com.tpy.p2p.pay.util.ParameterIps.getMd5ccertificate());
		String md5argSign = IpsCrypto.md5Sign(argSign.toString());//进行Md5加密
		//获取返回数据
		SoapProxy soapProxy = new SoapProxy();
		String argXmlPara = soapProxy.requestWs(Constant.QUERY_FOR_ACCBALANCE, com.tpy.p2p.pay.util.ParameterIps.getCert(),merchantNo,md5argSign);
		XmlTool Tool = new XmlTool();
		Tool.SetDocument(argXmlPara);
		String xml = Tool.getNodeValue("QueryForAccBalanceResult");
		BalanceInquiryInfo bal = new BalanceInquiryInfo();
		bal = (BalanceInquiryInfo) com.tpy.p2p.pay.util.XmlParsingBean.simplexml2Object(xml, new BalanceInquiryInfo());
		return bal;
	}
	/**
	 * 获取银行列表
	 * @return 返回银行信息列表
	 * @throws Exception 
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 * @throws java.rmi.RemoteException
	 */
	public static BankList bankList() throws Exception {
		StringBuffer argSign = new StringBuffer(com.tpy.p2p.pay.util.ParameterIps.getCert()).append(com.tpy.p2p.pay.util.ParameterIps.getMd5ccertificate());
		String md5 = IpsCrypto.md5Sign(argSign.toString());
//		String md5=argSign.toString().substring(0, 32).toLowerCase();
		SoapProxy soapProxy = new SoapProxy();
		
		String argXmlPara = soapProxy.requestWs(Constant.GET_BANK_LIST, com.tpy.p2p.pay.util.ParameterIps.getCert(),md5);
		XmlTool Tool = new XmlTool();
		Tool.SetDocument(argXmlPara);
		String xml = Tool.getNodeValue("GetBankListResult");
		BankList bank=new BankList();
		bank = (BankList) com.tpy.p2p.pay.util.XmlParsingBean.simplexml2Object(xml, new BankList());
		
		return bank;
	}
	/**
	 * 审核投标
	 * @param map 
	 * @param argMerCode 商户号 
	 * @param arg3DesXmlPara 3des加密后的信息
	 * @param argSign md5加密后的报文
	 * @throws java.rmi.RemoteException
	 * @return 返回放款处理后的信息
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 */
	public static ReturnInfo loans(Map<String, String> map) throws RemoteException, FileNotFoundException, UnsupportedEncodingException{
		String argMerCode = map.get("pMerCode");
		String arg3DesXmlPara = map.get("p3DesXmlPara");
		String argSign = map.get("pSign");
		SoapProxy soapProxy = new SoapProxy();
	    String info;
		try {
			info = soapProxy.requestWs(Constant.TRANSFER,argMerCode, arg3DesXmlPara, argSign);
	 	    XmlTool Tool = new XmlTool();
			Tool.SetDocument(info);
			String xml = Tool.getNodeValue("TransferResult");
			ReturnInfo returnInfo = (ReturnInfo) com.tpy.p2p.pay.util.XmlParsingBean.simplexml2Object(xml, new ReturnInfo());
			return returnInfo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} 
	/**
	 * 将xml信息解析成对象
	 * @param xml xml信息
	 */
	public static RepaymentInfo repaymentXml(String xml){
	    return com.tpy.p2p.pay.util.XmlParsingBean.parseXml(xml);
	}
	/**
	 * 查询ips用户信息
	 * @param identNo
	 * @return
	 */
	public static MerUserInfo QueryMerUserInfo(String identNo){
		String merCode= com.tpy.p2p.pay.util.ParameterIps.getCert();
	 	StringBuffer argSign = new StringBuffer(merCode)
	 									.append(identNo)
	 									.append(com.tpy.p2p.pay.util.ParameterIps.getMd5ccertificate());
		String md5 = IpsCrypto.md5Sign(argSign.toString());
		SoapProxy soapProxy = new SoapProxy();
		String info;
		try{
			info=soapProxy.requestQueryWs(Constant.QUERY_MER_USER_INFO,merCode,identNo,md5);
	 	    XmlTool Tool = new XmlTool();
			Tool.SetDocument(info);
			String xml=Tool.getNodeValue("QueryMerUserInfoResult");
			MerUserInfo merUserInfo=(MerUserInfo) com.tpy.p2p.pay.util.XmlParsingBean.simplexml2Object(xml, new MerUserInfo());
			return merUserInfo;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	

}
