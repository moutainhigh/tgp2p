package com.tpy.p2p.chesdai.spring.controller;

import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Elite;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.EliteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by Administrator on 2015/4/2.
 */
@Controller
@RequestMapping("/elite")
@CheckLogin(value = CheckLogin.WEB)
public class MyEliteController {

    @Resource
    private EliteService eliteService;

    @RequestMapping("/myelite")
    public String getMyEliteEarnings(HttpServletRequest request){
        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.ATTRIBUTE_USER);
        Elite elite = eliteService.getMyEliteEarnings(user.getId());
        request.setAttribute("elite",elite);
        return "/WEB-INF/views/member/myelite";
    }

    /**
     *
     * @param request
     * @param para
     * @return
     */
//    @RequestMapping("/openkey")
//    @ResponseBody
//    public String getConfigPara(HttpServletRequest request,String para){
//        Map<String,String> map = sysConfService.getSysConfig(para);
//        String value=map.get(para);
//        return value;
//    }

    @RequestMapping("/drawearnings")
    @ResponseBody
    public String drawEliteEarning(HttpServletRequest request){
        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.ATTRIBUTE_USER);
        try {
            eliteService.getEarnings(user.getId());
            return "1";
        }catch(Exception e){
            e.printStackTrace();
            return "0";
        }
    }

}
