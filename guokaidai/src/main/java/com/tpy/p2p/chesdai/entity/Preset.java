package com.tpy.p2p.chesdai.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Preset entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "preset")
public class Preset implements java.io.Serializable {

	// Fields

	private long id;
	private long loanSignId;
	private String presetTime;
	private String payTime;
	private double bargainMoney;
	private double loanMoney;
	private long state;
	private long userbaseinfoId;
	private String ucode;
	private long success;

	// Constructors

	/** default constructor */
	public Preset() {
	}

	/** minimal constructor */
	public Preset(long loanSignId, String presetTime, long userbaseinfoId) {
		this.loanSignId = loanSignId;
		this.presetTime = presetTime;
		this.userbaseinfoId = userbaseinfoId;
	}

	/** full constructor */
	public Preset(long loanSignId, String presetTime, String payTime,
			double bargainMoney, double loanMoney, long state,
			long userbaseinfoId, String ucode, long success) {
		this.loanSignId = loanSignId;
		this.presetTime = presetTime;
		this.payTime = payTime;
		this.bargainMoney = bargainMoney;
		this.loanMoney = loanMoney;
		this.state = state;
		this.userbaseinfoId = userbaseinfoId;
		this.ucode = ucode;
		this.success = success;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "loanSign_id", nullable = false)
	public long getLoanSignId() {
		return this.loanSignId;
	}

	public void setLoanSignId(long loanSignId) {
		this.loanSignId = loanSignId;
	}

	@Column(name = "presetTime",  length = 64)
	public String getPresetTime() {
		return this.presetTime;
	}

	public void setPresetTime(String presetTime) {
		this.presetTime = presetTime;
	}

	@Column(name = "payTime", length = 32)
	public String getPayTime() {
		return this.payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	@Column(name = "bargainMoney", precision = 18, scale = 4)
	public double getBargainMoney() {
		return this.bargainMoney;
	}

	public void setBargainMoney(double bargainMoney) {
		this.bargainMoney = bargainMoney;
	}

	@Column(name = "loanMoney", precision = 18, scale = 4)
	public double getLoanMoney() {
		return this.loanMoney;
	}

	public void setLoanMoney(double loanMoney) {
		this.loanMoney = loanMoney;
	}

	@Column(name = "state")
	public long getState() {
		return this.state;
	}

	public void setState(long state) {
		this.state = state;
	}

	@Column(name = "userbaseinfo_id", nullable = false)
	public long getUserbaseinfoId() {
		return this.userbaseinfoId;
	}

	public void setUserbaseinfoId(long userbaseinfoId) {
		this.userbaseinfoId = userbaseinfoId;
	}

	@Column(name = "ucode", length = 32)
	public String getUcode() {
		return this.ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	@Column(name = "success")
	public long getSuccess() {
		return this.success;
	}

	public void setSuccess(long success) {
		this.success = success;
	}

}