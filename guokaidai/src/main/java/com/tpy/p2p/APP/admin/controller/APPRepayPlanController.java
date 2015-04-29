package com.tpy.p2p.APP.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.borrow.RepayPlanService;
import net.sf.json.JSONObject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;

/**
 * 还款安排
 * 
 * @author My_Ascii
 * 
 */
@Controller
@RequestMapping("/apprepay_plan")
@CheckLogin(value = CheckLogin.WEB)
public class APPRepayPlanController {

    @Resource
    private HibernateSupport otherDao;

    @Resource
    private RepayPlanService repayservice;

    @Resource
    private SessionFactory sessionFactory;
	@Resource
	private UserBaseInfoService userBaseInfoService;

    /**
     * 还款安排页面
     * 
     * @param request
     *            HttpServletRequest
     * @param response
     *            HttpServletResponse
     * @return String
     */
    @CheckFundsSafe
    @RequestMapping(value="/showBackMoney",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject forwardRepayPlan(Model model,Long uid, HttpServletRequest request) {
        double total = 0;
    Map<String,Object> message=new HashMap<String,Object>();
        Userbasicsinfo user = (Userbasicsinfo) request.getSession()
                .getAttribute(Constant.SESSION_USER);
        user=  userBaseInfoService.queryUserById(uid);
    
        // 目前应还款总额(未还款，空，逾期未还款)
        String sql = "from Repaymentrecord t where t.loansign.userbasicsinfo.id="
                + user.getId()
                + " and (t.repayState=1 or t.repayState is null or t.repayState=3)";
        List<Repaymentrecord> list4 = otherDao.find(sql);
        for (Repaymentrecord recode : list4) {
            Map<String, Double> res = repayservice.getTotalMoneyAndRate(recode);
            total = total + res.get("total");
        }
        message.put("res4", total);

        // 查询借款笔数
        String sql1 = "select t.loanSign_id from  loansign t2 ,repaymentrecord t where t.loanSign_id=t2.id and t2.userbasicinfo_id="
                + user.getId()
                + " and (t.repayState=1 or t.repayState is null or t.repayState=3) group by t.loanSign_id";
        Session session = sessionFactory.openSession();
        List lists = session.createSQLQuery(sql1).list();
        session.close();
        message.put("num", lists.size());

        total = 0;

        // 未来一个月待还本息总额
        String beginDate = DateUtils.format("yyyy-MM-dd");
        String endDate = repayservice.getNowDateAddMonth(1);
        // 预计还款日期大于等于当前月份
        String hql = sql + "  and t.preRepayDate>='" + beginDate + "'";

        // 未来一个月还款
        List<Repaymentrecord> list = otherDao.find(hql
                + " and  t.preRepayDate<='" + endDate + "'");
        for (Repaymentrecord recode : list) {
            Map<String, Double> res = repayservice.getTotalMoneyAndRate(recode);
            total = total + res.get("total");
        }
        message.put("res1", total);
        total = 0;

        // 未来三个月
        endDate = repayservice.getNowDateAddMonth(3);
        // 未来三个月还款
        List<Repaymentrecord> list1 = otherDao.find(hql
                + " and  t.preRepayDate<='" + endDate + "'");
        for (Repaymentrecord recode : list1) {
            Map<String, Double> res = repayservice.getTotalMoneyAndRate(recode);
            total = total + res.get("total");
        }
        message.put("res2", total);
        total = 0;

        // 未来半年
        endDate = repayservice.getNowDateAddMonth(6);
        // 未来半年还款
        List<Repaymentrecord> list2 = otherDao.find(hql
                + " and t.preRepayDate<='" + endDate + "'");
        for (Repaymentrecord recode : list2) {
            Map<String, Double> res = repayservice.getTotalMoneyAndRate(recode);
            total = total + res.get("total");
        }
        message.put("res3", total);
        total = 0;

        return JSONObject.fromObject(message);
    }

    /**
     * 创建根据条件查询还款安排的方法
     */
    @RequestMapping("/repaymentPlanDetail")
    public String repaymentPlanDetail(
            @RequestParam(value = "no", required = false, defaultValue = "1") Integer no,
            String beginDate,
            @RequestParam(value = "endDate", required = false) String endDate, Model model, HttpServletRequest request) {
        repayservice.repaymentPlanDetail(no, beginDate, endDate, model, request);
        return "/WEB-INF/views/member/borrow/repayment_plan_detail";
    }
}
