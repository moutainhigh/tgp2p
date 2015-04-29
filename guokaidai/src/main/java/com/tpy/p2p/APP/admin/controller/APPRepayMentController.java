package com.tpy.p2p.APP.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.service.RepayMentServices;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.RepaymentSign;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tpy.base.util.LOG;
import com.tpy.p2p.pay.payservice.RegisterService;

import freemarker.template.TemplateException;

/**
 * 前台还款
 * 
 * @author lsy 2014-10-17
 * 
 */

@Controller
@RequestMapping("/apprepayments")
public class APPRepayMentController {

	@Resource
	private UserBaseInfoService userBaseInfoService;

	@Resource
	private RepayMentServices repayMentServices;

	@Resource
	private APPLoanInfoController aPPLoanInfoController;

	/**
	 * 还款
	 * 
	 * @param id
	 *            还款记录编号
	 * @return 返回路径
	 * @throws java.text.ParseException
	 */
	@CheckFundsSafe
	@RequestMapping(value = "appRelationrepayment.htm", method = RequestMethod.POST)
	public String repayment(HttpServletRequest request, Long uid)
			throws ParseException {
		Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
		String login = aPPLoanInfoController.loginMthod(user.getUserName(),
				user.getPassword(), request);
		if ("success".equals(login)) {
			// 提前还款
			request.setAttribute("advance",
					repayMentServices.advanceRepayment(user.getId()));
			// 按时还款
			request.setAttribute("schedule",
					repayMentServices.scheduleRepayment(user.getId()));
			// 逾期还款
			request.setAttribute("overdue",
					repayMentServices.overdueRepayment(user.getId()));

			// 借款总额
			request.setAttribute("money",
					repayMentServices.getMoney(user.getId()));
			// 还款标总数
			request.setAttribute("num", repayMentServices.getNum(user.getId()));
			int isRepaySign = 0;
			if (user.getpIpsAcctDate() == null
					|| user.getUserfundinfo().getpIdentNo() == null) {
				isRepaySign = -1;
			} else {
				isRepaySign = user.getRepaySignStatus();
			}
			// 是否签约自动还款
			request.setAttribute("isRepaySign", isRepaySign);

			return "WEB-INF/views/member/loanmanagement/apprepayment";
		} else {
			request.setAttribute("error", "web端用户登录失败");
			return "/WEB-INF/views/apprror";
		}
	}

	@RequestMapping("repaymentSign.htm")
	public String repaymentSign(HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		RepaymentSign repaySign = new RepaymentSign(user);
		try {
			String xml = com.tpy.p2p.pay.util.ParseXML.repaymentSignXml(repaySign);
			System.out.println(xml);
			Map<String, String> map = RegisterService.registerCall(xml);
			map.put("url", PayURL.REPAYMENTSIGNURL);
			request.setAttribute("map", map);
			return "WEB-INF/views/recharge_news";
		} catch (IOException | TemplateException e) {
			LOG.error("数据加密出错");
			e.printStackTrace();
			request.setAttribute("error", "数据加密出错");
			return "WEB-INF/views/failure";
		}
	}

}
