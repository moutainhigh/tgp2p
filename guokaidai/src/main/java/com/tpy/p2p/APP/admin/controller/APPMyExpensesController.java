package com.tpy.p2p.APP.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.MyExpensesService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.model.PageModel;

/**
 * 我的收支单
 * 
 * @author lsy
 * 
 */
@Controller
@RequestMapping("/appexpenses")
@SuppressWarnings("rawtypes")
public class APPMyExpensesController {

	/**
	 * 注入Service
	 */
	@Resource
    MyExpensesService myExpensesService;
	@Resource
	private UserInfoServices userInfoServices;

	/**
	 * 我的收支单
	 * 
	 * @param beginTime
	 * @param endTime
	 * @param typeId
	 *            事件类型
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value="myexpenses.htm",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject queryExpenses(@RequestParam(value="beginTime", required=false, defaultValue="") String beginTime, @RequestParam(value="endTime", required=false, defaultValue="")String endTime, @RequestParam(value="uid", required=true)String uid,@RequestParam(value="typeId", required=false,defaultValue="")Long typeId,
			HttpServletRequest request, Integer pageNum) {
		JSONObject res=new JSONObject();
		Userbasicsinfo user=	userInfoServices.queryBasicsInfoById(uid);
		if(null==typeId){
			typeId=(long) 0;
		}
		PageModel page = new PageModel();
		page.setPageNum(pageNum == null ? 1 : pageNum);
		// 记录条数
		Object obj = myExpensesService.getCount(beginTime, endTime, typeId,
				user.getId());
		page.setTotalCount(Integer.parseInt(obj.toString()));
		// 收支记录集合
		if ("".equals(page.getPageNum())) {
			page.setPageNum(1);
		}
		List expenses = myExpensesService.queryExpense(user.getId(), beginTime,
				endTime, typeId, page);
		// 事件类型
		List types = myExpensesService.queryType(user.getId());

		res.accumulate("page", page);
		res.accumulate("expenses", expenses);
		res.accumulate("types", types);
		res.accumulate("beginTime", beginTime);
		res.accumulate("endTime", endTime);
		res.accumulate("typeId", typeId);
		return res;
	}
}
