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
@RequestMapping("/myelite")
public class EliteConfigController {

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
        request.setAttribute("is_elite_open",map.get("is_elite_open"));
        request.setAttribute("elite_money",map.get("elite_money"));
        request.setAttribute("elite_fee",map.get("elite_fee"));
        request.setAttribute("elite_bonus_period",map.get("elite_bonus_period"));
        request.setAttribute("elite_expiry_periods",map.get("elite_expiry_periods"));
        return "/WEB-INF/views/admin/elite/setting";
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