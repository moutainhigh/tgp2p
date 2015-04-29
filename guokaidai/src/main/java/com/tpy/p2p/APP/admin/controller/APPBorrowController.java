package com.tpy.p2p.APP.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.APP.admin.Util.MyUtil;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import com.tpy.p2p.chesdai.spring.service.borrow.BorrowService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.p2p.chesdai.entity.BorrowersApply;
import com.tpy.p2p.chesdai.entity.Borrowersbase;
import com.tpy.p2p.chesdai.entity.Borrowerscompany;
import com.tpy.p2p.chesdai.entity.Borrowerscontact;
import com.tpy.p2p.chesdai.entity.Borrowersfiles;
import com.tpy.p2p.chesdai.entity.Borrowersfinanes;
import com.tpy.p2p.chesdai.entity.Borrowersothercontact;
import com.tpy.p2p.chesdai.entity.LoansignType;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userrelationinfo;

/**
 * 我要借款
 * 
 * @author My_Ascii
 * @CheckLogin(value = CheckLogin.WEB)
 * 
 */
@Controller
@RequestMapping("/appborrow")
public class APPBorrowController {

	/**
	 * 注入borrowService
	 */
	@Resource
	private BorrowService borrowService;
	@Resource
	private UserBaseInfoService userBaseInfoService;
	@Resource
	private HibernateSupport dao;

