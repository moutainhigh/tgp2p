package com.tpy.p2p.APP.admin.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.util.AccessTypeJudge;
import com.tpy.base.util.LOG;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.service.RegistrationService;
import com.tpy.p2p.chesdai.util.GetIpAddress;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.service.MemberCenterService;
import com.tpy.p2p.chesdai.spring.service.MyindexService;

/**
 * 注册
 * 
 * @author lsy
 * 
 */
@Controller
@RequestMapping("/Appregister")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class AppRegistrationController {

	/**
	 * 用户注册接口
	 */
	@Resource
	private RegistrationService registrationService;

	/** memberCenterService 信息接口 */
	@Resource
	private MemberCenterService memberCenterService;
	@Resource
	private MyindexService myindexService;

	/**
	 * 用户注册
	 * 
	 * @param userName
	 *            用户名
	 * @param email  用户邮箱
	 * @param pwd   用户登录密码
	 * @param captcha   验证码
	 * @param number  会员编号
	 * @param request  请求
	 * @param response  相应
	 * @return Map提示信息！
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject registrationMethod(String userName, String phone,
			String character, String pwd, String number, String recommend,
			HttpServletRequest request, HttpServletResponse response) {

		System.out.println(userName+":"+phone+":"+character+":"+pwd+":"+number+":"+recommend);

		// 跳转路径
		Map<String, String> message = new HashMap<String, String>();
		if (!registrationService.checkUserName(userName)) {
			message.put("msg", "3");
			return JSONObject.fromObject(message);
		}
		if (!registrationService.checkPhone(phone)) {
			message.put("msg", "4");
			return JSONObject.fromObject(message);
		}

		try {
			// 判断验证码是否正确
			if (!StringUtil.isBlank(userName) && !StringUtil.isBlank(phone)
					&& !StringUtil.isBlank(pwd)) {

				// 调用推广链接
				Userbasicsinfo promoter = (Userbasicsinfo) request.getSession()
						.getAttribute("generuser");
				// 调用注册方法
				Userbasicsinfo isToPromoter = registrationService
						.registrationSave(userName, phone, pwd, number,
								recommend, Integer.parseInt(character),
								promoter, request);
				// 注册成功
				if (isToPromoter != null) {
					// 日志记录注册用户
					message.put("msg", "1");

					LOG.info(isToPromoter.getUserName() + "用户注册成功。。。");
					return JSONObject.fromObject(message);
				}
			} else {
				message.put("msg", "0");
			}
			request.getSession().setAttribute("messagecount", 1);
			request.getSession().removeAttribute("registration");
		} catch (Throwable e) {
			message.put("msg", "2");

			LOG.error("注册出现错误" + e.getMessage());
			return JSONObject.fromObject(message);
		}
		request.setAttribute("userName", userName);
		request.getSession().setAttribute("phone", phone);
		request.setAttribute("number", number);
		// 注册成功后跳转到安全中心
		return JSONObject.fromObject(message);
	}

	/**
	 * 会员登录
	 * 
	 * @param userName
	 *            用户名（邮箱）
	 * @param pwd
	 *            密码
	 * @param request
	 *            请求
	 * @return 视图
	 * @throws java.text.ParseException
	 *             异常
	 * 
	 */
	@RequestMapping(value = "/Applogin", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject loginMthod(String userName, String pwd,
			HttpServletRequest request) throws ParseException {
		Map<String, Object> message = new HashMap<String, Object>();
		// 错误次数
		Integer error = 0;
		// 判断验证码是否正确
		if (!StringUtil.isBlank(userName) && !StringUtil.isBlank(pwd)) {

			// 验证登录是否成功
			Userbasicsinfo user = registrationService.ApploginMethod(userName,pwd);
			// 如果用户名、密码匹配
			if (user != null) {
				// 判断该会员是否被后台管理员禁用
				boolean isLock = registrationService.isLock(user);
				// 如果该会员未被管理员禁用
				if (!isLock) {
					// 判断锁定时间是否已过
					boolean b = registrationService.comparisonTime(user);
					// 如果已过
					if (b) {
						// 保存会员上次登录信息到session
						registrationService.queryUserLog(user, request);
						// 获取ip
						String ip = GetIpAddress.getIp(request);

						// 添加登录日志
						registrationService.saveUserLog(user, ip);
						request.getSession().setAttribute(Constant.SESSION_USER, user);

						// 查询当前登录会员的未读信息
						Object obj = memberCenterService.queryIsReadCount(user.getId(), 0);
						if (null == obj || StringUtil.isBlank(obj.toString())) {
							obj = "0";
						}
						// 保存未读消息
						request.getSession().setAttribute("messagecount", obj);
						message.put("msg", "2");
						message.put("uid", user.getId());
					} else {
						// 如果还未过，保存时间
						message.put("msg", 1);
					}
				} else {
					message.put("msg", "0");
				}
			} else {
				// 如果不匹配、判断用户名（邮箱）是否存在，存在错误次数+1
				error = registrationService.errorCount(userName);
				if (error >= 0) {
					if (error == 5) {
						// 如果还未过，保存时间
						message.put("msg", error);
					} else {
						// 用户名密码错误
						message.put("msg", "3");
					}
				}
			}

		}
		return JSONObject.fromObject(message);
	}

	/**
	 * <p>
	 * Title: ajaxLogin
	 * </p>
	 * <p>
	 * Description: 前台会员ajax登录（此登录方法不会有验证码，但会判断是否是ajax请求，如果不是通过ajax请求，则直接返回参数错误）
	 * </p>
	 * 
	 * @param userName
	 *            用户名
	 * @param pwd
	 *            密码
	 * @param request
	 *            HttpServletRequest
	 * @return 登录结果，1表示成功，其它则为提示信息
	 */
	@ResponseBody
	@RequestMapping(value = "/ajaxLogin", method = RequestMethod.POST)
	public JSONObject ajaxLogin(String userName, String pwd,
			HttpServletRequest request, HttpServletResponse reponse) {
		Map<String, Object> masssage = new HashMap<String, Object>();

		if (AccessTypeJudge.isAjax(request)) {
			// 错误次数
			Integer error = 0;
			// 验证登录是否成功
			Userbasicsinfo user = registrationService
					.loginMethod(userName, pwd);
			// 如果用户名、密码匹配
			if (user != null) {
				// 判断该会员是否被后台管理员禁用
				boolean isLock = registrationService.isLock(user);
				// 如果该会员未被管理员禁用
				if (!isLock) {
					// 判断锁定时间是否已过
					boolean b = false;
					try {
						b = registrationService.comparisonTime(user);
					} catch (ParseException e) {
						LOG.error("ajax登录出现错误!", e);
						masssage.put("msg", 0);
					}
					// 如果已过
					if (b) {

						// 保存会员上次登录信息到session
						registrationService.queryUserLog(user, request);

						// 获取ip
						String ip = GetIpAddress.getIp(request);
						// 添加登录日志
						registrationService.saveUserLog(user, ip);
						request.getSession().setAttribute(
								Constant.SESSION_USER, user);
						// 查询当前登录会员的未读信息
						Object obj = memberCenterService.queryIsReadCount(
								user.getId(), 0);
						if (null == obj || StringUtil.isBlank(obj.toString())) {
							obj = "0";
						}
						// 保存未读消息
						request.getSession().setAttribute("messagecount", obj);
					} else {
						// 如果还未过，保存时间
						request.setAttribute("isLock", user.getFailTime());
					}
				} else {
					masssage.put("msg", 2);
				}

			} else {
				// 如果不匹配、判断用户名（邮箱）是否存在，存在错误次数+1
				error = registrationService.errorCount(userName);
				if (error > 0) {
					if (error == 5) {
						// 如果还未过，保存时间
						masssage.put("error", error);
					} else {
						// 保存错误次数

						masssage.put("error", 5 - error);

					}
				} else {
					// 用户名密码错误
					masssage.put("error", 5 - error);
				}
			}
			request.setAttribute("userName", userName);
			masssage.put("msg", 3);
			// 登录成功后跳转到会员中心首页
		} else {
			masssage.put("msg", 4);
		}

		return JSONObject.fromObject(masssage);

	}

	/**
	 * 安全退出
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return 首页
	 */
	@RequestMapping("/safety_exit")
	@ResponseBody
	public JSONObject safetyExit(HttpServletRequest request) {
		// 删除session
		request.getSession().removeAttribute(Constant.SESSION_USER);
		return JSONObject.fromObject("1");
	}

	@CheckFundsSafe
	@RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		return "/WEB-INF/views/visitor/index";
	}

	/**
	 * 验证邮箱激活链接的方法
	 * 
	 * @param activationid
	 *            激活邮箱链接的用户id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/activateAccount", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject activateAccount(
			Long uid,
			@RequestParam(defaultValue = "", required = false, value = "checkCode") String checkCode,
			String email, HttpServletRequest request) {
		Map<String, String> message = new HashMap<String, String>();
		Userbasicsinfo user = memberCenterService.queryById(uid);
		boolean bool = registrationService.checkEmail(email);
		if (bool) {
			if (null == user.getUserrelationinfo().getEmail()
					|| "".equals(user.getUserrelationinfo().getEmail())) {
				user.getUserrelationinfo().setEmail(email);
				user.getUserrelationinfo().setEmailisPass(0);
				myindexService.update(user);
				String res = myindexService.replyMail(request, user);
				message.put("msg", res);
			}
			// 0表示激活失败 1表示已经激活了邮箱 2表示激活链接时间失效 3表示激活成功
			Integer identy = registrationService.activateAccount(uid, request);

			if (identy == 3) {
				message.put("msg", "3");
			} else {
				message.put("msg", "0");
			}
		} else {
			message.put("msg", "4");
		}
		return JSONObject.fromObject(message);
	}
}