package com.tpy.p2p.chesdai.entity;

import javax.persistence.*;
import java.math.BigDecimal;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by hsq on 2015/4/2
 * <p/>
 * 体验金实体类.
 */
@Entity
@Table(name = "elite")
public class Elite {

    /**
     * ID
     */
    private Long id;

    /**
     * 用户ID
     */
    private Long userid;
    /**
     * 本金
     */
    private BigDecimal principal;
    /**
     * 当日收益
     */
    private BigDecimal day_earning;
    /**
     * 总收益
     */
    private BigDecimal total_earning;
    /**
     * 体验金发放时间
     */
    private Long provide_time;
    /**
     * 本金收回日期
     */
    private Long principal_failure_time;
    /**
     * 收益失效日期
     */
    private Long earning_failure_time;
    /**
     * 失效标记
     */
    private int effect;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @Column(name = "userid")
    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }
    @Column(name = "principal")
    public BigDecimal getPrincipal() {
        return principal;
    }

    public void setPrincipal(BigDecimal principal) {
        this.principal = principal;
    }

    @Column(name = "day_earning")
    public BigDecimal getDay_earning() {
        return day_earning;
    }

    public void setDay_earning(BigDecimal day_earning) {
        this.day_earning = day_earning;
    }
    @Column(name = "total_earning")
    public BigDecimal getTotal_earning() {
        return total_earning;
    }

    public void setTotal_earning(BigDecimal total_earning) {
        this.total_earning = total_earning;
    }
    @Column(name = "provide_time")
    public Long getProvide_time() {
        return provide_time;
    }

    public void setProvide_time(Long provide_time) {
        this.provide_time = provide_time;
    }
    @Column(name = "principal_failure_time")
    public Long getPrincipal_failure_time() {
        return principal_failure_time;
    }

    public void setPrincipal_failure_time(Long principal_failure_time) {
        this.principal_failure_time = principal_failure_time;
    }
    @Column(name = "earning_failure_time")
    public Long getEarning_failure_time() {
        return earning_failure_time;
    }

    public void setEarning_failure_time(Long earning_failure_time) {
        this.earning_failure_time = earning_failure_time;
    }
    @Column(name = "effect")
    public int getEffect() {
        return effect;
    }

    public void setEffect(int effect) {
        this.effect = effect;
    }
}
