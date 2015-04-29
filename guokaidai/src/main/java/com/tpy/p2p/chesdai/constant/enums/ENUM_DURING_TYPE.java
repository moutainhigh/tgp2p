package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 期限类型
 * @author ldd
 *
 */
public enum ENUM_DURING_TYPE{
	/**
	 * 天
	 */
	@FieldConfig("天")
	DAY,
	
	/**
	 * 月
	 */
	@FieldConfig("月")
	MONTH,
	/**
	 * 年
	 */
	@FieldConfig("年")
	YEAR;
}
