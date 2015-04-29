package com.tpy.p2p.chesdai.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.text.DecimalFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.tpy.base.util.DateUtils;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.constant.Constant;

/**
 * <p>
 * Title:Automatic
 * </p>
 * <p>
 * Description: 自动投标参数表
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author 
 */
@Entity
@Table(name = "automatic")
public class Automatic implements java.io.Serializable {

    /** 主键 */
    private Long id;
    
    /** 用户 */
    private Userbasicsinfo userbasicsinfo;
    
    /** 状态：1：启用 2：停用 */
    private Integer state;
    
    /** 录入时间 */
    private String entrytime;
    
    /** 修改时间 */
    private String updatetime;
    
    /** 商户签约订单号 */
    private String pMerBillNo;
    
    /** 签约日期  格式YYYYMMDD*/
    private String pSigningDate;
    
    /** 债权人证件号码  */
    private String pIdentNo;
    
    /** 债权人姓名  */
    private String pRealName;
    
    /** 债权人IPS账号 */
    private String pIpsAcctNo;
    
    /** 有效期类型  D代表天  M代表月 */
    private String pValidType;
    
    /** 有效期
     * D：以天计算有效期，数值范围在1-360任选
     * M：以月计算有效期，数据范围在1-12任选
     * 均为整数 */
    private String pValidDate;
    
    /** 标的借款周期类型   D代表天  M代表月*/
    private String pTrdCycleType;
    
    /** 借款周期最小值
     * 借款周期值，根据pTrdCycleType传入限制
     * D：以天计算有效期，数值范围在1-1800任选
     * M：以月计算有效期，数据范围在1-60任选
     */
    private Integer pSTrdCycleValue;
    
    /** 借款周期最大值
     * 借款周期值，根据pTrdCycleType传入限制
     * D：以天计算有效期，数值范围在1-1800任选
     * M：以月计算有效期，数据范围在1-60任选
     * pSTrdCycleValue不能大于pETrdCycleValue
     */
    private Integer pETrdCycleValue;
    
    /**标的借款额度最小值
     * 设置投资者认同标的借款额度范围。
     * 值都必须>=1.00
     * 格式要求如：整数104.00, 带小数104.23*/
    private String pSAmtQuota;
    
    
    /**标的借款额度最大值
     * 设置投资者认同标的借款额度范围。
     * 值都必须>=1.00
     * 格式要求如：整数104.00, 带小数104.23
     * pSAmtQuota不能大于pEamtQuota*/
    private String pEAmtQuota;
    
    /**标的利率限额最小值
     * 百分比，设置标的回报利率范围
     * 值都必须>=1.00只需传入数值，%号不传入
     * 如：23.12% 只传如23.12*/
    private String pSIRQuota;
    
    /**标的利率限额最大值
     * 百分比，设置标的回报利率范围
     * 值都必须>=1.00只需传入数值，%号不传入
     * 如：23.12% 只传如23.12
     * pSIRQuota不能大于pEIRQuota*/
    private String pEIRQuota;
    
    /**状态返回地址1*/
    private String pWebUrl=Constant.AUTOMATIC;
    
    /**状态返回地址2*/
    private String pS2SUrl=Constant.ASYNCHRONISMAUTOMATIC;
    
    /**备注*/
    private String pMemo1;
    
    /**备注*/
    private String pMemo2;
    
    /**备注*/
    private String pMemo3;
    
    /**Ips P2P订单号*/
    private String pP2PBillNo;
    
    /**授权号*/
    private String pIpsAuthNo;
    
    /**IPS处理时间 格式为yyyymmddhhmmss*/
    private String pIpsTime;
    
    

    // Constructors

    /** default constructor */
    public Automatic() {
    }

	// Property accessors
    /**
     * <p>
     * Title: getId
     * </p>
     * <p>
     * Description:
     * </p>
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
     * <p>
     * Title: setId
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param id
     *            id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * <p>
     * Title: getUserbasicsinfo
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return userbasicsinfo
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userbasicinfo_id")
    public Userbasicsinfo getUserbasicsinfo() {
        return this.userbasicsinfo;
    }

    /**
     * <p>
     * Title: setUserbasicsinfo
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param userbasicsinfo
     *            userbasicsinfo
     */
    public void setUserbasicsinfo(Userbasicsinfo userbasicsinfo) {
        this.userbasicsinfo = userbasicsinfo;
    }

    

    /**
     * <p>
     * Title: getState
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return state
     */
    @Column(name = "state")
    public Integer getState() {
        return this.state;
    }

    /**
     * <p>
     * Title: setState
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param state
     *            state
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * <p>
     * Title: getEntrytime
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return entrytime
     */
    @Column(name = "entrytime", length = 30)
    public String getEntrytime() {
        return this.entrytime;
    }

    /**
     * <p>
     * Title: setEntrytime
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param entrytime
     *            entrytime
     */
    public void setEntrytime(String entrytime) {
        this.entrytime = entrytime;
    }

    /**
     * <p>
     * Title: getUpdatetime
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return updatetime
     */
    @Column(name = "updatetime", length = 30)
    public String getUpdatetime() {
        return this.updatetime;
    }

