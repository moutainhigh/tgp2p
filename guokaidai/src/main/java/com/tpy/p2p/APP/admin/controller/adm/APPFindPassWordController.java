package com.tpy.p2p.APP.admin.controller.adm;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userrelationinfo;
import com.tpy.p2p.chesdai.entity.Validcodeinfo;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import com.tpy.p2p.chesdai.spring.service.ValidcodeInfoService;
import com.tpy.p2p.chesdai.util.GenerateLinkUtils;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.p2p.chesdai.spring.service.FindPassWordService;

import freemarker.template.TemplateException;

/**
 * <p>
 * Title:FindPassWordController
 * </p>
 * <p>
 * Description: 忘记密码专用控制层
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author lsy
 *         <p>
 *         date 2014年9月4日
 *         </p>
 */
@Controller
@RequestMapping("/appfind_password")
public class APPFindPassWordController {

	/** userBaseInfoService 会员统一查询service */
	@Resource
	private UserBaseInfoService userBaseInfoService;

	@Resource
	private FindPassWordService findPassWordService;

	/** validcodeInfoService 会员限制信息 */
	@Resource
	private ValidcodeInfoService validcodeInfoService;

	/**
	 * <p>
	 * Title: sendPhoneToFind
	 * </p>
	 * <p>
	 * Description: 通过手机发送忘记密码的验证吗
	 * </p>
	 * 
	 * @param phone
	 *            用户的手机号码
	 * @return 1 成功 2 电话号码不存在
	 */
	@ResponseBody
	@RequestMapping(value = "/findphone.do", method = RequestMethod.POST)
	public JSONObject sendPhoneToFind(String phone, HttpServletRequest request) {
		Userrelationinfo userrelat = findPassWordService.queryUserlationBysome(
				phone, 1);
		Map<String, String> message = new HashMap<String, String>();
		if (null == userrelat || StringUtil.isBlank(userrelat.getPhone())) {
			message.put("msg", "2");
			return JSONObject.fromObject(message);
		}

		Userbasicsinfo user = userBaseInfoService.queryUserById(userrelat
				.getId());
		Integer res = findPassWordService.sendsesCodel(user, phone, request);
		// 发送短信
		message.put("msg", res.toString());
		if (res == 1) {
			message.put("uid", user.getId().toString());
		}
		return JSONObject.fromObject(message);

	}

