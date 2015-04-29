package com.tpy.p2p.APP.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.util.DateUtils;
import com.tpy.p2p.APP.admin.Util.MyUtil;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Messagesetting;
import com.tpy.p2p.chesdai.entity.Messagetype;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.entity.Userrelationinfo;
import com.tpy.p2p.chesdai.entity.Validcodeinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.MyindexService;
import com.tpy.p2p.chesdai.spring.service.RegistrationService;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import com.tpy.p2p.chesdai.spring.service.VipInfoService;

/**
 * 会员基本信息修改
 * 
 * @author lsy 注解session测试
 * @CheckLogin
 */

@Controller
@RequestMapping("/appupdate_info")
public class AppUserBaseInfoController {

	/**
	 * 会员基本信息修改接口
	 */
	@Resource
	private UserBaseInfoService userBaseInfoService;

	/**
	 * 特权会员接口
	 */
	@Resource
	private VipInfoService vipInfoService;
	@Resource
	private MemberCenterService memberCenterService;

	@Resource
	private RegistrationService registrationService;
	@Resource
	private MyindexService myindexService;

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
	 * 用户密码
	 * 
	 * @param request
	 *            请求
	 * @return JSONObject
	 */
	@RequestMapping("/forword_url")
	@ResponseBody
	public ModelAndView queryPassword(String url, HttpServletRequest request) {
		Userbasicsinfo user = queryUser(request);
		user = userBaseInfoService.queryUserById(user.getId());
		request.setAttribute("user", user);
		return new ModelAndView("/WEB-INF/views/member/" + url);
	}

	/**
	 * 根据原密码改登录密码 phone
	 * 
	 * @param oldPwd
	 *            旧密码
	 * @param pwd
	 *            新密码
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @return null
	 */
	@RequestMapping(value = "/update_pwd", method = RequestMethod.POST)
	@ResponseBody
	@CheckLogin
	public JSONObject updatePwd(
			@RequestParam(value = "oldPwd", defaultValue = "", required = true) String oldPwd,
			@RequestParam(value = "pwd", defaultValue = "", required = true) String pwd,
			@RequestParam(value = "uid", defaultValue = "", required = true) Long uid,
			HttpServletRequest request) {
		Map<String, Object> mssage = new HashMap<String, Object>();
		try {
			// 查询基本信息
			Userbasicsinfo user = userBaseInfoService.queryUserById(uid);

			// 判断旧密码是否为空
			if (oldPwd != null && !oldPwd.trim().equals("")) {
				if (!oldPwd.equals(user.getPassword())) {
					// 判断旧登录密码是否正确
					mssage.put("msg", 0);
				} else {
					// 修改登录密码
					userBaseInfoService.updatePwd(user, pwd);
					mssage.put("msg", 1);
				}
			}
		} catch (Throwable e) {
			mssage.put("msg", 2);
			e.getMessage();

		}
		return JSONObject.fromObject(mssage);
	}

	/**
	 * 上传头像
	 * 
	 * @param imgUrl
	 *            头像地址
	 * @param multipartRequest
	 *            multipartRequest
	 * @param response
	 *            response
	 * @throws java.io.IOException
	 */
	@RequestMapping("/upload_head")
	public String uploadHead(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		Userbasicsinfo user = queryUser(request);
		user = userBaseInfoService.queryUserById(user.getId());
		// 获得文件
		MultipartFile file = multipartRequest.getFile("imgUrl");
		// 获得文件名
		String filename = file.getOriginalFilename();
		// 取得根目录
		String root = request.getSession().getServletContext()
				.getRealPath("/upload/user")
				+ "/";
		// 取得后缀
		String postfix = filename.substring(filename.indexOf("."))
				.toLowerCase();
		String name = DateUtils.format("yyyyMMddHHmmss") + postfix;
		String str = root + name;

		File file2 = new File(str);
		// 写入文件
		file.transferTo(file2);
		String imgUrl = request.getScheme()
				+ "://"
				+ request.getServerName()
				+ ":"
				+ request.getServerPort()
				+ (request.getContextPath() + "/upload/user/" + name).replace(
						"//", "/");
		// 修改头像路径
		userBaseInfoService.updateHead(user, imgUrl);
		request.setAttribute("msg", "1");
		return "redirect:/update_info/forword_url?url=head";
	}

