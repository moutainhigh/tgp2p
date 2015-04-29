package com.tpy.p2p.chesdai.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.NavigableMap;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by zzzhy on 15/3/4.
 */
@Entity
@Table(name = "transfer_pool")
public class TransferPool implements Serializable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 1L;

    private Long id;

    private Integer loanCount;

    private BigDecimal yearInterest;

    private Integer poolNum;

    private BigDecimal amount;

    private BigDecimal openAmount;

    private Integer soldOut;

    private Integer status;

    private Date createdAt;

    private Date updatedAt;

    public TransferPool() {
    }

    public TransferPool(Integer loanCount, BigDecimal yearInterest, Integer poolNum, BigDecimal amount, BigDecimal openAmount, Integer soldOut, Integer status, Date createdAt, Date updatedAt) {
        this.loanCount = loanCount;
        this.yearInterest = yearInterest;
        this.poolNum = poolNum;
        this.amount = amount;
        this.openAmount = openAmount;
        this.soldOut = soldOut;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "loan_count")
    public Integer getLoanCount() {
        return loanCount;
    }

    public void setLoanCount(Integer loanCount) {
        this.loanCount = loanCount;
    }

    @Column(name = "year_interest",precision = 18, scale = 4)
    public BigDecimal getYearInterest() {
        return yearInterest;
    }

    public void setYearInterest(BigDecimal yearInterest) {
        this.yearInterest = yearInterest;
    }

    @Column(name = "pool_num")
    public Integer getPoolNum() {
        return poolNum;
    }

    public void setPoolNum(Integer poolNum) {
        this.poolNum = poolNum;
    }

    @Column(name = "amount",precision = 18, scale = 4)
    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    @Column(name = "open_amount",precision = 18, scale = 4)
    public BigDecimal getOpenAmount() {
        return openAmount;
    }

    public void setOpenAmount(BigDecimal openAmount) {
        this.openAmount = openAmount;
    }

    @Column(name = "sold_out")
    public Integer getSoldOut() {
        return soldOut;
    }

    public void setSoldOut(Integer soldOut) {
        this.soldOut = soldOut;
    }

    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "created_at")
    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Column(name = "updated_at")
    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
