package com.tpy.p2p.chesdai.spring.controller.borrow;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.admin.spring.service.MessagesettingService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.BorrowersApply;
import com.tpy.p2p.chesdai.entity.Borrowersbase;
import com.tpy.p2p.chesdai.entity.Borrowerscompany;
import com.tpy.p2p.chesdai.entity.Borrowerscontact;
import com.tpy.p2p.chesdai.entity.Borrowersfiles;
import com.tpy.p2p.chesdai.entity.Borrowersfinanes;
import com.tpy.p2p.chesdai.entity.LoansignType;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.borrow.BorrowService;

/**
 * 我要借款
 * 
 * @author My_Ascii
 * 
 */
@Controller
@RequestMapping("/borrow")
@CheckLogin(value = CheckLogin.WEB)
public class BorrowController {

	/**
	 * 注入borrowService
	 */
	@Resource
	private BorrowService borrowService;

	@Resource
	private MessagesettingService messagesettingService;

	@Resource
	private HibernateSupport dao;

	/**
	 * 申请贷款类型 判断用户是否已经成为借款人
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("borr-type")
	public String borrType(HttpServletRequest request) {

		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);

		request.setAttribute("base", dao.findObject(
				"FROM Borrowersbase b WHERE b.userbasicsinfo.id=?",
				user.getId()));

		return "/WEB-INF/views/member/borrow/step-type";

	}

	/**
	 * 开始申请
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return
	 */
	@CheckFundsSafe
	@RequestMapping("start-apply")
	public String startApply(HttpServletRequest request,
			HttpServletResponse response, Integer type) {
		System.out.println(this);
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);

		request.setAttribute("curType", type);

		synchronized (user.getId()) {

			Borrowersbase base = (Borrowersbase) dao.findObject(
					"FROM Borrowersbase b WHERE b.userbasicsinfo.id=?",
					user.getId());

			if (base != null && base.getAuditResult() == 1) {// 已经通过了

				borrowService.forwardDataUpload(request, response);

				return applyBorrowers(user, base, type, request);

			} else if (base == null) {// 该用户有成为借款人的意向，但是借款人表未添加对应数据

				base = new Borrowersbase();
				base.setAuditResult(0);
				base.setUserbasicsinfo(user);

				borrowService.initBorrower(base);
			}

		}
		return forwardPersoninfo(request, response);

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
	private String applyBorrowers(Userbasicsinfo user, Borrowersbase base,
			Integer type, HttpServletRequest request) {
		// 查询borrow验证信息
		List<LoansignType> loantype = borrowService.getLoanSignTypeById(type
				.toString());
		request.setAttribute("loantype", loantype.size() > 0 ? loantype.get(0)
				: null);
		if (type == 1) {
			request.setAttribute("type", "太平洋宝");
		} else if (type == 2) {
			request.setAttribute("type", "转盈宝");
		}
		return "/WEB-INF/views/member/borrow/apply-borrower";
	}

	/**
	 * 申请结果
	 * 
	 * @return
	 */
	@RequestMapping("my-apply-result")
	public String applyResult(HttpServletRequest request, Integer type) {
		System.out.println(this);
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		if (user != null) {
			request.setAttribute(
					"list",
					dao.find(
							"FROM BorrowersApply a WHERE a.borrowersbase.userbasicsinfo.id=? order by a.time desc",
							user.getId()));

			request.setAttribute("curType", type);

			return "/WEB-INF/views/member/borrow/apply-result";
		} else {
			return "redirect:/visitor/to-login";
		}
	}