	/**
	 * 修改头像
	 * 
	 * @param imgUrl
	 *            头像地址
	 * @param response
	 *            response
	 * @param request
	 *            request
	 * @return 是否上传成功
	 */
	@RequestMapping("/update_head")
	@ResponseBody
	public boolean updateHead(String imgUrl, Long uid,
			HttpServletResponse response, HttpServletRequest request) {
		boolean bool = false;
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		try {
			// 判断是否为ajax提交
			if (request.getHeader("X-Requested-With") != null) {
				if (imgUrl != null && imgUrl.trim().length() > 0) {
					user = userBaseInfoService.queryUserById(user.getId());
					userBaseInfoService.updateHead(user, imgUrl);
					bool = true;
				}
			}
		} catch (Throwable e) {
			LOG.error("修改头像出错：" + e.getMessage());
			return false;
		}
		return bool;
	}

	/**
	 * 初始化修改会员资料首页
	 * 
	 * @param request
	 *            request
	 * @return JSONObject
	 */
	@RequestMapping(value = "/basicinfo", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateBasiciinfoInit(HttpServletRequest request,
			Long uid, String answer) {
		List<Object> usermodelList = new ArrayList<Object>();
		Userbasicsinfo user = queryUser(request);
		user = userBaseInfoService.queryUserById(uid);
		// 用户设置的安全问题
		MemberNumber memberNumber = user.getMemberNumber();
	
		Userfundinfo userfundinfo = user.getUserfundinfo();
		Userrelationinfo userrelationinfo = user.getUserrelationinfo();
		Validcodeinfo validcodeinfo = user.getValidcodeinfo();
		usermodelList.add(user);
		if (null != memberNumber)
			usermodelList.add(memberNumber);

		if (null != userfundinfo)
			usermodelList.add(userfundinfo);
		if (null != userrelationinfo)
			usermodelList.add(userrelationinfo);
		if (null != validcodeinfo)
			usermodelList.add(validcodeinfo);
		JSONObject res = MyUtil.AllEntityValue(usermodelList);
		// 查询用户是否设置安全问题
		List<Object> securityObj = new ArrayList<Object>();
		Boolean bool = memberCenterService.isSecurityproblem(user.getId());

		List<Object[]> securityproblems = myindexService
				.appquerySecurityproblem(user.getId());
		for (Object[] ss : securityproblems) {
			securityObj.add(ss[1]);

		}
		JSONArray jsonSecurutylist = MyUtil.sameEntityValue(securityObj);
		res.put("isSecuruty", bool);
		res.put("securutyproblems", jsonSecurutylist);
		res.put("date", DateUtils.format("yyyy-MM-dd"));

		return res;
	}

	/**
	 * 修改用户基本信息 phone
	 * 
	 * @param info
	 *            info
	 * @param nickname
	 *            昵称
	 * @param response
	 *            response
	 * @param request
	 *            request
	 */
	@RequestMapping(value = "/update_basicinfo", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateBasicinfo(Userrelationinfo info, String nickname,
			Long uid, HttpServletResponse response, HttpServletRequest request) {
		Userbasicsinfo user1 = queryUser(request);
		// 查询会员基本信息
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		Map<String, Object> message = new HashMap<String, Object>();
		try {

			// 昵称
			user.setNickname(nickname);

			// 取到会员关联信息
			Userrelationinfo relationinfo = user.getUserrelationinfo();
			// 手机号码
			relationinfo.setPhone(info.getPhone());
			// 性别
			relationinfo.setSex(info.getSex());
			// 出身日期
			relationinfo.setBirthDay(info.getBirthDay());
			// 最高学历
			relationinfo.setQualifications(info.getQualifications());
			// 毕业院校
			relationinfo.setInstitutions(info.getInstitutions());
			// 婚姻状况
			relationinfo.setMarriage(info.getMarriage());
			// 居住地址
			relationinfo.setNewaddress(info.getNewaddress());
			// 公司行业
			relationinfo.setIndustry(info.getIndustry());
			// 公司规模
			relationinfo.setScale(info.getScale());
			// 职位
			relationinfo.setPost(info.getPost());
			// 月收入
			relationinfo.setIncome(info.getIncome());

			// 注入会员关联信息
			user.setUserrelationinfo(relationinfo);
			userBaseInfoService.update(user);
			message.put("msg", 1);
		} catch (Throwable e) {
			LOG.error("修改会员基本信息出错：" + e.getMessage());
			message.put("msg", 0);
		}
		return JSONObject.fromObject(message);
	}

	/**
	 * 初始化消息设置页面
	 * 
	 * @param request
	 *            request
	 * @return jsp
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("message_setting")
	public String queryMessageSetting(HttpServletRequest request) {
		Userbasicsinfo user = queryUser(request);
		user = userBaseInfoService.queryUserById(user.getId());
		request.setAttribute("user", user);
		List list = userBaseInfoService.queryMessge(user.getId());
		request.setAttribute("list", list);
		Object vip = vipInfoService.isVip(user.getId());
		request.setAttribute("vip", vip);
		return "/WEB-INF/views/member/messageSet";
	}

	/**
	 * 消息设置修改
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 *             ransheng
	 */
	@RequestMapping(value = "/update_messge", method = RequestMethod.POST)
	public String updateMessge(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Userbasicsinfo user = queryUser(request);
			int row = Integer
					.parseInt(request.getParameter("row") == null ? "0"
							: request.getParameter("row"));
			for (int i = 0; i < row; i++) {
				String id = request.getParameter("id_" + i);

				List<Messagesetting> li = userBaseInfoService
						.queryMessageByType(id, user.getId());

				String sysvals = request.getParameter("cbo_sys_" + i);
				String emalvals = request.getParameter("cbo_email_" + i);
				String msgvals = request.getParameter("cbo_msg_" + i);

				// 如果该提示类容在存在，则修改该条内容
				if (li != null && li.size() > 0) {
					Messagesetting msg = li.get(0);
					msg.setEmailIsEnable(emalvals == null ? false : true);
					msg.setSysIsEnable(sysvals == null ? false : true);
					msg.setSmsIsEnable(msgvals == null ? false : true);
					userBaseInfoService.updateMessagesetting(msg);
				} else {
					// 如果该提示类容不存在，则添加一条新内容
					List<Messagetype> lt = userBaseInfoService
							.queryByMesaageId(id);
					if (lt != null && lt.size() > 0) {
						Messagesetting msg = new Messagesetting();
						msg.setEmailIsEnable(emalvals == null ? false : true);
						msg.setSysIsEnable(sysvals == null ? false : true);
						msg.setSmsIsEnable(msgvals == null ? false : true);
						msg.setMessagetype(lt.get(0));
						msg.setUserbasicsinfo(user);
						userBaseInfoService.saveMessagesetting(msg);
					}

				}
			}
			request.setAttribute("msg", 1);
		} catch (Throwable e) {
			LOG.info("新增消息设置出错" + e);
		}
		return queryMessageSetting(request);
	}

	/**
	 * <p>
	 * Title: loginOut
	 * </p>
	 * <p>
	 * Description: 会员退出登录
	 * </p>
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return 首页
	 */
	@RequestMapping("/login_out")
	public String loginOut(HttpServletRequest request) {

		request.getSession().removeAttribute(Constant.SESSION_USER);

		return "redirect:/index.htm";

	}
}
