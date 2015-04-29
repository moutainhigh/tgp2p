package com.tpy.p2p.chesdai.spring.controller;

import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Earnings;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.EarningsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by hsq on 2015/3/18.
 */
@Controller
@RequestMapping("/earnings")
public class EarningsController {

    @Resource
    private EarningsService earningsService;

    /**
     *
     * @return
     */
    @RequestMapping("/myearnings")
    public String getMyEarnings(HttpServletRequest request){

        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);

        List<Earnings> list = earningsService.getEarningsByMonth(user.getId());
        List<Earnings> invite_list = earningsService.getInviteEarningsByMonth(user.getId());
        request.setAttribute("earnings",list);
        request.setAttribute("invite_earnings",invite_list);

        return "/WEB-INF/views/member/myearnings";
    }

    @RequestMapping("/detail")
    public String getEarningDetail(String month ,String type, HttpServletRequest request){
        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);

        if(type.trim().equals("1")){
            List<Earnings> list = earningsService.getMyEarnings(user.getId(),month);
            request.setAttribute("earnings",list);
        }
        if(type.trim().equals("2")){
            List<Earnings> invite_list = earningsService.getMyInviteEarnings(user.getId(), month);
            request.setAttribute("invite_list",invite_list);
        }

        return "/WEB-INF/views/member/earningsdetail";
    }

}
