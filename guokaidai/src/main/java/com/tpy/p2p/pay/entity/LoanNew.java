package com.tpy.p2p.pay.entity;


/**
 * 用于回收中投资对象存放
 * @author ranqibing
 *
 */
public class LoanNew {
	
	private String loanNumber;  //借款标号
	
    private String loanTitle;   //借款标题
    
	private String borrowername; //借款人
	
	private Double issueLoan;    //标的金额
	
	private String tenderTime;  //投资日期
	
	private Double tenderMoney; //投标金额
	
	private Double interestRate;  //利率
	
	private String deadline; //期限
	
	private Double schedule;//进度
	
	private String status;//状态
	
	private Double money;  //金额
	
	private String principalandInterest;  //应收本息和
	
	private String realTotal; //实收本息

	private String tzyj;//管理费
	
	private Integer lastDays;//剩余标期
	
	private Long loanId; //借款loan_id
	
	private Integer loanUnit; //出借单位
	
	public String getLoanNumber() {
		return loanNumber;
	}

	public void setLoanNumber(String loanNumber) {
		this.loanNumber = loanNumber;
	}

	public String getLoanTitle() {
        return loanTitle;
    }

    public void setLoanTitle(String loanTitle) {
        this.loanTitle = loanTitle;
    }

    public String getBorrowername() {
		return borrowername;
	}

	public void setBorrowername(String borrowername) {
		this.borrowername = borrowername;
	}

	public String getTenderTime() {
		return tenderTime;
	}

	public Double getIssueLoan() {
        return issueLoan;
    }

    public void setIssueLoan(Double issueLoan) {
        this.issueLoan = issueLoan;
    }

    public void setTenderTime(String tenderTime) {
		this.tenderTime = tenderTime;
	}

	public double getTenderMoney() {
		return tenderMoney;
	}

	public void setTenderMoney(double tenderMoney) {
		this.tenderMoney = tenderMoney;
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public double getSchedule() {
		return schedule;
	}

	public void setSchedule(double schedule) {
		this.schedule = schedule;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getPrincipalandInterest() {
		return principalandInterest;
	}

	public void setPrincipalandInterest(String principalandInterest) {
		this.principalandInterest = principalandInterest;
	}

	public String getTzyj() {
		return tzyj;
	}

	public void setTzyj(String tzyj) {
		this.tzyj = tzyj;
	}

    public String getRealTotal() {
        return realTotal;
    }

    public void setRealTotal(String realTotal) {
        this.realTotal = realTotal;
    }

    

	public Integer getLastDays() {
		return lastDays;
	}

	public void setLastDays(Integer lastDays) {
		this.lastDays = lastDays;
	}

	public Long getLoanId() {
		return loanId;
	}

	public void setLoanId(Long loanId) {
		this.loanId = loanId;
	}

	public Integer getLoanUnit() {
		return loanUnit;
	}

	public void setLoanUnit(Integer loanUnit) {
		this.loanUnit = loanUnit;
	}
    
}