	/**
	 * <p>
	 * Title: checksmsCode
	 * </p>
	 * <p>
	 * Description: 通过用户和验证码判断验证码是否正确，并跳转到响应的页面
	 * </p>
	 * 
	 * @param id
	 *            用户编号
	 * @param smsCode
	 *            短信验证码
	 * @param request
	 *            请求
	 * @return 1.成功 2请重新发送短新验证码 3验证码输入错误！ 4找回密码失败！5.该手机号码不存在！
	 */
	@RequestMapping(value = "/checksmsCode", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject checksmsCode(String phone, Integer smsCode,
			HttpServletRequest request) {

		Userrelationinfo userrelat = findPassWordService.queryUserlationBysome(
				phone, 1);
		Map<String, String> message = new HashMap<String, String>();
		if (null != userrelat && !StringUtil.isBlank(userrelat.getPhone())) {
			Userbasicsinfo userbasics = userBaseInfoService
					.queryUserById(userrelat.getId());
			Validcodeinfo valid = validcodeInfoService
					.getValidcodeinfoByUid(userbasics.getId());
			if (null != valid && 0 != valid.getSmsCode()) {
				if (valid.getSmsCode().intValue() == smsCode.intValue()) {
					request.getSession().setAttribute("updateuser", userbasics);
					message.put("msg", "1");
				} else {
					message.put("msg", "3");
				}
			} else {
				message.put("msg", "2");
			}

		} else {
			message.put("msg", "0");
		}
		return JSONObject.fromObject(message);
	}

	/**
	 * <p>
	 * Title: sendemailToFind
	 * </p>
	 * <p>
	 * Description: 通过用户邮箱找回密码
	 * </p>
	 * 
	 * @param email
	 *            邮箱
	 * @return 1.成功 2 发送太频繁 3 邮箱不存在 4 发送失败
	 */
	@ResponseBody
	@RequestMapping(value = "/findemail.do", method = RequestMethod.POST)
	public JSONObject sendemailToFind(String email, HttpServletRequest request) {
		Userrelationinfo userrelat = findPassWordService.queryUserlationBysome(
				email, 2);
		Map<String, String> message = new HashMap<String, String>();
		if (null == userrelat || StringUtil.isBlank(userrelat.getEmail())) {
			message.put("msg", "3");
		}

		Userbasicsinfo user = userBaseInfoService.queryUserById(userrelat
				.getId());

		// 激活邮件
		try {
			Integer res = findPassWordService.sendEmailCodel(user, email,
					request);
			message.put("msg", res.toString());
		} catch (IOException e) {
			message.put("msg", "4");
			e.printStackTrace();
		} catch (TemplateException e) {
			message.put("msg", "4");
			e.printStackTrace();
		}
		return JSONObject.fromObject(message);
	}

	/**
	 * <p>
	 * Title: checkResetpwdLink
	 * </p>
	 * <p>
	 * Description: 点击找回密码的链接
	 * </p>
	 * 
	 * @param userName
	 *            参数
	 * @param request
	 *            请求
	 * @return 要返回的页面
	 */
	@RequestMapping(value = "/checkresetpwdlink", method = RequestMethod.POST)
	public String checkResetpwdLink(Long uid, HttpServletRequest request) {

		String msg = "链接错误！";
		String msg1 = "该链接已失效！";
		if (uid != null && !"".equals(uid)) {
			Userbasicsinfo userbasics = userBaseInfoService.queryUserById(uid);
			if (null != userbasics) {
				Validcodeinfo valid = validcodeInfoService
						.getValidcodeinfoByUid(userbasics.getId());
				if (valid != null) {
					long overtime = 0;

					// 获取过期时间
					if (valid.getEmailovertime() != null
							&& !"".equals(valid.getEmailovertime())) {
						overtime = valid.getEmailovertime();
					}

					// 判断链接是否过期
					if ((overtime - System.currentTimeMillis()) > 0) {

						userbasics.setRandomCode(valid.getEmailcode());

						// 判断链接中的令牌是否正确
						if (GenerateLinkUtils.verifyCheckcode(userbasics,
                                request)) {

							request.getSession().setAttribute("updateuser",
									userbasics);
							return "WEB-INF/views/updatepassword";
						} else {
							// 此链接已失效
							request.setAttribute("msg", msg);
						}

					} else {
						// 此链接已失效
						request.setAttribute("msg", msg1);
					}
				}
			} else {
				// 错误的链接
				request.setAttribute("msg", msg);
			}
		} else {
			// 错误的链接
			request.setAttribute("msg", msg);
		}
		return "WEB-INF/views/findpassword";
	}

	/**
	 * <p>
	 * Title: checkpasswordByLink
	 * </p>
	 * <p>
	 * Description: 修改登陆密码
	 * </p>
	 * 
	 * @param password
	 *            密码
	 * @param passwordagain
	 *            重复密码
	 * @param request
	 *            请求
	 * @param response
	 *            返回
	 * @return 输出的提示
	 */
	@ResponseBody
	@RequestMapping(value = "/checkpasswordbylink", method = RequestMethod.POST)
	public JSONObject checkpasswordByLink(String password,
			String passwordagain, Long uid, HttpServletRequest request,
			HttpServletResponse response) {

		/*
		 * Userbasicsinfo userbasicsinfo = (Userbasicsinfo) request.getSession()
		 * .getAttribute("updateuser");
		 */
		Userbasicsinfo userbasicsinfo = userBaseInfoService.queryUserById(uid);
		Map<String, String> message = new HashMap<String, String>();
		if (userbasicsinfo == null) {
			message.put("msg", "-1");
			return JSONObject.fromObject(message);
		}
		if (password == null || passwordagain == null
				|| password.trim().length() == 0
				|| !password.equals(passwordagain)) {
			message.put("msg", "-3");
			return JSONObject.fromObject(message);
		} else if (password.equals(passwordagain)) {
			userbasicsinfo.setPassword(password);
			userbasicsinfo.setTransPassword(passwordagain);

		} else {
			message.put("msg", "0");
			return JSONObject.fromObject(message);
		}

		Validcodeinfo validcodeinfo = validcodeInfoService
				.getValidcodeinfoByUid(userbasicsinfo.getId());

		if (null != validcodeinfo) {
			validcodeinfo.setEmailagaintime(Long.parseLong("0"));
			validcodeinfo.setEmailovertime(Long.parseLong("0"));
			validcodeinfo.setEmailcode(null);
			validcodeinfo.setSmsagainTime(Long.parseLong("0"));
			validcodeinfo.setSmsCode(null);
			validcodeinfo.setSmsoverTime(Long.parseLong("0"));
			validcodeInfoService.update(validcodeinfo);
			userBaseInfoService.update(userbasicsinfo);
			message.put("msg", "1");
		}

		request.getSession().removeAttribute("updateuser");

		return JSONObject.fromObject(message);
	}

}
