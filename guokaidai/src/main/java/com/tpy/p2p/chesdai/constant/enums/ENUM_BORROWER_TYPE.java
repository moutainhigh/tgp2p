package com.tpy.p2p.chesdai.constant.enums;

import com.tpy.base.annotation.FieldConfig;


public enum ENUM_BORROWER_TYPE{
    
    /**
     * 默认占位
     */
    DEFAULT,
    /**
     * 助人贷
     */
	@FieldConfig("助人贷")
	ZHUREN,
	/**
	 * 助企贷
	 */
	@FieldConfig("助企贷")
	ZHUQI,
	/**
	 * 企业群联保贷
	 */
	@FieldConfig("企业群联保贷")
	QIYEQUNLIANBAO,
	/**
     * 投资人周转贷
     */
    @FieldConfig("投资人周转贷")
    TOUZIRENZHOUZHUAN;
}
