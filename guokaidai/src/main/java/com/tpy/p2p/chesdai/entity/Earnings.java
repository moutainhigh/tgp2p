package com.tpy.p2p.chesdai.entity;

import net.sf.ehcache.pool.sizeof.annotations.IgnoreSizeOf;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by Administrator on 2015/3/18.
 */
@Entity
@Table(name = "earnings")
public class Earnings {

    private Long id       ;

    private Long genuid   ;            //推广人ID',

    private Long uid      ;            //被推广人ID',

    private String month ;            //收益月份',

    private BigDecimal  umoney;           //被推广人收益金额',

    private BigDecimal money;            //推广人收益金额',

    private Long loan_id;            //标号',

    private BigDecimal total;

    private Userbasicsinfo user;

    private Loansign loan;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(name = "genuid")
    public Long getGenuid() {
        return genuid;
    }

    public void setGenuid(Long genuid) {
        this.genuid = genuid;
    }
    @Column(name = "uid")
    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }
    @Column(name = "month")
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
    @Column(name = "umoney")
    public BigDecimal getUmoney() {
        return umoney;
    }

    public void setUmoney(BigDecimal umoney) {
        this.umoney = umoney;
    }
    @Column(name = "money")
    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    @Column(name = "loan_id")
    public Long getLoan_id() {
        return loan_id;
    }

    public void setLoan_id(Long loan_id) {
        this.loan_id = loan_id;
    }

    /**
        @Transient表示该属性并非一个到数据库表的字段的映射,ORM框架将忽略该属性.
        如果一个属性并非数据库表的字段映射,就务必将其标示为@Transient,否则,ORM框架默认其注解为@Basic
    */
    @Transient
    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    @Transient
    public Userbasicsinfo getUser() {
        return user;
    }

    public void setUser(Userbasicsinfo user) {
        this.user = user;
    }

    @Transient
    public Loansign getLoan() {
        return loan;
    }

    public void setLoan(Loansign loan) {
        this.loan = loan;
    }
}
