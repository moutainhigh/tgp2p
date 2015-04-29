package com.tpy.p2p.APP.admin.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.spring.service.BorrowerFundService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.ExpensesInfo;
import com.tpy.p2p.pay.entity.RepaymentInvestor;
import com.tpy.p2p.pay.payservice.RegisterService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.admin.spring.service.loan.LoanSignService;
import com.tpy.p2p.pay.entity.Repayment;
import com.tpy.p2p.pay.util.ParseXML;

import freemarker.template.TemplateException;

/**
 * 借款人的借款标管理
 * 
 * @author RanQiBing 2014-03-30
 * 
 */
@Controller
@RequestMapping("/apploanManage")
public class APPLoanManageController {

	@Resource
	private LoanSignService loanSignService;

	@Resource
	private BaseLoansignService baseLoansignService;

	@Resource
	private LoanManageService loanManageService;

	@Resource
	private BorrowerFundService borrowerFundService;

	/** loanSignQuery 公用借款标的查询 */
	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private UserInfoQuery userInfoQuery;
	@Resource
	private UserInfoServices infoServices;
	private DecimalFormat df = new DecimalFormat("0.00");

	/**
	 * 得到发布中的借款标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@RequestMapping(value="achieveLoan.htm",method=RequestMethod.POST )
	@ResponseBody
	public JSONObject achieveLoan(
			HttpServletRequest request,
			@RequestParam(value = "beginTime", required = false, defaultValue = "") String beginTime,
			@RequestParam(value = "endTime", required = false, defaultValue = "") String endTime,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "PageNum", required = false, defaultValue = "1") Integer PageNum,	@RequestParam(value = "NumPerPage", required = false, defaultValue = "10") Integer NumPerPage) {
		Userbasicsinfo user = infoServices.queryBasicsInfoById(uid);
		PageModel page = new PageModel(PageNum,NumPerPage);
		page = loanManageService.getAchieveLoan(request, user.getId(),
				beginTime, endTime, page);
		List<Object[]> data = (List<Object[]>) page.getList();
		List<Map<String, Object>> all = new ArrayList<Map<String, Object>>();
		for (Object[] aa : data) {
			Map<String, Object> row = new HashMap<String, Object>();
			while (aa != null) {
				for (int x = 0; x < aa.length; x++) {
					switch (x) {
					case 0:
						row.put("0", aa[x]);
						break;
					case 1:
						row.put("1", aa[x]);
						break;

					case 2:
						row.put("2", aa[x]);
						break;

					case 3:
						row.put("3", aa[x]);
						break;

					case 4:
						row.put("4", aa[x]);
						break;

					case 5:
						row.put("5", aa[x]);
						break;

					case 6:
						row.put("6", aa[x]);
						break;

					case 7:
						row.put("7", aa[x]);
						break;

					default:
						break;
					}
				}
				all.add(row);
			}

		}
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("data", all);
		message.put("beginTime", beginTime);
		message.put("endTime", endTime);
		message.put("PageNum", page.getPageNum());
		message.put("NumPerPage", page.getNumPerPage());
		message.put("TotalCount", page.getTotalCount());
		message.put("TotalPage", page.getTotalPage());
		
		return JSONObject.fromObject(message);
	}

	/**
	 * 得到还款中的借款给标
	 */
	@RequestMapping("repaymentLoanOpen.htm")
	public String repaymentLoanOpen(HttpServletRequest request) {
		return "WEB-INF/views/member/loanmanagement/repaymentloan";
	}

