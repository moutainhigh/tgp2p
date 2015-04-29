package com.tpy.p2p.pay.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.tpy.base.util.FreeMarkerUtil;
import com.tpy.base.util.FreeMarkerUtil;
import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.pay.entity.*;
import com.tpy.p2p.pay.entity.BidAssignment;
import com.tpy.p2p.pay.entity.TenderAuditInfo;

import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.RepaymentSign;
import com.tpy.p2p.pay.entity.Transfer;
import com.tpy.p2p.pay.entity.WithdrawalInfo;
import freemarker.template.TemplateException;
/**
 * 
 * 生成xml文件
 * @author RanQiBing 2014-01-03
 *
 */
public class ParseXML {
	/**
	 * 用户注册信息生成xml文件
	 * @param register 用户信息
	 * @return 返回一个xml文件
	 * @throws TemplateException 
	 * @throws java.io.IOException
	 */
	public static String registration(RegisterInfo register) throws IOException, TemplateException{
		Map<String,String> map = new HashMap<String, String>();
		map.put("pMerBillNo",register.getpMerBillNo());
		map.put("pIdentType",register.getpIdentType());
		map.put("pIdentNo",register.getpIdentNo());
//		map.put("pStatus",register.getpStatus());
//		map.put("pIpsAcctNo",register.getpIpsAcctNo());
//		map.put("pIpsAcctDate",register.getpIpsAcctDate());
		map.put("pRealName",register.getpRealName());
		
		map.put("pMobileNo",register.getpMobileNo());
		map.put("pEmail",register.getpEmail());
		map.put("pSmDate",register.getpSmDate());
		map.put("pWebUrl",register.getpWebUrl());
		map.put("pS2SUrl",register.getpS2SUrl());
		map.put("pMemo1",register.getpMemo1());
		map.put("pMemo2",register.getpMemo2());
		map.put("pMemo3",register.getpMemo3());
		String registrationxml = FreeMarkerUtil.execute("config/pay/registration.flt", "UTF-8", map);
		return registrationxml;
	}
	/**
	 * 充值信息转换成xml
	 * @param recharge 充值信息
	 * @return  返回一个xml文件
	 * @throws TemplateException 
	 * @throws java.io.IOException
	 */
    public static String rechargeXml(RechargeInfo recharge) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo", recharge.getpMerBillNo());
    	map.put("pAcctType",recharge.getpAcctType());
    	map.put("pIdentNo",recharge.getpIdentNo());
    	map.put("pRealName", recharge.getpRealName());
    	map.put("pIpsAcctNo", recharge.getpIpsAcctNo());
    	map.put("pTrdDate",recharge.getpTrdDate());
    	map.put("pTrdAmt",recharge.getpTrdAmt());
    	map.put("PChannelType",recharge.getPChannelType());
    	map.put("pTrdBnkCode",recharge.getpTrdBnkCode());
    	map.put("pMerFee",recharge.getpMerFee());
    	map.put("pIpsFeeType",recharge.getpIpsFeeType());
    	map.put("pWebUrl",recharge.getpWebUrl());
    	map.put("pS2SUrl",recharge.getpS2SUrl());
    	map.put("pMemo1",recharge.getpMemo1());
    	map.put("pMemo2",recharge.getpMemo2());
    	map.put("pMemo3",recharge.getpMemo3());
    	String recharges = FreeMarkerUtil.execute("config/pay/recharge.flt", "UTF-8", map);
    	return recharges;
    }
    /**
     * 用户投标信息
     * @param bid 投标信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws java.io.IOException
     */
    public static String bidXml(BidInfo bid) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo", bid.getpMerBillNo());
    	map.put("pMerDate", bid.getpMerDate());
    	map.put("pBidNo", bid.getpBidNo());
    	map.put("pContractNo", bid.getpContractNo());
    	map.put("pRegType", bid.getpRegType());
    	map.put("pAuthNo", bid.getpAuthNo());
    	map.put("pAuthAmt", bid.getpAuthAmt());
    	map.put("pTrdAmt", bid.getpTrdAmt());
    	map.put("pFee", bid.getpFee());
    	map.put("pAcctType", bid.getpAcctType());
    	map.put("pIdentNo", bid.getpIdentNo());
    	map.put("pRealName", bid.getpRealName());
    	map.put("pAccount", bid.getpAccount());
    	map.put("pUse", bid.getpUse());
    	map.put("pWebUrl", bid.getpWebUrl());
    	map.put("pS2SUrl", bid.getpS2SUrl());
    	map.put("pMemo1", bid.getpMemo1());
    	map.put("pMemo2", bid.getpMemo2());
    	map.put("pMemo3", bid.getpMemo3());

    	String bidxml = FreeMarkerUtil.execute("config/pay/bid.flt", "UTF-8", map);
    	return bidxml;
    }
    /**
     * 将自动投标信息转换成xml文件
     * @param automatic 自动投标信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws java.io.IOException
     */
    public static String automaticBidXml(AutomaticBidInfo automatic) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo",automatic.getpMerBillNo());
    	map.put("pSigningDate",automatic.getpSigningDate());
    	map.put("pAcctType",automatic.getpAcctType());
    	map.put("pIdentNo",automatic.getpIdentNo());
    	map.put("pRealName",automatic.getpRealName());
    	map.put("pIpsAcctNo",automatic.getpIpsAcctNo());
    	map.put("pWebUrl",automatic.getpWebUrl());
    	map.put("pS2SUrl",automatic.getpS2SUrl());
    	map.put("pMemo1",automatic.getpMemo1());
    	map.put("pMemo2",automatic.getpMemo2());
    	map.put("pMemo3",automatic.getpMemo3());
    	String automaticxml = FreeMarkerUtil.execute("config/pay/automaticBid.flt", "UTF-8", map);
    	return automaticxml;
    }
    /**
     * 还款信息转换成xml文件
     * @param repayment 还款信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws java.io.IOException
     */
    public static String repaymentXml(Repayment repayment) throws IOException, TemplateException{
    	Map<String,Object> map = new HashMap<String, Object>();
    	map.put("pBidNo",repayment.getpBidNo());
    	map.put("pRepaymentDate",repayment.getpRepaymentDate());
    	map.put("pMerBillNo",repayment.getpMerBillNo());
    	map.put("pRepayType",repayment.getpRepayType());
    	map.put("pIpsAuthNo",repayment.getpIpsAuthNo());
    	map.put("pOutAcctNo",repayment.getpOutAcctNo());
    	map.put("pOutAmt",repayment.getpOutAmt());
    	map.put("pOutFee",repayment.getpOutFee());
    	map.put("pWebUrl",repayment.getpWebUrl());
    	map.put("pS2SUrl",repayment.getpS2SUrl());
    	map.put("list",repayment.getInvestorInfos());
    	map.put("pMemo1",repayment.getpMemo1());
    	map.put("pMemo2",repayment.getpMemo2());
    	map.put("pMemo3",repayment.getpMemo3());
    	String repaymentxml = FreeMarkerUtil.execute("config/pay/repayment.flt", "UTF-8", map);
    	System.out.println(repaymentxml);
    	return repaymentxml;
    }
    /**
     * 投标审核
     * @param tenderAudit 投标审核信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws java.io.IOException
     */
    public static String tenderAuditXml(TenderAuditInfo tenderAudit) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pBidNo",tenderAudit.getpBidNo());
    	map.put("pContractNo",tenderAudit.getpContractNo());
    	map.put("pMerBillNo",tenderAudit.getpMerBillNo());
    	map.put("pBidStatus",tenderAudit.getpBidStatus());
    	map.put("pS2SUrl",tenderAudit.getpS2SUrl());
    	map.put("pMemo1",tenderAudit.getpMemo1());
    	map.put("pMemo2",tenderAudit.getpMemo2());
    	map.put("pMemo3",tenderAudit.getpMemo3());
    	String tenderAuditxml = FreeMarkerUtil.execute("config/pay/tenderAudit.flt", "UTF-8", map);
    	return tenderAuditxml;
    }
    /**
     * 提现
     * @param withdrawal 提现信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws java.io.IOException
     */
    public static String withdrawalXml(WithdrawalInfo withdrawal) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo",withdrawal.getpMerBillNo());
    	map.put("pAcctType",withdrawal.getpAcctType());
    	map.put("pOutType",withdrawal.getpOutType());
    	map.put("pBidNo",withdrawal.getpBidNo());
    	map.put("pContractNo",withdrawal.getpContractNo());
    	map.put("pDwTo",withdrawal.getpDwTo());
    	map.put("pIdentNo",withdrawal.getpIdentNo());
    	map.put("pRealName",withdrawal.getpRealName());
    	map.put("pIpsAcctNo",withdrawal.getpIpsAcctNo());
    	map.put("pDwDate",withdrawal.getpDwDate());
    	map.put("pTrdAmt",withdrawal.getpTrdAmt());
    	map.put("pMerFee",withdrawal.getpMerFee());
    	map.put("pIpsFeeType",withdrawal.getpIpsFeeType());
    	map.put("pWebUrl",withdrawal.getpWebUrl());
    	map.put("pS2SUrl",withdrawal.getpS2SUrl());
    	map.put("pMemo1",withdrawal.getpMemo1());
    	map.put("pMemo2",withdrawal.getpMemo2());
    	map.put("pMemo3",withdrawal.getpMemo3());
    	String tenderAuditxml = FreeMarkerUtil.execute("config/pay/withdrawal.flt", "UTF-8", map);
    	return tenderAuditxml;
    	
    }
    /**
     * 将标的和借款人转为ips格式
     * @param rs
     * @return
     * @throws java.io.IOException
     * @throws TemplateException
     */
    public static String registerSubjectXml(RegisterSubject rs) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo",rs.getpMerBillNo());
    	map.put("pBidNo",rs.getpBidNo());
    	map.put("pRegDate",rs.getpRegDate());
    	map.put("pLendAmt",rs.getpLendAmt());
    	map.put("pGuaranteesAmt",rs.getpGuaranteesAmt());
    	map.put("pTrdLendRate",rs.getpTrdLendRate());
    	map.put("pTrdCycleType",rs.getpTrdCycleType());
    	map.put("pTrdCycleValue",rs.getpTrdCycleValue());
    	map.put("pLendPurpose",rs.getpLendPurpose());
    	map.put("pRepayMode",rs.getpRepayMode());
    	map.put("pOperationType",rs.getpOperationType());
    	map.put("pLendFee",rs.getpLendFee());
    	map.put("pAcctType",rs.getpAcctType());
    	map.put("pIdentNo",rs.getpIdentNo());
    	map.put("pRealName",rs.getpRealName());
    	map.put("pIpsAcctNo",rs.getpIpsAcctNo());
    	map.put("pWebUrl",rs.getpWebUrl());
    	map.put("pS2SUrl",rs.getpS2SUrl());
    	map.put("pMemo1",rs.getpMemo1());
    	map.put("pMemo2",rs.getpMemo2());
    	map.put("pMemo3",rs.getpMemo3());
    	String registerSubjectXml = FreeMarkerUtil.execute("config/pay/registerSubject.flt", "UTF-8", map);
    	return registerSubjectXml;
    }

    
    /**
     * 
     * @param transfer
     * @return
     * @throws java.io.IOException
     * @throws TemplateException
     */
	public static String transFerXml(Transfer transfer) throws IOException, TemplateException {
		Map<String,Object> map = new HashMap<String, Object>();

		map.put("pMerBillNo", transfer.getpMerBillNo());
		map.put("pBidNo", transfer.getpBidNo());
		map.put("pDate", transfer.getpDate());
		map.put("pTransferType", transfer.getpTransferType());
		map.put("pTransferMode", transfer.getpTransferMode());
		map.put("pS2SUrl", transfer.getpS2SUrl());
		
		map.put("pMemo1", transfer.getpMemo1());
		map.put("pMemo2", transfer.getpMemo2());
		map.put("pMemo3", transfer.getpMemo3());
		map.put("pRows", transfer.getpRows());
		
		String transferXml = FreeMarkerUtil.execute("config/pay/transfers.flt", "UTF-8", map);
		return transferXml;
	}


   /**
    * 债权转让
    * @param assignment
    * @return 返回xml文件
    * @throws java.io.IOException
    * @throws TemplateException
    */
    public static String bidAssignmentXml(BidAssignment assignment) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo", assignment.getpMerBillNo());
    	map.put("pMerDate", assignment.getpMerDate());
    	map.put("pBidNo", assignment.getpBidNo());
    	map.put("pContractNo", assignment.getpContractNo());
    	map.put("pFromAccountType", assignment.getpFromAccountType());
    	map.put("pFromName", assignment.getpFromName());
    	map.put("pFromAccount", assignment.getpFromAccount());
    	map.put("pFromIdentType", assignment.getpFromIdentType());
    	map.put("pFromIdentNo", assignment.getpFromIdentNo());
    	map.put("pToAccountType", assignment.getpToAccountType());
    	map.put("pToAccountName", assignment.getpToAccountName());
    	map.put("pToAccount", assignment.getpToAccount());
    	map.put("pToIdentType", assignment.getpToIdentType());
    	map.put("pToIdentNo", assignment.getpToIdentNo());

    	
    	map.put("pCreMerBillNo", assignment.getpCreMerBillNo());
    	map.put("pCretAmt", assignment.getpCretAmt());
    	map.put("pPayAmt", assignment.getpPayAmt());
    	map.put("pFromFee", assignment.getpFromFee());
    	map.put("pToFee", assignment.getpToFee());
    	map.put("pCretType", assignment.getpCretType());
    	
    	map.put("pWebUrl", assignment.getpWebUrl());
    	map.put("pS2SUrl", assignment.getpS2SUrl());
    	map.put("pMemo1", assignment.getpMemo1());
    	map.put("pMemo2", assignment.getpMemo2());
    	map.put("pMemo3", assignment.getpMemo3());

    	String bidxml = FreeMarkerUtil.execute("config/pay/bidAssignment.flt", "UTF-8", map);
    	return bidxml;
    }
    /**
     * 自动投标规则
     * @param automaitc
     * @return
     * @throws java.io.IOException
     * @throws TemplateException
     */
    public static String automaitcXml(Automatic automaitc)throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo", automaitc.getpMerBillNo());
    	map.put("pSigningDate", automaitc.getpSigningDate());
    	map.put("pIdentNo", automaitc.getpIdentNo());
    	map.put("pRealName", automaitc.getpRealName());
    	map.put("pIpsAcctNo", automaitc.getpIpsAcctNo());
    	map.put("pValidType", automaitc.getpValidType());
    	map.put("pValidDate", automaitc.getpValidDate());
    	map.put("pTrdCycleType", automaitc.getpTrdCycleType());
    	map.put("pSTrdCycleValue",automaitc.getpSTrdCycleValue().toString());
    	map.put("pETrdCycleValue",automaitc.getpETrdCycleValue().toString());
    	map.put("pSAmtQuota", automaitc.getpSAmtQuota().toString());
    	map.put("pEAmtQuota", automaitc.getpEAmtQuota().toString());
    	map.put("pSIRQuota", automaitc.getpSIRQuota().toString());
    	map.put("pEIRQuota", automaitc.getpEIRQuota().toString());
    	map.put("pWebUrl", automaitc.getpWebUrl());
    	map.put("pS2SUrl", automaitc.getpS2SUrl());
    	map.put("pMemo1", automaitc.getpMemo1());
    	map.put("pMemo2", automaitc.getpMemo2());
    	map.put("pMemo3", automaitc.getpMemo3());
    	
    	String bidxml = FreeMarkerUtil.execute("config/pay/automaticBid.flt", "UTF-8", map);
    	return bidxml;
    }
   
    /**
     * 自动还款签约
     * @throws TemplateException 
     * @throws java.io.IOException
     * 
     */
    public static String repaymentSignXml(RepaymentSign repaymentSign) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo", repaymentSign.getpMerBillNo());
    	map.put("pSigningDate", repaymentSign.getpSigningDate());
    	map.put("pIdentType", repaymentSign.getpIdentType());
    	map.put("pIdentNo", repaymentSign.getpIdentNo());
    	map.put("pRealName", repaymentSign.getpRealName());
    	map.put("pIpsAcctNo", repaymentSign.getpIpsAcctNo());
    	map.put("pValidType", repaymentSign.getpValidType());
    	map.put("pValidDate", repaymentSign.getpValidDate());
    	map.put("pWebUrl", repaymentSign.getpWebUrl());
    	map.put("pS2SUrl", repaymentSign.getpS2SUrl());
    	map.put("pMemo1", repaymentSign.getpMemo1());
    	map.put("pMemo2",repaymentSign.getpMemo2());
    	map.put("pMemo3", repaymentSign.getpMemo3());
    	
    	String repaymentSignXml= FreeMarkerUtil.execute("config/pay/repaymentSign.flt", "UTF-8", map);
    	return repaymentSignXml;
    }
    
    }
