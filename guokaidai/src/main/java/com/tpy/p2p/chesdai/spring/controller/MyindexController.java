package com.tpy.p2p.chesdai.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.*;
import com.tpy.p2p.chesdai.spring.util.IpsJudge;
import com.tpy.p2p.chesdai.util.GenerateLinkUtils;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.RegisterInfo;
import com.tpy.p2p.pay.payservice.RegisterService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baofoo.p2p.dto.request.BindBaofooPage;
import com.baofoo.p2p.service.RequestService;
import com.cddgg.commons.normal.Validate;
import com.tpy.base.annotation.LoginedUser;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Preset;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Usermessage;

import freemarker.template.TemplateException;

/**
 * 个人中心
 * 
 * @author My_Ascii
 * 
 */
@Controller
@RequestMapping("/member")
@CheckLogin(value = CheckLogin.WEB)
public class MyindexController {

	/**
	 * 注入MyindexService
	 */
	@Resource
	private MyindexService myindexService;

	/**
	 * 会员中心首页接口
	 */
	@Resource
	private MemberCenterService memberCenterService;

	/**
	 * 注入EmailService
	 */
	@Resource
	private EmailService emailService;

	/**
	 * 注入SmsService
	 */
	@Resource
	private SmsService smsService;
	
	private final Log log=LogFactory.getLog(getClass());
	

	/**
	 * ProductService
	 */
	@Resource
	VisitorController visitor;

	@Resource
	private UserInfoServices infoServices;

	@Resource
	private PresetService presetService;

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private LoanInfoService loanInfoService;

	/**
	 * HibernateSupport
	 */
	@Resource
	private  RequestService requestService;

	/**
	 * HibernateSupport
	 */
	@Resource
    HibernateSupport dao;

	/**
	 * 返回的提示信息
	 */
	private String msg = "msg";

	/**
	 * 返回的提示状态
	 */
	private String result = "result";

	/**
	 * 是否通过验证
	 */
	String isPass = "false";

	/**
	 * 邮箱验证初始化
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return 返回邮箱验证页面
	 */
	@RequestMapping("/mail")
	//@CheckFundsSafe
	public String mailValidate(HttpServletRequest request,
			HttpServletResponse response) {

//		Map<String,String> map = sysService.getSysConfig();
//		request.setAttribute("sysmap",map);
//		System.out.println("map:"+map.size()+"|"+map.get("sys_name"));
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute( Constant.SESSION_USER);
		u = myindexService.queryUserinfo(u.getId());
		request.getSession().setAttribute(Constant.SESSION_USER,u);
		return "WEB-INF/views/member/safetycenter/safetycenter";
	}

	@RequestMapping("/openIps")
	public String gotoIps(HttpServletRequest request,
			HttpServletResponse response) {
		return "WEB-INF/views/member/safetycenter/verify_phone";
	}
	/**
	 * 身份验证
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return 返回身份验证页面
	 */
	@RequestMapping("/identity")
	public String identityValidate(HttpServletRequest request) {
		return initIdentity(request);
	}

	/**
	 * 跳转到我的认购记录
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@LoginedUser
	@RequestMapping("/my-product-list")
	public String toMyProductList(HttpServletRequest request) {

		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.ATTRIBUTE_USER);

		request.setAttribute(
				"during",
				dao.findBySql(
						"SELECT DISTINCT a.day_during,b.day_type FROM product a,product_type b,product_pay_record c WHERE a.type=b.id AND a.id=c.product_id AND c.userbasic_id = ?",
						user.getId()));

		return "WEB-INF/views/member/product-list";
	}

	/**
	 * 初始化身份验证页面
	 * 
	 * @param request
	 *            HttpServletRequest request
	 * @return String
	 */
	public String initIdentity(HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		u = myindexService.queryUserinfo(u.getId());
		request.setAttribute("u", u);
		request.setAttribute("uname", u.getName());
		request.setAttribute("ucardId", u.getUserrelationinfo().getCardId());
		return "WEB-INF/views/member/safetycenter/verify_identity";
	}