	/**
	 * 得到还款中的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@RequestMapping("repaymentLoan.htm")
	public String repaymentLoan(HttpServletRequest request, String beginTime,
			String endTime, String month, Integer no) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(no);
		if (null != beginTime && !"".equals(beginTime) && null != endTime
				&& !"".equals(endTime)) {
			month = "0";
		}
		try {
			page = loanManageService.getRepaymentLoan(request, user.getId(),
					beginTime, endTime, page, month);
			List<Object[]> list = new ArrayList<Object[]>();
			for (int i = 0; i < page.getList().size(); i++) {
				Object[] obj = (Object[]) page.getList().get(i);
				int num = DateUtils.differenceDate("yyyy-MM-dd",
						DateUtils.format("yyyy-MM-dd"), obj[9].toString());
				if (Integer.parseInt(obj[11].toString()) == 2
						|| Integer.parseInt(obj[11].toString()) == 5) {
					obj[11] = 1;
				} else if (Integer.parseInt(obj[11].toString()) == 1 && num < 0) {
					obj[11] = 2;
				} else if (Integer.parseInt(obj[11].toString()) == 3) {
					obj[11] = 3;
				} else {
					obj[11] = 4;
				}

				list.add(obj);
			}
			page.setList(list);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("page", page);
		return "WEB-INF/views/member/loanmanagement/repaymenttable";
	}

	// /**
	// * 得到逾期中的借款给标
	// * @param request
	// * @beginTime 开始时间
	// * @endTime 结束时间
	// * @return 返回页面路径
	// */
	// @RequestMapping("overdueLoan.htm")
	// public String overdueLoan(HttpServletRequest request,String
	// beginTime,String endTime){
	// Userbasicsinfo user = (Userbasicsinfo)
	// request.getSession().getAttribute(Constant.SESSION_USER);
	// PageModel page = new PageModel();
	// page = loanManageService.getOverdueLoan(request, user.getId(), beginTime,
	// endTime, page);
	// List<Object[]> list = new ArrayList<Object[]>();
	// if(null!=page.getList()&&page.getList().size()>0){
	// for(int i=0;i<page.getList().size();i++){
	// Object [] obj = new Object [15];
	// Object[] objs = (Object[]) page.getList().get(i);
	// obj[0] = objs[0];
	// obj[1] = objs[1];
	// obj[2] = objs[2];
	// obj[3] = objs[3];
	// obj[4] = objs[4];
	// obj[5] = objs[5];
	// obj[6] = objs[6];
	// obj[7] = objs[7];
	// obj[8] = objs[8];
	// obj[9] = objs[9];
	// obj[10] = objs[10];
	// int day = 0;
	// try {
	// day =
	// DateUtils.differenceDate("yyyy-MM-dd",obj[9].toString(),DateUtils.format("yyyy-MM-dd"));
	// obj[11] = day;
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// obj[12] =
	// loanManageService.overdueRepayment(Double.parseDouble(obj[3].toString()),day);
	// list.add(obj);
	// }
	// }
	// page.setList(list);
	// request.setAttribute("beginTime",beginTime);
	// request.setAttribute("endTime",endTime);
	// request.setAttribute("page",page);
	// return "WEB-INF/views/member/loanmanagement/overdueloan";
	// }
	// /**
	// * 得到已还款借款标
	// * @param request
	// * @beginTime 开始时间
	// * @endTime 结束时间
	// * @return 返回页面路径
	// */
	// @RequestMapping("hasTheRepaymentLoan.htm")
	// public String hasTheRepaymentLoan(HttpServletRequest request,String
	// beginTime,String endTime){
	// Userbasicsinfo user = (Userbasicsinfo)
	// request.getSession().getAttribute(Constant.SESSION_USER);
	// PageModel page = new PageModel();
	// try {
	// page = loanManageService.getHasTheRepaymentLoan(request, user.getId(),
	// beginTime, endTime, page);
	// } catch (ParseException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// request.setAttribute("beginTime",beginTime);
	// request.setAttribute("endTime",endTime);
	// request.setAttribute("page",page);
	// return "WEB-INF/views/member/loanmanagement/hastherepaymentloan";
	// }
	/**
	 * 得到已完成的借款给标
	 * 
	 * @param request
	 * @beginTime 开始时间
	 * @endTime 结束时间
	 * @return 返回页面路径
	 */
	@RequestMapping("underwayLoan.htm")
	public String underwayLoan(HttpServletRequest request, String beginTime,
			String endTime) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page = loanManageService.getUnderwayLoan(request, user.getId(),
				beginTime, endTime, page);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/loanmanagement/underwayloan";
	}

	/**
	 * 借款人进行还款操作
	 * 
	 * @param id
	 *            还款编号
	 * @return 返回提交ips地址
	 */
	@RequestMapping("repayment.htm")
	public String repayment(String id, HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		//得到还款信息
		Repaymentrecord repaymentrecord = baseLoansignService.getRepaymentId(Long.parseLong(id));
		
		//得到投资人还款的所有信息
		List<RepaymentInvestor> investorList = loanManageService.listRepayment(repaymentrecord);
		
//        //得到借款人的还款信息
//		ExpensesInfo ex = borrowerFundService.getBorrowerFund(repaymentrecord, 1);
		
		String pOutAmt=borrowerFundService.getRepmentSumMoney(investorList);
		String pOutFee=borrowerFundService.getRepmentSumFee(investorList);
		Repayment info = new Repayment(
				repaymentrecord,user,"1",pOutAmt,pOutFee,investorList);
		try {
			String xml = ParseXML.repaymentXml(info);
			Map<String,String> map = RegisterService.registerCall(xml);
			map.put("url", PayURL.REPAYMRNTTESTURL);
			request.setAttribute("map",map);
			return "WEB-INF/views/recharge_news";
		} catch (IOException | TemplateException e) {
			LOG.error("数据加密出错");
			e.printStackTrace();
			request.setAttribute("error","数据加密出错");
			return "WEB-INF/views/failure";
		}
		
	}

	/**
	 * 判断用户的金额是否可以偿还
	 * 
	 * @param id
	 *            还款编号
	 * @return
	 */
	@RequestMapping("judge.htm")
	@ResponseBody
	public String getJudge(Long id, HttpServletRequest request) {
		String alert = "";
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		// 得到还款信息
		Repaymentrecord repaymentrecord = baseLoansignService
				.getRepaymentId(id);
		// 得到借款人的还款信息
		ExpensesInfo ex = borrowerFundService.getBorrowerFund(repaymentrecord,
				true);
		Double money = ex.getInterest() + ex.getMoney() + ex.getPenalty();
		// 得到用户账户余额
		Userfundinfo userinfo = userInfoQuery.getUserFundInfoBybasicId(user
				.getId());
		// 判断用户的可用余额是可以偿还
		if (userinfo.getCashBalance() < money) {
			alert = "余额不足，请充值";
		} else {
			alert = "本金:" + df.format(ex.getMoney()) + "利息:"
					+ df.format(ex.getInterest());
			if (ex.getPenalty() > 0) {
				alert = alert + "违约金:" + df.format(ex.getPenalty());
			}
		}
		return alert;
	}

}
