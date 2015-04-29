package com.tpy.base.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;

/**
 * 用户资源请求拦截器(测试)
 * 
 * @author ldd
 * 
 */
public class UserResourcesRequestInterceptor extends HandlerInterceptorAdapter {

    /**
     * 构造方法
     */
    public UserResourcesRequestInterceptor() {
        LOG.info("--->用户资源请求拦截器已启动!");
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {

        Userbasicsinfo user = (Userbasicsinfo)request.getSession().getAttribute(Constant.SESSION_USER);
        
        //用户未登录
        if(user==null){
            request.setAttribute("user_error","请先登录后执行操作！");
            request.getRequestDispatcher(Constant.URL_LOGIN).forward(request, response);
            return false;
        }
        
        return request.getRequestURI().indexOf("/user/"+user.getId()+"/")!=-1;
        
    }

}