	/**
	 * 申请贷款类型 判断用户是否已经成为借款人
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "borr-type", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject borrType(HttpServletRequest request, Long uid) {

		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);

		user = userBaseInfoService.queryUserById(uid);
		Object obj = dao.findObject(
				"FROM Borrowersbase b WHERE b.userbasicsinfo.id=?",
				user.getId());

		return MyUtil.singleEntityValue(obj);

	}

	/**
	 * 开始申请
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return 0表示已成为可借款人 个人信息的json数据
	 */
	@CheckFundsSafe
	@RequestMapping(value = "start-apply", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject startApply(HttpServletRequest request,
			HttpServletResponse response, Long uid, Integer type) {
		System.out.println(this);
		/*
		 * Userbasicsinfo user = (Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER);
		 */
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		request.setAttribute("curType", type);

		synchronized (user.getId()) {

			Borrowersbase base = (Borrowersbase) dao.findObject(
					"FROM Borrowersbase b WHERE b.userbasicsinfo.id=?",
					user.getId());

			if (base != null && base.getAuditResult() == 1) {// 已经通过了

				borrowService.forwardDataUpload(request, uid);

				return applyBorrowers(user, base, type, request);

			} else if (base == null) {// 该用户有成为借款人的意向，但是借款人表未添加对应数据

				base = new Borrowersbase();
				base.setAuditResult(0);
				base.setUserbasicsinfo(user);

				borrowService.initBorrower(base);
			}

		}

		return forwardPersoninfo(request, uid, type, response);

	}

	/**
	 * 申请借款
	 * 
	 * @param user
	 * @param base
	 * @param type
	 * @param request
	 * @return
	 */

	private JSONObject applyBorrowers(Userbasicsinfo user, Borrowersbase base,
			Integer type, HttpServletRequest request) {

		// 查询borrow验证信息
		List<LoansignType> loantype = borrowService.getLoanSignTypeById(type
				.toString());
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("AuditResult", base.getAuditResult());
		message.put("AuditStatus", base.getAuditStatus());
		message.put("IpsAcctDate", user.getpIpsAcctDate());

		if (type == 1) {
			message.put("type", "优金贷");
		} else if (type == 2) {
			message.put("type", "优商贷");
		}
		message.put("borrowersbase.id", base.getId());
		if (loantype.size() > 0) {
			LoansignType loansignType = loantype.get(0);
			JSONObject json = MyUtil.singleEntityValue(loansignType);
			message.put("borrower", json);

		}
		return JSONObject.fromObject(message);
	}

	@RequestMapping("toApplyOne")
	public String toApplyOne(HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		if (user == null) {
			return "/WEB-INF/views/visitor/login";
		}
		return "/WEB-INF/views/visitor/communal/loan1";
	}

	@RequestMapping("toApplyTwo")
	public String toApplyTwo() {
		return "/WEB-INF/views/visitor/communal/loan2";
	}

	@RequestMapping("toApplyThree")
	public String toApplyThree() {
		return "/WEB-INF/views/visitor/communal/loan3";
	}

	/**
	 * 申请结果
	 * 
	 * @param Long
	 *            uid
	 * @param request
	 * @param Integer
	 *            type
	 * @return JSONObject
	 */
	@RequestMapping(value = "my-apply-result", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject applyResult(HttpServletRequest request, Long uid,
			Page page, Integer type) {
		// Userbasicsinfo user = (Userbasicsinfo)
		// request.getSession().getAttribute(Constant.SESSION_USER);
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		Map<String, Object> message = new HashMap<String, Object>();
		String queryString = "FROM BorrowersApply a WHERE a.borrowersbase.userbasicsinfo.id=? order by a.time desc";
		List list = dao.pageListByHql(page, queryString, true, user.getId());
		List<Object> conList = null;
		JSONArray jsosBrowerApply = null;
		if (null != list) {
			conList = new ArrayList<Object>();
			for (Object value : list) {
				conList.add(value);
			}
			jsosBrowerApply = MyUtil.sameEntityValue(conList);
			message.put("borrowersApply", jsosBrowerApply);
		}

		message.put("curType", type);
		message.put("pagePerSize", page.getPagePerSize());
		message.put("pageNo", page.getPageNo());
		message.put("dataCount", page.getDataCount());
		message.put("pageLast", page.getPageLast());
		return JSONObject.fromObject(message);
	}

	/**
	 * 提交申请
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "submit-apply", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject submitApply(HttpServletRequest request,
			@ModelAttribute() BorrowersApply apply, Long uid) {
		/*
		 * Userbasicsinfo user = (Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER);
		 */
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		apply.setUserbasicsinfo(user);
		borrowService.submitApply(user, apply);
		Map<String, String> message = new HashMap<String, String>();
		message.put("msg", "1");

		return JSONObject.fromObject(message);
	}

	/**
	 * 个人资料
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@CheckFundsSafe
	@RequestMapping(value = "forwardPersoninfo", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardPersoninfo(HttpServletRequest request, Long uid,
			Integer type, HttpServletResponse response) {
		// 查询用户基本信息
		/*
		 * Userbasicsinfo userbasic = borrowService
		 * .queryUserinfo(((Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER)).getId());
		 */
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		// 用户关联信息
		Userrelationinfo mrinfo = userbasic.getUserrelationinfo();

		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(userbasic.getId());
		if (borrowerlist.size() > 0) {
			Borrowersbase resborrower = borrowerlist.get(0);
			resborrower.setAge(String.valueOf(StringUtil.getAgeByIdCard(mrinfo
                    .getCardId())));
			resborrower.setIsCard(mrinfo.getCardId());
			resborrower.setRealName(userbasic.getName());
			resborrower.setPhone(mrinfo.getPhone());
			String sex = mrinfo.getSex();
			if ("女".equals(sex)) {
				resborrower.setSex("0");
			} else if ("男".equals(sex)) {
				resborrower.setSex("1");
			} else {
				resborrower.setSex(sex);
			}
			resborrower.setMarryStatus(mrinfo.getMarriage());

			resborrower.setQualifications(resborrower.getQualifications());
			resborrower.setIncome(mrinfo.getIncome());
			Map<String, Object> message = new HashMap<String, Object>();
			message.put("borrower", MyUtil.singleEntityValue(resborrower));
			message.put("IpsAcctDate", userbasic.getpIpsAcctDate());
			return JSONObject.fromObject(message);

		} else {
			return null;
		}

	}