    /**
     * <p>
     * Title: setUpdatetime
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param updatetime
     *            updatetime
     */
    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
    
    @Column(name = "pMerBillNo", length = 30)
	public String getpMerBillNo() {
		return pMerBillNo;
	}

	public void setpMerBillNo(String pMerBillNo) {
		this.pMerBillNo = pMerBillNo;
	}
	@Column(name = "pSigningDate", length = 8)
	public String getpSigningDate() {
		return pSigningDate;
	}

	public void setpSigningDate(String pSigningDate) {
		this.pSigningDate = pSigningDate;
	}
	@Column(name = "pIdentNo", length = 30)
	public String getpIdentNo() {
		return pIdentNo;
	}

	public void setpIdentNo(String pIdentNo) {
		this.pIdentNo = pIdentNo;
	}
	@Column(name = "pRealName", length = 30)
	public String getpRealName() {
		return pRealName;
	}

	public void setpRealName(String pRealName) {
		this.pRealName = pRealName;
	}
	@Column(name = "pIpsAcctNo", length = 30)
	public String getpIpsAcctNo() {
		return pIpsAcctNo;
	}

	public void setpIpsAcctNo(String pIpsAcctNo) {
		this.pIpsAcctNo = pIpsAcctNo;
	}
	@Column(name = "pValidType", length = 2)
	public String getpValidType() {
		return pValidType;
	}

	public void setpValidType(String pValidType) {
		this.pValidType = pValidType;
	}
	@Column(name = "pValidDate", length = 8)
	public String getpValidDate() {
		return pValidDate;
	}

	public void setpValidDate(String pValidDate) {
		this.pValidDate = pValidDate;
	}
	@Column(name = "pTrdCycleType", length = 2)
	public String getpTrdCycleType() {
		return pTrdCycleType;
	}

	public void setpTrdCycleType(String pTrdCycleType) {
		this.pTrdCycleType = pTrdCycleType;
	}
	@Column(name = "pSTrdCycleValue", length = 5)
	public Integer getpSTrdCycleValue() {
		return pSTrdCycleValue;
	}

	public void setpSTrdCycleValue(Integer pSTrdCycleValue) {
		this.pSTrdCycleValue = pSTrdCycleValue;
	}
	@Column(name = "pETrdCycleValue", length = 5)
	public Integer getpETrdCycleValue() {
		return pETrdCycleValue;
	}

	public void setpETrdCycleValue(Integer pETrdCycleValue) {
		this.pETrdCycleValue = pETrdCycleValue;
	}
	@Column(name = "pSAmtQuota", length = 12)
	public String getpSAmtQuota() {
		return pSAmtQuota;
	}

	public void setpSAmtQuota(String pSAmtQuota) {
		this.pSAmtQuota = pSAmtQuota;
	}
	@Column(name = "pEamtQuota", length = 12)
	public String getpEAmtQuota() {
		return pEAmtQuota;
	}

	public void setpEAmtQuota(String pEAmtQuota) {
		this.pEAmtQuota = pEAmtQuota;
	}
	@Column(name = "pSIRQuota", length = 12)
	public String getpSIRQuota() {
		return pSIRQuota;
	}

	public void setpSIRQuota(String pSIRQuota) {
		this.pSIRQuota = pSIRQuota;
	}
	@Column(name = "pEIRQuota", length = 12)
	public String getpEIRQuota() {
		return pEIRQuota;
	}

	public void setpEIRQuota(String pEIRQuota) {
		this.pEIRQuota = pEIRQuota;
	}

	public String getpWebUrl() {
		return pWebUrl;
	}

	public void setpWebUrl(String pWebUrl) {
		this.pWebUrl = pWebUrl;
	}

	public String getpS2SUrl() {
		return pS2SUrl;
	}

	public void setpS2SUrl(String pS2SUrl) {
		this.pS2SUrl = pS2SUrl;
	}

	@Column(name = "pP2PBillNo", length = 50)
	public String getpP2PBillNo() {
		return pP2PBillNo;
	}

	public void setpP2PBillNo(String pP2PBillNo) {
		this.pP2PBillNo = pP2PBillNo;
	}
	@Column(name = "pIpsAuthNo", length = 50)
	public String getpIpsAuthNo() {
		return pIpsAuthNo;
	}

	public void setpIpsAuthNo(String pIpsAuthNo) {
		this.pIpsAuthNo = pIpsAuthNo;
	}

	public String getpMemo1() {
		return pMemo1;
	}

	public void setpMemo1(String pMemo1) {
		this.pMemo1 = pMemo1;
	}

	public String getpMemo2() {
		return pMemo2;
	}

	public void setpMemo2(String pMemo2) {
		this.pMemo2 = pMemo2;
	}

	public String getpMemo3() {
		return pMemo3;
	}

	public void setpMemo3(String pMemo3) {
		this.pMemo3 = pMemo3;
	}

	public String getpIpsTime() {
		return pIpsTime;
	}

	public void setpIpsTime(String pIpsTime) {
		this.pIpsTime = pIpsTime;
	}
    
    

}