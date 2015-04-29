package com.tpy.p2p.chesdai.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="withdraw_apply")
public class WithdrawApply {
	/**ID*/
	private Long id;
	
	/**余额*/
	private double cash;
	
	/**申请提现的数目*/
	private double applyNum;
	
	/**
	 * 申请结果
	 * 0不通过，1通过,2已提现,3提现中
	 * */
	private int result;
	
	/**
	 * 申请状态
	 * 0未审核，1已审核
	 */
	private int status;
	
	/**申请时间*/
	private String applyTime;
	
	/**审核时间*/
	private String answerTime;
	
	/**申请人*/
	private Userbasicsinfo userbasicsinfo;
	
	
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "cash")
	public double getCash() {
		return cash;
	}
	public void setCash(double cash) {
		this.cash = cash;
	}
	
	@Column(name = "apply_num")
	public double getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(double applyNum) {
		this.applyNum = applyNum;
	}
	
	@Column(name = "result")
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	
	@Column(name = "status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userbasic_id")
	public Userbasicsinfo getUserbasicsinfo() {
		return userbasicsinfo;
	}
	public void setUserbasicsinfo(Userbasicsinfo userbasicsinfo) {
		this.userbasicsinfo = userbasicsinfo;
	}
	
	@Column(name = "apply_time")
	public String getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}
	
	@Column(name = "answer_time")
	public String getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(String answerTime) {
		this.answerTime = answerTime;
	}
	
}
