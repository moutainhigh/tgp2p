package com.tpy.p2p.pay.util;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.ips.security.utility.IpsCrypto;
import com.tpy.p2p.pay.entity.ReturnInfo;

/**
 * 获取ips资金托管参数
 * @author RanQiBing
 * 2014-04-18
 *
 */
public class ParameterIpsUrl {
	
	private static Properties pro = null;
	static{
		try {
			 pro = PropertiesLoaderUtils.loadAllProperties("config/context/pay/payurl.properties");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	/**
	 * 用户注册
	 * @return
	 */
	public static String getRegistrationurl() {
		return pro.getProperty("REGISTRATIONTESTURL");
	}
	
	/**
	 * 充值地址
	 * @return
	 */
	public static String getRechargeurl() {
		return pro.getProperty("RECHARGETESTURL");
	}
	
	/**
	 * 投标
	 * @return
	 */
	public static String getBidurl() {
		return pro.getProperty("BIDTESTURL");
	}
	
	/**
	 * 自动投标
	 * @return
	 */
	public static String getAutomaticbidurl() {
		return pro.getProperty("AUTOMATICBIDTESTURL");
	}
	
	/**
	 * 还款
	 * @return
	 */
	public static String getRepaymenturl() {
		return pro.getProperty("REPAYMENTTESTURL");
	}
	
	/**
	 * 提现
	 * @return
	 */
	public static String getWithdrawalurl() {
		return pro.getProperty("WITHDRAWALTESTURL");
	}
	
	/**
	 * 账户余额查询
	 * @return
	 */
	public static String getBalabceinquiryurl() {
		return pro.getProperty("BALABCEINQUIRYTESTURL");
	}
	
	/**
	 * 获取银行列表
	 * @return
	 */
	public static String getBanklistqeryurl() {
		return pro.getProperty("BANKLISTQUERYTESTURL");
	}
	
	/**
	 * 发布标同时到环讯登记
	 * @return
	 */
	public static String getRegSub() {
		return pro.getProperty("REGSUB");
	}
	

	/**
	 * 转账地址
	 * @return
	 */
	public static String getTransferUrl(){
		return pro.getProperty("TRANSFER");
	}

	/**
	 *债权转让投标
	 * @return
	 */
	public static String getBidAssignment(){
		return pro.getProperty("BIDASSIGNMENTTESTURL");
	}
	/**
	 * 查询交易及用户信息地址
	 */
	public static String getCreditWSQuery(){
		return pro.getProperty("CREDITWSQUERYURL");
	}
	/**
	 * 自动投标规则地址
	 * @return
	 */
	public static String getAutomatic(){
		return pro.getProperty("AUTOMATICTESTURL");
	}
	
	/**
	 * 自动还款签约
	 */
	public static String getRepaymentSignUrl(){
		return pro.getProperty("REPAYMENTSIGNURL");
	}
}
