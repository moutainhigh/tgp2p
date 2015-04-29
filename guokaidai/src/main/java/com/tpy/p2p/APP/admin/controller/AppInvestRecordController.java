package com.tpy.p2p.APP.admin.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.model.PageModel;
import com.tpy.p2p.APP.admin.Util.MyUtil;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loanrecord;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.invest.InvestService;
import com.tpy.p2p.chesdai.spring.util.Arith;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.spring.service.borrow.RepayPlanService;
import com.tpy.p2p.chesdai.util.LoanUncollected;

/**
 * 投资记录
 * 
 * @author lsy
 * 
 */
@Controller
@RequestMapping("Appdepositshistory")
public class AppInvestRecordController {

	/**
	 * 注入InvestService
	 */
	@Resource
	private InvestService investService;

	/**
	 * 注入InvestService
	 */
	@Resource
	private RepayPlanService repayPlanService;

	@Resource
	private UserInfoServices userInfoServices;

	/**
	 * 初始化投资记录——投标中的项目
	 * 
	 * @throws java.text.ParseException
	 * @throws Exception
	 */
	@RequestMapping(value = "init_two", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject initshowtwo(
			HttpServletRequest request,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "pageNume", required = true, defaultValue = "1") Integer pageNume)
			throws ParseException {
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取user信息
		// Userbasicsinfo user= (Userbasicsinfo)
		// request.getSession().getAttribute("session_user");
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		// 获取竞标中列表
		List loanrecordlist = investService.getLoanRecord(2, user.getId(),
				(pageNume - 1) * 10, 1);

		List<Object> loannlist = investService.getLoanGlF(loanrecordlist);

		PageModel pager = getPager(pageNume,
				investService.getLoanRecord(2, user.getId()));
		JSONArray jsonloanList = MyUtil.sameEntityValue(loannlist);
		message.put("loanrecordlist", jsonloanList);

		message.put("PageNum", pager.getPageNum());
		message.put("TotalCount", pager.getTotalCount());
		message.put("NumPerPage", pager.getNumPerPage());
		message.put("TotalPage", pager.getTotalPage());
		
		// 总标数
		message.put("count", loanrecordlist.size());
		// 总投资额
		double count_money = investService.getSumTenderMoney(loannlist);
		message.put("count_money", Arith.round(count_money, 2));
		return JSONObject.fromObject(message);
	}

	/**
	 * 得到分页对象
	 * 
	 * @param curPage
	 * @param total
	 * @return
	 * @author hulicheng 2013-5-9 Page
	 */
	private PageModel getPager(int pgeNum, long total) {
		PageModel pager = new PageModel();
		pager.setPageNum(pgeNum);
		pager.setNumPerPage(Constant.PAGE_SIZE_RECHARGE_RECORD);
		pager.setTotalCount(Integer.parseInt(total + ""));
		return pager;
	}

	/**
	 * 初始化投资记录——收款中的项目
	 * 
	 * @throws java.text.ParseException
	 * @throws Exception
	 */
	@RequestMapping(value = "init_three", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject initshowthree(
			HttpServletRequest request,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "pageNume", required = false, defaultValue = "1") Integer pageNume)
			throws ParseException {
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取user信息
		// Userbasicsinfo user = (Userbasicsinfo)
		// request.getSession().getAttribute("session_user");
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		List loanrecordlist = investService.getLoanRecord(3, user.getId(),
				(pageNume - 1) * 10, 2);

		List<Object> loannlist = investService.getLoanGlF(loanrecordlist);
		PageModel pager = getPager(pageNume,
				investService.getLoanRecord(3, user.getId()));
		JSONArray jsonloanList = MyUtil.sameEntityValue(loannlist);

		message.put("PageNum", pager.getPageNum());
		message.put("TotalCount", pager.getTotalCount());
		message.put("NumPerPage", pager.getNumPerPage());
		message.put("TotalPage", pager.getTotalPage());

		// 总标数
		message.put("count", loanrecordlist.size());
		// 总投资额
		double count_money = investService.getMoney(loannlist);
		message.put("count_money", Arith.round(count_money, 2));
		// 平均收益率
		double pjsyl = investService.getInterests_pj(loanrecordlist, request);
		message.put("pjsyl", Arith.round(pjsyl, 2));
		// 最后一次还款计划
		Repaymentrecord rr = investService.getLastRuturnRepay(loanrecordlist);
		List<Object> rrList = new ArrayList<Object>();
		rrList.add(rr);
		JSONArray jsonrr = MyUtil.sameEntityValue(rrList);
		message.put("lastRepay", jsonrr);

		message.put("loanrecordlist", jsonloanList);
		return JSONObject.fromObject(message);
	}

