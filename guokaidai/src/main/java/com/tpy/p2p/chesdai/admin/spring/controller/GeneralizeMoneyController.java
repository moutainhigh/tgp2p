package com.tpy.p2p.chesdai.admin.spring.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.GeneralizeMoneyServices;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.GeneralizeMoneyServices;

/**   
 * Filename:    GeneralizeMoneyController.java   
 * Company:     太平洋金融  
 * @version:    1.0   
 * @since:  JDK 1.7.0_25  
 * Create at:   2014年2月11日 下午5:09:35   
 * Description:  后台会员推广信息查询控制层
 *   
 * Modification History:   
 * 时间    			作者   	   	版本     		描述 
 * ----------------------------------------------------------------- 
 * 2014年2月11日 	LiNing      1.0     	1.0Version   
 */

/**
 * <p>
 * Title:GeneralizeMoneyController
 * </p>
 * <p>
 * Description: 后台会员推广信息查询控制层
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author LiNing
 *         <p>
 *         date 2014年2月11日
 *         </p>
 */
@Controller
@RequestMapping("/generalizemoney")
public class GeneralizeMoneyController {

    /** 注入服务层 */
    @Resource
    private GeneralizeMoneyServices generalizeMoneyServices;

    /**
     * <p>
     * Title: queryPage
     * </p>
     * <p>
     * Description: 后台查询会员推广记录
     * </p>
     * 
     * @param limit
     *            每页查询多少条
     * @param start
     *            从第几条开始查询
     * @param page
     *            分页模型
     * @param ids
     *            会员编号
     * @return 推广信息结果
     */
    @ResponseBody
    @RequestMapping("/querypage")
    public JSONObject queryPage(String limit, String start, PageModel page,
            String ids) {

        JSONObject resultjson = new JSONObject();

        JSONArray jsonlist = new JSONArray();

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

        @SuppressWarnings("rawtypes")
        List datalist = generalizeMoneyServices.queryByUser(page, ids);
        String titles = "id,adddate,userName,umoney,bonuses";
        // 将查询结果转换为json结果集
        ArrayToJson.arrayToJson(titles, datalist, jsonlist);

        resultjson.element("rows", jsonlist);
        resultjson.element("total", page.getTotalCount());

        return resultjson;
    }
    
    /**
     * 页面跳转方法
     * @param url 要跳转的页面
     * @param ids 附带参数
     * @param request HttpServletRequest
     * @return 传入的页面
     */
    @RequestMapping("/jume")
    public ModelAndView jumePage(String url, String ids,
            HttpServletRequest request) {

        request.setAttribute("ids", ids);
        return new ModelAndView("WEB-INF/views/admin/usermanager/" + url);
    }
}
