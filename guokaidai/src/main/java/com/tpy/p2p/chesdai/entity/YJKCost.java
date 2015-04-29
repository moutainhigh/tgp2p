package com.tpy.p2p.chesdai.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yjkcost")
public class YJKCost {
	/**
	 * id 自动增长列
	 */
	 @Id
	 @GeneratedValue(strategy = IDENTITY)
	 @Column(name = "id", unique = true, nullable = false)
	private Long id;
	/**
	 * HR客户借款服务费
	 */
	 @Column(name="lv0")
	private Double lv0;
	
	/**
	 * E客户借款服务费
	 */
	 @Column(name="lv1")
	private Double lv1;
	
	/**
	 * D客户借款服务费
	 */
	 @Column(name="lv2")
	private Double lv2;
	
	/**
	 * C客户借款服务费
	 */
	 @Column(name="lv3")
	private Double lv3;
	
	/**
	 * B客户借款服务费
	 */
	 @Column(name="lv4")
	private Double lv4;
	
	/**
	 * A客户借款服务费
	 */
	 @Column(name="lv5")
	private Double lv5;
	
	/**
	 * AA客户借款服务费
	 */
	 @Column(name="lv6")
	private Double lv6;
	
	/**
	 * AAA客户借款服务费
	 */
	 @Column(name="lv7")
	private Double lv7;
	
	/**
	 * 借款管理费率(按月收取)
	 */
	 @Column(name="repay_manage_ratio")
	private Double repayManageRatio;
	
	/**
	 * 逾期还款罚息利率1(30天以内)
	 */
	 @Column(name="overdue_repay_ratio1")
	private Double overdueRepayRatio1;
	/**
	 * 逾期还款费罚息利率2(31天以上)
	 */
	 @Column(name="overdue_repay_ratio2")
	private Double overdueRepayRatio2;
	/**
	 * 逾期还款管理费率1(30天以内)
	 */
	 @Column(name="overdue_repay_mngmt1")
	private Double overdueRepayMngmt1;
	
	/**
	 * 逾期还款管理费率(31天以上)
	 */
	 @Column(name="overdue_repay_mngmt2")
	private Double overdueRepayMngmt2;
	
	/**
	 * 身份验证费
	 */
	 @Column(name="id_verify_fee")
	private Double idVerifyFee;
	
	/**
	 * ips开户费
	 */
	 @Column(name="ips_reg_fee")
	private Double ipsRegFee;
	
	/**
	 * 借款审核费
	 */
	 @Column(name="borrow_audit_fee")
	private Double borrowAuditFee;
	/**
	 * ips短信服务费
	 */
	 @Column(name="ips_sms_fee")
	private Double ipsSmsFee;
	/**
	 * 充值服务费率
	 */
	 @Column(name="recharge_ratio")
	private Double rechargeRatio;
	 /**
	  * 充值手续费上限
	  */
	 @Column(name="recharge_fee_top")
	 private Double rechargeFeeTop;
	 