	/**
	 * 
	 * 初始化投资记录——未收款明细
	 * 
	 * @param model
	 * @param request
	 * @return JSONObject
	 */
	@RequestMapping(value = "init_Four", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject initshowFour(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "pageNume", required = false, defaultValue = "1") Integer pageNume) {
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取user信息
		// Userbasicsinfo user = (Userbasicsinfo)
		// request.getSession().getAttribute("session_user");
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		PageModel pager = getPager(pageNume,
				investService.getNumrepauy(user.getId()));
		List<Object[]> loanlist = investService.getRepay(user.getId(),
				(pageNume - 1) * 10);
		List<LoanUncollected> loannlist = investService
				.getLoanUncollected(loanlist);
		List<Object> encryp = new ArrayList<Object>();
		for (Object vv : loannlist) {
			encryp.add(vv);
		}
		JSONArray jsonloannList = MyUtil.sameEntityValue(encryp);
		// 总标数
		message.put("count", loannlist.size());
		// 总投资额
		double count_money = investService.getTotal(loannlist);
		message.put("count_money", Arith.round(count_money, 2));
		model.addAttribute("count_money", Arith.round(count_money, 2));
		model.addAttribute("loannlist", jsonloannList);
		message.put("PageNum", pager.getPageNum());
		message.put("TotalCount", pager.getTotalCount());
		message.put("NumPerPage", pager.getNumPerPage());
		message.put("TotalPage", pager.getTotalPage());
		
		
		return JSONObject.fromObject(message);
	}

	/**
	 * 
	 * 初始化投资记录——已收款明细
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init_five", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject initshowFive(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "pageNume", required = false, defaultValue = "1") Integer pageNume) {
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取user信息
		// Userbasicsinfo user = (Userbasicsinfo)
		// request.getSession().getAttribute("session_user");
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		// ---竞标中数据开始--
		List<Object[]> loanlist = investService.getRepayW(user.getId(),
				(pageNume - 1) * 10);
		List<LoanUncollected> loannlist = investService
				.getAllLoanDetails(loanlist);
		List<Object> encrypLoanaList = new ArrayList<Object>();
		for (Object vv : loannlist) {
			encrypLoanaList.add(vv);
		}
		JSONArray jsoLoannList = MyUtil.sameEntityValue(encrypLoanaList);
		PageModel pager = getPager(pageNume, investService.getNum(user.getId()));
		// 总标数
		message.put("count", loannlist.size());
		// 总投资额
		double count_money = investService.getTotal(loannlist);
		message.put("count_money", Arith.round(count_money, 2));
		model.addAttribute("count_money", Arith.round(count_money, 2));
		message.put("loannlist", jsoLoannList);
		message.put("PageNum", pager.getPageNum());
		message.put("TotalCount", pager.getTotalCount());
		message.put("NumPerPage", pager.getNumPerPage());
		message.put("TotalPage", pager.getTotalPage());
		
		return JSONObject.fromObject(message);
	}

	/**
	 * 
	 * 初始化投资记录——借出明细
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init_six", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject initshowSix(
			Model model,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "pageNume", required = false, defaultValue = "1") Integer pageNume) {
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取user信息
		/*
		 * Userbasicsinfo user = (Userbasicsinfo) request.getSession()
		 * .getAttribute("session_user");
		 */
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		List<Loanrecord> loanrecordlist = investService.getLoanRecord(0,
				user.getId(), (pageNume - 1) * 10, 4);
		model.addAttribute("loanrecordlist", loanrecordlist);

		// 获取借出明细
		List<LoanUncollected> loannlist = investService
				.getLentDetails(loanrecordlist);
		List<Object> encrypList = new ArrayList<Object>();
		for (Object vv : loannlist) {
			encrypList.add(vv);
		}
		JSONArray jsonLoannList = MyUtil.sameEntityValue(encrypList);
		PageModel pager = getPager(pageNume,
				investService.getLoanRecord(0, user.getId()));
		// 总标数
		model.addAttribute("count", loannlist.size());
		message.put("count", loannlist.size());
		// 总投资额
		double count_money = investService.getTotal(loannlist);
		message.put("count_money", Arith.round(count_money, 2));
		message.put("loannlist", jsonLoannList);
		message.put("PageNum", pager.getPageNum());
		message.put("TotalCount", pager.getTotalCount());
		message.put("NumPerPage", pager.getNumPerPage());
		message.put("TotalPage", pager.getTotalPage());
		
		return JSONObject.fromObject(message);
	}

	/**
	 * 初始化投资记录——已还清项目
	 * 
	 * @throws java.text.ParseException
	 * @throws Exception
	 */
	@RequestMapping(value = "init_seven", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject initshowfour(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "pageNume", required = false, defaultValue = "1") Integer pageNume)
			throws ParseException {
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取user信息
		/*
		 * Userbasicsinfo user = (Userbasicsinfo) request.getSession()
		 * .getAttribute("session_user");
		 */
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		List loanrecordlist = investService.getLoanRecord(4, user.getId(),
				(pageNume - 1) * 10, 3);

		loanrecordlist = investService.getLoanGlF(loanrecordlist);
		JSONArray jsonloanrecordlist = MyUtil.sameEntityValue(loanrecordlist);
		PageModel pager = getPager(pageNume,
				investService.getLoanRecord(4, user.getId()));
		// 总标数
		message.put("count", loanrecordlist.size());
		double count_money = investService.getMoney(loanrecordlist);
		// 总投资额
		message.put("count_money", Arith.round(count_money, 2));
		message.put("loanrecordlist", jsonloanrecordlist);
		message.put("PageNum", pager.getPageNum());
		message.put("TotalCount", pager.getTotalCount());
		message.put("NumPerPage", pager.getNumPerPage());
		message.put("TotalPage", pager.getTotalPage());
		
		return JSONObject.fromObject(message);
	}
}
