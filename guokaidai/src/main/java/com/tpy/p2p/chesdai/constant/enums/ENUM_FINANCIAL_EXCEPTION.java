package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 资金级别异常
 * @author ldd
 *
 */
public enum ENUM_FINANCIAL_EXCEPTION{
	/**
	 * 购买
	 */
	@FieldConfig("购买")
	PAY,
	
	/**
	 * 充值
	 */
	@FieldConfig("充值")
	RECHARGE,
	
	/**
	 * 还款
	 */
	@FieldConfig("还款")
	REPAYMENT,
	/**
     * 放款
     */
    @FieldConfig("放款")
	LOAN,
	/**
     * 提现
     */
    @FieldConfig("提现")
	EXTRACT
}
