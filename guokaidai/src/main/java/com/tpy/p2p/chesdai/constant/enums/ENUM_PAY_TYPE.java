package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;
/**
 * 是否显示状态enum
 * 0线上购买、1线下购买
 * @author hsq
 *
 */
public enum ENUM_PAY_TYPE{
	/**
	 * 线上购买
	 */
	@FieldConfig("线上购买")
	ONLINE,
	
	/**
	 * 线下购买
	 */
	@FieldConfig("线下购买")
	OFFLINE,
}
