package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 资金流状态
 * @author ldd
 *
 */
public enum ENUM_MONEY_EXCHANGE_STATE{
    
    /**
     * 线上
     */
    @FieldConfig("线上")
	ONLINE,
	/**
	 * 线下
	 */
	@FieldConfig("线下")
	OFFLINE,;
}
