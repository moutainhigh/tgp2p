package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;
/**
 * 是否显示状态enum
 * 0显示、1不显示
 * @author hsq
 *
 */
public enum ENUM_PROBLEM_TYPE{
    /**
     * 借款问题
     */
	@FieldConfig("借款问题")
	BORROWPROBLEM,
	/**
	 * 投资问题
	 */
	@FieldConfig("投资问题")
	INVESTPROBLEM,
	/**
     * 平台运营问题
     */
    @FieldConfig("平台运营问题")
	PLATFORMPROBLEM,
}
