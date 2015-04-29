package com.tpy.p2p.pay.entity;

 import java.text.DecimalFormat;
import java.text.ParseException;

import com.tpy.base.util.StringUtil;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
 import com.tpy.base.util.StringUtil;
 import com.tpy.p2p.chesdai.constant.Constant;
 import com.tpy.p2p.chesdai.entity.Userbasicsinfo;

/**
 * 投标
 * 投资人手续费用与是否vip相关，用属性注入
 * @author frank 2014-08-18
 *
 */
public class BidInfo {
	
	/**投标订单号 */
	private String pMerBillNo; 	
	
	/**商户日期,格式：YYYYMMDD*/
	private String pMerDate;
	
    /**标号,长度30 */
	private String pBidNo;
	
	/**合同号 */
	private String pContractNo; 
	
	/**登记方式,1：手动投标 2：自动投标*/
	private String pRegType;
	
	/**授权号,登记方式为1 时，为空登记方式为2 时，填写该投资人自动投标签约时IPS 向平台接口返回的“pIpsAuthNo 授权号”*/
	private String pAuthNo;
	
	/**债权面额,登记债权人时提交的数据*/
	private String pAuthAmt;
	
	/**交易金额,债权面额等于交易金额*/
	private String pTrdAmt;
	
	/**投资人手续费*/
	private String pFee;
	
	/**账户类型 0#机构（暂未开放）；1#个人*/
	private String pAcctType;
	
	/**证件号码*/
	private String pIdentNo;
	
	/**姓名*/
	private String pRealName;
	
	/**投资人环讯账户*/
	private String pAccount;
	
	/**借款用途 */
	private String pUse;	
	
	/**投资人编号*/
	private String pAccountDealNo;
	
	/**标的编号*/
	private String pBidDealNo;
	
	/**业务类型,返回1，代表投标*/
	private String pBusiType;
	
	/**实际冻结金额*/
	private String pTransferAmt;
	
	/**债权人状态,0：新增 1：进行中 10：结束*/
	private String pStatus;
	
	/**IPS P2P 订单号,由IPS 系统生成的唯一流水号*/
	private String pP2PBillNo;
	
	/**IPS 处理时间,格式为：yyyyMMddHHmmss*/
	private String pIpsTime;

	private String pWebUrl = Constant.BID;
	/**状态返回地址2 */
	private String pS2SUrl = Constant.ASYNCHRONISMBID; 		
	/**备注 */
	private String pMemo1=""; 			
	/**备注 */
	private String pMemo2=""; 			
	/**备注 */
	private String pMemo3=""; 			
	/**IPS投标订单号 (由 IPS 系统生成的唯一流水号 )*/
	private String pIpsBillNo;		

	public BidInfo(){};
	/**
	 * 
	 * @param user 
	 * @param timePayStart
	 * @param money 购标金额
	 * @param loan	标
	 * @param pRegType	购标方式1：手动，2：自动
	 * @throws java.text.ParseException
	 */
	public BidInfo(Userbasicsinfo user,Loansign loan,String pRegType, Double money) throws ParseException{
		//格式化金额为xxx.xx
		DecimalFormat df=new DecimalFormat("0.00");
		
		this.pMerBillNo = "DDH"+ StringUtil.pMerBillNo();
//		this.pMerBillNo = loan.getLoansignbasics().getpBidNo();
	    this.pBidNo = loan.getLoansignbasics().getLoanNumber();
	    
	    this.pContractNo = loan.getLoansignbasics().getpContractNo();
	    
	    this.pMerDate = DateUtils.format("yyyyMMdd");
	    this.pRegType=pRegType;
	    if(pRegType.equals("1")){
	    	this.pAuthNo="";
	    }else{
	    	//TODO 此处涉及自动投标
	    	this.pAuthNo="xxxx";
	    }
	    this.pAuthAmt=String.valueOf(df.format(money));
		this.pTrdAmt=String.valueOf(df.format(money));
		
		
		this.pAcctType="1";
		this.pIdentNo=user.getUserrelationinfo().getCardId();
		this.pRealName=user.getName();
		this.pAccount=user.getUserfundinfo().getpIdentNo();
		this.pUse=loan.getLoansignbasics().getBehoof();
		
	    
	    
	    this.pMemo1 = loan.getId().toString();
	    this.pMemo2 = user.getId().toString()+"_1";
//	    this.pMemo3 = String.valueOf(money);
	    
	}
	
