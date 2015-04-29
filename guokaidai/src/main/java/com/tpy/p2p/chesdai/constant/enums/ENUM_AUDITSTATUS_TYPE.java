package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 审核结果
 * @author Mr.Po
 *
 */
public enum ENUM_AUDITSTATUS_TYPE{

    DEFAULT,
    
    /**
     * 未提交
     */
	@FieldConfig("未提交")
	NOSUBMIT,
	/**
	 * 未审核
	 */
	@FieldConfig("未审核")
    NOCHECK,
    /**
     * 正在审核
     */
    @FieldConfig("正在审核")
    CHECKING,
    /**
     * 已审核
     */
    @FieldConfig("已审核")
    CHECKED;
}
