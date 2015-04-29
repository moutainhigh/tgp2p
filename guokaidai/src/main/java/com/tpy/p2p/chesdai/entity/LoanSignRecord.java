package com.tpy.p2p.chesdai.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="loanSignRecord")
public class LoanSignRecord {
	
	private Long id;
	private Userbasicsinfo userinfo;  //购标人
	private Double rate;   //利率
	private Double tenderMoney;  //投标金额
	private Integer state;  //状态  1、表示付款成功；0、表示付款失败
	private Long gradeNo;   //借款标编号
	private String time;   //购标时间
	private Long loanSignId;  //购买债权转让的原始id
	private Integer loanState; //状态 1-原始标  2-债权转让
	
	
	public LoanSignRecord() {
	}

	public LoanSignRecord(Long id, Userbasicsinfo userinfo, Double rate,
			Double tenderMoney, Integer state, Long gradeNo, String time) {
		super();
		this.id = id;
		this.userinfo = userinfo;
		this.rate = rate;
		this.tenderMoney = tenderMoney;
		this.state = state;
		this.gradeNo = gradeNo;
		this.time = time;
	}
	
	@Id 
	@GeneratedValue(strategy=IDENTITY)
    @Column(name="id", unique=true, nullable=false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@ManyToOne
    @JoinColumn(name="user_id")
	public Userbasicsinfo getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Userbasicsinfo userinfo) {
		this.userinfo = userinfo;
	}
	@Column(name="rate")
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	@Column(name="tenderMoney")
	public Double getTenderMoney() {
		return tenderMoney;
	}
	public void setTenderMoney(Double tenderMoney) {
		this.tenderMoney = tenderMoney;
	}
	@Column(name="state")
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Column(name="gradeNo")
	public Long getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(Long gradeNo) {
		this.gradeNo = gradeNo;
	}

	@Column(name="time")
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Column(name="loansign_id")
	public Long getLoanSignId() {
		return loanSignId;
	}

	public void setLoanSignId(Long loanSignId) {
		this.loanSignId = loanSignId;
	}
	@Column(name="loanState")
	public Integer getLoanState() {
		return loanState;
	}

	public void setLoanState(Integer loanState) {
		this.loanState = loanState;
	}
	
}
