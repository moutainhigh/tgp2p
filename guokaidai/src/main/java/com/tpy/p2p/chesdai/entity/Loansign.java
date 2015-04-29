package com.tpy.p2p.chesdai.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Loansign
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "loansign")
public class Loansign implements java.io.Serializable {

    public static int DISPERSION_BID = 0;
    public static int DINGCUN_BID = 1;

    // Fields
    /**
     * id
     */
    private Long id;
    /** 借款人基本信息 */
    private Userbasicsinfo userbasicsinfo;
    /** 利率 */
    private Double rate;
    /** 本期借款额 */
    private Double issueLoan;
    /** 借款标类型：1普通标、2天标、3秒标、4流转标  6债权转让 7理财计划*/
    private Integer loanType;
    /** 借款标状态：1未发布、2进行中、3回款中、4已完成 、5投标处理中 */
    private Integer loanstate;
    /** 预计使用天数 */
    private Integer useDay;
    /** 实际借款天数 */
    private Integer realDay;
    /** 是否显示：1显示，2不显示 */
    private Integer isShow;
    /** 是否推荐到首页：1推荐，2不推荐 */
    private Integer isRecommand;
    /** 还款方式：1按月等额本息、2按月付息到期还本、3到期一次性还本息 */
    private Integer refundWay;
    /** 最小出借单位：100、200、300、500、1000 */
    private Integer loanUnit;
    /** 还款期限 */
    private Integer month;
    /** 发布时间 */
    private String publishTime;
    /** 结束时间 */
    private String endTime;
    /** 投资人管理费比例 */
    private Double mfeeratio;
    /** 普通会员借款人管理费比例 */
    private Double pmfeeratio;
    /**
     * 提前还款利率
     */
    private Double prepaymentRate;
    /**
     * 逾期还款利率
     */
    private Double overdueRepayment;
    
    /**
     * vip投资管理费率
     */
    private Double vipMfeeratio;
    /**
     * vip投资管理费上限
     */
    private Double vipMfeetop;
    /**
     * vip借款管理费率
     */
    private Double vipPmfeeratio;
    /**
     * vip借款管理费上限
     */
    private Double vipPmfeetop;
    /**
     * 应收取的借款管理费
     */
    private Double shouldPmfee;
    /**
     * 标种子类型：1富担标，2担保，3抵押，4信用，5实地
     */
    private Integer subType;
    /**
     * 借款标类型
     */
    private LoansignType loansignType;
    /**
     * 借款标类型ID
     */
    private Long loansignTypeId;
	/**
     * 普通会员最大购买份数
     */
    private Integer counterparts;
    /**
     * vip最大购买份数
     */
    private Integer vipCounterparts;
    
    /**
     * 借款标基础信息
     */
    private Loansignbasics loansignbasics;
    
    /**
     * 借款申请记录
     */
    private BorrowersApply borrowersApply;
    /** 还款信息集合 */
    private Set<Repaymentrecord> repaymentrecords = new HashSet<Repaymentrecord>(
            0);
    /** 借入记录 */
    private Set<Loanrecord> loanrecords = new HashSet<Loanrecord>(0);
    /** Autointegral */
    private Set<Autointegral> autointegrals = new HashSet<Autointegral>(0);
    /** Loansignbasics */
    private Set<Loansignbasics> loansignbasicses = new HashSet<Loansignbasics>(
            0);
    /** Attachment */
    private Set<Attachment> attachments = new HashSet<Attachment>(0);
    /** Comment */
    private Set<Comment> comments = new HashSet<Comment>(0);

    private int product;

    private int status;

    // Constructors

    /** default constructor */
    public Loansign() {
    }
    