	/**
	 * 提交申请
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("submit-apply")
	public String submitApply(HttpServletRequest request,
			@ModelAttribute() BorrowersApply apply) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		apply.setUserbasicsinfo(user);
		apply.setCash(apply.getCash() == null ? 0.0 : apply.getCash());
		apply.setRate(apply.getRate() / 100);
		borrowService.submitApply(user, apply);
		return "success";
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
	@RequestMapping("forwardPersoninfo")
	public String forwardPersoninfo(HttpServletRequest request,
			HttpServletResponse response) {
		// 查询用户基本信息
		Userbasicsinfo userbasic = borrowService
				.queryUserinfo(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(userbasic.getId());

		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("userbasic", userbasic);// 用户基本信息
		request.setAttribute("age", StringUtil.getAgeByIdCard(userbasic
                .getUserrelationinfo().getCardId()));

		return "/WEB-INF/views/member/borrow/step1";
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
	@RequestMapping("forwardContact")
	public String forwardContact(HttpServletRequest request,
			HttpServletResponse response) {
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("contact", borrowerlist.size() > 0 ? borrowerlist
				.get(0).getBorrowerscontact() : null);
		return "/WEB-INF/views/member/borrow/step2";
	}

	/**
	 * 单位资料
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("forwardCompany")
	public String forwardCompany(HttpServletRequest request,
			HttpServletResponse response) {
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("company", borrowerlist.size() > 0 ? borrowerlist
				.get(0).getBorrowerscompany() : null);
		return "/WEB-INF/views/member/borrow/step3";
	}

	/**
	 * 财务状况
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("forwardFinanes")
	public String forwardFinanes(HttpServletRequest request,
			HttpServletResponse response) {
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("finanes", borrowerlist.size() > 0 ? borrowerlist
				.get(0).getBorrowersfinanes() : null);
		return "/WEB-INF/views/member/borrow/step4";
	}

	/**
	 * 联保情况
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("forwardOthercontact")
	public String forwardOthercontact(HttpServletRequest request,
			HttpServletResponse response) {
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("othercontact",
				borrowerlist.size() > 0 ? borrowerlist.get(0)
						.getBorrowersothercontact() : null);
		return "/WEB-INF/views/member/borrow/step5";
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
	@RequestMapping("forwardBusinessImg")
	public String forwardBusinessImg(HttpServletRequest request,
			HttpServletResponse response) {
		return borrowService.forwardBusinessImg(request, response);
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
	public String forwardDataUpload(HttpServletRequest request,
			HttpServletResponse response) {
		return borrowService.forwardDataUpload(request, response);
	}

	/**
	 * 审核记录
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("forwardAuditRecord")
	public String forwardAuditRecord(HttpServletRequest request,
			HttpServletResponse response) {
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		return "/WEB-INF/views/member/borrow/step8";
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
	@RequestMapping("borrowerbase")
	public String addOrUptBorrower(Borrowersbase borrower,
			HttpServletRequest request) {
		if (null == borrower.getId()) {
			borrowService.initBorrower(borrower);
		}
		borrowService.addOrUptBorrower(borrower, request);

		return "redirect:forwardContact";

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
	@RequestMapping("borrowercontant")
	public String addOrUptContact(@ModelAttribute() Borrowerscontact contact,
			Borrowersbase borrower) {

		borrowService.addOrUptContact(contact, borrower);

		return "redirect:forwardCompany.htm";
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
	@RequestMapping("updateCompany")
	public String updateCompany(
			@ModelAttribute("Borrowerscompany") Borrowerscompany company,
			HttpServletRequest request) {
		borrowService.updateCompany(company, request);
		return "redirect:forwardFinanes.htm";
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
	@RequestMapping("updateFinanes")
	public String updateFinanes(
			@ModelAttribute("Borrowersfinanes") Borrowersfinanes finanes,
			HttpServletRequest request) {
		borrowService.updateFinanes(finanes, request);
		return "redirect:forwardOthercontact.htm";
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
	@RequestMapping("updateOthercontact")
	public String updateOthercontact(
			@ModelAttribute("Borrowersothercontact") Borrowersothercontact othercontact,
			HttpServletRequest request) {
		borrowService.updateOthercontact(othercontact, request);
		return "redirect:forwardBusinessImg.htm";
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
	@RequestMapping("uploadFile")
	public String uploadFile(
			@ModelAttribute("Borrowersfiles") Borrowersfiles file,
			String fileType, HttpServletRequest request,
			HttpServletResponse response, String type) throws IOException {
		List<Borrowersbase> borrowerlist = borrowService
				.queryBorrowerByUbaseid(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		request.setAttribute("borrower",
				borrowerlist.size() > 0 ? borrowerlist.get(0) : null);
		request.setAttribute("files", borrowService.queryBorrowersfiles(
				borrowerlist.size() > 0 ? borrowerlist.get(0).getId() : null,
				request));
		request.setAttribute("curType", type);
		return borrowService.uploadFile(request, response, file, fileType);
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
	@RequestMapping("updateBorrower")
	@ResponseBody
	public boolean updateBorrower(String baseId, HttpServletRequest request,
			HttpServletResponse response) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		return borrowService.updateBorrower(baseId, user, request, response);

	}

}
