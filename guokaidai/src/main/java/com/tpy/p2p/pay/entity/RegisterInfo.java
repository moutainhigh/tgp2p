package com.tpy.p2p.pay.entity;

import com.tpy.base.util.StringUtil;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.Constant;

/**
 * 注册环讯平台账号对象
 * @author QanQiBing 2014-01-03
 *
 */
public class RegisterInfo {
	
    /**商户开户流水号;(KH+当前时间精确到秒+四位随机数)*/
	private String pMerBillNo = "KH"+StringUtil.pMerBillNo() ;  
	/**证件类型 默认为身份证类型 1 */
	private String pIdentType = Constant.STATUES_ONE.toString();
	/**证件号码;*/
	private String pIdentNo;	
	/**开户状态 (10#开户成功，5#注册超时，9#开户失败)*/
	private String pStatus;		
	/**IPS账户号*/
	private String pIpsAcctNo;	
	/**IPS开户日期*/
	private String pIpsAcctDate = DateUtils.format("yyyyMMdd"); 
	/**姓名 */
	private String pRealName;	
	/**手机号 */
	private String pMobileNo;	
	/**激活邮件*/
	private String pEmail;	
	/**提交日期 */
	private String pSmDate = DateUtils.format("yyyyMMdd");
	/**银行名称,pErrCode 返回状态为MG00000F 时返回，用户在IPS 登记的信息*/
	private String pBankName;
	/**户名,pErrCode 返回状态为MG00000F 时返回，用户在IPS 登记的信息与姓名一致。*/
	private String pBkAccName;
	/**银行卡账号 返回卡号后4 位 */
	private String pBkAccNo;
	/**身份证状态 是否验证成功：F 未验证，Y 验证通过，N 验证不通过*/
	private String pCardStatus;
	/**手机状态 是否验证成功：F 未验证，Y 验证通过，N 验证不通过*/
	private String pPhStatus;
	
	/**状态返回地址(即浏览器返回地址) */
	private String pWebUrl = Constant.REGISTRATION;		
	/**状态返回地址(即后台返回地址) */
	private String pS2SUrl = Constant.ASYNCHRONISMREGISTRATION;		
	/**备注1*/
	private String pMemo1 = "";		
	/**备注1*/
	private String pMemo2 = "";		
	/**备注1*/
	private String pMemo3 = "";  	
	
