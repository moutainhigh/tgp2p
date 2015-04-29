package com.tpy.p2p.chesdai.admin.spring.controller.fund;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.fund.WithdrawApplyAdminService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.util.DwzResponseUtil;

/**
 * 申请提现记录
 * 
 * @author hsq 2014-09-05
 * 
 */
@Controller
@RequestMapping("/withdraw_apply")
@CheckLogin(value = CheckLogin.ADMIN)
@SuppressWarnings("rawtypes")
public class WithdrawApplyAdminController {

	/**
	 * 申请提现记录接口
	 */
	@Resource
	private WithdrawApplyAdminService withdrawApplyAdminService;
	
	/**
	 * 操作后要刷新的页面
	 */
	private String borrowpageId = "main62";

	/**
	 * 查询提现申请记录
	 * 
	 * @param page
	 *            分页对象
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @param request
	 *            request
	 * @return 申请提现记录jsp
	 */
	@RequestMapping("/open")
	public String queryPage(@ModelAttribute("PageModel") PageModel page,
			String beginDate, String endDate, HttpServletRequest request) {
		Integer count = withdrawApplyAdminService
				.queryCount(beginDate, endDate);
		page.setTotalCount(count);
		List list = withdrawApplyAdminService.queryPage(page, beginDate,
				endDate);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		return "/WEB-INF/views/admin/withdraw/withdrawApplyList";
	}

	/**
	 * 申请提现列表
	 * 
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @param request
	 *            请求
	 * @param page
	 *            分页对象
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryWithdrawApply")
	public JSONObject queryWithdrawApply(String start, String limit,
			String beginDate, String endDate, HttpServletRequest request,
			PageModel page) {
		
		JSONObject resultjson = new JSONObject();
		
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
		List list = withdrawApplyAdminService.queryPage(page, beginDate, endDate);
		
		JSONArray jsonlist = new JSONArray();
		String titles = "id,cash,user_name,real_name,apply_num,result,status,apply_time,answer_time";
		
		// 将查询结果转换为json结果集
		ArrayToJson.arrayToJson(titles, list, jsonlist);

		// 将数据源封装成json对象（命名必须row）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", page.getTotalCount());

		return resultjson;
	}
	
	/**
     * <p>
     * Title: passBorrow
     * </p>
     * <p>
     * Description: 审核通过和不通过
     * </p>
     * 
     * @param ids
     *            审核通过
     * @param state
     *            状态
     * @return 结果
     */
    @ResponseBody
    @RequestMapping("/pass")
    public JSONObject passBorrow(int state, String ids) {

        JSONObject json = new JSONObject();

        if (StringUtil.isNotBlank(ids)) {
            if(withdrawApplyAdminService.ispassture(ids)){
                return DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_ERROR,
                        "只有未审核的提现申请才能审核", borrowpageId, null);
            }
            boolean bool = withdrawApplyAdminService.updateResult(ids, state);
            if (!bool) {
                return DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_ERROR,
                        "审核失败", borrowpageId, null);
            }
        }
       
        return  DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_SUCCESS,
                "提现申请审核成功", borrowpageId, null);
    }

	/**
	 * 审核提现放款
	 * @param state
	 * @param ids
	 * @return
	 */
	public JSONObject applyLoan(int state,String ids){
		JSONObject json = new JSONObject();

		if(StringUtil.isNotBlank(ids)){

			if(!withdrawApplyAdminService.ispassture(ids)){
				return DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_ERROR,
						"只有通过审核的提现申请才能放款", borrowpageId, null);
			}

			boolean flag = withdrawApplyAdminService.updateResult(ids, state);
			if(flag){
				return DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_ERROR,
						"放款失败", borrowpageId, null);
			}
		}
		return  DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_SUCCESS,
				"放款成功", borrowpageId, null);
	}
}
