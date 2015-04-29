package com.tpy.p2p.chesdai.admin.spring.controller.loan;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.controller.UserInfoController;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.service.PresetService;
import com.tpy.p2p.chesdai.spring.service.borrow.BorrowService;
import com.tpy.p2p.chesdai.util.DwzResponseUtil;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.ReturnInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cddgg.commons.normal.Md5Util;
import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.HibernateSupportTemplate;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.controller.UserInfoController;
import com.tpy.p2p.chesdai.admin.spring.service.AutomaticService;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.admin.spring.service.loan.LoanSignService;
import com.tpy.p2p.chesdai.admin.spring.service.loan.LoansignTypeService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.chesdai.entity.BorrowersApply;
import com.tpy.p2p.chesdai.entity.Borrowersbase;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.LoansignType;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.MemberNumber;
import com.tpy.p2p.chesdai.entity.Preset;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.entity.Usermessage;
import com.tpy.p2p.chesdai.entity.Userrelationinfo;
import com.tpy.p2p.chesdai.entity.Vipinfo;
import com.tpy.p2p.chesdai.model.RechargeModel;
import com.tpy.p2p.chesdai.spring.service.PlankService;
import com.tpy.p2p.chesdai.spring.service.PresetService;
import com.tpy.p2p.chesdai.spring.service.borrow.BorrowService;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.chesdai.util.DwzResponseUtil;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.ReturnInfo;

import freemarker.template.TemplateException;

/**
 * <p>
 * Title:LoanSignController
 * </p>
 * <p>
 * Description: 普通标Controller
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author LongYang
 *         <p>
 *         date 2014年1月26日
 *         </p>
 */
@Controller
@RequestMapping("/loanSign")
public class LoanSignController {

	/** 引入log4j日志打印类 */
	private static final Logger LOGGER = Logger
			.getLogger(UserInfoController.class);

	/** 用于调用常用方法的dao */
	@Resource
	HibernateSupportTemplate dao;

	@Resource
	private HibernateSupport commonDao;

	/** loanSignService:普通借款标的service */
	@Resource
	private LoanSignService loanSignService;

	/** baseLoansignService:借款标公用方法的service */
	@Resource
	private BaseLoansignService baseLoansignService;

	/**
	 * auto
	 */
	@Resource
	private PlankService plankService;

	@Resource
	private AutomaticService automaticService;

	/** loanSignQuery 公用借款标的查询 */
	@Autowired
	private LoanSignQuery loanSignQuery;

	/** rechargeModel:导出数据的公用model */
	@Resource
	private RechargeModel rechargeModel;

	@Resource
	private LoansignTypeService loansignTypeService;

	@Resource
	private UserInfoQuery userInfoQuery;

	@Resource
	private PresetService presetService;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private BorrowService borrowService;

	/**
	 * <p>
	 * Title: index
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @return 后台普通标展示页面
	 */
	@RequestMapping(value = { "dcbindex", "/" })
	public ModelAndView dcbindex() {

		ModelAndView returnModelAndView = new ModelAndView(
				"WEB-INF/views/admin/loansign/dcbloansign");

		return returnModelAndView;
	}

	/**
	 * <p>
	 * Title: index
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 *
	 * @return 后台普通标展示页面
	 */
	@RequestMapping(value = { "index", "/" })
	public ModelAndView index() {

		ModelAndView returnModelAndView = new ModelAndView(
				"WEB-INF/views/admin/loansign/loansign");

		return returnModelAndView;
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
	@RequestMapping(value = { "loanSignList", "/" })
	public JSONObject loanSignList(String limit, String start,
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
		List list = loanSignService
				.loanSignPage(page, loansignbasics, loanType);
		/* JSONArray jsonlist = loanSignService.queryJSONByList(list); */
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
	@RequestMapping(value = { "dcbLoanSignList", "/" })
	public JSONObject dcbLoanSignList(String limit, String start,
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
					.parseInt(limit) : 30);
		} else {
			page.setNumPerPage(30);
		}

		// 计算当前页
		if (StringUtil.isNotBlank(start) && StringUtil.isNumberString(start)) {
			page.setPageNum(Integer.parseInt(start) / page.getNumPerPage() + 1);
		}

		// 分页数据源
		List list = loanSignService
				.dcbLoanSignPage(page, loansignbasics, loanType);
		/* JSONArray jsonlist = loanSignService.queryJSONByList(list); */
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


	/* 优金开始 */
	/**
	 * 后台优金计划展示页面
	 * 
	 * @return
	 */
	@RequestMapping(value = { "youxuan", "/" })
	public ModelAndView youxuan() {

		ModelAndView returnModelAndView = new ModelAndView(
				"WEB-INF/views/admin/loansign/youxuan");

		return returnModelAndView;
	}

	/**
	 * 查询优金列表
	 * 
	 * @param start
	 * @param limit
	 * @param loansignbasics
	 * @param loanType
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = { "youXuanList", "/" })
	public JSONObject youXuanList(String limit, String start,
			Loansignbasics loansignbasics, String loanType,
			HttpServletRequest request, PageModel page) {

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
		List list = loanSignService.loanSignPage1(page, loansignbasics,
				loanType);
		/* JSONArray jsonlist = loanSignService.queryJSONByLists(list); */
		JSONArray jsonlist = new JSONArray();
		String titles = "id,loanNumber,loanTitle,name,loanUnit,issueLoan,month,mgtMoney,publishTime,rate,reward,successfulLending,remainingCopies,refundWay,loanstate,iscredit,creditTime,isShow,isRecommand";
		// 将查询结果转换为json结果集
		ArrayToJson.arrayToJson(titles, list, jsonlist);
		// 将数据源封装成json对象（命名必须row）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", page.getTotalCount());

		return resultjson;
	}

	/**
	 * 查看优金标详情 操作号 1 新增 2 编辑 3 查看详情
	 * 
	 * @param id
	 * @param operNumber
	 * @param request
	 * @return
	 */
	@RequestMapping("/showDetails")
	public ModelAndView showDetails(
			@RequestParam(value = "id", defaultValue = "", required = false) String id,
			int operNumber, HttpServletRequest request) {

		if (null != id && !id.trim().equals("") && operNumber != 1) {
			// 通过id查询到信息
			Loansign loansign = loanSignQuery.getLoansignById(id);
			// loansign.setRate(Arith.round(
			// new BigDecimal(loansign.getRate()).multiply(new BigDecimal(
			// 100)), 2).doubleValue());

			Loansignbasics loansignbasics = loanSignQuery
					.getLoansignbasicsById(id);
			// loansignbasics.setReward(Arith.round(
			// new BigDecimal(loansignbasics.getReward())
			// .multiply(new BigDecimal(100)), 2).doubleValue());
			// loansignbasics.setMgtMoneyScale(Arith.round(
			// new BigDecimal(loansignbasics.getMgtMoneyScale())
			// .multiply(new BigDecimal(100)), 2).doubleValue());

			request.setAttribute("loansign", loansign);
			request.setAttribute("loansignbasics", loansignbasics);
		} else {
			request.setAttribute("loansign", new Loansign());
			request.setAttribute("loansignbasics", new Loansignbasics());
		}
		// 查询标类型
		request.setAttribute("loanType", loansignTypeService.queryLoanType());
		request.setAttribute("operNumber", operNumber);
		if (operNumber == 2 || operNumber == 3) {
			ModelAndView returnModelAndView = new ModelAndView(
					"WEB-INF/views/admin/loansign/edityouxuan");
			return returnModelAndView;
		} else {
			ModelAndView returnModelAndView = new ModelAndView(
					"WEB-INF/views/admin/loansign/saveyouxuan");
			return returnModelAndView;
		}

	}