	/**
	 * 商户开户流水号
	 * @return pMerBillNo
	 */
	public String getpMerBillNo() {
		return pMerBillNo;
	}
	/**
	 * 商户开户流水号
	 * @param pMerBillNo pMerBillNo
	 */
	public void setpMerBillNo(String pMerBillNo) {
		this.pMerBillNo = pMerBillNo;
	}
	/**
	 * 证件类型 默认为身份证类型 1
	 * @return pIdentType
	 */
	public String getpIdentType() {
		return pIdentType;
	}
	/**
	 * 证件类型 默认为身份证类型 1
	 *  pIdentType
	 */
	public void setpIdentType() {
		this.pIdentType = "1";
	}
	/**
	 * 证件号码
	 * @return pIdentNo
	 */
	public String getpIdentNo() {
		return pIdentNo;
	}
	/**
	 * 证件号码
	 * @param pIdentNo pIdentNo
	 */
	public void setpIdentNo(String pIdentNo) {
		this.pIdentNo = pIdentNo;
	}
	/**
	 * 姓名
	 * @return pRealName
	 */ 
	public String getpRealName() {
		return pRealName;
	}
	/**
	 * 姓名
	 * @param pRealName pRealName
	 */
	public void setpRealName(String pRealName) {
		this.pRealName = pRealName;
	}
	/**
	 * 激活邮件
	 * @return pMobileNo
	 */
	public String getpMobileNo() {
		return pMobileNo;
	}
	/**
	 * 激活邮件
	 * @param pMobileNo pMobileNo
	 */
	public void setpMobileNo(String pMobileNo) {
		this.pMobileNo = pMobileNo;
	}
	/**
	 * 激活邮件
	 * @return pEmail
	 */
	public String getpEmail() {
		return pEmail;
	}
	/**
	 * 激活邮件
	 * @param pEmail pEmail
	 */
	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}
	/**
	 * 状态返回地址(即浏览器返回地址) 
	 * @return pWebUrl
	 */
	public String getpWebUrl() {
		return pWebUrl;
	}
	/**
	 * 状态返回地址(即浏览器返回地址) 
	 * @param pWebUrl pWebUrl
	 */
	public void setpWebUrl(String pWebUrl) {
		this.pWebUrl = pWebUrl;
	}
	/**
	 * 状态返回地址(即后台返回地址)
	 * @return pS2SUrl
	 */ 
	public String getpS2SUrl() {
		return pS2SUrl;
	}
	/**
	 * 状态返回地址(即后台返回地址)
	 * @param pS2SUrl pS2SUrl
	 */
	public void setpS2SUrl(String pS2SUrl) {
		this.pS2SUrl = pS2SUrl;
	}
	/**
	 * 备注1
	 * @return pMemo1
	 */
	public String getpMemo1() {
		return pMemo1;
	}
	/**
	 * 备注1
	 * @param pMemo1 pMemo1
	 */
	public void setpMemo1(String pMemo1) {
		this.pMemo1 = pMemo1;
	}
	/**
	 * 备注2
	 * @return pMemo2
	 */
	public String getpMemo2() {
		return pMemo2;
	}
	/**
	 * 备注2
	 * @param pMemo2 pMemo2
	 */
	public void setpMemo2(String pMemo2) {
		this.pMemo2 = pMemo2;
	}
	/**
	 * 备注3
	 * @return pMemo3
	 */
	public String getpMemo3() {
		return pMemo3;
	}
	/**
	 * 备注3
	 * @param pMemo3 pMemo3
	 */
	public void setpMemo3(String pMemo3) {
		this.pMemo3 = pMemo3;
	}  
	/**
	 * 开户状态 (状态0000：成功)
	 * @return pStatus
	 */
	public String getpStatus() {
		return pStatus;
	}
	/**
	 * 开户状态 (状态0000：成功)
	 * @param pStatus pStatus
	 */
	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}
	/**
	 * IPS账户号
	 * @return pIpsAcctNo
	 */
	public String getpIpsAcctNo() {
		return pIpsAcctNo;
	}
	/**
	 * IPS账户号
	 * @param pIpsAcctNo pIpsAcctNo
	 */
	public void setpIpsAcctNo(String pIpsAcctNo) {
		this.pIpsAcctNo = pIpsAcctNo;
	}
	/**
	 * IPS开户日期
	 * @return pIpsAcctDate
	 */
	public String getpIpsAcctDate() {
		return pIpsAcctDate;
	}
	/**
	 * IPS开户日期
	 * @param pIpsAcctDate pIdentType
	 */
	public void setpIpsAcctDate(String pIpsAcctDate) {
		this.pIpsAcctDate = pIpsAcctDate;
	}
	/**
	 * 证件类型 默认为身份证类型 1 
	 * @param pIdentType pIdentType
	 */
	public void setpIdentType(String pIdentType) {
		this.pIdentType = pIdentType;
	}
	/**
	 * 提交日期
	 * @return
	 */
	public String getpSmDate() {
		return pSmDate;
	}
	/**
	 * 提交日期
	 * 时间格式“yyyyMMdd”,商户提交日期,。如：20140323
	 * @param pSmDate
	 */
	public void setpSmDate(String pSmDate) {
		this.pSmDate = pSmDate;
	}
	/**银行名称,pErrCode 返回状态为MG00000F 时返回，用户在IPS 登记的信息*/
	public String getpBankName() {
		return pBankName;
	}
	public void setpBankName(String pBankName) {
		this.pBankName = pBankName;
	}
	/**户名,pErrCode 返回状态为MG00000F 时返回，用户在IPS 登记的信息与姓名一致。*/
	public String getpBkAccName() {
		return pBkAccName;
	}
	public void setpBkAccName(String pBkAccName) {
		this.pBkAccName = pBkAccName;
	}
	/**银行卡账号*/
	public String getpBkAccNo() {
		return pBkAccNo;
	}
	public void setpBkAccNo(String pBkAccNo) {
		this.pBkAccNo = pBkAccNo;
	}
	/**身份证状态*/
	public String getpCardStatus() {
		return pCardStatus;
	}
	public void setpCardStatus(String pCardStatus) {
		this.pCardStatus = pCardStatus;
	}
	/**手机状态 */
	public String getpPhStatus() {
		return pPhStatus;
	}
	public void setpPhStatus(String pPhStatus) {
		this.pPhStatus = pPhStatus;
	}
	
}
