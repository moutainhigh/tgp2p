package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 发布状态
 * @author ldd
 *
 */
public enum ENUM_PUBLISH_STATE{
	
    /**
     * 未发布
     */
	@FieldConfig("未发布")
	UNPUBLISH,
	/**
	 * 已发布
	 */
	@FieldConfig("已发布")
	PUBLISH,
}
