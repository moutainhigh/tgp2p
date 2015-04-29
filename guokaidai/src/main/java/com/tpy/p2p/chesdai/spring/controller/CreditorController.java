package com.tpy.p2p.chesdai.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.annotation.LoginedUser;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 前台债权
 * @author ldd
 *
 */
@Controller("cdr")
@RequestMapping("cdr/")
public class CreditorController {

    /**
     * HibernateSupport
     */
    @Resource
    HibernateSupport dao;
    
    /**
     * 债权列表分页
     * @param page  page
     * @param id    产品认购记录
     * @param request   请求
     * @return  page
     */
    @LoginedUser
    @RequestMapping("my-creditor-list")
    @ResponseBody
    public Object pageMyList(Page page,int id,HttpServletRequest request){
        
        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.ATTRIBUTE_USER);
       
        page.setData(dao.pageListByHql(page,"SELECT a.id,a.creditor.money,a.creditor.timeDuring,a.creditor.timeStart,a.creditor.timeEnd,a.creditor.status FROM CreditorPayRecord a WHERE a.productPayRecord.id=? AND a.userbasicsinfo.id=?",true,id,user.getId()));
        
        return page;
        
    }
    
    /**
     * 页面跳转
     * @param request   请求
     * @return  页面
     */
    @RequestMapping("creditor-list")
    @LoginedUser
    public String toCreditorList(HttpServletRequest request){
        return "WEB-INF/views/member/creditor-list";
    }
    
}
