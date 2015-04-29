package com.tpy.p2p.chesdai.spring.aspect;

import javax.annotation.Resource;

import com.tpy.base.spring.exception.ResponseExceptionFactory;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.view.AjaxResponseView;
import com.tpy.base.view.UrlResponseView;
import com.tpy.p2p.chesdai.constant.ErrorNumber;
import com.tpy.p2p.chesdai.constant.enums.ENUM_SHOW_STATE;
import com.tpy.p2p.chesdai.entity.Product;
import com.tpy.p2p.chesdai.exception.ProductPayException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.tpy.base.spring.exception.ResponseException;
import com.tpy.base.spring.exception.ResponseExceptionFactory;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.view.AjaxResponseView;
import com.tpy.base.view.UrlResponseView;
import com.tpy.p2p.chesdai.constant.ErrorNumber;
import com.tpy.p2p.chesdai.constant.enums.ENUM_PUBLISH_STATE;
import com.tpy.p2p.chesdai.constant.enums.ENUM_SHOW_STATE;
import com.tpy.p2p.chesdai.entity.Product;
import com.tpy.p2p.chesdai.exception.ProductPayException;
import com.tpy.p2p.chesdai.spring.annotation.ProductVerification;

/**
 * 日志记录
 * 
 * @author frank
 * 
 */
@Aspect
@Component
public class ProductAspect {

    /**
     * HibernateSupport
     */
    @Resource
    private HibernateSupport dao;
    
    /**
     * HibernateSupport
     */
    @Resource
    private AjaxResponseView ajaxView;
    
    /**
     * HibernateSupport
     */
    @Resource
    private UrlResponseView urlView;
    
    /**
     * ResponseExceptionFactory
     */
    @Resource
    ResponseExceptionFactory factory;
    
    /**
     * 执行之前
     * @param jp    切入点
     * @param p 产品
     * @throws ResponseException 
     */
    @Before("within(com.jubaopen.p2p.chesudai..*) && @annotation(p)")
    public void executeBefore(JoinPoint jp, ProductVerification p) throws ResponseException{
        
        Object[] objs = jp.getArgs();
        
        Product product = dao.get(Product.class,((Product)objs[0]).getId());
        
        if(product==null){//判断产品是否存在
            
            throw factory.bornUrl(ErrorNumber.NO_2, null, null);
        }
        
        if (product.getStatus() == ENUM_PUBLISH_STATE.UNPUBLISH.ordinal()) {// 判断产品是否发布
            throw new ProductPayException("该产品尚未发布，敬请期待！",ajaxView);
        }

        if (product.getShows() == ENUM_SHOW_STATE.FALSE.ordinal()) {// 判断产品是否隐藏
            throw new ProductPayException("该产品已经下架，无法再次购买！",ajaxView);
        }

    }

    
}
