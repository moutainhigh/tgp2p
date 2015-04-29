package com.tpy.p2p.pay.payservice;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tpy.base.util.LOG;
import org.springframework.stereotype.Service;

import com.baofoo.p2p.dto.receive.ResultDto;
import com.baofoo.p2p.dto.request.BalanceDto;
import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.baofoo.p2p.util.XMLBuild;
import com.ips.security.utility.IpsCrypto;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.BankInfo;
import com.tpy.p2p.pay.entity.BankList;
import com.tpy.p2p.pay.entity.RepaymentAsyn;
import com.tpy.p2p.pay.entity.RepaymentInfo;
import com.tpy.p2p.pay.entity.ReturnInfo;

/**
 * 
 * 根据用户传入的数据访问环讯
 * 
 * @author frank 2014-07-03
 * 用getMercode()代替 getCert() 2014-7-24
 */
@Service
public class RegisterService {
	
	@Resource
	private  RequestService bfService;
	
	@Resource 
	private ReceiveService receiveService;
	
	/**
	 * 加密信息并返回加密后的信息
	 * @param registerCall 提交信息的xml文件
	 * @return 返回加密后的文件集合
	 */
	public static Map<String,String> registerCall(String registerCall){
		//将xml字符串进行3des加密
		String desede = IpsCrypto.triDesEncrypt(registerCall, com.tpy.p2p.pay.util.ParameterIps.getDes_algorithm(), com.tpy.p2p.pay.util.ParameterIps.getDesedevector());
		//将加密后的字符串不换行
		desede = desede.replaceAll("\r\n","");
		//将“ 平台 ”账号 、用户注册信息、证书拼接成一个字符串
		StringBuffer argSign = new StringBuffer(com.tpy.p2p.pay.util.ParameterIps.getCert()).append(desede).append(com.tpy.p2p.pay.util.ParameterIps.getMd5ccertificate());
		//将argSign进行MD5加密
		String md5 = IpsCrypto.md5Sign(argSign.toString());
		//将参数装进map里面
		Map<String,String> map = new HashMap<String, String>();
		map.put("argMerCode", com.tpy.p2p.pay.util.ParameterIps.getCert());
		map.put("arg3DesXmlPara", desede);
		map.put("argSign",md5);
		return map;
	}
	/**
	 * 解析xml文件
	 * @param registerCall 环讯返回信息的xml文件
	 * @param obj 需要解析成的对象
	 * @return 返回实体对象
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 */
	public static Object decryption(String registerCall,Object obj) throws FileNotFoundException, UnsupportedEncodingException{
		return com.tpy.p2p.pay.util.XmlParsingBean.simplexml1Object(registerCall, obj);
	}
	/**
	 * 得到银行信息集合
	 * @return 返回银行信息集合对象
	 */
	public static List<BankInfo> bankList(){
		List<BankInfo> bankList = new ArrayList<BankInfo>();
		BankList bank = null;
		try {
			bank = WebService.bankList();
			bankList = com.tpy.p2p.pay.util.BankInfoListUtil.dismantling(bank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bankList;
	}
	/**
	 * 
	 * 获取宝付平台或商户余额
	 * @param merchantNo 平台或商户账号
	 * @return 返回商户余额信息
	 */
	public  String  accountBFBalance(String merchantNo){
		try {
			BalanceDto balanceDto = new BalanceDto(com.tpy.p2p.pay.util.ParameterIps.getMercode(),merchantNo);
			String balanceXml = bfService.serv_AccountBalance(balanceDto);
			LOG.info("接受到的账户余额xml为" + balanceXml);
			ResultDto resultDto	 = XMLBuild.parseXMLToEntity( balanceXml , ResultDto.class);
			return resultDto.getBalance() ;
		} catch (Exception e) {
			LOG.error("获取宝付平台余额出现异常"+merchantNo,e);
		}
		return null;
	}
	
	
	/**
	 * 
	 * 获取平台或商户余额
	 * @param merchantNo 平台或商户账号
	 * @return 返回商户余额信息
	 */
	public static BalanceInquiryInfo accountBalance(String merchantNo){
		try {
			return WebService.accountBalance(merchantNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 投资审核 ,放款
	 * @param map 加密后的集合信息
	 * @return 返回放款处理后的信息
	 * @throws java.rmi.RemoteException
	 * @throws java.io.UnsupportedEncodingException
	 * @throws java.io.FileNotFoundException
	 */
	public static ReturnInfo transfer(Map<String,String> map) throws RemoteException, FileNotFoundException, UnsupportedEncodingException{
	     return  WebService.loans(map);
	}
	/**
	 * 将xml信息解析成对象
	 * @param xml xml信息
	 */
	public static RepaymentInfo repaymentXml(String xml){
	    return com.tpy.p2p.pay.util.XmlParsingBean.parseXml(xml);
	}
	public static RepaymentAsyn repaymentAsynXml(String xml){
		return com.tpy.p2p.pay.util.XmlParsingBean.asynXml2Repayment(xml);
	}
	
}
