package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 栏目是否可删除
 * @author My_Ascii
 *
 */
public enum ENUM_COLUMN_ISFIXED{
	/**
	 * 可删除
	 */
	@FieldConfig("可删除")
	DELETE,
	
	/**
	 * 不可删除
	 */
	@FieldConfig("不可删除")
	UNDELETE,
	
	/**
	 * 不可修改
	 */
	@FieldConfig("不可修改")
	UNUPDATE,
}
