package com.tpy.p2p.APP.admin.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.APP.admin.Util.MyUtil;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Preset;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.model.LoanContract;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.chesdai.util.GetIpAddress;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.p2p.chesdai.spring.service.ContractService;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.chesdai.spring.service.MemberCenterService;
import com.tpy.p2p.chesdai.spring.service.PresetService;
import com.tpy.p2p.chesdai.spring.service.RegistrationService;

/**
 * 获取标的详细信息
 * 
 * @author lsy 2014-08-21
 * 
 */
@Service
@Controller
@RequestMapping("/apploaninfo")
public class APPLoanInfoController {

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private LoanInfoService loanInfoService;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private LoanManageService loanManageService;

	@Resource
	private ContractService contractService;
	@Resource
	private PresetService presetService;
	@Resource
	private MemberCenterService memberCenterService;
	@Resource
	private RegistrationService registrationService;

	/**
	 * 获取标的详细信息
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@RequestMapping(value = "getLoanInfo.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getLoanInfo(Long id, String uid,
			HttpServletRequest request) {
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		Loansignbasics loansinb = loan.getLoansignbasics();
		JSONObject josonLoansignbasics = MyUtil.singleEntityValue(loansinb);
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("Loansignbasics", josonLoansignbasics);
		message.put("userInfo",
				MyUtil.singleEntityValue(user.getUserfundinfo()));
		// 更新浏览数
		loanInfoService.save(loan);
		JSONObject jsonLoan = MyUtil.singleEntityValue(loan);
		jsonLoan.put("loanUerId", loan.getUserbasicsinfo().getId());
		message.put("Loansign", jsonLoan);
		String phone = user.getUserrelationinfo().getPhone() == null ? ""
				: user.getUserrelationinfo().getPhone().trim();
		JSONObject userValidate = new JSONObject();
		if (phone.equals("")) {
			userValidate.put("isphone", "0");
		} else {
			userValidate.put("isphone", "1");
		}
		Integer email = user.getUserrelationinfo().getEmailisPass() == null ? 0
				: user.getUserrelationinfo().getEmailisPass();

		// 如果没有通过邮箱验证
		if (email == 0) {
			userValidate.put("isemail", "0");
		} else {
			userValidate.put("isemail", "1");
		}
		String name = user.getName() == null ? "" : user.getName().trim();
		String cardId = user.getUserrelationinfo().getCardId() == null ? ""
				: user.getUserrelationinfo().getCardId().trim();
		// 实名验证没有通过
		if (name.equals("") || cardId.equals("")) {
			userValidate.put("isname", "0");
		} else {
			userValidate.put("isname", "1");
		}
		// 判断用户是否通过安全验证
		boolean bool = memberCenterService.isSecurityproblem(user.getId());
		if (!bool) {
			userValidate.put("isproblem", "0");
		} else {
			userValidate.put("isproblem", "1");
		}
		String filePath = user.getUserrelationinfo().getImgUrl();
		if (null == filePath || "".equals(filePath)) {
			userValidate.put("isimgUrl", "0");
		} else {
			userValidate.put("isimgUrl", "0");
		}
		message.put("userValidate", JSONObject.fromObject(userValidate));

		// 获取标的认购金额

		message.put(
				"scale",
				Arith.div(loanSignQuery.getLoanrecordMoneySum(id),
                        loan.getIssueLoan(), 2));
		message.put("creditRating", loanInfoService.getCreditRating(loan
				.getUserbasicsinfo().getId()));

		if (null != user) {
			// 获取当前用户的最新信息
			Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(user
					.getId().toString());

			// 判断当前用户最大认购份数
			int maxcount = loanInfoService.getCount(loan, userinfo);
			message.put("maxMoney", maxcount * loan.getLoanUnit());
			message.put("maxCopies", maxcount);
			message.put("money", userinfo.getUserfundinfo().getMoney());
			message.put("logo", "logo");

		} else {
			message.put("maxMoney", 0);
			message.put("maxCopies", 0);
			message.put("money", 0);
			message.put("logo", "logo");
		}

		return JSONObject.fromObject(message);
	}

	/**
	 * 获取标的详细信息
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 * @throws java.text.ParseException
	 */
	@RequestMapping(value = "appRelationWebgetLoanCirInfo.htm", method = RequestMethod.POST)
	public String getLoanCirInfoRelationWeb(Long id, String uid,
			HttpServletRequest request) throws ParseException {

		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		String login = this.loginMthod(user.getUserName(), user.getPassword(),
				request);
		if ("success".equals(login)) {
			// 剩余还需投标多少
			Double reMoney = 0.0000;
			Double tenderMoney = 0.0000;
			// 获取标的详细信息
			Loansign loan = loanSignQuery.getLoansignById(id.toString());
			// 更新浏览数
			loanInfoService.save(loan);

			// 获取标的认购金额
			request.setAttribute(
					"scale",
					Arith.div(loanSignQuery.getLoanrecordMoneySum(id),
							loan.getIssueLoan(), 2));
			request.setAttribute("loan", loan);
			// 得到结束时间
			// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
			// request.setAttribute("attachment",loanInfoService.getAttachment(id));
			// 得到还款记录

			/*
			 * request.setAttribute("creditRating", loanInfoService
			 * .getCreditRating(loan.getUserbasicsinfo().getId()));
			 */

			// 查询购买该标的人数
			Integer count = loanSignQuery.getBuyCount(id.toString());
			request.setAttribute("buyCount", count);
			// 查询剩余金额
			tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
			reMoney = loan.getIssueLoan() - tenderMoney;

			if (null != user) {
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(user.getId().toString());
				int maxcount = loanInfoService.getCount(loan, userinfo);
				request.setAttribute("maxMoney", maxcount * loan.getLoanUnit());
				request.setAttribute("maxCopies", maxcount);
				request.setAttribute("money", userinfo.getUserfundinfo()
						.getMoney());
				request.setAttribute("logo", "logo");
			} else {
				request.setAttribute("maxMoney", 0);
				request.setAttribute("maxCopies", 0);
				request.setAttribute("money", 0);
				request.setAttribute("logo", "logoNot");
			}
			request.setAttribute("reMoney", reMoney);
			return "WEB-INF/views/member/loan/debtinfo";
		} else {
			request.setAttribute("error", "web端用户登录失败");
			return "/WEB-INF/views/apprror";
		}
	}