	/**
	 * 查询理财产品借款人
	 * 
	 * @param username
	 * @param cardno
	 * @param page
	 * @param conditions
	 * @param request
	 * @return
	 */
	@RequestMapping("borroweryouxuan")
	public String queryBorrowersbaseList(
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "cardno", defaultValue = "", required = false) String cardno,
			PageModel page, String conditions, HttpServletRequest request) {
		// 查询借款人条件
		Object count = loanSignService.queryBorroweryouxuancount(username,
				cardno);
		page.setTotalCount(Integer.parseInt(count.toString()));
		// 分页查询所有借款人
		Object obj = loanSignService.queryBorroweryouxuanList(page, username,
				cardno);
		request.setAttribute("list", obj);
		request.setAttribute("page", page);
		request.setAttribute("username", username.trim());
		request.setAttribute("cardno", cardno);
		return "WEB-INF/views/admin/loansign/borrowerlist";

	}

	/**
	 * 保存、更新理财计划
	 * 
	 * @param loanSign
	 * @param loansignbasics
	 * @param user
	 * @param type
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = { "saveyouxuan", "/" })
	public JSONObject saveyouxuan(Loansign loanSign,
			Loansignbasics loansignbasics, Userbasicsinfo user, Integer type,
			HttpServletRequest request) {
		// 实际传进来的不是Userbasicsinfo的id，而是BorrowersApply的id
		Long appid = loanSign.getUserbasicsinfo().getId();
		// 取得BorrowersApply
		BorrowersApply app = userInfoQuery.getBorrowersApplys(appid);
		// 通过BorrowersApply取得userid
		Long userId = userInfoQuery.getUserId(app.getId());
		// 替换掉loanSign的user
		Userbasicsinfo u = dao.get(Userbasicsinfo.class, userId);
		loanSign.setUserbasicsinfo(u);
		boolean vip = userInfoQuery.isPrivilege(u);
		JSONObject json = new JSONObject();
		boolean bool = true;
		json.element("callbackType", "closeCurrent");
		json.element("statusCode", "300");
		// 判断本期借款金额是否正确
		if (loanSign.getIssueLoan() % loanSign.getLoanUnit() != 0) {
			bool = false;
			json.element("message", "请输入能正确的借款金额！");
		}
		// // 结束时间不能小于当前时间
		// if
		// (bool&&DateUtils.isAfter(Constant.DEFAULT_DATE_FORMAT,loanSign.getEndTime()))
		// {
		// json.element("message", "结束时间应在当前时候之后！");
		// bool=false;
		// }
		if (!bool) {
			return json;
		}
		String alert = getJudge(loanSign.getIssueLoan(), loanSign.getRate(),
				loanSign.getMonth(), type);
		if (!"".equals(alert)) {
			json.element("message", alert);
		}
		String num = this.judgeLoan(loanSign.getIssueLoan(), app.getId(), type);
		int nums = Integer.parseInt(num);
		if (nums == 0) {
			bool = false;
			json.element("message", "选择的借款标类型和该借款人申请的借款标类型不一致，请重新选择!");
			return json;
		} else if (nums == 1) {
			bool = false;
			json.element("message", "发布金额大于了该借款人申请的金额!");
			return json;
		} else if (nums == 2) {
			bool = false;
			json.element("message", "借款金额大于了投资本息的70%！");
			return json;
		}

		// 2.检查有没有设置费用比例
		Costratio costratio = loanSignQuery.queryCostratio();
		loanSign.setRate(loanSign.getRate() / 100);
		// loansignbasics.setMgtMoneyScale(loansignbasics.getMgtMoneyScale() /
		// 100);
		loanSign.setLoanType(7);// 理财计划
		/*
		 * loanSign.setLoansignType(loansignTypeService.queryOne(type.toString())
		 * );
		 */

		// insert
		// 1.检查授信额度
		// BorrowersApply boor =
		// userInfoQuery.getBorrowersApplys(loanSign.getUserbasicsinfo().getId());
		// loanSign.getUserbasicsinfo().setId(.getUserbasicsinfo().getId());
		/*
		 * if (!baseLoansignService.checkCredit(loanSign, userId)) {
		 * json.element("message", "保存失败,借款金额超过借款人的可用授信额度！"); bool = false; }
		 */
		if (bool && costratio == null) {
			json.element("message", "请设置费用比例后在进行新增标操作！");
			bool = false;
		}
		if (bool) {
			// 3.添加
			// loansignbasics.setBidTime(10);
			if (app.getType() != 7) {
				app.setState(1);
			}

			bool = baseLoansignService.save(loanSign, loansignbasics,
					costratio, vip);

		} else {
			return json;
		}
		if (bool) {
			// dwz返回json对象
			json.element("statusCode", "200");
			json.element("message", "更新成功");
			json.element("navTabId", "main66");
			json.element("callbackType", "closeCurrent");
			return json;
		} else {
			json.element("message", "更新失败");
			return json;
		}

	}

	@ResponseBody
	@RequestMapping(value = { "updateyouxuan", "/" })
	public JSONObject updateyouxuan(Loansign loanSign,
			Loansignbasics loansignbasics, Userbasicsinfo user, Integer type,
			HttpServletRequest request) {

		JSONObject json = new JSONObject();
		boolean bool = true;
		json.element("callbackType", "closeCurrent");
		json.element("statusCode", "300");
		// 判断本期借款金额是否正确
		if (loanSign.getIssueLoan() % loanSign.getLoanUnit() != 0) {
			bool = false;
			json.element("message", "请输入能正确的借款金额！");
		}
		// // 结束时间不能小于当前时间
		// if
		// (bool&&DateUtils.isAfter(Constant.DEFAULT_DATE_FORMAT,loanSign.getEndTime()))
		// {
		// json.element("message", "结束时间应在当前时候之后！");
		// bool=false;
		// }
		if (!bool) {
			return json;
		}

		// 2.检查有没有设置费用比例
		Costratio costratio = loanSignQuery.queryCostratio();
		loanSign.setRate(loanSign.getRate() / 100);
		// loansignbasics.setMgtMoneyScale(loansignbasics.getMgtMoneyScale() /
		// 100);
		loanSign.setLoanType(7);// 理财计划
		loanSign.setLoansignType(loansignTypeService.queryOne(type.toString()));
		if (loanSign.getId() != null) {
			// update
			bool = baseLoansignService.update(loanSign, loansignbasics,
					costratio,2);
		} else {
			// insert
			// 1.检查授信额度
			// BorrowersApply boor =
			// userInfoQuery.getBorrowersApplys(loanSign.getUserbasicsinfo().getId());
			// loanSign.getUserbasicsinfo().setId(.getUserbasicsinfo().getId());
			if (!baseLoansignService.checkCredit(loanSign, user.getId())) {
				json.element("message", "保存失败,借款金额超过借款人的可用授信额度！");
				bool = false;
			}

			if (bool && costratio == null) {
				json.element("message", "请设置费用比例后在进行新增标操作！");
				bool = false;
			}
			if (bool) {
				// 3.添加
				// loansignbasics.setBidTime(10);
				boolean vip = userInfoQuery.isPrivilege(user);
				bool = baseLoansignService.save(loanSign, loansignbasics,
						costratio, vip);
			} else {
				return json;
			}
		}
		if (bool) {
			// dwz返回json对象
			json.element("statusCode", "200");
			json.element("message", "更新成功");
			json.element("navTabId", "main57");
			json.element("callbackType", "closeCurrent");
			return json;
		} else {
			json.element("message", "更新失败");
			return json;
		}

	}

	/**
	 * 理财产品发布
	 * 
	 * @param loanSignId
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/publish")
	public int publish(String loanSignId, HttpServletRequest request)
			throws Exception {

		// 1、检查是否可以发布
		Loansign loansign = loanSignQuery.getLoansignById(loanSignId);

		if (loansign.getLoanstate() != 1) {
			return 2;
		}
		Loansign loan = loanSignQuery.getYouxuan();
		if (loan != null) {
			return 4;
		}
		// 2.发布
		// 2014-8-15添加环讯接口

		RegisterSubject subject = null;
		// 0代表保证金暂时设置,1代表“新增”
		subject = new RegisterSubject(loansign, loansign.getLoansignbasics()
				.getGuaranteesAmt() == null ? "0.00" : loansign
				.getLoansignbasics().getGuaranteesAmt().toString(), "1");
		try {
			request.getSession().setAttribute("map",
					baseLoansignService.encryption(subject));
			List<Vipinfo> list = userInfoQuery.getisPrivilege();
			for (Vipinfo vipinfo : list) {
				// 新增预定记录
				Preset preset = new Preset();
				preset.setLoanMoney(0.00);
				preset.setBargainMoney(0.00);
				preset.setLoanSignId(Integer.parseInt(String
						.valueOf(loanSignId)));
				preset.setState(0);
				preset.setSuccess(0);
				String ucode = String.valueOf("8888");
				preset.setUcode(ucode);
				preset.setUserbaseinfoId(vipinfo.getUserbasicsinfo().getId());
				presetService.save(preset);

			}

			// TODO DWZ 页面跳转
			return 3;
		} catch (IOException | TemplateException e) {
			e.printStackTrace();
			return 2;
		}

	}

	@RequestMapping("gotoIPS.htm")
	public String publishToIps() {
		return "WEB-INF/views/regSub_news";
	}

	/*********** 优选用户开始 ***********/

	/**
	 * 理财用户列表
	 * 
	 * @return
	 */
	@RequestMapping("openUser")
	public String userList() {
		return "WEB-INF/views/admin/loansign/useryouxuan";
	}

	@RequestMapping("addUser")
	public String addUser() {
		return "WEB-INF/views/admin/loansign/addUseryx";
	}

	@RequestMapping("addAuto")
	public String addAuto(HttpServletRequest request, String userId) {
		request.setAttribute("userId", userId);
		return "WEB-INF/views/admin/loansign/autoBidyx";
	}

	/**
	 * 查询user列表
	 * 
	 * @param userinfo
	 * @param page
	 * @param request
	 * @param limit
	 * @param start
	 * @param isbrow
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryUserList")
	public JSONObject queryUserList(Userbasicsinfo userinfo, PageModel page,
			HttpServletRequest request, String limit, String start,
			String isbrow) {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("queryPage(Userbasicsinfo userinfo=" + userinfo + ", PageModel page=" + page + ", HttpServletRequest request=" + request + ", String limit=" + limit + ")方法开始"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		}

		if (StringUtil.isNotBlank(isbrow) && StringUtil.isNumberString(isbrow)) {
			userinfo.setLockTime(isbrow);
		}
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

		// 统计数据条数sql拼接
		StringBuffer countsql = new StringBuffer(
				"SELECT count(1)FROM userbasicsinfo ");
		countsql.append(" LEFT JOIN userfundinfo ON userbasicsinfo.id = userfundinfo.id ");
		countsql.append(" LEFT JOIN userrelationinfo ON userrelationinfo.user_id = userbasicsinfo.id  ");
		countsql.append(" WHERE userbasicsinfo.isespecialuser=1 AND userbasicsinfo.userName is not null ");

		// 查询数据sql拼接
		StringBuffer sqlbuffer = new StringBuffer(
				"SELECT userbasicsinfo.id, userbasicsinfo.userName,userbasicsinfo.`name`, ");
		sqlbuffer
				.append("( SELECT suminte FROM borrowersbase WHERE userbasicinfo_id = userbasicsinfo.id ),");
		sqlbuffer
				.append(" ROUND(userfundinfo.credit,2), userbasicsinfo.createTime, ( SELECT max(userloginlog.logintime) ");
		sqlbuffer
				.append(" FROM userloginlog WHERE userloginlog.user_id = userbasicsinfo.id),");
		sqlbuffer
				.append(" ( SELECT count(1) FROM userloginlog WHERE userloginlog.user_id = userbasicsinfo.id ), ");
		sqlbuffer
				.append(" (SELECT  max(endtime) FROM vipinfo WHERE vipinfo.endtime > NOW() AND vipinfo.user_id = userbasicsinfo.id)  AS vipendtime,");
		sqlbuffer
				.append(" ( SELECT count(1) FROM borrowersbase WHERE auditResult = 1 AND userbasicinfo_id = userbasicsinfo.id ),");
		sqlbuffer
				.append(" CASE WHEN userbasicsinfo.repaySignStatus=1 THEN '已签约' ELSE '未签约' END, ");
		sqlbuffer
				.append(" (SELECT realname FROM adminuser WHERE id = userrelationinfo.adminuser_id ),userfundinfo.pIdentNo ");
		sqlbuffer
				.append(" FROM userbasicsinfo LEFT JOIN userfundinfo ON userbasicsinfo.id = userfundinfo.id ");
		sqlbuffer
				.append(" LEFT JOIN userrelationinfo ON userrelationinfo.user_id = userbasicsinfo.id WHERE userbasicsinfo.isespecialuser=1 AND userbasicsinfo.userName is not null ");

		if (null != userinfo) {

			if (StringUtil.isNotBlank(userinfo.getUserName())) {
				sqlbuffer.append(" and userbasicsinfo.userName like '%")
						.append(StringUtil.replaceAll(userinfo.getUserName()))
						.append("%'");
				countsql.append(" and userbasicsinfo.userName like '%")
						.append(StringUtil.replaceAll(userinfo.getUserName()))
						.append("%'");
			}

			// 是否是特权会员，0是普通会员，1是特权会员
			if (null != userinfo.getErrorNum()) {
				if ("0".equals(userinfo.getErrorNum().intValue() + "")) {
					sqlbuffer
							.append(" and userbasicsinfo.id NOT IN ( SELECT vipinfo.user_id FROM vipinfo WHERE vipinfo.endtime > NOW())");
					countsql.append(" and  userbasicsinfo.id NOT IN ( SELECT vipinfo.user_id FROM vipinfo WHERE vipinfo.endtime > NOW())");
				} else {
					sqlbuffer
							.append(" and userbasicsinfo.id IN ( SELECT vipinfo.user_id FROM vipinfo WHERE vipinfo.endtime > NOW())");
					countsql.append(" and userbasicsinfo.id IN ( SELECT vipinfo.user_id FROM vipinfo WHERE vipinfo.endtime > NOW())");
				}
			}

			// 注册时间查询
			if (StringUtil.isNotBlank(userinfo.getCreateTime())) {
				sqlbuffer.append(" and userbasicsinfo.createTime >= '")
						.append(userinfo.getCreateTime()).append(" 00:00:00'");
				countsql.append(" and userbasicsinfo.createTime >= '")
						.append(userinfo.getCreateTime()).append(" 00:00:00'");
			}

			if (StringUtil.isNotBlank(userinfo.getFailTime())) {
				sqlbuffer.append(" and userbasicsinfo.createTime <= '")
						.append(userinfo.getFailTime()).append(" 23:59:59'");
				countsql.append(" and userbasicsinfo.createTime <= '")
						.append(userinfo.getFailTime()).append(" 23:59:59'");
			}

		}
		List datalist = dao.pageListBySql(page, countsql.toString(),
				sqlbuffer.toString(), null);
		List destList = new ArrayList();
		if (datalist != null) {
			// 添加信用等级字段
			for (int i = 0; i < datalist.size(); i++) {
				Object[] dataAry = (Object[]) datalist.get(i);
				Borrowersbase b = new Borrowersbase();
				int suminte = 0;
				if (dataAry[3] != null) {
					suminte = Integer.parseInt(dataAry[3].toString());
				}
				b.setSuminte(suminte);
				Object[] destAry = new Object[dataAry.length + 1];
				// 信用等级
				destAry[destAry.length - 1] = b.getCreditGrade();
				System.arraycopy(dataAry, 0, (Object) destAry, 0,
						dataAry.length);
				destList.add(destAry);
			}
		}
		// endtime,vipendtime,isborrower,备用
		String titles = "id,username,realname,suminte,credit,createTime,lasttime,logincount,vipendtime,isborr,signAutoRepay,adminname,pIdentNo,creditGrade";
		// 将查询结果转换为json结果集
		ArrayToJson.arrayToJson(titles, destList, jsonlist);

		resultjson.element("rows", jsonlist);
		resultjson.element("total", page.getTotalCount());

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("queryPage(Userbasicsinfo, PageModel, HttpServletRequest, String)方法结束OUTPARAM=" + resultjson); //$NON-NLS-1$
		}
		return resultjson;

	}

	@ResponseBody
	@RequestMapping("/saveUser")
	@Transactional(rollbackFor = Exception.class)
	public JSONObject saveUser(HttpServletRequest request,
			Userbasicsinfo userInfo, Userrelationinfo userrelationinfo,
			String password) throws DataAccessException, IOException,
			TemplateException {

		JSONObject json = new JSONObject();

		try {
			// 当前时间
			String date = DateUtils.format(null);
			// 用户资金信息
			Userfundinfo userFund = new Userfundinfo();
			// 用户系统消息
			Usermessage userMessage = new Usermessage();
			// 邮箱限制信息
			// Validcodeinfo validcodeinfo=new Validcodeinfo();
			// 积分
			// Manualintegral mt=new Manualintegral();

			password = Md5Util.execute(password);
			userInfo.setPassword(password);
			// 注册时间
			userInfo.setCreateTime(date);
			// 是否被锁[1-是，0-否]
			userInfo.setIsLock(1);
			// 初始化交易密码（与登录密码一致）
			userInfo.setTransPassword(userInfo.getPassword());
			// 会员编号
			MemberNumber memberNumber = null;
			userInfo.setMemberNumber(memberNumber);
			userInfo.setIsLock(1);
			// 优选用户
			userInfo.setIsespecialuser(1);
			// 是否激活邮箱
			userrelationinfo.setEmailisPass(1);
			// 用户基本信息
			userrelationinfo.setUserbasicsinfo(userInfo);
			userFund.setUserbasicsinfo(userInfo);
			userMessage.setUserbasicsinfo(userInfo);
			// 保存用户关联信息
			userInfoServices.saveUser(userInfo);
			userInfoServices.saveUser1(userrelationinfo);
			userInfoServices.saveUserFun(userFund);
			userInfoServices.saveUsermess(userMessage);
			// 成为借款人
			Borrowersbase bsb = borrowService.queryByUserInfo(Long.valueOf(5));// 暂时用已有资料
			BorrowersApply apply = new BorrowersApply();
			apply.setUserbasicsinfo(userInfo);
			apply.setType(7);
			apply.setState(0);
			apply.setMoney(100000000.00);
			apply.setBorrowersbase(bsb);
			apply.setRefunway("1");
			apply.setRemark("批量处理");

			// 申请资料
			borrowService.submitApplyone(userInfo, apply);
			return DwzResponseUtil.setJson(json,
					Constant.HTTP_STATUSCODE_SUCCESS, "新增用户成功", "main67",
					"closeCurrent");
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return DwzResponseUtil.setJson(json,
                    Constant.HTTP_STATUSCODE_ERROR, "新增用户失败", "main67",
                    "closeCurrent");

		}

	}

	/**
	 * 新增自动投标
	 * 
	 * @param request
	 * @param auto
	 * @return
	 */
	@RequestMapping("/saveAuto")
	@ResponseBody
	public JSONObject saveAuto(HttpServletRequest request, Automatic automatic,
			String userId) {
		ReturnInfo info = null;
		JSONObject json = new JSONObject();
		Userbasicsinfo userinfo = commonDao.get(Userbasicsinfo.class,
				Long.valueOf(userId));
		DecimalFormat df = new DecimalFormat("######0.00");
		automatic.setpEAmtQuota(df.format(Double.valueOf(automatic
				.getpEAmtQuota())));
		automatic.setpSAmtQuota(df.format(Double.valueOf(automatic
				.getpSAmtQuota())));
		automatic.setpSIRQuota(df.format(Double.valueOf(automatic
				.getpSIRQuota())));
		automatic.setpEIRQuota(df.format(Double.valueOf(automatic
				.getpEIRQuota())));
		automatic.setEntrytime(DateUtils.format("yyyy-MM-dd"));
		try {
			// 发送报文
			automatic.setpMerBillNo("ZD" + StringUtil.pMerBillNo());
			automatic.setpSigningDate(DateUtils.format("yyyyMMdd"));
			automatic.setpIdentNo(userinfo.getUserrelationinfo().getCardId());
			automatic.setpRealName(userinfo.getName());
			automatic.setpIpsAcctNo(userinfo.getUserfundinfo().getpIdentNo());
			automatic.setpMemo1(userinfo.getId().toString() + "_"
					+ automatic.getEntrytime() + "_"
					+ automatic.getpSigningDate());
			automatic.setpMemo2(automatic.getpTrdCycleType() + "_"
					+ automatic.getpValidType());
			automatic.setpMemo3(automatic.getpSTrdCycleValue() + "_"
					+ automatic.getpETrdCycleValue());
			Map<String, String> map = plankService.automaitcBid(automatic);
			request.getSession().setAttribute("map", map);
			// userInfoServices.saveAuto(automatic);
			return DwzResponseUtil.setJson(json,
					Constant.HTTP_STATUSCODE_SUCCESS, "保存成功", "main67",
					"closeCurrent", "/baseLoanSign/gotoIPS.htm");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOG.error("自动投标规则失败,数据解析失败-->需要解析的数据为：" + info.getP3DesXmlPara());
			e.printStackTrace();
			return DwzResponseUtil.setJson(json,
					Constant.HTTP_STATUSCODE_ERROR, "保存失败", "main67",
					"closeCurrent", "");

		}
	}

	/**
	 * 查询用户的自动投标列表
	 * 
	 * @param request
	 * @param userId
	 * @return
	 */
	@RequestMapping("/AutoList")
	@ResponseBody
	public JSONObject queryAutoList(HttpServletRequest request, String userId,
			PageModel page, String limit, String start) {

		JSONObject resultjson = new JSONObject();
		JSONArray jsonlist = new JSONArray();
		// 得到总条数
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

		if(!StringUtil.isNumberString(userId)){
			LOG.error("userId不为数字");
			return DwzResponseUtil.setJson(new JSONObject(),
					Constant.HTTP_STATUSCODE_ERROR, "参数错误", "main67",
					"closeCurrent", "");
		}
		String sql = "SELECT id,state,pRealName,pTrdCycleType,pSTrdCycleValue,pETrdCycleValue,pSAmtQuota,pEAmtQuota,pSIRQuota,pEIRQuota from automatic where userbasicinfo_id="
				+ userId;
		String sqlcount = "SELECT count(id) from automatic where userbasicinfo_id="
				+ userId;

		// 分页数据源
		List list = dao.pageListBySql(page, sqlcount.toString(),
				sql.toString(), null);
		String titles = "id,state,pRealName,pTrdCycleType,pSTrdCycleValue,pETrdCycleValue,pSAmtQuota,pEAmtQuota,pSIRQuota,pEIRQuota";
		ArrayToJson.arrayToJson(titles, list, jsonlist);
		// 将数据源封装成json对象（命名必须row）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", page.getTotalCount());

		return resultjson;

	}

	/**
	 * 启用和停用自动投标规则
	 * 
	 * @param state
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateAutoState")
	public String updateAutoState(String ids, String state) {
		if ("1".equals(state)) {
			if (automaticService.hasAutoEn(ids)) {
				return "禁用中的投标规则才可以启用";
			} else {
				return automaticService.updateAuto(ids, state);
			}
		} else if ("2".equals(state)) {
			if (automaticService.hasAutoDis(ids)) {
				return "启用中的投标规则才可以禁用";
			} else {
				return automaticService.updateAuto(ids, state);
			}
		}
		return "success";
	}

	/* 优金结束 */

	/**
	 * <p>
	 * Title: saveOrUpdateLoansign
	 * </p>
	 * <p>
	 * Description: 保存普通标
	 * </p>
	 *
	 * @param loanSign
	 *            借款标信息
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return 返回的结果集
	 */
	@ResponseBody
	@RequestMapping(value = { "saveLoansign", "/" })
	public JSONObject saveLoansign(Loansign loanSign,
								   Loansignbasics loansignbasics, Userbasicsinfo user, Integer type,
								   HttpServletRequest request) {
		// 实际传进来的不是Userbasicsinfo的id，而是BorrowersApply的id
		Long appid = loanSign.getUserbasicsinfo().getId();
		// 取得BorrowersApply
		BorrowersApply app = userInfoQuery.getBorrowersApplys(appid);
		// 通过BorrowersApply取得userid
		Long userId = userInfoQuery.getUserId(app.getId());
		// 替换掉loanSign的user
		Userbasicsinfo u = dao.get(Userbasicsinfo.class, userId);
		loanSign.setUserbasicsinfo(u);
		boolean isVip = userInfoQuery.isPrivilege(u);
		JSONObject json = new JSONObject();
		boolean bool = true;
		json.element("callbackType", "closeCurrent");
		json.element("statusCode", "300");
		// 判断本期借款金额是否正确
		if (loanSign.getIssueLoan() % loanSign.getLoanUnit() != 0) {
			bool = false;
			json.element("message", "借款额必须为最小借出单位的倍数！");
		}
		// // 结束时间不能小于当前时间
		// if
		// (bool&&DateUtils.isAfter(Constant.DEFAULT_DATE_FORMAT,loanSign.getEndTime()))
		// {
		// json.element("message", "结束时间应在当前时候之后！");
		// bool=false;
		// }
		if (!bool) {
			return json;
		}
		String alert = getJudge(loanSign.getIssueLoan(), loanSign.getRate(),
				loanSign.getMonth(), type);
		if (!"".equals(alert)) {
			json.element("message", alert);
		}
		String num = this.judgeLoan(loanSign.getIssueLoan(), app.getId(), type);
		int nums = Integer.parseInt(num);
		if (nums == 0) {
			bool = false;
			json.element("message", "选择的借款标类型和该借款人申请的借款标类型不一致，请重新选择!");
			return json;
		} else if (nums == 1) {
			bool = false;
			json.element("message", "发布金额大于了该借款人申请的金额!");
			return json;
		} else if (nums == 2) {
			bool = false;
			json.element("message", "借款金额大于了投资本息的70%！");
			return json;
		}

		// 2.检查有没有设置费用比例
		Costratio costratio = loanSignQuery.queryCostratio();
		loanSign.setRate(loanSign.getRate() / 100);
		loansignbasics.setReward(loansignbasics.getReward() / 100);
		loansignbasics.setMgtMoney(0.00);
		loanSign.setLoanType(1);// 普通标
		loanSign.setLoansignType(loansignTypeService.queryOne(type.toString()));
		if (loanSign.getId() != null) {
			// update
			bool = baseLoansignService.update(loanSign, loansignbasics,
					costratio,2);
		} else {
			// insert
			// 1.检查授信额度
			// BorrowersApply boor =
			// userInfoQuery.getBorrowersApplys(loanSign.getUserbasicsinfo().getId());
			// loanSign.getUserbasicsinfo().setId(.getUserbasicsinfo().getId());
			if (!baseLoansignService.checkCredit(loanSign, userId)) {
				json.element("message", "保存失败,借款金额超过借款人的可用授信额度！");
				bool = false;
			}

			if (bool && costratio == null) {
				json.element("message", "请设置费用比例后在进行新增标操作！");
				bool = false;
			}
			if (bool) {
				// 3.添加
				// loansignbasics.setBidTime(10);
				if (app.getType() != 7) {
					app.setState(1);
				}

				bool = baseLoansignService.save(loanSign, loansignbasics,
						costratio, isVip);
			} else {
				return json;
			}
		}
		if (bool) {
			// dwz返回json对象
			json.element("statusCode", "200");
			json.element("message", "更新成功");
			json.element("navTabId", "main34");
			json.element("callbackType", "closeCurrent");
			return json;
		} else {
			json.element("message", "更新失败");
			return json;
		}
	}


	/**
	 * <p>
	 * Title: saveOrUpdateLoansign
	 * </p>
	 * <p>
	 * Description: 保存普通标
	 * </p>
	 *
	 * @param loanSign
	 *            借款标信息
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return 返回的结果集
	 */
	@ResponseBody
	@RequestMapping(value = { "saveDcbLoansign", "/" })
	public JSONObject saveDcbLoansign(Loansign loanSign,
								   Loansignbasics loansignbasics, Userbasicsinfo user, Integer type,
								   HttpServletRequest request) {
		// 实际传进来的不是Userbasicsinfo的id，而是BorrowersApply的id
		Long appid = loanSign.getUserbasicsinfo().getId();
		// 取得BorrowersApply
		BorrowersApply app = userInfoQuery.getBorrowersApplys(appid);
		// 通过BorrowersApply取得userid
		Long userId = userInfoQuery.getUserId(app.getId());
		// 替换掉loanSign的user
		Userbasicsinfo u = dao.get(Userbasicsinfo.class, userId);
		loanSign.setUserbasicsinfo(u);
		boolean isVip = userInfoQuery.isPrivilege(u);
		JSONObject json = new JSONObject();
		boolean bool = true;
		json.element("callbackType", "closeCurrent");
		json.element("statusCode", "300");
		// 判断本期借款金额是否正确
		if (loanSign.getIssueLoan() % loanSign.getLoanUnit() != 0) {
			bool = false;
			json.element("message", "借款额必须为最小借出单位的倍数！");
		}
		if (!bool) {
			return json;
		}
		String alert = getJudge(loanSign.getIssueLoan(), loanSign.getRate(),
				loanSign.getMonth(), type);
		if (!"".equals(alert)) {
			json.element("message", alert);
		}
		String num = this.judgeLoan(loanSign.getIssueLoan(), app.getId(), type);
		int nums = Integer.parseInt(num);
		if (nums == 0) {
			bool = false;
			json.element("message", "选择的借款标类型和该借款人申请的借款标类型不一致，请重新选择!");
			return json;
		} else if (nums == 1) {
			bool = false;
			json.element("message", "发布金额大于了该借款人申请的金额!");
			return json;
		} else if (nums == 2) {
			bool = false;
			json.element("message", "借款金额大于了投资本息的70%！");
			return json;
		}

		// 2.检查有没有设置费用比例
		Costratio costratio = loanSignQuery.queryCostratio();
		loanSign.setRate(loanSign.getRate() / 100);
		loansignbasics.setReward(loansignbasics.getReward() / 100);
		loansignbasics.setMgtMoney(0.00);
		loanSign.setLoanType(1);// 普通标
		loanSign.setLoansignType(loansignTypeService.queryOne(type.toString()));
		loanSign.setProduct(1);
		if (loanSign.getId() != null) {
			// update
			bool = baseLoansignService.update(loanSign, loansignbasics,
					costratio,2);
		} else {
			if (!baseLoansignService.checkCredit(loanSign, userId)) {
				json.element("message", "保存失败,借款金额超过借款人的可用授信额度！");
				bool = false;
			}

			if (bool && costratio == null) {
				json.element("message", "请设置费用比例后在进行新增标操作！");
				bool = false;
			}
			if (bool) {
				// 3.添加
				// loansignbasics.setBidTime(10);
				if (app.getType() != 7) {
					app.setState(1);
				}
				bool = baseLoansignService.save(loanSign, loansignbasics,
						costratio, isVip);
			} else {
				return json;
			}
		}
		if (bool) {
			// dwz返回json对象
			json.element("statusCode", "200");
			json.element("message", "更新成功");
			json.element("navTabId", "main34");
			json.element("callbackType", "closeCurrent");
			return json;
		} else {
			json.element("message", "更新失败");
			return json;
		}
	}

	/**
	 * 修改未发布标
	 * 
	 * @param loanSign
	 * @param loansignbasics
	 * @param user
	 * @param type
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = { "updateLoansign", "/" })
	public JSONObject updateLoansign(Loansign loanSign,
			Loansignbasics loansignbasics, Userbasicsinfo user, Integer type,
			HttpServletRequest request, int operNumber) {
		JSONObject json = new JSONObject();
		boolean bool = true;
		boolean vip = userInfoQuery.isPrivilege(user);
		json.element("callbackType", "closeCurrent");
		json.element("statusCode", "300");
		if (operNumber == 3) {//除未发布的标-修改
			Costratio costratio = loanSignQuery.queryCostratio();
			bool = baseLoansignService.update(loanSign, loansignbasics,
					costratio,operNumber);
			if (bool) {
				// dwz返回json对象
				json.element("statusCode", "200");
				json.element("message", "更新成功");
				json.element("navTabId", "main34");
				json.element("callbackType", "closeCurrent");
				return json;
			} else {
				json.element("message", "更新失败");
				return json;
			}
		} else {
			// 判断本期借款金额是否正确
			if (loanSign.getIssueLoan() % loanSign.getLoanUnit() != 0) {
				bool = false;
				json.element("message", "请输入能正确的借款金额！");
			}
			// // 结束时间不能小于当前时间
			// if
			// (bool&&DateUtils.isAfter(Constant.DEFAULT_DATE_FORMAT,loanSign.getEndTime()))
			// {
			// json.element("message", "结束时间应在当前时候之后！");
			// bool=false;
			// }
			if (!bool) {
				return json;
			}
			String alert = getJudge(loanSign.getIssueLoan(),
					loanSign.getRate(), loanSign.getMonth(), type);
			if (!"".equals(alert)) {
				json.element("message", alert);
			}

			// 2.检查有没有设置费用比例
			Costratio costratio = loanSignQuery.queryCostratio();
			loanSign.setRate(loanSign.getRate() / 100);
			// loansignbasics.setMgtMoneyScale(loansignbasics.getMgtMoneyScale()
			// /
			// 100);
			loansignbasics.setReward(loansignbasics.getReward() / 100);
			loanSign.setLoanType(1);// 普通标
			loanSign.setLoansignType(loansignTypeService.queryOne(type
					.toString()));

			bool = baseLoansignService.update(loanSign, loansignbasics,
					costratio,2);

			if (bool) {
				// dwz返回json对象
				json.element("statusCode", "200");
				json.element("message", "更新成功");
				json.element("navTabId", "main34");
				json.element("callbackType", "closeCurrent");
				return json;
			} else {
				json.element("message", "更新失败");
				return json;
			}
		}

	}

	/**
	 * <p>
	 * Title: onTimeRepay
	 * </p>
	 * <p>
	 * Description: 按时还款
	 * </p>
	 * 
	 * @param repaymentRecordId
	 *            按时还款的记录编号
	 * @param repayTime
	 *            按时选择还款时间
	 * @return 数字 1.成功 2.还款失败,只能针对未还款记录还款,请尝试刷新页面！ 3.还款时间应该在预计还款时间之前！
	 *         4.还款失败,只能按期数顺序依次还款！ 5 异常
	 */
	@ResponseBody
	@RequestMapping("/onTimeRepay")
	public int onTimeRepay(String repaymentRecordId, String repayTime) {
		int state = 0;
		// 1.判断是否可以还款
		Repaymentrecord repaymentrecord = dao.get(Repaymentrecord.class,
				Long.valueOf(repaymentRecordId));
		if (repaymentrecord.getRepayState() != 1) {// 1.未还款
			state = 2;
		}
		try {
			// 按时还款的时间不能大于预计还款时间
			if (state > 0
					&& DateUtils.isBefore(Constant.DEFAULT_DATE_FORMAT,
							repaymentrecord.getPreRepayDate(),
							Constant.DEFAULT_DATE_FORMAT, repayTime)) {
				state = 3;
			}
		} catch (ParseException e) {
			return 5;
		}

		// 判断是否按期数还款
		if (loanSignQuery.checkRepayOrder(repaymentrecord)) {
			state = 4;
		}
		// 还款
		boolean bool = baseLoansignService.onTimeRepay(repaymentrecord,
				repayTime);
		state = bool ? 1 : 5;
		return state;
	}

	/**
	 * <p>
	 * Title: exceedTimeRepay
	 * </p>
	 * <p>
	 * Description: 逾期还款
	 * </p>
	 * 
	 * @param repaymentRecordId
	 *            逾期还款的编号
	 * @return 数字状态 1.成功 2.还款失败,只能针对未还款记录还款,请尝试刷新页面. 3.还款失败,只能按期数顺序依次还款！4.异常
	 */
	@ResponseBody
	@RequestMapping("/exceedTimeRepay")
	public int exceedTimeRepay(String repaymentRecordId) {

		JSONObject json = new JSONObject();
		// 1.判断是否可以还款
		Repaymentrecord repaymentrecord = dao.get(Repaymentrecord.class,
				Long.valueOf(repaymentRecordId));
		if (repaymentrecord.getRepayState() != 1) {// 1.未还款
			return 2;
		}
		// 判断是否按期数还款
		if (loanSignQuery.checkRepayOrder(repaymentrecord)) {
			return 3;
		}
		// 逾期还款
		boolean bool = baseLoansignService.exceedTimeRepay(repaymentrecord);
		return bool ? 1 : 4;
	}

	/**
	 * <p>
	 * Title: exceedTimeRepayed
	 * </p>
	 * <p>
	 * Description: 逾期已还款
	 * </p>
	 * 
	 * @param repaymentRecordId
	 *            逾期还款的编号
	 * @param repayTime
	 *            时间
	 * @return 数字状态 1.成功 2.还款失败 3.还款失败,只有平台垫付的标可以还款,请尝试刷新页面！
	 *         4.还款失败,实际还款时间必须大于预计还款时间！
	 */
	@ResponseBody
	@RequestMapping("/exceedTimeRepayed")
	public int exceedTimeRepayed(String repaymentRecordId, String repayTime) {

		// 1.判断是否可以还款
		Repaymentrecord repaymentrecord = dao.get(Repaymentrecord.class,
				Long.valueOf(repaymentRecordId));
		if (repaymentrecord.getRepayState() != 3) {// 3.逾期未还款
			return 3;
		}

		boolean flag = true;
		try {
			flag = DateUtils.isAfter(Constant.DEFAULT_DATE_FORMAT,
					repaymentrecord.getPreRepayDate(),
					Constant.DEFAULT_DATE_FORMAT, repayTime);
		} catch (ParseException e) {
		}

		if (flag) {
			return 4;
		}

		boolean bool = loanSignService.updateRepaymentRecord(repaymentrecord,
				repayTime);
		int returnint = bool ? 1 : 2;

		return returnint;
	}

	/**
	 * <p>
	 * Title: outPutLoanSignExcel
	 * </p>
	 * <p>
	 * Description: 导出普通标借款列表
	 * </p>
	 * 
	 * @param request
	 *            request
	 * @param response
	 *            response
	 */
	@RequestMapping("/outPutExcel")
	public void outPutLoanSignExcel(HttpServletRequest request,
			HttpServletResponse response) {

		// 标题
		String[] header = new String[] { "序号", "借款标号", "标题", "借款人", "最小出借单位",
				"借款金额", "还款期限", "借款标类型", "标种子类型", "借款管理费", "年化利率", "平台奖励",
				"成功借出份数", "剩余份数", "还款方式", "借款标状态", "是否放款", "放款时间", "发布时间",
				"是否显示", "推荐到首页" };
		// 行宽度
		Integer[] column = new Integer[] { 8, 10, 11, 12, 12, 10, 10, 12, 10,
				10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 };
		// 获取数据源
		List list = loanSignService.outPutList();

		List<Map<String, String>> content = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;

		for (Object obj : list) {
			Object[] str = (Object[]) obj;
			map = new HashMap<String, String>();
			map.put("序号", str[0] + "");
			map.put("借款标号", str[1] + "");
			map.put("标题", str[2] + "");
			map.put("借款人", str[3] + "");
			map.put("最小出借单位", str[4] + "");
			map.put("借款金额", Arith.round(new BigDecimal(str[5].toString()), 2)
					+ "元");
			map.put("还款期限", str[6] + "个月");
			map.put("借款标类型", str[7] + "");
			map.put("标种子类型", str[8] + "");
			map.put("借款管理费", str[9] + "");
			map.put("年化利率", Arith.round(new BigDecimal(str[11].toString()), 2)
					+ "%");
			map.put("平台奖励", Arith.round(new BigDecimal(str[12].toString()), 2)
					+ "%");
			map.put("成功借出份数", Integer.parseInt(str[13].toString()) + "");
			map.put("剩余份数", Double.valueOf(str[14].toString()) > 0 ? str[14]
					+ "" : "满标");
			map.put("还款方式", str[15] + "");
			map.put("借款标状态", str[16] + "");
			map.put("是否放款", str[17] + "");
			map.put("发布时间", null != str[10] ? str[10].toString() : "");
			map.put("放款时间", null != str[18] ? str[18].toString() : "");
			map.put("是否显示", str[19] + "");
			map.put("推荐到首页", str[20] + "");
			content.add(map);
		}
		// 下载excel
		rechargeModel.downloadExcel("普通借款标", column, header, content, response);
	}

	/**
	 * <p>
	 * Title: seeDetails
	 * </p>
	 * <p>
	 * Description: 查询普通标详情
	 * </p>
	 * 
	 * @param id
	 *            标编号
	 * @param operNumber
	 *            操作号 1 新增 2 编辑 3 查看详情
	 * @param request
	 *            HttpServletRequest
	 * @return 执行完方法返回的页面
	 */
	@RequestMapping("/seeDetails")
	public ModelAndView seeDetails(
			@RequestParam(value = "id", defaultValue = "", required = false) String id,
			int operNumber, HttpServletRequest request) {
		if (null != id && !id.trim().equals("") && operNumber != 1) {
			// 通过id查询到信息
			Loansign loansign = loanSignQuery.getLoansignById(id);

			Loansignbasics loansignbasics = loanSignQuery
					.getLoansignbasicsById(id);

			List<LoansignType> loansignType = loanSignQuery.queryLoanType();

			request.setAttribute("loansignType", loansignType);
			request.setAttribute("loansign", loansign);
			request.setAttribute("loansignbasics", loansignbasics);
		} else {
			request.setAttribute("loansign", new Loansign());
			request.setAttribute("loansignbasics", new Loansignbasics());
		}
		// 查询标类型
		request.setAttribute("loanType", loansignTypeService.queryLoanType());
		request.setAttribute("operNumber", operNumber);
		if (operNumber == 2 || operNumber == 3) {
			ModelAndView returnModelAndView = new ModelAndView(
					"WEB-INF/views/admin/loansign/editloansign");
			return returnModelAndView;
		} else {
			ModelAndView returnModelAndView = new ModelAndView(
					"WEB-INF/views/admin/loansign/saveloansign");
			return returnModelAndView;
		}
	}


	/**
	 * <p>
	 * Title: seeDetails
	 * </p>
	 * <p>
	 * Description: 查询普通标详情
	 * </p>
	 *
	 * @param id
	 *            标编号
	 * @param operNumber
	 *            操作号 1 新增 2 编辑 3 查看详情
	 * @param request
	 *            HttpServletRequest
	 * @return 执行完方法返回的页面
	 */
	@RequestMapping("/seeDcbLoansignDetails")
	public ModelAndView seeDcbLoansignDetails(
			@RequestParam(value = "id", defaultValue = "", required = false) String id,
			int operNumber, HttpServletRequest request) {
		if (null != id && !id.trim().equals("") && operNumber != 1) {
			// 通过id查询到信息
			Loansign loansign = loanSignQuery.getLoansignById(id);

			Loansignbasics loansignbasics = loanSignQuery
					.getLoansignbasicsById(id);

			List<LoansignType> loansignType = loanSignQuery.queryLoanType();

			request.setAttribute("loansignType", loansignType);
			request.setAttribute("loansign", loansign);
			request.setAttribute("loansignbasics", loansignbasics);
		} else {
			request.setAttribute("loansign", new Loansign());
			request.setAttribute("loansignbasics", new Loansignbasics());
		}
		// 查询标类型
		request.setAttribute("loanType", loansignTypeService.queryLoanType());
		request.setAttribute("operNumber", operNumber);
		if (operNumber == 2 || operNumber == 3) {
			ModelAndView returnModelAndView = new ModelAndView(
					"WEB-INF/views/admin/loansign/editdcbloansign");
			return returnModelAndView;
		} else {
			ModelAndView returnModelAndView = new ModelAndView(
					"WEB-INF/views/admin/loansign/savedcbloansign");
			return returnModelAndView;
		}
	}

	/**
	 * 在发布净值标的时候判断用户的借款金额 (净值标借款金额 = 用户前期投资未回收的所有本息和 *70%) 用户发布的金额
	 * 
	 * @param id
	 *            用户编号
	 * @return 返回用户可发布的净值标金额
	 */
	public String judgeLoan(Double money, Long id, Integer typeId) {
		Userbasicsinfo user = new Userbasicsinfo();
		user.setId(id);
		BorrowersApply boor = userInfoQuery.getBorrowersApplys(id);
		if (!boor.getType().equals(typeId)) {// 发标的类型和申请的类型不一样
			return "0";
		}
		if (boor.getMoney() < money) {// 发标金额大于了借款金额
			return "1";
		}
		if (boor.getType() == 4) {
			Double moneyAndInterest = loanSignService.getLoanRecordMoney(id);
			Double moenys = Arith.mul(moneyAndInterest, 0.7).doubleValue();
			if (money > moenys) {
				return "2";
			}
		}
		return "3";
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	public String getJudge(Double money, Double rate, int month, int id) {
		LoansignType type = loansignTypeService.queryOne(id + "");
		// 判断额度
		if (type.getMincredit() > money) {
			return "借款金额不能小于最小" + type.getTypename() + "的最小额度";
		}
		if (type.getMaxcredit() < money) {
			return "借款金额不能大于最大" + type.getTypename() + "的最大额度";
		}
		// 利率
		if (type.getMinrate() > Arith.div(rate, 100, 4).doubleValue()) {
			return "年化利率不能小于" + type.getTypename() + "的最小利率";
		}
		if (type.getMaxrate() > Arith.div(rate, 100, 4).doubleValue()) {
			return "年化利率不能大于" + type.getTypename() + "的最大利率";
		}
		// 借款标期限
		if (type.getMinmoney() > month) {
			return "借款期限不能小于" + type.getTypename() + "的最小借款期限";
		}
		if (type.getMaxmoney() > month) {
			return "借款期限不能大于" + type.getTypename() + "的最大借款期限";
		}
		return "";
	}
}