    public Loansign(Long id, Userbasicsinfo userbasicsinfo, Double rate,
			Double issueLoan, Integer loanType, Integer loanstate,
			Integer useDay, Integer realDay, Integer isShow,
			Integer isRecommand, Integer refundWay, Integer loanUnit,
			Integer month, String publishTime, String endTime,
			Double mfeeratio, Double pmfeeratio, Double mfeetop,
			Double pmfeetop, Double other, Double highLines,
			Double prepaymentRate, Double overdueRepayment,
			LoansignType loansignType, Integer counterparts,
			Integer vipCounterparts, Loansignbasics loansignbasics,
			BorrowersApply borrowersApply,
			Set<Repaymentrecord> repaymentrecords, Set<Loanrecord> loanrecords,
			Set<Autointegral> autointegrals,
			Set<Loansignbasics> loansignbasicses, Set<Attachment> attachments,
			Set<Comment> comments) {
		super();
		this.id = id;
		this.userbasicsinfo = userbasicsinfo;
		this.rate = rate;
		this.issueLoan = issueLoan;
		this.loanType = loanType;
		this.loanstate = loanstate;
		this.useDay = useDay;
		this.realDay = realDay;
		this.isShow = isShow;
		this.isRecommand = isRecommand;
		this.refundWay = refundWay;
		this.loanUnit = loanUnit;
		this.month = month;
		this.publishTime = publishTime;
		this.endTime = endTime;
		this.mfeeratio = mfeeratio;
		this.pmfeeratio = pmfeeratio;
		this.prepaymentRate = prepaymentRate;
		this.overdueRepayment = overdueRepayment;
		this.loansignType = loansignType;
		this.counterparts = counterparts;
		this.vipCounterparts = vipCounterparts;
		this.loansignbasics = loansignbasics;
		this.borrowersApply = borrowersApply;
		this.repaymentrecords = repaymentrecords;
		this.loanrecords = loanrecords;
		this.autointegrals = autointegrals;
		this.loansignbasicses = loansignbasicses;
		this.attachments = attachments;
		this.comments = comments;
	}

	/**
     * id
     * 
     * @param id
     *            id
     */
    public Loansign(Long id) {
        this.id = id;
    }

