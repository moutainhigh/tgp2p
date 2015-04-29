package com.tpy.base.filter;


import com.tpy.base.util.StringUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * XSS过滤器
 *
 * Created by hsq on 2015/4/1.
 */
public class XSSFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        /*
        Map<String, String[]> paramMap = servletRequest.getParameterMap();
        Set<String> keySet = paramMap.keySet();
        for(Iterator iterator = keySet.iterator();iterator.hasNext();) {
            String key = (String)iterator.next();
            String[] values = paramMap.get(key);
            for(int i=0;i<values.length;i++) {
                System.out.println(values[i]);
            }
        }
        */
        filterChain.doFilter( new XSSRequestWrapper((HttpServletRequest) servletRequest), servletResponse);
    }

    @Override
    public void destroy() {

    }
}