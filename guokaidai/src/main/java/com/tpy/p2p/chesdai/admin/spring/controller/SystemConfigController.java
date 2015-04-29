package com.tpy.p2p.chesdai.admin.spring.controller;

import com.tpy.p2p.chesdai.admin.spring.service.SystemConfigService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Map;

/**
 * Created by hsq on 2015/3/17.
 */
@Controller
@RequestMapping("/invite")
public class SystemConfigController {

    @Resource
    private SystemConfigService systemConfigService;

    /**
     * 获取设置列表
     * @throws java.text.ParseException
     * @throws Exception
     */
    @RequestMapping("/setting")
    public String initshow( HttpServletRequest request) throws ParseException {
        Map<String,String> map = systemConfigService.getSysConfig();
        request.setAttribute("isRecommendOpen",map.get("isRecommendOpen"));
        request.setAttribute("RecommendCalculateDate",map.get("RecommendCalculateDate"));
        request.setAttribute("recommendee_fee",map.get("recommendee_fee"));
        request.setAttribute("recommender_fee",map.get("recommender_fee"));
        request.setAttribute("bonus_period",map.get("bonus_period"));

        return "/WEB-INF/views/admin/invite/setting";
    }

    /**
     * 保存设置
     * @param name
     * @param value
     * @return
     */
    @RequestMapping("/savesetting")
    @ResponseBody
    public String saveSetting(String name,String value){
        try {
            int rst = systemConfigService.saveSetting(name,value);
            if(rst>0){
                return"success";
            }else{
                return"fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return"fail";
        }
    }
}