	/**
	 * 联系方式
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping(value = "forwardContact", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardContact(HttpServletRequest request, Long uid,
			HttpServletResponse response) {
		/*
		 * List<Borrowersbase> borrowerlist = borrowService
		 * .queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER)).getId());
		 */
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(userbasic.getId());
		if (borrowerlist.size() > 0) {
			Borrowerscontact cc = borrowerlist.get(0).getBorrowerscontact();
			return MyUtil.singleEntityValue(cc);

		} else {
			return null;
		}

	}

	/**
	 * 单位资料
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String step3
	 */
	@RequestMapping(value = "forwardCompany", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardCompany(HttpServletRequest request, Long uid,
			HttpServletResponse response) {
		/*
		 * List<Borrowersbase> borrowerlist = borrowService
		 * .queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER)).getId());
		 */
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(userbasic.getId());
		if (borrowerlist.size() > 0) {
			Borrowerscompany company = borrowerlist.get(0)
					.getBorrowerscompany();
			return MyUtil.singleEntityValue(company);

		} else {
			return null;
		}

	}

	/**
	 * 财务状况
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return JSONObject step4
	 */
	@RequestMapping(value = "forwardFinanes", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardFinanes(HttpServletRequest request, Long uid,
			HttpServletResponse response) {
		/*
		 * List<Borrowersbase> borrowerlist = borrowService
		 * .queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER)).getId());
		 */
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(userbasic.getId());
		if (borrowerlist.size() > 0) {
			Borrowersfinanes finanes = borrowerlist.get(0)
					.getBorrowersfinanes();
			JSONObject josnFinanes = MyUtil.singleEntityValue(finanes);
			return josnFinanes;

		} else {
			return null;
		}

	}

	/**
	 * 联保情况
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String step 5
	 */
	@RequestMapping(value = "forwardOthercontact", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardOthercontact(HttpServletRequest request, Long uid,
			HttpServletResponse response) {
		/*
		 * List<Borrowersbase> borrowerlist = borrowService
		 * .queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER)).getId());
		 */
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(userbasic.getId());
		if (borrowerlist.size() > 0) {
			Borrowersothercontact othercontact = borrowerlist.get(0)
					.getBorrowersothercontact();
			return MyUtil.singleEntityValue(othercontact);

		} else {
			return null;
		}

	}

	/**
	 * 商业图片
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping(value = "forwardBusinessImg", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardBusinessImg(HttpServletRequest request, Long uid) {
		JSONObject res = borrowService.forwardBusinessImg(request, uid);
		return res;
	}

	/**
	 * 资料上传
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("forwardDataUpload")
	@ResponseBody
	public JSONObject forwardDataUpload(HttpServletRequest request, Long uid) {
		return borrowService.forwardDataUpload(request, uid);
	}

	/**
	 * 审核记录
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String step 8
	 */
	@RequestMapping(value = "forwardAuditRecord", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject forwardAuditRecord(HttpServletRequest request, Page page,
			Long uid, HttpServletResponse response) {
		/*
		 * List<Borrowersbase> borrowerlist = borrowService
		 * .queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER)).getId());
		 */
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		List borrowerlist = borrowService.queryBorrowerByUbaseid(page,
				userbasic.getId());
		if (borrowerlist.size() > 0) {

			List<Object> outall = new ArrayList<Object>();
			for (Object vlaue : borrowerlist) {
				outall.add(vlaue);
			}
			JSONArray jsonborrowers = MyUtil.sameEntityValue(outall);
			Map<String, Object> message = new HashMap<String, Object>();

			message.put("borrowerlist", jsonborrowers);
			message.put("pageNo", page.getPageNo());
			message.put("pagePerSize", page.getPagePerSize());
			message.put("dataCount", page.getDataCount());
			message.put("pageLast", page.getPageLast());

			return JSONObject.fromObject(message);

		} else {
			return null;
		}

	}

	/**
	 * 添加/修改借款人基本信息
	 * 
	 * @param borrower
	 *            Borrowersbase
	 * @return boolean
	 * @param basicId
	 *            用户基本信息id
	 */
	@RequestMapping(value = "borrowerbase", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addOrUptBorrower(Borrowersbase borrower, Long uid,
			HttpServletRequest request) {
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		Userrelationinfo reUser = user.getUserrelationinfo();
		if ("女".equals(borrower.getSex())) {
			reUser.setSex("0");
		} else if ("男".equals(borrower.getSex())) {
			reUser.setSex("1");
		}
		reUser.setMarriage(borrower.getMarryStatus());
		reUser.setIncome(borrower.getIncome());
		reUser.setQualifications(borrower.getQualifications());
		userBaseInfoService.update(user);

		Boolean addResult = borrowService.addOrUptBorrower(borrower, uid,
				request);
		Map<String, String> res = new HashMap<String, String>();
		if (addResult) {
			res.put("msg", "1");
		} else {
			res.put("msg", "0");
		}
		return JSONObject.fromObject(res);

	}

	/**
	 * 修改联系方式
	 * 
	 * @param contact
	 *            Borrowerscontact
	 * @param baseId
	 *            String
	 * @return boolean
	 */
	@RequestMapping(value = "borrowercontant", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addOrUptContact(
			@ModelAttribute() Borrowerscontact contact,
			Borrowersbase borrower) {

		borrowService.addOrUptContact(contact, borrower);
		Map<String, String> massage = new HashMap<String, String>();
		massage.put("msg", "1");
		return JSONObject.fromObject(massage);
	}

	/**
	 * 修改单位资料
	 * 
	 * @param company
	 *            Borrowerscompany
	 * @param baseId
	 *            String
	 * @return boolean
	 */
	@RequestMapping(value = "updateCompany", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateCompany(
			@ModelAttribute("Borrowerscompany") Borrowerscompany company,
			HttpServletRequest request) {
		borrowService.updateCompany(company, request);
		Map<String, String> message = new HashMap<String, String>();
		message.put("msg", "1");

		return JSONObject.fromObject(message);
	}

	/**
	 * 修改财务状况
	 * 
	 * @param finanes
	 *            Borrowersfinanes
	 * @param baseId
	 *            String
	 * @return boolean
	 */
	@RequestMapping(value = "updateFinanes", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateFinanes(
			@ModelAttribute("Borrowersfinanes") Borrowersfinanes finanes,
			HttpServletRequest request) {
		borrowService.updateFinanes(finanes, request);
		Map<String, String> message = new HashMap<String, String>();
		message.put("msg", "1");
		return JSONObject.fromObject(message);
	}

	/**
	 * 修改联保情况
	 * 
	 * @param othercontact
	 *            Borrowersfinanes
	 * @param baseId
	 *            String
	 * @return boolean
	 */
	@RequestMapping(value = "updateOthercontact", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateOthercontact(
			@ModelAttribute("Borrowersothercontact") Borrowersothercontact othercontact,
			HttpServletRequest request) {
		borrowService.updateOthercontact(othercontact, request);
		Map<String, String> message = new HashMap<String, String>();
		message.put("msg", "1");
		return JSONObject.fromObject(message);
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 *            Borrowersfiles
	 * @param baseId
	 *            String
	 * @return boolean
	 * @throws java.io.IOException
	 */
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject uploadFile(
			@ModelAttribute("Borrowersfiles") Borrowersfiles file,
			@RequestParam(required = false, defaultValue = "", value = "fileType") String fileType,
			HttpServletRequest request, Long uid, HttpServletResponse response,
			String type) throws IOException {
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(user.getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("files", borrowService.queryBorrowersfiles(
				borrowerlist.size() > 0 ? borrowerlist.get(0).getId() : null,
				request));
		return borrowService.uploadFile(request, response, file, uid, fileType);

	}

	/**
	 * 修改文件
	 * 
	 * @param file
	 *            Borrowersfiles
	 * @param baseId
	 *            String
	 * @return boolean
	 */
	@RequestMapping("updateFile")
	@ResponseBody
	public boolean updateFile(
			@ModelAttribute("Borrowersfiles") Borrowersfiles file,
			HttpServletRequest request) {
		return borrowService.updateFile(file, request);
	}

	/**
	 * 删除文件
	 * 
	 * @param file
	 *            Borrowersfiles
	 * @param baseId
	 *            String
	 * @return boolean
	 */
	@RequestMapping("deleteFile")
	@ResponseBody
	public boolean deleteFile(String fileId) {
		return borrowService.deleteFile(fileId);
	}

	/**
	 * 下载文件
	 * 
	 * @param fileId
	 *            String
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return boolean
	 */
	@RequestMapping("downFile")
	@ResponseBody
	public void downFile(String fileId, HttpServletRequest request,
			HttpServletResponse response) {
		borrowService.downFile(Long.parseLong(fileId), request, response);
	}

	/**
	 * 申请审核
	 * 
	 * @param baseId
	 *            借款人id
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return boolean
	 */
	@RequestMapping(value = "updateBorrower", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateBorrower(String baseId, Long uid,
			HttpServletRequest request, HttpServletResponse response) {
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		boolean res = borrowService.updateBorrower(baseId, user, request,
				response);
		Map<String, String> message = new HashMap<String, String>();
		if (res) {
			message.put("msg", "1");
		} else {
			message.put("msg", "0");
		}
		return JSONObject.fromObject(message);

	}

}