	/**
	 * 
	 * @param user 
	 * @param timePayStart
	 * @param money 购标金额
	 * @param loan	标
	 * @param pRegType	购标方式1：手动，2：自动
	 * @throws java.text.ParseException
	 */
	public BidInfo(Userbasicsinfo user,Loansign loan,String pRegType, Double money,String pAuthNo) throws ParseException{
		//格式化金额为xxx.xx
		DecimalFormat df=new DecimalFormat("0.00");
		this.pMerBillNo = "ZDTB"+StringUtil.pMerBillNo();
	    this.pBidNo = loan.getLoansignbasics().getLoanNumber();
	    
	    this.pContractNo = loan.getLoansignbasics().getpContractNo();
	    
	    this.pMerDate = DateUtils.format("yyyyMMdd");
	    this.pRegType=pRegType;
	    this.pAuthNo=pAuthNo;
	    this.pAuthAmt=String.valueOf(df.format(money));
		this.pTrdAmt=String.valueOf(df.format(money));
		
		
		this.pAcctType="1";
		this.pIdentNo=user.getUserrelationinfo().getCardId();
		this.pRealName=user.getName();
		this.pAccount=user.getUserfundinfo().getpIdentNo();
		this.pUse=loan.getLoansignbasics().getBehoof();
	    
	    this.pMemo1 = loan.getId().toString();
	    this.pMemo2 = user.getId().toString()+"_2";
	    
	}
	/**
	 * 投标订单号 
	 * @return
	 */
	public String getpMerBillNo() {
		return pMerBillNo;
	}
	/**
	 * 投标订单号 
	 * @param pMerBillNo
	 */
	public void setpMerBillNo(String pMerBillNo) {
		this.pMerBillNo = pMerBillNo;
	}
	/**
	 * 商户日期
	 * @return
	 */
	public String getpMerDate() {
		return pMerDate;
	}
	/**
	 * 商户日期
	 * @param pMerDate
	 */
	public void setpMerDate(String pMerDate) {
		this.pMerDate = pMerDate;
	}
	/**
	 * 标号
	 * @return
	 */
	public String getpBidNo() {
		return pBidNo;
	}
	/**
	 * 标号
	 * @param pBidNo
	 */
	public void setpBidNo(String pBidNo) {
		this.pBidNo = pBidNo;
	}
	/**
	 * 标号
	 * @return
	 */
	public String getpContractNo() {
		return pContractNo;
	}
	/**
	 * 标号
	 * @param pContractNo
	 */
	public void setpContractNo(String pContractNo) {
		this.pContractNo = pContractNo;
	}
	public String getpRegType() {
		return pRegType;
	}
	public void setpRegType(String pRegType) {
		this.pRegType = pRegType;
	}
	public String getpAuthNo() {
		return pAuthNo;
	}
	public void setpAuthNo(String pAuthNo) {
		this.pAuthNo = pAuthNo;
	}
	public String getpAuthAmt() {
		return pAuthAmt;
	}
	public void setpAuthAmt(String pAuthAmt) {
		this.pAuthAmt = pAuthAmt;
	}
	public String getpTrdAmt() {
		return pTrdAmt;
	}
	public void setpTrdAmt(String pTrdAmt) {
		this.pTrdAmt = pTrdAmt;
	}
	public String getpFee() {
		return pFee;
	}
	public void setpFee(String pFee) {
		this.pFee = pFee;
	}
	public String getpAcctType() {
		return pAcctType;
	}
	public void setpAcctType(String pAcctType) {
		this.pAcctType = pAcctType;
	}
	public String getpIdentNo() {
		return pIdentNo;
	}
	public void setpIdentNo(String pIdentNo) {
		this.pIdentNo = pIdentNo;
	}
	public String getpRealName() {
		return pRealName;
	}
	public void setpRealName(String pRealName) {
		this.pRealName = pRealName;
	}
	public String getpAccount() {
		return pAccount;
	}
	public void setpAccount(String pAccount) {
		this.pAccount = pAccount;
	}
	public String getpUse() {
		return pUse;
	}
	public void setpUse(String pUse) {
		this.pUse = pUse;
	}
	public String getpAccountDealNo() {
		return pAccountDealNo;
	}
	public void setpAccountDealNo(String pAccountDealNo) {
		this.pAccountDealNo = pAccountDealNo;
	}
	public String getpBidDealNo() {
		return pBidDealNo;
	}
	public void setpBidDealNo(String pBidDealNo) {
		this.pBidDealNo = pBidDealNo;
	}
	public String getpBusiType() {
		return pBusiType;
	}
	public void setpBusiType(String pBusiType) {
		this.pBusiType = pBusiType;
	}
	public String getpTransferAmt() {
		return pTransferAmt;
	}
	public void setpTransferAmt(String pTransferAmt) {
		this.pTransferAmt = pTransferAmt;
	}
	public String getpStatus() {
		return pStatus;
	}
	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}
	public String getpP2PBillNo() {
		return pP2PBillNo;
	}
	public void setpP2PBillNo(String pP2PBillNo) {
		this.pP2PBillNo = pP2PBillNo;
	}
	public String getpIpsTime() {
		return pIpsTime;
	}
	public void setpIpsTime(String pIpsTime) {
		this.pIpsTime = pIpsTime;
	}
	public String getpWebUrl() {
		return pWebUrl;
	}
	public void setpWebUrl(String pWebUrl) {
		this.pWebUrl = pWebUrl;
	}
	public String getpS2SUrl() {
		return pS2SUrl;
	}
	public void setpS2SUrl(String pS2SUrl) {
		this.pS2SUrl = pS2SUrl;
	}
	public String getpMemo1() {
		return pMemo1;
	}
	public void setpMemo1(String pMemo1) {
		this.pMemo1 = pMemo1;
	}
	public String getpMemo2() {
		return pMemo2;
	}
	public void setpMemo2(String pMemo2) {
		this.pMemo2 = pMemo2;
	}
	public String getpMemo3() {
		return pMemo3;
	}
	public void setpMemo3(String pMemo3) {
		this.pMemo3 = pMemo3;
	}
	public String getpIpsBillNo() {
		return pIpsBillNo;
	}
	public void setpIpsBillNo(String pIpsBillNo) {
		this.pIpsBillNo = pIpsBillNo;
	}
	

}
