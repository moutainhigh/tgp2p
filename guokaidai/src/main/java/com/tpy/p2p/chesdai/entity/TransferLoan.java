package com.tpy.p2p.chesdai.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by zzzhy on 15/3/4.
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "transfer_loan")
public class TransferLoan implements Serializable {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * 借款标信息
     */
    private Loansign loansign;

    private Integer poolNum;

    private Repaymentrecord repaymentrecord;

    private BigDecimal partitionAmount;

    private Integer status = 0;

    private Integer deleted = 0;

    private Date createdAt;

    private Date updatedAt;

    public TransferLoan() {
    }

    public TransferLoan(Loansign loansign, Integer poolNum, Repaymentrecord repaymentrecord, BigDecimal partitionAmount, Integer status, Integer deleted, Date createdAt, Date updatedAt) {
        this.loansign = loansign;
        this.poolNum = poolNum;
        this.repaymentrecord = repaymentrecord;
        this.partitionAmount = partitionAmount;
        this.status = status;
        this.deleted = deleted;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne()
    @JoinColumn(name = "id", unique = true, nullable = false, insertable = false, updatable = false)
    public Loansign getLoansign() {
        return this.loansign;
    }

    public void setLoansign(Loansign loansign) {
        this.loansign = loansign;
    }

    @Column(name = "pool_num")
    public Integer getPoolNum() {
        return poolNum;
    }

    public void setPoolNum(Integer poolNum) {
        this.poolNum = poolNum;
    }

    @ManyToOne()
    @JoinColumn(name = "id", unique = true, nullable = false, insertable = false, updatable = false)
    public Repaymentrecord getRepaymentrecord() {
        return repaymentrecord;
    }

    public void setRepaymentrecord(Repaymentrecord repaymentrecord) {
        this.repaymentrecord = repaymentrecord;
    }

    @Column(name = "partition_amount", precision = 18, scale = 4)
    public BigDecimal getPartitionAmount() {
        return partitionAmount;
    }

    public void setPartitionAmount(BigDecimal partitionAmount) {
        this.partitionAmount = partitionAmount;
    }

    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "deleted")
    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
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