	/**
	 * 提现费用(2万元以下)
	 */
	 @Column(name="withdraw_fee0")
	private Double withdrawFee0;
	/**
	 * 提现费用(2万(含)-5万元)
	 */
	 @Column(name="withdraw_fee1")
	private Double withdrawFee1;
	/**
	 * 提现费用(5万(含)-100万元以下)
	 */
	 @Column(name="withdraw_fee2")
	private Double withdrawFee2;
	 /**
	  *推广基础分数
	  */
	 @Column(name="tg_base_score")
	private Integer tgBaseScore; 
	 /**
	  * 债权转让手续费
	  */
	 /*@Column(name="creditor_transfer_fee")
	 private Double creditorTransferFee;*/
	 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getLv0() {
		return lv0;
	}
	public void setLv0(Double lv0) {
		this.lv0 = lv0;
	}
	public Double getLv1() {
		return lv1;
	}
	public void setLv1(Double lv1) {
		this.lv1 = lv1;
	}
	public Double getLv2() {
		return lv2;
	}
	public void setLv2(Double lv2) {
		this.lv2 = lv2;
	}
	public Double getLv3() {
		return lv3;
	}
	public void setLv3(Double lv3) {
		this.lv3 = lv3;
	}
	public Double getLv4() {
		return lv4;
	}
	public void setLv4(Double lv4) {
		this.lv4 = lv4;
	}
	public Double getLv5() {
		return lv5;
	}
	public void setLv5(Double lv5) {
		this.lv5 = lv5;
	}
	public Double getLv6() {
		return lv6;
	}
	public void setLv6(Double lv6) {
		this.lv6 = lv6;
	}
	public Double getLv7() {
		return lv7;
	}
	public void setLv7(Double lv7) {
		this.lv7 = lv7;
	}
	public Double getOverdueRepayRatio1() {
		return overdueRepayRatio1;
	}
	public void setOverdueRepayRatio1(Double overdueRepayRatio1) {
		this.overdueRepayRatio1 = overdueRepayRatio1;
	}
	public Double getOverdueRepayRatio2() {
		return overdueRepayRatio2;
	}
	public void setOverdueRepayRatio2(Double overdueRepayRatio2) {
		this.overdueRepayRatio2 = overdueRepayRatio2;
	}
	public Double getOverdueRepayMngmt1() {
		return overdueRepayMngmt1;
	}
	public void setOverdueRepayMngmt1(Double overdueRepayMngmt1) {
		this.overdueRepayMngmt1 = overdueRepayMngmt1;
	}
	public Double getOverdueRepayMngmt2() {
		return overdueRepayMngmt2;
	}
	public void setOverdueRepayMngmt2(Double overdueRepayMngmt2) {
		this.overdueRepayMngmt2 = overdueRepayMngmt2;
	}
	public Double getIdVerifyFee() {
		return idVerifyFee;
	}
	public void setIdVerifyFee(Double idVerifyFee) {
		this.idVerifyFee = idVerifyFee;
	}
	public Double getIpsRegFee() {
		return ipsRegFee;
	}
	public void setIpsRegFee(Double ipsRegFee) {
		this.ipsRegFee = ipsRegFee;
	}
	public Double getBorrowAuditFee() {
		return borrowAuditFee;
	}
	public void setBorrowAuditFee(Double borrowAuditFee) {
		this.borrowAuditFee = borrowAuditFee;
	}
	public Double getIpsSmsFee() {
		return ipsSmsFee;
	}
	public void setIpsSmsFee(Double ipsSmsFee) {
		this.ipsSmsFee = ipsSmsFee;
	}
	public Double getWithdrawFee0() {
		return withdrawFee0;
	}
	public void setWithdrawFee0(Double withdrawFee0) {
		this.withdrawFee0 = withdrawFee0;
	}
	public Double getWithdrawFee1() {
		return withdrawFee1;
	}
	public void setWithdrawFee1(Double withdrawFee1) {
		this.withdrawFee1 = withdrawFee1;
	}
	public Double getWithdrawFee2() {
		return withdrawFee2;
	}
	public void setWithdrawFee2(Double withdrawFee2) {
		this.withdrawFee2 = withdrawFee2;
	}
	public Double getRepayManageRatio() {
		return repayManageRatio;
	}
	public void setRepayManageRatio(Double repayManageRatio) {
		this.repayManageRatio = repayManageRatio;
	}
	public Double getRechargeRatio() {
		return rechargeRatio;
	}
	public void setRechargeRatio(Double rechargeRatio) {
		this.rechargeRatio = rechargeRatio;
	}
	public Double getRechargeFeeTop() {
		return rechargeFeeTop;
	}
	public void setRechargeFeeTop(Double rechargeFeeTop) {
		this.rechargeFeeTop = rechargeFeeTop;
	}
	public Integer getTgBaseScore() {
		return tgBaseScore;
	}
	public void setTgBaseScore(Integer tgBaseScore) {
		this.tgBaseScore = tgBaseScore;
	}
	/*public Double getCreditorTransferFee() {
		return creditorTransferFee;
	}
	public void setCreditorTransferFee(Double creditorTransferFee) {
		this.creditorTransferFee = creditorTransferFee;
	}*/
	
}
