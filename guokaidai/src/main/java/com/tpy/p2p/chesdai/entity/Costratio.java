package com.tpy.p2p.chesdai.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Costratio 推广奖金
 */
@Entity
@Table(name = "costratio")
public class Costratio implements java.io.Serializable {

    // Fields

    /**
     * id
     */
    private Long id;

    /**
     * 推广奖金
     */
    private Double bouns;

 
    /**
     * 借款人普通用户管理费比例
     */
    private Double pmfeeratio;   

    /**
     * 投资者管理费比例
     */
    private Double mfeeratio;    
    
    /**
     * 天标管理费
     */
    private Double dayRate; 
    
    /**
     * 提前还款利率
     */
    private Double prepaymentRate;
    /**
     * 逾期还款
     */
    private Double overdueRepayment; 


    /**
     * 充值提现费(普通会员)
     */
    private Double recharge;
    /**
     * 充值提现费(vip会员)
     */
    private Double viprecharge;
    /**
     * 提现手续费(普通会员)
     */
    private Double withdraw;
    /**
     * 提现手续费(vip会员)
     */
    private Double vipwithdraw;
    
    /**
     * money
     */
    private Integer money;
    
    /**
     * vip会员借款管理费率
     */
    private Double vipPmfeeratio;
    
    /**
     * vip会员借款管理费上限金额
     */
   private Double  vipPmfeetop;
   
   /**
     * vip会员投资管理费率
     */
   private Double vipMfeeratio;
   
   /**
    * vip会员投资管理费上限金额 
    */
   private Double vipMfeetop;
    // Constructors
   /**
    * 升级VIP费用
    */
   private Double vipUpgrade;
   /**
    * vip会员提现金额手续费上限
    */
   private Double vipwithdrawtop;
    /** default constructor */
    public Costratio() {
    }




    /**
     * Property accessors
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
     * @param id    id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * bouns
     * @return  bouns
     */
    @Column(name = "bouns", precision = 18, scale = 4)
    public Double getBouns() {
        return this.bouns;
    }

    /**
     * bouns
     * @param bouns bouns
     */
    public void setBouns(Double bouns) {
        this.bouns = bouns;
    }

    /**
     * mfeeratio
     * 投资人管理费比例
     * @return  mfeeratio
     */
    @Column(name = "mfeeratio", precision = 18, scale = 4)
    public Double getMfeeratio() {
        return this.mfeeratio;
    }

    /**
     * mfeeratio
     * 投资人管理费比例
     * @param mfeeratio mfeeratio
     */
    public void setMfeeratio(Double mfeeratio) {
        this.mfeeratio = mfeeratio;
    }


    /**
     * pmfeeratio
     * 借款人VIP用户管理费比例
     * @return  pmfeeratio
     */
    @Column(name = "pmfeeratio", precision = 18, scale = 4)
    public Double getPmfeeratio() {
        return this.pmfeeratio;
    }

    /**
     * pmfeeratio
     * 借款人VIP用户管理费比例
     * @param pmfeeratio    pmfeeratio
     */
    public void setPmfeeratio(Double pmfeeratio) {
        this.pmfeeratio = pmfeeratio;
    }



	/**
     * money
     * @return  money
     */
    @Column(name = "money")
    public Integer getMoney() {
        return this.money;
    }

    
    /**
     * money
     * @param money money
     */
    public void setMoney(Integer money) {
        this.money = money;
    }

	/**
	 * 天标管理费
	 * @return  dayRate
	 */
	@Column(name = "dayRate", precision = 18, scale = 4)
	public Double getDayRate() {
		return dayRate;
	}
	/**
	 * @param dayRate 天标管理费
	 */
	public void setDayRate(Double dayRate) {
		this.dayRate = dayRate;
	}
	/**
	 * 提前还款利率
	 * @return  prepaymentRate
	 */
	@Column(name = "prepaymentRate", precision = 18, scale = 4)
	public Double getPrepaymentRate() {
		return prepaymentRate;
	}
	/**
	 * @param prepaymentRate 提前还款利率
	 */
	public void setPrepaymentRate(Double prepaymentRate) {
		this.prepaymentRate = prepaymentRate;
	}
	/**
	 * 逾期还款 
	 * @return  overdueRepayment
	 */
	@Column(name = "overdueRepayment", precision = 18, scale = 4)
	public Double getOverdueRepayment() {
		return overdueRepayment;
	}
	/**
	 * @param overdueRepayment 逾期还款 
	 */
	public void setOverdueRepayment(Double overdueRepayment) {
		this.overdueRepayment = overdueRepayment;
	}
    /**
     * 充值提现费(普通会员)
     */
    @Column(name = "recharge")
	public Double getRecharge() {
		return recharge;
	}
    /**
     * 充值提现费(普通会员)
     */
	public void setRecharge(Double recharge) {
		this.recharge = recharge;
	}
    /**
     * 充值提现费(vip会员)
     */
	@Column(name = "viprecharge")
	public Double getViprecharge() {
		return viprecharge;
	}
    /**
     * 充值提现费(vip会员)
     */
	public void setViprecharge(Double viprecharge) {
		this.viprecharge = viprecharge;
	}
    /**
     * 提现手续费(普通会员)
     */
	@Column(name = "withdraw")
	public Double getWithdraw() {
		return withdraw;
	}
    /**
     * 提现手续费(普通会员)
     */
	public void setWithdraw(Double withdraw) {
		this.withdraw = withdraw;
	}
    /**
     * 提现手续费(vip会员)
     */
	@Column(name = "vipwithdraw")
	public Double getVipwithdraw() {
		return vipwithdraw;
	}
    /**
     * 提现手续费(vip会员)
     */
	public void setVipwithdraw(Double vipwithdraw) {
		this.vipwithdraw = vipwithdraw;
	}
	
	@Column(name="vip_pmfeeratio")
	public Double getVipPmfeeratio() {
		return vipPmfeeratio;
	}

	public void setVipPmfeeratio(Double vipPmfeeratio) {
		this.vipPmfeeratio = vipPmfeeratio;
	}

	@Column(name="vip_pmfeetop")
	public Double getVipPmfeetop() {
		return vipPmfeetop;
	}

	public void setVipPmfeetop(Double vipPmfeetop) {
		this.vipPmfeetop = vipPmfeetop;
	}

	@Column(name="vip_mfeeratio")
	public Double getVipMfeeratio() {
		return vipMfeeratio;
	}


	public void setVipMfeeratio(Double vipMfeeratio) {
		this.vipMfeeratio = vipMfeeratio;
	}

	@Column(name="vip_mfeetop")
	public Double getVipMfeetop() {
		return vipMfeetop;
	}

	public void setVipMfeetop(Double vipMfeetop) {
		this.vipMfeetop = vipMfeetop;
	}
	
	@Column(name="vipwithdrawtop")
	public Double getVipwithdrawtop() {
		return vipwithdrawtop;
	}

	public void setVipwithdrawtop(Double vipwithdrawtop) {
		this.vipwithdrawtop = vipwithdrawtop;
	}

	@Column(name="vip_upgrade")
	public Double getVipUpgrade() {
		return vipUpgrade;
	}

	public void setVipUpgrade(Double vipUpgrade) {
		this.vipUpgrade = vipUpgrade;
	}
	
	
}