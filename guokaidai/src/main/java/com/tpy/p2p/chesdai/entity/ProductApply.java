package com.tpy.p2p.chesdai.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ProductApply entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "product_apply")
public class ProductApply implements java.io.Serializable {

    // Fields

    /**
     * id
     */
    private Long id;
    /**
     * 用户id
     */
    private Long userbasicId;
    /**
     * 金额
     */
    private Double money;
    /**
     * 期限
     */
    private String timeDuring;

    /**
     * 开始时间
     */
    private String timeStart;

    /**
     * 结束时间
     */
    private String timeEnd;
    /**
     * 年利率
     */
    private BigDecimal ratePercentYear;
    /**
     * 偿还利率类型
     */
    private String ratePayType;
    /**
     * 偿还本金类型
     */
    private String principalPayType;
    /**
     * 状态
     */
    private Integer status;

    /**
     * userbasicsinfo
     */
    private Userbasicsinfo userbasicsinfo;

    // Constructors

    /** default constructor */
    public ProductApply() {
    }

    /**
     * userbasicsinfo
     * @return  userbasicsinfo
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userbasic_id", insertable = false, updatable = false)
    public Userbasicsinfo getUserbasicsinfo() {
        return this.userbasicsinfo;
    }

    /**
     * userbasicsinfo
     * @param userbasicsinfo    userbasicsinfo
     */
    public void setUserbasicsinfo(Userbasicsinfo userbasicsinfo) {
        this.userbasicsinfo = userbasicsinfo;
    }

    /**
     * id
     * @return  id
     */
    @Id
    @GeneratedValue
    @Column(name = "id")
    public Long getId() {
        return this.id;
    }

    /**
     * id
     * @param id    id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * userbasicId
     * @return  userbasicId
     */
    @Column(name = "userbasic_id")
    public Long getUserbasicId() {
        return this.userbasicId;
    }

    /**
     * userbasicId
     * @param userbasicId   userbasicId
     */
    public void setUserbasicId(Long userbasicId) {
        this.userbasicId = userbasicId;
    }

    /**
     * money
     * @return  money
     */
    @Column(name = "money", precision = 20, scale = 4)
    public Double getMoney() {
        return this.money;
    }

    /**
     * money
     * @param money money
     */
    public void setMoney(Double money) {
        this.money = money;
    }

    /**
     * timeDuring
     * @return  timeDuring
     */
    @Column(name = "time_during", length = 20)
    public String getTimeDuring() {
        return this.timeDuring;
    }

    /**
     * timeDuring
     * @param timeDuring    timeDuring
     */
    public void setTimeDuring(String timeDuring) {
        this.timeDuring = timeDuring;
    }

    /**
     * timeStart
     * @return  timeStart
     */
    @Column(name = "time_start", length = 20)
    public String getTimeStart() {
        return this.timeStart;
    }

    /**
     * timeStart
     * @param timeStart timeStart
     */
    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    /**
     * timeEnd
     * @return  timeEnd
     */
    @Column(name = "time_end", length = 20)
    public String getTimeEnd() {
        return this.timeEnd;
    }

    /**
     * timeEnd
     * @param timeEnd   timeEnd
     */
    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    /**
     * ratePercentYear
     * @return  ratePercentYear
     */
    @Column(name = "rate_percent_year", precision = 20, scale = 0)
    public BigDecimal getRatePercentYear() {
        return this.ratePercentYear;
    }

    /**
     * ratePercentYear
     * @param ratePercentYear   ratePercentYear
     */
    public void setRatePercentYear(BigDecimal ratePercentYear) {
        this.ratePercentYear = ratePercentYear;
    }

    /**
     * ratePayType
     * @return  ratePayType
     */
    @Column(name = "rate_pay_type", length = 20)
    public String getRatePayType() {
        return this.ratePayType;
    }

    /**
     * ratePayType
     * @param ratePayType   ratePayType
     */
    public void setRatePayType(String ratePayType) {
        this.ratePayType = ratePayType;
    }

    /**
     * principalPayType
     * @return  principalPayType
     */
    @Column(name = "principal_pay_type", length = 20)
    public String getPrincipalPayType() {
        return this.principalPayType;
    }

    /**
     * principalPayType
     * @param principalPayType  principalPayType
     */
    public void setPrincipalPayType(String principalPayType) {
        this.principalPayType = principalPayType;
    }

    /**
     * status
     * @return  status
     */
    @Column(name = "status")
    public Integer getStatus() {
        return this.status;
    }

    /**
     * status
     * @param status    status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

}