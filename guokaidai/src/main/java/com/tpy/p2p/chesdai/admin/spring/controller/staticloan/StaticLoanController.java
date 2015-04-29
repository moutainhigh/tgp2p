package com.tpy.p2p.chesdai.admin.spring.controller.staticloan;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.HibernateSupportTemplate;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.loan.LoanSignService;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.base.util.ArrayToJson;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zzzhy on 15/2/28.
 */
@Controller
@RequestMapping("/staticloan/")
public class StaticLoanController {

    /**
     * 引入log4j日志打印类
     */
    private static final Logger log = Logger.getLogger(StaticLoanController.class);

    /**
     * 用于调用常用方法的dao
     */
    @Resource
    HibernateSupportTemplate dao;

    /** loanSignService:普通借款标的service */
    @Resource
    private LoanSignService loanSignService;

    @RequestMapping(value = {"index", "/"})
    public String index() {
        return "WEB-INF/views/admin/staticloan/staticloan";
    }

    /**
     * <p>
     * Title: loanSignList
     * </p>
     * <p>
     * Description: 借款标列表
     * </p>
     *
     * @param start
     *            开始
     * @param limit
     *            结束
     * @param loansignbasics
     *            借款标基础信息表
     * @param request
     *            请求的request
     * @return 结果 JSONObject
     */
    @ResponseBody
    @RequestMapping(value = { "staticLoanList", "/" })
    public JSONObject staticLoanList(String limit, String start,
                                   Loansignbasics loansignbasics, String loanType,
                                   HttpServletRequest request, PageModel page) {

        JSONObject resultjson = new JSONObject();
        // 得到总条数
		/*
		 * int count =
		 * loanSignService.getLoansignCount(loansignbasics,loanType);
		 */

        // 每页显示条数
        if (StringUtil.isNotBlank(limit) && StringUtil.isNumberString(limit)) {
            page.setNumPerPage(Integer.parseInt(limit) > 0 ? Integer
                    .parseInt(limit) : 10);
        } else {
            page.setNumPerPage(10);
        }

        // 计算当前页
        if (StringUtil.isNotBlank(start) && StringUtil.isNumberString(start)) {
            page.setPageNum(Integer.parseInt(start) / page.getNumPerPage() + 1);
        }

        // 分页数据源
        List list = loanSignService.loanSignPage(page, loansignbasics, loanType);
        JSONArray jsonlist = new JSONArray();
        String titles = "id,loanNumber,loanTitle,name,loanUnit,issueLoan,month,loancategory,subType,mgtMoney,shouldPmfee,publishTime,rate,reward,successfulLending,remainingCopies,refundWay,loanstate,iscredit,creditTime,isShow,isRecommand";
        // 将查询结果转换为json结果集
        ArrayToJson.arrayToJson(titles, list, jsonlist);

        // 将数据源封装成json对象（命名必须row）
        resultjson.element("rows", jsonlist);
        // 总条数(命名必须total)
        resultjson.element("total", page.getTotalCount());

        return resultjson;
    }

}