	/**
	 * 获取标的详细信息
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 * @throws java.text.ParseException
	 */
	@RequestMapping(value = "getLoanInfoRelatinWeb.htm", method = RequestMethod.POST)
	public String getLoanInfoRelationWeb(Long id, String uid,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException {

		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		String login = this.loginMthod(user.getUserName(), user.getPassword(),
				request);
		if ("success".equals(login)) {
			Double reMoney = 0.0000;
			Double tenderMoney = 0.0000;
			// 获取标的详细信息
			Loansign loan = loanSignQuery.getLoansignById(id.toString());
			// 更新浏览数
			loanInfoService.save(loan);

			// 获取标的认购金额
			request.setAttribute(
					"scale",
					Arith.div(loanSignQuery.getLoanrecordMoneySum(id),
							loan.getIssueLoan(), 2));
			request.setAttribute("loan", loan);
			// 得到结束时间
			// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
			// request.setAttribute("attachment",loanInfoService.getAttachment(id));
			// 得到还款记录

			request.setAttribute("creditRating", loanInfoService
					.getCreditRating(loan.getUserbasicsinfo().getId()));
			// 查询购买该标的人数
			Integer count = loanSignQuery.getBuyCount(id.toString());
			request.setAttribute("buyCount", count);
			// 查询剩余金额
			tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
			reMoney = loan.getIssueLoan() - tenderMoney;
			if (null != user) {

				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(user.getId().toString());

				// 判断当前用户最大认购份数
				int maxcount = loanInfoService.getCount(loan, userinfo);

				request.setAttribute("maxMoney", maxcount * loan.getLoanUnit());
				request.setAttribute("maxCopies", maxcount);
				request.setAttribute("money", userinfo.getUserfundinfo()
						.getMoney());
				request.setAttribute("logo", "logo");
			} else {
				request.setAttribute("maxMoney", 0);
				request.setAttribute("maxCopies", 0);
				request.setAttribute("money", 0);
				request.setAttribute("logo", "logoNot");
			}
			request.setAttribute("reMoney", reMoney);
			return "WEB-INF/views/member/loan/apploaninfo";
		} else {
			request.setAttribute("error", "web端用户登录失败");
			return "/WEB-INF/views/apprror";
		}
	}

	@RequestMapping(value = "getloanAnduser", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getUserAcount(HttpServletRequest request, String uid,
			Long id) {
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		Map<String, Object> message = new HashMap<String, Object>();

		if (null != user) {
			// 获取当前用户的最新信息
			Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(user
					.getId().toString());

			// 判断当前用户最大认购份数
			int maxcount = loanInfoService.getCount(loan, userinfo);
			message.put("maxMoney", maxcount * loan.getLoanUnit());
			message.put("maxCopies", maxcount);
			message.put("money", userinfo.getUserfundinfo().getMoney());
			message.put("logo", "logo");
			message.put("loanUnit", loan.getLoanUnit());

		} else {
			message.put("maxMoney", 0);
			message.put("maxCopies", 0);
			message.put("money", 0);
			message.put("logo", "logo");
			message.put("loanUnit", loan.getLoanUnit());
		}

		return JSONObject.fromObject(message);
	}

	/**
	 * 查询优金理财详情
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getYouxuanInfo.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getYouxuanInfo(HttpServletRequest request, String uid) {
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);

		Double reMoney = 0.0000;
		Double tenderMoney = 0.0000;
		Double lastMoney = 0.0000;
		Double last = 0.0000;
		// 获取标的详细信息
		Map<String, Object> message = new HashMap<String, Object>();
		Loansign loan = loanSignQuery.getYouxuan();
		if (loan != null) {
			last = presetService.getlastMoney(loan.getId());
			if (last != null) {
				lastMoney = loan.getIssueLoan() - last;
				message.put("lastMoney", lastMoney);

			} else {
				tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
				lastMoney = loan.getIssueLoan() - tenderMoney;
				message.put("lastMoney", lastMoney);
			}
		} else {

			loan = loanSignQuery.getYouxuanlast();
			if (null != loan) {
				last = presetService.getlastMoney(loan.getId());
			}
			if (last != null && null != loan) {

				lastMoney = loan.getIssueLoan() - last;
				tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
				lastMoney = loan.getIssueLoan() - tenderMoney;
				message.put("lastMoney", lastMoney);
			} else {
				lastMoney = 0.0;
				message.put("lastMoney", lastMoney);
			}
		}

		if (loan != null) {
			// 离开始预定时间比较
			GregorianCalendar gc1 = new GregorianCalendar();
			Date dt = new Date(); // 系统时间
			String s22 = dt.toString();
			Date date1;
			try {
				date1 = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(loan.getPublishTime());
				gc1.setTime(date1);
				SimpleDateFormat df = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				gc1.add(5, +loan.getLoansignbasics().getBidTime());
				request.setAttribute("comtime", df.format(gc1.getTime()));
				java.util.Calendar c11 = java.util.Calendar.getInstance();
				java.util.Calendar c22 = java.util.Calendar.getInstance();
				try {
					c11.setTime(df.parse(df.format(gc1.getTime())));
					c22.setTime(df.parse(s22));
				} catch (ParseException e) {
				}
				int result1 = c11.compareTo(c22);
				message.put("stime", result1);

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 离预定结束时间比较
			String s1 = loan.getEndTime(); // 结束时间
			Date date = new Date(); // 系统时间
			String s2 = date.toString();

			java.text.DateFormat df = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.util.Calendar c1 = java.util.Calendar.getInstance();
			java.util.Calendar c2 = java.util.Calendar.getInstance();
			try {
				if (null != s1)
					c1.setTime(df.parse(s1));
				if (null != s2)
					c2.setTime(df.parse(s2));
			} catch (ParseException e) {
			}
			int result = c1.compareTo(c2);
			message.put("isTime", result);
			// 更新浏览数
			// loanInfoService.save(loan);

			// 获取标的认购金额
			message.put("scale", Arith.div(
					loanSignQuery.getLoanrecordMoneySum(loan.getId()),
					loan.getIssueLoan(), 2));
			JSONObject jsonloan = MyUtil.singleEntityValue(loan);
			jsonloan.accumulate("loanTitle", loan.getLoansignbasics()
					.getLoanTitle());
			jsonloan.accumulate("assure", loan.getLoansignbasics().getAssure());
			message.put("loan", jsonloan);

			if (null != user) {
				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(user.getId().toString());

				// 判断当前用户最大认购份数
				int maxcount = loanInfoService.getCount(loan, userinfo);
				// 是否兑换
				Preset ps = presetService.getPresetByUserId(userinfo.getId(),
						loan.getId());
				if (ps != null) {
					Long usuccess = ps.getSuccess();
					Long state = ps.getState();
					message.put("state", state);
					message.put("usuccess", usuccess);
				}
				message.put("maxMoney", maxcount * loan.getLoanUnit());
				message.put("maxCopies", maxcount);
				message.put("money", userinfo.getUserfundinfo().getMoney());
				message.put("logo", "logo");
			} else {
				message.put("maxMoney", 0);
				message.put("maxCopies", 0);
				message.put("money", 0);
				message.put("logo", "logoNot");
			}

		} else {
			if (null != user) {
				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(user.getId().toString());
				message.put("maxMoney", 0);
				message.put("maxCopies", 0);
				message.put("money", userinfo.getUserfundinfo().getMoney());
				message.put("logo", "logo");
			} else {
				message.put("maxMoney", 0);
				message.put("maxCopies", 0);
				message.put("money", 0);
				message.put("logo", "logoNot");
			}
		}
		message.put("reMoney", reMoney);
		return JSONObject.fromObject(message);
	}

	/* 优金开始 */
	/**
	 * 查询优金理财详情
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getYouxuanInfoAppRelationWeb.htm", method = RequestMethod.POST)
	public String getYouxuanInfoAppRelationWeb(
			HttpServletRequest request,
			@RequestParam(defaultValue = "", required = false, value = "uid") String uid) {

		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getYouxuan();
		Double reMoney = 0.0000;
		Double tenderMoney = 0.0000;

		if (loan != null) {
			// 离开始预定时间比较
			GregorianCalendar gc1 = new GregorianCalendar();
			Date dt = new Date(); // 系统时间
			String s22 = dt.toString();
			Date date1;
			try {
				date1 = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(loan.getPublishTime());
				gc1.setTime(date1);
				SimpleDateFormat df = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				gc1.add(5, +loan.getLoansignbasics().getBidTime());
				request.setAttribute("comtime", df.format(gc1.getTime()));
				java.util.Calendar c11 = java.util.Calendar.getInstance();
				java.util.Calendar c22 = java.util.Calendar.getInstance();
				try {
					c11.setTime(df.parse(df.format(gc1.getTime())));
					c22.setTime(df.parse(s22));
				} catch (ParseException e) {
				}
				int result1 = c11.compareTo(c22);
				request.setAttribute("stime", result1);

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 离预定结束时间比较
			String s1 = loan.getEndTime(); // 结束时间
			Date date = new Date(); // 系统时间
			String s2 = date.toString();

			java.text.DateFormat df = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.util.Calendar c1 = java.util.Calendar.getInstance();
			java.util.Calendar c2 = java.util.Calendar.getInstance();
			try {
				if (null != s1)
					c1.setTime(df.parse(s1));
				if (null != s2)
					c2.setTime(df.parse(s2));
			} catch (ParseException e) {
			}
			int result = c1.compareTo(c2);
			request.setAttribute("isTime", result);
			// 更新浏览数
			// loanInfoService.save(loan);

			// 获取标的认购金额
			request.setAttribute("scale", Arith.div(
					loanSignQuery.getLoanrecordMoneySum(loan.getId()),
					loan.getIssueLoan(), 2));
			request.setAttribute("loan", loan);
			// 得到结束时间
			// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
			// request.setAttribute("attachment",loanInfoService.getAttachment(id));
			// 得到还款记录

			request.setAttribute("creditRating", loanInfoService
					.getCreditRating(loan.getUserbasicsinfo().getId()));

			tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
			reMoney = loan.getIssueLoan() - tenderMoney;

			if (null != user) {
				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(user.getId().toString());

				// 判断当前用户最大认购份数
				int maxcount = loanInfoService.getCount(loan, userinfo);
				// 是否兑换
				Preset ps = presetService.getPresetByUserId(userinfo.getId(),
						loan.getId());
				if (ps != null) {
					Long usuccess = ps.getSuccess();
					request.setAttribute("usuccess", usuccess);
				}
				request.setAttribute("maxMoney", maxcount * loan.getLoanUnit());
				request.setAttribute("maxCopies", maxcount);
				request.setAttribute("money", userinfo.getUserfundinfo()
						.getMoney());
				request.setAttribute("logo", "logo");
			} else {
				request.setAttribute("maxMoney", 0);
				request.setAttribute("maxCopies", 0);
				request.setAttribute("money", 0);
				request.setAttribute("logo", "logoNot");
			}

		} else {
			if (null != user) {
				// 获取当前用户的最新信息
				Userbasicsinfo userinfo = userInfoServices
						.queryBasicsInfoById(user.getId().toString());
				request.setAttribute("maxMoney", 0);
				request.setAttribute("maxCopies", 0);
				request.setAttribute("money", userinfo.getUserfundinfo()
						.getMoney());
				request.setAttribute("logo", "logo");
			} else {
				request.setAttribute("maxMoney", 0);
				request.setAttribute("maxCopies", 0);
				request.setAttribute("money", 0);
				request.setAttribute("logo", "logoNot");
			}
		}
		request.setAttribute("reMoney", reMoney);
		return "WEB-INF/views/member/loan/appyouxuaninfo";
	}

	/**
	 * 查询该标的所有购买记录
	 * 
	 * @param id
	 *            标编号
	 * @return 查询结果
	 */
	@RequestMapping(value = "loanRecord.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getLoanrecord(
			Long id,
			@RequestParam(defaultValue = "", required = false, value = "uid") String uid,
			Integer pageNum, HttpServletRequest request) {
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		request.getSession().setAttribute("user", user);
		PageModel page = new PageModel();
		page.setPageNum(pageNum);
		page = loanInfoService.getLoanRecord(id, page);
		List<Object[]> data = page.getList();
		// u.`name`,l.rate,r.tenderMoney,CASE WHEN r.isSucceed=1 THEN '成功' else
		// '失败' END,date_format(r.tenderTime,'%Y-%m-%d'),u.userName,l.loanType
		JSONArray cc = new JSONArray();
		for (Object[] value : data) {
			Map<String, Object> row = new HashMap<String, Object>();
			for (int x = 0; x < value.length; x++) {
				if (null == value[x]) {
					value[x] = "";
				}
				switch (x) {
				case 0:
					row.put("name", value[x]);
					break;
				case 1:
					row.put("rate", value[x]);
					break;
				case 2:
					row.put("tenderMoney", value[x]);
					break;
				case 3:
					row.put("isSucceed", value[x]);
					break;
				case 4:
					row.put("tenderTime", value[x]);
					break;
				case 5:
					row.put("userName", value[x]);
					break;
				case 6:
					row.put("loanType", value[x]);
					break;

				default:
					break;
				}

			}
			cc.add(JSONObject.fromObject(row));

		}

		Map<String, Object> allOut = new HashMap<String, Object>();
		allOut.put("numPerPage", page.getNumPerPage());
		allOut.put("pageNum", page.getPageNum());
		allOut.put("totalCount", page.getTotalCount());
		allOut.put("totalPage", page.getTotalPage());
		if (null != cc) {
			allOut.put("data", cc);
		}
		return JSONObject.fromObject(allOut);
	}

	/**
	 * 获取该标的借款人的所有借款历史记录
	 * 
	 * @param id
	 *            当前借款标号
	 * @param pageNo
	 *            当前页
	 * @return 返回页面路径
	 */
	@RequestMapping(value = "loanSignRecord.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getLoanSignRecord(Long id, Integer pageNum,
			HttpServletRequest request) {
		PageModel page = new PageModel();
		page.setPageNum(pageNum);
		page = loanInfoService.getLoanSignRecord(id, page);
		// b.loanNumber,b.loanTitle,l.issueLoan,l.rate,l.refundWay,l.`month`,l.useDay,l.loanType
		List<Object[]> data = page.getList();
		List<Object> allData = new ArrayList<Object>();
		for (Object[] value : data) {
			Map<String, Object> row = new HashMap<String, Object>();
			for (int x = 0; x < value.length; x++) {
				if (null == value[x]) {
					value[x] = "";
				}
				switch (x) {
				case 0:
					row.put("loanNumber", value[x]);
					break;
				case 1:
					row.put("loanTitle", value[x]);
					break;
				case 2:
					row.put("issueLoan", value[x]);
					break;
				case 3:
					row.put("rate", value[x]);
					break;
				case 4:
					row.put("refundWay", value[x]);
					break;
				case 5:
					row.put("month", value[x]);

					break;
				case 6:
					row.put("useDay", value[x]);
					break;
				case 7:
					row.put("loanType", value[x]);
					break;
				default:
					break;
				}

			}
			allData.add(row);

		}
		Map<String, Object> outAll = new HashMap<String, Object>();

		outAll.put("NumPerPage", page.getNumPerPage());
		outAll.put("TotalCount", page.getTotalCount());
		outAll.put("TotalPage", page.getTotalPage());
		outAll.put("PageNum", page.getPageNum());
		outAll.put("data", allData);
		return JSONObject.fromObject(outAll);
	}

	/**
	 * 查询所有标信息
	 * 
	 * @param money
	 *            借款标金额
	 * @param month
	 *            借款标期限
	 * @param type
	 *            还款类型
	 * @param rank
	 *            信用度
	 * @param loanType
	 *            借款标类型
	 * @return 返回分页内容
	 */
	@RequestMapping(value = "loanList.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getLoanlist(HttpServletRequest request, String money,
			String month, String loanstate, String rank, String loanType,
			Integer PageNum, Integer NumPerPage) {
		PageModel page = new PageModel(PageNum, NumPerPage);
		page = loanManageService.getLoanList(money, month, loanstate, rank,
				loanType, page);
		List<Object[]> objList = new ArrayList<Object[]>();
		List<Object> list = new ArrayList<Object>();
		if (null != page.getList() && page.getList().size() > 0) {
			for (int i = 0; i < page.getList().size(); i++) {
				Object[] obj = (Object[]) page.getList().get(i);
				Map<String, Object> reMessage = new HashedMap();
				reMessage.put("uid", obj[2]);
				obj[2] = loanInfoService.getCreditRating(Long.parseLong(obj[2]
						.toString()));
				for (int x = 0; x < obj.length; x++) {

					if (obj[x] == null) {
						obj[x] = "";
					}
					switch (x) {
					case 0:
						reMessage.put("id", obj[x]);
						break;
					case 1:
						reMessage.put("name", obj[x]);
						break;
					case 2:
						reMessage.put("2", obj[x]);
						break;
					case 3:
						// 借入金额
						reMessage.put("borrowmoney", obj[x]);
						break;
					case 4:
						// 年利率(*100)
						reMessage.put("rateofinterest", obj[x]);
						break;
					case 5:
						// 还款期限：月
						reMessage.put("deadlineMonth", obj[x]);

						break;
					case 6:
						// 还款期限：日
						reMessage.put("deadlineDay", obj[x]);
						break;
					case 7:
						// loanList[7]==2 && loanList[8]<1:立即投资 2:满标 3:还款中 4：已完成
						reMessage.put("optionType", obj[x]);

						break;
					case 8:
						reMessage.put("8", obj[x]);
						break;
					case 9:
						reMessage.put("9", obj[x]);
						break;
					case 10:
						reMessage.put("10", obj[x]);
						break;
					case 11:
						// 2:天标
						reMessage.put("type", obj[x].toString());
						break;
					case 12:
						// 浏览数：
						reMessage.put("bsum", obj[x]);
						break;
					case 13:
						// 1:按月等额本息2:按月付息到期还本3:到期一次性还本息
						reMessage.put("repaymentMethod", obj[x]);
						break;
					case 14:
						// 总投标数
						reMessage.put("summark", obj[x]);
						break;
					case 15:
						// 已投金额
						reMessage.put("castmoney", obj[x]);
						break;
					// l.publishTime,l.endTime,l.loanType,l.loanstate"
					case 16:
						// 已投金额
						reMessage.put("publishTime", obj[x]);
						break;
					case 17:
						// 已投金额
						reMessage.put("endTime", obj[x]);
						break;
					case 18:
						// 已投金额
						reMessage.put("loanType", obj[x]);
						break;
					case 19:
						// 已投金额
						reMessage.put("loanstate", obj[x]);
						break;

					default:
						break;
					}

				}
				list.add(reMessage);
				//
				objList.add(obj);
			}
		}
		page.setList(list);
		Map<String, Object> message = new HashedMap();
		message.put("numPerPage", page.getNumPerPage());
		message.put("totalCount", page.getTotalCount());
		message.put("totalPage", page.getTotalPage());
		message.put("pageNum", page.getPageNum());
		message.put("data", list);
		return JSONObject.fromObject(message);
	}

	/**
	 * 打开借款标列表页面
	 * 
	 * @return
	 */
	@RequestMapping("openLoan.htm")
	public String opLoanList() {
		return "WEB-INF/views/member/loan/loanlist";
	}

	/**
	 * 获取债权转让
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@RequestMapping(value = "getLoanCirInfo.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getLoanCirInfo(Long id, String uid,
			HttpServletRequest request) {
		/*
		 * Userbasicsinfo user = (Userbasicsinfo) request.getSession()
		 * .getAttribute(Constant.SESSION_USER);
		 */
		Userbasicsinfo user = userInfoServices.queryBasicsInfoById(uid);
		Map<String, Object> message = new HashMap<String, Object>();
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		// 更新浏览数
		loanInfoService.save(loan);
		List<Object> loanDeail = new ArrayList<Object>();
		loanDeail.add(loan);
		JSONObject jsonLoan = MyUtil.AllEntityValue(loanDeail);
		message.put("loanDetail", jsonLoan);

		// 获取标的认购金额
		message.put(
				"scale",
				Arith.div(loanSignQuery.getLoanrecordMoneySum(id),
						loan.getIssueLoan(), 2));
		// 得到结束时间
		// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		// request.setAttribute("attachment",loanInfoService.getAttachment(id));
		// 得到还款记录

		message.put("creditRating", loanInfoService.getCreditRating(loan
				.getUserbasicsinfo().getId()));
		if (null != user) {
			// 获取当前用户的最新信息
			Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(user
					.getId().toString());

			// 判断当前用户最大认购份数
			int maxcount = loanInfoService.getCount(loan, userinfo);

			message.put("maxMoney", maxcount * loan.getLoanUnit());
			message.put("maxCopies", maxcount);
			message.put("money", userinfo.getUserfundinfo().getMoney());
			message.put("logo", "logo");
		} else {
			message.put("maxMoney", 0);
			message.put("maxCopies", 0);
			message.put("money", 0);
			message.put("logo", "logoNot");
		}

		return JSONObject.fromObject(message);
	}

	/**
	 * 查询债权转让
	 * 
	 * @param money
	 *            借款标金额
	 * @param month
	 *            借款标期限
	 * @param type
	 *            还款类型
	 * @param rank
	 *            信用度
	 * @param loanType
	 *            借款标类型
	 * @return 返回分页内容
	 */
	@RequestMapping(value = "loanCirList.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getLoanCirlist(HttpServletRequest request, String money,
			String month, String loanstate, String rank, String loanType,
			Integer PageNum, Integer NumPerPage) {

		PageModel page = new PageModel(PageNum, NumPerPage);
		page = loanManageService.getAppLoanListCir(money, month, loanstate, rank, loanType, page);
		List<Object[]> objList = new ArrayList<Object[]>();
		List<Object> list = new ArrayList<Object>();

		if (null != page.getList() && page.getList().size() > 0) {
			for (int i = 0; i < page.getList().size(); i++) {
				Object[] obj = (Object[]) page.getList().get(i);
				Map<String, Object> reMessage = new HashMap<String, Object>();
				reMessage.put("uid", obj[2]);
				obj[2] = loanInfoService.getCreditRating(Long.parseLong(obj[2]
						.toString()));

				// 数据重组

				for (int x = 0; x < obj.length; x++) {
					if (obj[x] == null) {
						obj[x] = "";
					}
					switch (x) {
					case 0:
						//
						reMessage.put("id", obj[x]);
						break;
					case 1:
						//
						reMessage.put("name", obj[x]);
						break;
					case 2:
						reMessage.put("2", obj[x]);
						break;
					case 3:
						// 借入金额
						reMessage.put("brmoney", obj[x]);
						break;
					case 4:
						// 年利率
						reMessage.put("rateofinterest", obj[x]);
						break;
					case 5:
						// 还款期限
						reMessage.put("deadlineMonth", obj[x]);
						break;
					case 6:
						// 还款期限
						reMessage.put("deadlineDay", obj[x]);
						break;
					case 7:
						//
						reMessage.put("7", obj[x]);
						break;
					case 8:
						reMessage.put("8", obj[x]);
						break;
					case 9:
						//
						reMessage.put("9", obj[x]);
						break;
					case 10:
						reMessage.put("10", obj[x]);
						break;
					case 11:
						// repaymentMethod=2||3||4到期一次性还本息
						reMessage.put("11", obj[x]);
						break;
					case 12:
						// 浏览数
						reMessage.put("bsum", obj[x]);
						break;
					case 13:
						// 还款方式条件：11==1&&13=1(按月等额本息) ,11==1&&13=2(按月付息到期还本)
						// ,11==1&&13=3(到期一次性还本息)
						reMessage.put("repaymentMethod", obj[x]);
						break;
					case 14:
						// 总投标数
						reMessage.put("summark", obj[x]);
						break;
					case 15:
						// 已投金额
						reMessage.put("bmoneysucceed", obj[x]);
						break;
					// l.publishTime,l.endTime,l.loanType,l.loanstate
					case 16:
						// 已投金额
						reMessage.put("publishTime", obj[x]);
						break;
					case 17:
						// 已投金额
						reMessage.put("endTime", obj[x]);
						break;
					case 18:
						// 已投金额
						reMessage.put("loanType", obj[x]);
						break;
					case 19:
						// 已投金额
						reMessage.put("loanstate", obj[x]);
						break;
					default:
						break;
					}
				}
				list.add(reMessage);
				objList.add(obj);
			}
		}
		page.setList(objList);
		Map<String, Object> message = new HashedMap();
		message.put("NumPerPage", page.getNumPerPage());
		message.put("TotalCount", page.getTotalCount());
		message.put("TotalPage", page.getTotalPage());
		message.put("PageNum", page.getPageNum());
		message.put("data", list);
		return JSONObject.fromObject(message);
	}

	/**
	 * 打开债权让转让
	 * 
	 * @return
	 */
	@RequestMapping("openLoanCir.htm")
	public String opLoanCirList() {
		return "WEB-INF/views/member/loan/debtlist";
	}

	@RequestMapping("contact")
	public void buildLoanContact(HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		LoanContract contract = new LoanContract();
		contract.setBonaType("aaa");
		contract.setBorrowMonth("5");
		contract.setContractId("dfdfd");
		contract.setPartyA("utouzi");
		contract.setPartyB("fubb");
		contract.setIdCardA("0123456");
		contract.setIdCardB("0123456");
		contract.setDateTime("2014-7-29");
		contract.setMonthBack("9");
		contract.setRate(0.15);
		contract.setSignedAddress("中国地球");
		contract.setPdfPassword("123");
		try {
			contract.setLoanMoney(123545.45);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		contract.setLoanMoneyUpper("十万八千");
		try {
			// 获取环境地址
			OutputStream ots = new FileOutputStream("contact.pdf");
			contractService.born(contract, ots);
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	/**
	 * @param userName
	 * @param pwd
	 * @param request
	 * @return success
	 * @throws java.text.ParseException
	 */
	public String loginMthod(String userName, String pwd,
			HttpServletRequest request) throws ParseException {
		// 返回路径
		String url = "success";

		// 错误次数
		Integer error = 0;

		// 判断验证码是否正确
		if (!StringUtil.isBlank(userName) && !StringUtil.isBlank(pwd)) {

			// 移除验证码
			request.getSession().removeAttribute("user_login");
			// 验证登录是否成功
			Userbasicsinfo user = registrationService.ApploginMethod(userName,
					pwd);
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
						url = "/WEB-INF/views/visitor/login";
					}
				} else {
					request.setAttribute("admin_lock", "该会员已被禁用！");
					url = "/WEB-INF/views/visitor/login";
				}

			} else {
				// 如果不匹配、判断用户名（邮箱）是否存在，存在错误次数+1
				error = registrationService.errorCount(userName);
				if (error > 0) {
					if (error == 5) {
						// 如果还未过，保存时间
						request.setAttribute("lock", "对不起，您的账户密码今日已输入错误5次或以上。");
					} else {
						// 保存错误次数
						request.setAttribute("error", error);
					}
				} else {
					// 用户名密码错误
					request.setAttribute("user_error", "用户名或密码错误");
				}
				url = "/WEB-INF/views/visitor/login";
			}
		} else {
			// 验证码错误
			request.setAttribute("msg", 1);
			url = "/WEB-INF/views/visitor/login";
		}
		request.setAttribute("userName", userName);

		// 登录成功后跳转到会员中心首页
		return url;
	}

}
