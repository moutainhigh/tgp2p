package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;

/**
 * 产品购买状态
 * @author ldd
 *
 */
public enum ENUM_PRODUCT_PAY_STATE{
    
    /**
     * 回购中
     */
    @FieldConfig("回购中")
	EXECUTING,
	/**
     * 待分配
     */
	@FieldConfig("待分配")
	WAITING,
	/**
	 * 已完成
	 */
	@FieldConfig("已完成")
	FINISH;
}