    // Property accessors
    /**
     * id
     * 
     * @return id
     */
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return this.id;
    }

    /**
     * id
     * 
     * @param id
     *            id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * userbasicsinfo
     * 
     * @return userbasicsinfo
     */
    @ManyToOne()
    @JoinColumn(name = "userbasicinfo_id")
    public Userbasicsinfo getUserbasicsinfo() {
        return this.userbasicsinfo;
    }

    /**
     * userbasicsinfo
     * 
     * @param userbasicsinfo
     *            userbasicsinfo
     */
    public void setUserbasicsinfo(Userbasicsinfo userbasicsinfo) {
        this.userbasicsinfo = userbasicsinfo;
    }

    /**
     * rate
     * 利率
     * @return rate
     */
    @Column(name = "rate", precision = 18, scale = 4)
    public Double getRate() {
        return this.rate;
    }

    /**
     * rate
     * 
     * @param rate
     *            rate
     */
    public void setRate(Double rate) {
        this.rate = rate;
    }

    /**
     * issueLoan
     * 本期借款金额
     * @return issueLoan
     */
    @Column(name = "issueLoan", precision = 18, scale = 4)
    public Double getIssueLoan() {
        return this.issueLoan;
    }

    /**
     * issueLoan
     * 本期借款额
     * @param issueLoan
     *            issueLoan
     */
    public void setIssueLoan(Double issueLoan) {
        this.issueLoan = issueLoan;
    }

    /**
     * 标类型
     * @return loanType
     */
    @Column(name = "loanType")
    public Integer getLoanType() {
        return this.loanType;
    }

    /**
     * @param loanType
     *  标类型
     */
    public void setLoanType(Integer loanType) {
        this.loanType = loanType;
    }

    /**
     * 借款标状态
     * @return loanstate
     */
    @Column(name = "loanstate")
    public Integer getLoanstate() {
        return this.loanstate;
    }

    /**
     * @param loanstate
     *  借款标状态
     */
    public void setLoanstate(Integer loanstate) {
        this.loanstate = loanstate;
    }

    /**
     * useDay
     * 预计使用天数
     * @return useDay
     */
    @Column(name = "useDay")
    public Integer getUseDay() {
        return this.useDay;
    }

    /**
     * useDay
     * 
     * @param useDay
     *  预计使用天数
     */
    public void setUseDay(Integer useDay) {
        this.useDay = useDay;
    }

    /**
     * realDay
     * 实际使用天数
     * @return realDay
     */
    @Column(name = "realDay")
    public Integer getRealDay() {
        return this.realDay;
    }

    /**
     * 
     * @param realDay
     *  实际使用天数
     */
    public void setRealDay(Integer realDay) {
        this.realDay = realDay;
    }

    /**
     * @return isShow
     * 显示
     */
    @Column(name = "isShow")
    public Integer getIsShow() {
        return this.isShow;
    }

    /**
     * isShow
     * 
     * @param isShow
     *  显示
     */
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    /**
     * isRecommand
     * 推荐到首页
     * @return isRecommand
     */
    @Column(name = "isRecommand")
    public Integer getIsRecommand() {
        return this.isRecommand;
    }

    /**
     * 推荐到首页
     * @param isRecommand
     *            isRecommand
     */
    public void setIsRecommand(Integer isRecommand) {
        this.isRecommand = isRecommand;
    }

    /**
     * 还款方式
     * @return refundWay
     */
    @Column(name = "refundWay")
    public Integer getRefundWay() {
        return this.refundWay;
    }

    /**
     * 还款方式
     * @param refundWay
     *            refundWay
     */
    public void setRefundWay(Integer refundWay) {
        this.refundWay = refundWay;
    }

    /**
     * 最小出借单位
     * @return loanUnit
     */
    @Column(name = "loanUnit")
    public Integer getLoanUnit() {
        return this.loanUnit;
    }

    /**
     * 最小出借单位
     * @param loanUnit
     *            loanUnit
     */
    public void setLoanUnit(Integer loanUnit) {
        this.loanUnit = loanUnit;
    }

    /**
     * 还款期限
     * @return month
     */
    @Column(name = "month")
    public Integer getMonth() {
        return this.month;
    }

    /**
     * 还款期限
     * @param month
     *            month
     */
    public void setMonth(Integer month) {
        this.month = month;
    }

    /**
     * 发布时间
     * @return publishTime
     */
    @Column(name = "publishTime", length = 50)
    public String getPublishTime() {
        return this.publishTime;
    }

    /**
     * 发布时间
     * @param publishTime
     *            publishTime
     */
    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * 结束时间 
     * @return endTime
     */
    @Column(name = "endTime", length = 50)
    public String getEndTime() {
        return this.endTime;
    }

    /**
     * 结束时间 
     * @param endTime
     *            endTime
     */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    /**
     * 投资人管理费比例
     * @return mfeeratio
     */
    @Column(name = "mfeeratio", precision = 18, scale = 4)
    public Double getMfeeratio() {
        return this.mfeeratio;
    }

    /**
     * 投资人管理费比例
     * @param mfeeratio
     *            mfeeratio
     */
    public void setMfeeratio(Double mfeeratio) {
        this.mfeeratio = mfeeratio;
    }

    /**
     * 借款人管理费比例 
     * @return pmfeeratio
     */
    @Column(name = "pmfeeratio", precision = 18, scale = 4)
    public Double getPmfeeratio() {
        return this.pmfeeratio;
    }

    /**
     * 借款人管理费比例
     * @param pmfeeratio
     *            pmfeeratio
     */
    public void setPmfeeratio(Double pmfeeratio) {
        this.pmfeeratio = pmfeeratio;
    }

    /**
     * 提前还款利率
     * 
     * @return prepaymentRate
     */
    @Column(name = "prepaymentRate", precision = 18, scale = 4)
    public Double getPrepaymentRate() {
        return prepaymentRate;
    }

    /**
     * @param prepaymentRate
     *            提前还款利率
     */
    public void setPrepaymentRate(Double prepaymentRate) {
        this.prepaymentRate = prepaymentRate;
    }

    /**
     * 逾期还款
     * 
     * @return overdueRepayment
     */
    @Column(name = "overdueRepayment", precision = 18, scale = 4)
    public Double getOverdueRepayment() {
        return overdueRepayment;
    }

    /**
     * @param overdueRepayment
     *            逾期还款
     */
    public void setOverdueRepayment(Double overdueRepayment) {
        this.overdueRepayment = overdueRepayment;
    }

    /**
     * 普通会员最大购买份数
     * 
     * @return counterparts
     */
    @Column(name = "counterparts")
    public Integer getCounterparts() {
        return counterparts;
    }

    /**
     * @param counterparts
     *            普通会员最大购买份数
     */
    public void setCounterparts(Integer counterparts) {
        this.counterparts = counterparts;
    }

    /**
     * vip最大购买份数
     * 
     * @return vipCounterparts
     */
    @Column(name = "vipCounterparts")
    public Integer getVipCounterparts() {
        return vipCounterparts;
    }

    /**
     * @param vipCounterparts
     *            vip最大购买份数
     */
    public void setVipCounterparts(Integer vipCounterparts) {
        this.vipCounterparts = vipCounterparts;
    }

    /**
     * @return repaymentrecords
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Repaymentrecord> getRepaymentrecords() {
        return this.repaymentrecords;
    }

    /**
     * 
     * @param repaymentrecords
     *            repaymentrecords
     */
    public void setRepaymentrecords(Set<Repaymentrecord> repaymentrecords) {
        this.repaymentrecords = repaymentrecords;
    }

    /**
     * 
     * @return loanrecords
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Loanrecord> getLoanrecords() {
        return this.loanrecords;
    }

    /**
     * 
     * @param loanrecords
     *            loanrecords
     */
    public void setLoanrecords(Set<Loanrecord> loanrecords) {
        this.loanrecords = loanrecords;
    }

    /**
     * 
     * @return autointegrals
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Autointegral> getAutointegrals() {
        return this.autointegrals;
    }

    /**
     * 
     * @param autointegrals
     *            autointegrals
     */
    public void setAutointegrals(Set<Autointegral> autointegrals) {
        this.autointegrals = autointegrals;
    }

    /**
     * 
     * @return loansignbasicses
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Loansignbasics> getLoansignbasicses() {
        return this.loansignbasicses;
    }

    /**
     * 
     * @param loansignbasicses
     *            loansignbasicses
     */
    public void setLoansignbasicses(Set<Loansignbasics> loansignbasicses) {
        this.loansignbasicses = loansignbasicses;
    }

    /**
     * 
     * @return attachments
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Attachment> getAttachments() {
        return this.attachments;
    }

    /**
     * 
     * @param attachments
     *            attachments
     */
    public void setAttachments(Set<Attachment> attachments) {
        this.attachments = attachments;
    }

    /**
     * 
     * @return comments
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Comment> getComments() {
        return this.comments;
    }

    /**
     * 
     * @param comments
     *            comments
     */
    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @ManyToOne()
    @JoinColumn(name = "loansignType_id")
    public LoansignType getLoansignType() {
        return loansignType;
    }

    public void setLoansignType(LoansignType loansignType) {
        this.loansignType = loansignType;
    }

    @OneToOne
    @JoinColumn(name = "id")
    public Loansignbasics getLoansignbasics() {
        return loansignbasics;
    }

    public void setLoansignbasics(Loansignbasics loansignbasics) {
        this.loansignbasics = loansignbasics;
    }

  

    @ManyToOne()
    @JoinColumn(name = "borrowersApply_id")
	public BorrowersApply getBorrowersApply() {
		return borrowersApply;
	}

	public void setBorrowersApply(BorrowersApply borrowersApply) {
		this.borrowersApply = borrowersApply;
	}
	
	@Transient
	public Long getLoansignTypeId() {
		return loansignTypeId;
	}

	public void setLoansignTypeId(Long loansignTypeId) {
		this.loansignTypeId = loansignTypeId;
	}
	@Column(name="vipMfeeratio")
	public Double getVipMfeeratio() {
		return vipMfeeratio;
	}

	public void setVipMfeeratio(Double vipMfeeratio) {
		this.vipMfeeratio = vipMfeeratio;
	}
	@Column(name="vipMfeetop")
	public Double getVipMfeetop() {
		return vipMfeetop;
	}

	public void setVipMfeetop(Double vipMfeetop) {
		this.vipMfeetop = vipMfeetop;
	}
	@Column(name="vipPmfeeratio")
	public Double getVipPmfeeratio() {
		return vipPmfeeratio;
	}
	
	public void setVipPmfeeratio(Double vipPmfeeratio) {
		this.vipPmfeeratio = vipPmfeeratio;
	}
	
	@Column(name="vipPmfeetop")
	public Double getVipPmfeetop() {
		return vipPmfeetop;
	}

	public void setVipPmfeetop(Double vipPmfeetop) {
		this.vipPmfeetop = vipPmfeetop;
	}
	@Column(name="shouldPmfee")
	public Double getShouldPmfee() {
		return shouldPmfee;
	}

	public void setShouldPmfee(Double shouldPmfee) {
		this.shouldPmfee = shouldPmfee;
	}
	@Column(name="subType")
	public Integer getSubType() {
		return subType;
	}

	public void setSubType(Integer subType) {
		this.subType = subType;
	}

    @Column(name="product")
    public int getProduct() {
        return product;
    }

    public void setProduct(int product) {
        this.product = product;
    }

    @Column(name = "status")
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}