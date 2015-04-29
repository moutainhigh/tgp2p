package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 借款标类型enum
 * 1普通标、2天标、3秒标、4流转标
 * @author hsq
 *
 */
public enum ENUM_LOANSIGN_TYPE{
	/**
	 * 默认值
	 */
	DEFAULT,
	
	/**
	 * 普通标
	 */
	@FieldConfig("普通标")
	LOANSIGN,
	
	/**
	 * 天标
	 */
	@FieldConfig("天标")
	LOANSIGNOFDAY,
	
	/**
	 * 秒标
	 */
	@FieldConfig("秒标")
	LOANSIGNOFSEC,
	
	/**
	 * 流转标
	 */
	@FieldConfig("流转标")
	LOANSIGNOFCIR;
}
