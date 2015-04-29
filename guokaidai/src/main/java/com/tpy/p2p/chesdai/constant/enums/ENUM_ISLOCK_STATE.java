package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 启用、禁用状态enum
 * 0显示、1不显示
 * @author hsq
 *
 */
public enum ENUM_ISLOCK_STATE{
	/**
	 * 已启用
	 */
	@FieldConfig("已启用")
	ENABLE,
	
	/**
	 * 未启用
	 */
	@FieldConfig("已禁用")
	DISABLE,
}
