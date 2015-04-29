package com.tpy.p2p.chesdai.exception;



import com.alibaba.fastjson.JSONArray;
import com.tpy.base.spring.exception.SimpleResponseException;
import com.tpy.base.view.AjaxResponseView;
import com.tpy.base.view.UrlResponseView;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.ErrorNumber;

/**
 * 产品购买异常
 * @author ldd
 *
 */
public class ProductPayException extends SimpleResponseException {


    /**
     * 标示
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * 构造方法
     * @param msg    异常文本
     * @param view ajax视图
     */
    public ProductPayException(String msg,AjaxResponseView view) {
        super(Constant.URL_ERROR_500,msg);
        setAttr(Constant.URL_ERROR_500_MSG);
        setVal(Constant.URL_ERROR_500_MSG_VAL_0);
        setJson(JSONArray.toJSONString(new Object[]{-ErrorNumber.NO_1.ordinal(),msg}));
        setAjaxView(view);
    }
    
    /**
     * 构造方法
     * @param msg    异常文本
     * @param view url视图
     */
    public ProductPayException(String msg,UrlResponseView view) {
        super(Constant.URL_ERROR_500,msg);
        setAttr(Constant.URL_ERROR_500_MSG);
        setVal(msg);
        setUrlView(view);
    }

    
}