	/**
	 * 安全问题验证
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return 返回安全问题验证页面
	 */
	@RequestMapping("/safety_quuestion")
	public String safetyQuuestionValidate(HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		if (myindexService.querySecurityproblem(u.getId()).size() > 0) {
			isPass = "true";
		}
		request.setAttribute("isPass", isPass);
		request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
		return "WEB-INF/views/member/safetycenter/verify_question";
	}

	/**
	 * 手机验证
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return 返回手机验证页面
	 */
	@RequestMapping("/phone")
	public String phoneValidate(HttpServletRequest request,
			HttpServletResponse response) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
		return "WEB-INF/views/member/safetycenter/verify_phone";
	}

	/**
	 * 跳转到上传头像页面
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/fowardUploadPhoto")
	public String fowardUploadPhoto(HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
		return "WEB-INF/views/member/personalinfo/upload_photo";
	}

	
	
	
	
	/**
	 * 
	 * @param page
	 *            Page
	 * @param request
	 *            HttpServletRequest
	 * @return Object
	 */
	@LoginedUser
	@ResponseBody
	@RequestMapping("/loglist")
	public Object loglist(Page page, HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		page.setData(myindexService.queryLog(page, u.getId()));
		return page;
	}

	/**
	 * 跳转到登陆日志页面
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/fowardLogging")
	public String fowardLogging(HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		return "WEB-INF/views/member/systeminfo/logging";
	}

	/**
	 * 查询用户系统消息
	 * 
	 * @param page
	 *            分页对象
	 * @param id
	 *            消息id
	 * @param unRead
	 *            是否已读
	 * @param request
	 *            请求
	 * @return 返回.jsp
	 */
	@RequestMapping("/fowardSysteminfo")
	public String querySysteminfo(
			@ModelAttribute("PageModel") PageModel page,
			@RequestParam(value = "id", defaultValue = "", required = false) Long id,
			@RequestParam(value = "unRead", defaultValue = "", required = false) Integer unRead,
			HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		return querySystemMessage(page, id, unRead, request);
	}

	/**
	 * 查询用户系统消息
	 * 
	 * @param page
	 *            分页对象
	 * @param id
	 *            消息id
	 * @param unRead
	 *            是否已读
	 * @param request
	 *            请求
	 * @return 返回.jsp
	 */
	public String querySystemMessage(
			@ModelAttribute("PageModel") PageModel page,
			@RequestParam(value = "id", defaultValue = "", required = false) Long id,
			@RequestParam(value = "unRead", defaultValue = "", required = false) Integer unRead,
			HttpServletRequest request) {
		// 取到登录用户sesssion
		Userbasicsinfo user = queryUser(request);
		// 如果查看单条信息
		if (id != null && unRead != null && !id.toString().trim().equals("")
				&& !unRead.toString().trim().equals("")) {
			Usermessage message = memberCenterService.queryById(id, unRead);
			request.setAttribute("id", message.getId());
		}
		// 查询用户已读消息条数
		Object read = memberCenterService.queryIsReadCount(user.getId(), 1);
		// 查询用户系统消息条数
		Object obj = memberCenterService.queryUserMessageCount(user.getId());
		page.setTotalCount(Integer.parseInt(obj.toString()));
		// 查询用户系统消息
		List list = memberCenterService.queryUserMessage(user.getId(), page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("count", Integer.parseInt(obj.toString()));
		request.setAttribute("read", read);
		request.setAttribute("unRead", Integer.parseInt(obj.toString())
				- Integer.parseInt(read.toString()));
		return "WEB-INF/views/member/systeminfo/systeminfo";
	}

	/**
	 * 登录用户session
	 * 
	 * @param request
	 *            请求
	 * @return 用户基本信息
	 */
	public Userbasicsinfo queryUser(HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		return user;
	}

	/**
	 * 修改头像具体操作
	 * 
	 * @param imgurl
	 *            头像路径
	 * @param uid
	 *            会员id
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("/updatePhoto")
	@ResponseBody
	public String updatePhoto(String imgurl, String uid,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			Userbasicsinfo u = myindexService
					.queryUserinfo(Long.parseLong(uid));
			u.getUserrelationinfo().setImgUrl(imgurl);
			myindexService.update(u);
			request.getSession().setAttribute(Constant.SESSION_USER, u);
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "0";
		}

		return result;
	}

	/**
	 * 上传头像具体操作
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 * @throws java.io.IOException
	 *             异常
	 */
	@RequestMapping("/uploadPhoto")
	public String uploadPhoto(HttpServletRequest request) throws IOException {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		u.getUserrelationinfo().setImgUrl(
				myindexService.upload(request).get("imgurl").toString());
		myindexService.update(u);
		request.getSession().setAttribute(Constant.SESSION_USER, u);
		request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
		return "WEB-INF/views/member/personalinfo/upload_photo";
	}

	/**
	 * 发送邮箱激活邮件
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return boolean
	 */
	@RequestMapping("/replymail")
	@ResponseBody
	public String replyMail(HttpServletRequest request) {
		return myindexService.replyMail(request);
	}

	/**
	 * 通过发送邮件重置邮箱
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/resetMail")
	@ResponseBody
	public String resetMail(HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(
				Constant.SESSION_USER);
		request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
		u = myindexService.queryUserinfo(u.getId());
		try {
			// 发送激活邮件
			try {
				myindexService.sendResetEmail(u, request);
			} catch (Exception e) {
				e.printStackTrace();
				result = "0";
			}
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "0";
		}
		return result;
	}

	/**
	 * 发送修改邮箱的邮件
	 * 
	 * @param u
	 *            用户
	 * @param request
	 *            HttpServletRequest
	 * @throws java.io.IOException
	 *             异常
	 * @throws TemplateException
	 *             异常
	 */
	public void sendResetEmail(Userbasicsinfo u, HttpServletRequest request)
			throws IOException, TemplateException {
		// 收件人地址
		String address = u.getUserrelationinfo().getEmail();
		String userName = u.getName();

		String url = GenerateLinkUtils.generateUptEmailLink(u, request);
		Map<String, String> map = new HashMap<String, String>();
		if (userName == null || userName.equals("")) {
			map.put("name", "亲爱的用户");
		} else {
			map.put("name", userName);
		}

		map.put("emailActiveUrl", url);
		String[] msg = emailService.getEmailResources("uptemail-activate.ftl",map);

		// 发送邮件链接地址
		emailService.sendEmail(msg[0], msg[1], address);
	}

	/**
	 * 邮箱激活
	 * 
	 * @param id
	 *            用户id
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/emailValidate")
	public String emailValidate(String id, HttpServletRequest request) {
		if (Validate.emptyStringValidate(id)) {
			if ((id.indexOf("+") == -1 || id.indexOf("/") == -1)
					&& id.indexOf("=") == -1) {
				try {
					id = URLDecoder.decode(id, "UTF-8");
				} catch (UnsupportedEncodingException e) {
				}
			}
			String idStr = StringUtil.correctPassword(id);
			Userbasicsinfo user = myindexService.queryUserinfo(Long
					.parseLong(StringUtil.correctPassword(id)));
			user.getUserrelationinfo().setEmailisPass(1);
			request.setAttribute("u", user);
			try {
				myindexService.update(user);
				request.getSession().setAttribute(Constant.SESSION_USER, user);
				return "WEB-INF/views/success";
			} catch (Exception e) {
				e.printStackTrace();
				return "WEB-INF/views/member/safetycenter/ev_failed";
			}
		} else {
			return "WEB-INF/views/member/safetycenter/ev_failed";
		}
	}

	/**
	 * 身份验证具体操作
	 * 
	 * @param name
	 *            会员真实姓名
	 * @param cardId
	 *            会员身份证号
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/identityValidateImpl")
	@ResponseBody
	public String identityValidateImpl(String name, String cardId,
			HttpServletRequest request) {
		return myindexService.identityValidateImpl(name, cardId, request);
	}

	/**
	 * 设置会员安全问题
	 * 
	 * @param id
	 *            用户id
	 * @param question01
	 *            问题1
	 * @param question02
	 *            问题2
	 * @param anwser01
	 *            答案1
	 * @param anwser02
	 *            答案2
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/setSafetyProblem")
	@ResponseBody
	public String setSafetyProblem(String id, String question01,
			String anwser01, String question02, String anwser02,
			HttpServletRequest request) {
		return myindexService.verify_question(question01, anwser01, question02,
				anwser02, request);
	}

	/**
	 *
	 * @param id
	 * @param tradePwd
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/setTradePwd")
	@ResponseBody
	public String setTradePwd(String tradePwd,String confirmTradePwd,HttpServletRequest request){
		return myindexService.setTradePassword(tradePwd, confirmTradePwd, request);
	}

	/**
	 *
	 * @param id
	 * @param tradePwd
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/resetTradePwd")
	@ResponseBody
	public String resetTradePwd(String smsCode,String tradePwd,String confirmTradePwd,HttpServletRequest request){
		return myindexService.resetTradePassword(smsCode, tradePwd, confirmTradePwd, request);
	}


	@RequestMapping(value="/getOldTradePwd")
	@ResponseBody
	public String getOldTradePwd(String oldpwd , HttpServletRequest request){
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);

		if(oldpwd.equals(u.getTransPassword())){
			return "success";
		}
		return "fail";
	}

	/**
	 * 检查环迅账号
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkIpsAccount")
	@ResponseBody
	public String checkIpsAccount(HttpServletRequest request){
		return myindexService.checkIpsAccount(request);
	}

	/**
	 * 发送短信验证码
	 * 
	 * @param phone
	 *            手机号码
	 * @param request
	 *            HttpServletRequest
	 * @throws Exception
	 *             抛出异常
	 * @return String
	 */
	@RequestMapping("/sendSMS")
	@ResponseBody
	public String sendSMS(String phone, HttpServletRequest request)
			throws Exception {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		Userbasicsinfo user = infoServices.queryBasicsInfoById(u.getId().toString());
		try {
			user.getUserrelationinfo().setPhone(phone);
			request.getSession().setAttribute(Constant.SESSION_USER, user);
			smsService.sendCode(user);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}

	/**
	 * 手机验证
	 * 
	 * @param phone  手机号码
	 * @param smscode  手机验证码
	 * @param request  HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/validatePhone")
	@ResponseBody
	public String validatePhone(String phone, String smscode,
			HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		//可能出现用户长时间没处理而session过期
		if(u==null){
			return "redirect:/visitor/to-login";
		}
		return myindexService.verifyPhone(phone, smscode, request);
		//如果短信验证过了
		/*
		if(myindexService.verifyPhone(phone, smscode, request).equals("1")){
			//如果邮箱还没验证
			if(u.getUserrelationinfo().getEmailisPass()==null||u.getUserrelationinfo().getEmailisPass()!=1){
				return "redirect:/member/mail";
			}else{
				//否则返回个人中心
				return "member_index/member_center";
			}
		}else{
			return "redirect:/member/mail";
		}
		*/
	}

	/**
	 * 手机验证
	 *
	 * @param phone
	 *            手机号码
	 * @param smscode
	 *            手机验证码
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/validateNewPhone")
	@ResponseBody
	public String validateNewPhone(String phone, String phone2,String smscode,
								HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		//可能出现用户长时间没处理而session过期
		if(u==null){
			return "redirect:/visitor/to-login";
		}
		return myindexService.verifyPhone(phone, smscode, request);
		//如果短信验证过了
		/*
		if(myindexService.verifyPhone(phone, smscode, request).equals("1")){
			//如果邮箱还没验证
			if(u.getUserrelationinfo().getEmailisPass()==null||u.getUserrelationinfo().getEmailisPass()!=1){
				return "redirect:/member/mail";
			}else{
				//否则返回个人中心
				return "member_index/member_center";
			}
		}else{
			return "redirect:/member/mail";
		}
		*/
	}

	/**
	 * 身份验证上传附件
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 * @throws java.io.IOException
	 *             异常
	 */
	@RequestMapping("/uploadFile")
	public String uploadFile(HttpServletRequest request) throws IOException {
		myindexService.upload(request);
		return initIdentity(request);
	}

	/**
	 * 初始化注册托管账户页面
	 * 
	 * @param request
	 *            request
	 * @return 返回页面地址
	 */
	@RequestMapping("openIps")
	public String openIps(HttpServletRequest request) {
		// Userbasicsinfo userbasics = (Userbasicsinfo) request.getSession()
		// .getAttribute(Constant.SESSION_USER);
		Userbasicsinfo u = myindexService
				.queryUserinfo(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		String url = IpsJudge.judge(u);
		if (myindexService.querySecurityproblem(u.getId()).size() > 0) {
			isPass = "true";
		}
		request.setAttribute("isPass", isPass);
		// request.setAttribute("u", userbasics);
		if (null != url) {
			return url;
		} else {
			request.getSession().setAttribute(Constant.SESSION_USER, u);
			return "WEB-INF/views/member/safetycenter/ipsregistration";
		}
	}

	/**
	 * 注册ips账户
	 * 
	 * @param userId
	 *            用户id
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("ipsRegistration")
	public String ipsRegistration(String userId, HttpServletRequest request) {
		// 得到当前用户信息
		Userbasicsinfo userbasics = myindexService
				.queryUserinfo(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());

		RegisterInfo register = new RegisterInfo();
		register.setpIdentNo(userbasics.getUserrelationinfo().getCardId());
		register.setpRealName(userbasics.getName());
		register.setpMobileNo(userbasics.getUserrelationinfo().getPhone());
		register.setpEmail(userbasics.getUserrelationinfo().getEmail());
		register.setpMemo1(userbasics.getId().toString());
		Map<String, String> map = null;
		try {
			String registerXml = com.tpy.p2p.pay.util.ParseXML.registration(register);
			map = RegisterService.registerCall(registerXml);
			map.put("url", PayURL.REGISTRATIONTESTURL);
			request.setAttribute("map", map);
			return "WEB-INF/views/central_news";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 注册宝付账户
	 * 
	 * @param userId
	 *            用户id
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("bfRegistration")
	public String bfRegistration(String userId, HttpServletRequest request,HttpServletResponse  response) {
		// 得到当前用户信息
		Userbasicsinfo userbasics = myindexService
				.queryUserinfo(((Userbasicsinfo) request.getSession()
						.getAttribute(Constant.SESSION_USER)).getId());
		/*BindBaofooDto bindBaofooDto = new BindBaofooDto();
		// RequestService requestService = new RequestService(true,"100000701","100000675","n725d5gsb7mlyzzw");
		 bindBaofooDto.setHas_bf_account("0"); //没有宝付帐号
		 bindBaofooDto.setAccount_type("1");//使用手机帐号
		 bindBaofooDto.setReal_name(userbasics.getName());//真实姓名
		 bindBaofooDto.setId_card(userbasics.getUserrelationinfo().getCardId());//身份证
		 bindBaofooDto.setBf_account(userbasics.getUserrelationinfo().getPhone());//手机号码
		 bindBaofooDto.setUser_id(userbasics.getId().toString());*/
		//page invoke
		 BindBaofooPage bindBaofooPage = new BindBaofooPage();
		 bindBaofooPage.setId_card(userbasics.getUserrelationinfo().getCardId());
		 bindBaofooPage.setName(userbasics.getName());
		 bindBaofooPage.setUser_id(userbasics.getId().toString());
		 bindBaofooPage.setPage_url(Constant.REGISTRATION);
		 bindBaofooPage.setReturn_url(Constant.ASYNCHRONISMREGISTRATION);
		 bindBaofooPage.setBf_account(userbasics.getUserrelationinfo().getPhone());
//		RegisterInfo register = new RegisterInfo();
//		register.setpIdentNo(userbasics.getUserrelationinfo().getCardId());
//		register.setpRealName(userbasics.getName());
//		register.setpMobileNo(userbasics.getUserrelationinfo().getPhone());
//		register.setpEmail(userbasics.getUserrelationinfo().getEmail());
//		register.setpMemo1(userbasics.getId().toString());
		try {
		//	String registerXml = ParseXML.registration(register);
		//	map = RegisterService.registerCall(registerXml);
		//	map.put("url", PayURL.REGISTRATIONTESTURL);
		requestService.page_BindBaoofooAccount(bindBaofooPage, response);
		} catch (Exception e) {
			log.error("绑定宝付账户出现异常", e);
		}
		return null;
	}
	/**
	 * 注册ips账户
	 * 
	 * @param userId
	 *            用户id
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("ipsRegistrationone")
	public String ipsRegistrationone(String userId, HttpServletRequest request) {

		Userbasicsinfo userbasics = myindexService.queryUserinfo(Long.valueOf(userId));
		RegisterInfo register = new RegisterInfo();
		register.setpIdentNo(userbasics.getUserrelationinfo().getCardId());
		register.setpRealName(userbasics.getName());
		register.setpMobileNo(userbasics.getUserrelationinfo().getPhone());
		register.setpEmail(userbasics.getUserrelationinfo().getEmail());
		register.setpMemo1(userbasics.getId().toString());
		Map<String, String> map = null;
		try {
			String registerXml = com.tpy.p2p.pay.util.ParseXML.registration(register);
			map = RegisterService.registerCall(registerXml);
			map.put("url", PayURL.REGISTRATIONTESTURL);
			request.setAttribute("map", map);
			return "WEB-INF/views/central_news";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 用户注册成功
	 * 
	 * @param request
	 *            HttpServletRequest
	 */
	@RequestMapping("regis")
	@ResponseBody
	public void regis(HttpServletRequest request) {
		Userbasicsinfo userbasicsinfo = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		Userbasicsinfo user = myindexService.queryUserinfo(userbasicsinfo
				.getId());
		request.setAttribute("u", user);
		request.setAttribute(Constant.SESSION_USER, user);
	}

	/**
	 * 
	 * @param email
	 *            邮箱
	 * @param id
	 *            用户id
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/uptEmail")
	@ResponseBody
	public String uptEmail(String email, String id, HttpServletRequest request) {
		try {
			Userbasicsinfo user = myindexService.queryUserinfo(Long
					.parseLong(id));
			user.getUserrelationinfo().setEmail(email);
			user.getUserrelationinfo().setEmailisPass(0);
			myindexService.update(user);
			request.getSession().setAttribute(Constant.SESSION_USER, user);
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "0";
		}
		return result;
	}

	/**
	 * 修改手机号
	 * 
	 * @param id
	 *            用户id
	 * @param newPhone
	 *            新手机号
	 * @param question01
	 *            问题1
	 * @param anwser01
	 *            答案1
	 * @param question02
	 *            问题2
	 * @param anwser02
	 *            答案2
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("uptPhone")
	@ResponseBody
	public String uptPhone(String id, String newPhone, String question01,
			String anwser01, String question02, String anwser02,
			HttpServletRequest request) {
		boolean flag = myindexService.checkSafeQuestions(id, question01,
				anwser01, question02, anwser02);
		if (flag) {
			Userbasicsinfo user = myindexService.queryUserinfo(Long
					.parseLong(id));
			user.getUserrelationinfo().setPhone(newPhone);
			myindexService.update(user);
			request.getSession().setAttribute(Constant.SESSION_USER, user);
			return "1";
		} else {
			return "0";
		}
	}

	/**
	 * 根据手机验证码和回答安全问题来修改邮箱
	 * @param newemail 新邮箱
	 * @param request HttpServletRequest
	 * @return String
	 */
	@RequestMapping("uptEmail1_bak")
	@ResponseBody
	public String uptEmail1_bak(String id, String newemail, String question01,
			String anwser01, String question02, String anwser02,
			HttpServletRequest request) {
		Userbasicsinfo u = myindexService.queryUserinfo(Long.parseLong(id));// 根据用户id查询用户
		boolean flag = myindexService.checkSafeQuestions(id, question01,
				anwser01, question02, anwser02);
		if (flag) {
			u.getUserrelationinfo().setEmail(newemail);
			u.getUserrelationinfo().setEmailisPass(0);
			myindexService.update(u);
			request.getSession().setAttribute(Constant.SESSION_USER, u);
			return "1";
		} else {
			request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
			return "0";
		}
	}

	@RequestMapping("uptEmail1")
	@ResponseBody
	public String uptEmail1( String newemail,HttpServletRequest request) {
		Userbasicsinfo u = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		if (u.getUserrelationinfo().getEmail()!=null) {
			u.getUserrelationinfo().setEmail(newemail);
			u.getUserrelationinfo().setEmailisPass(0);
			myindexService.update(u);
			try {
				myindexService.sendResetEmail(u, request);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute(Constant.SESSION_USER, u);
			return "1";
		} else {
			request.setAttribute("u", myindexService.queryUserinfo(u.getId()));
			return "0";
		}
	}


	/**
	 * 根据编号删除系统消息
	 * 
	 * @param ids
	 *            要删除的系统消息的编号
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("/deletes")
	@ResponseBody
	public String deletes(
			@RequestParam(value = "ids", defaultValue = "", required = false) String ids,
			HttpServletRequest request) {
		try {
			// 删除系统消息
			memberCenterService.deletes(ids);
		} catch (Exception e) {
			LOG.info("删除系统消息错误" + e.getMessage());
			return "failed";
		}
		return "successed";
	}

	/**
	 * 读系统消息
	 * 
	 * @param id
	 *            消息id
	 * @param request
	 *            HttpServletRequest
	 * @return Map<String, Integer>
	 */
	@RequestMapping("/readUMSG")
	@ResponseBody
	public Map<String, Integer> readUMSG(String id, HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		Map<String, Integer> map = new HashMap<String, Integer>();
		myindexService.read(Long.parseLong(id));
		// 查询用户已读消息条数
		Object read = memberCenterService.queryIsReadCount(user.getId(), 1);
		// 查询用户系统消息条数
		Object obj = memberCenterService.queryUserMessageCount(user.getId());
		map.put("count", Integer.parseInt(obj.toString()));
		map.put("read", Integer.parseInt(read.toString()));
		map.put("unRead",
				Integer.parseInt(obj.toString())
						- Integer.parseInt(read.toString()));
		return map;
	}

	/**
	 * 修改邮箱页面
	 * 
	 * @param id
	 *            用户id
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	@RequestMapping("forwardUptEmail")
	public String forwardUptEmail(String id, HttpServletRequest request) {
		if (Validate.emptyStringValidate(id)) {
			Userbasicsinfo user = myindexService.queryUserinfo(Long.parseLong(StringUtil.correctPassword(id)));
			request.setAttribute("u", user);
			//return "WEB-INF/views/resetEmail";
			return "WEB-INF/views/success";
		} else {
			return "WEB-INF/views/visitor/index";
		}
	}

	/**
	 * 安全认证
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping("safeVerify")
	@CheckFundsSafe
	public String safeVerify(HttpServletRequest request,
			HttpServletResponse response) {
		return "/WEB-INF/views/visitor/index";
	}

	/**
	 * 验证安全问题是否正确
	 * 
	 * @param id
	 *            用户id
	 * @param question01
	 *            安全问题1
	 * @param anwser01
	 *            答案1
	 * @param question02
	 *            安全问题2
	 * @param anwser02
	 *            答案2
	 */
	@RequestMapping("checkSafeQuestions")
	@ResponseBody
	public boolean checkSafeQuestions(String id, String question01,
			String anwser01, String question02, String anwser02) {
		return myindexService.checkSafeQuestions(id, question01, anwser01,
				question02, anwser02);
	}

	/**
	 * 兑换ucode
	 * 
	 * @return
	 */
	@RequestMapping("uCode.htm")
	@ResponseBody
	public String uCode(String ucode, HttpServletRequest request) {

		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		Long loansignId = loanSignQuery.getYouxuan().getId();
		Preset preset = presetService.getPresetByUserId(user.getId(),loansignId);
		if (preset != null && preset.getUcode().equals(ucode)) {
			if (preset != null && preset.getSuccess() == 1) {
				return "2";
			} else {
				preset.setSuccess(1);
				// 修改兑换成功字段
				presetService.updateUcode(preset);
				return "1";
			}
		} else {
			return "0";
		}
	}

	/**
	 * @param request
	 * @return
	 */
	@RequestMapping("ucodeSuccess.htm")
	public String ucodeSuccess(HttpServletRequest request) {
		Loansign loan = loanSignQuery.getYouxuan();
		request.setAttribute("youxuan", loan);
		return "/WEB-INF/views/member/ucodeSuccess";
	}
}
