package com.tpy.p2p.chesdai.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignflow;
import com.tpy.p2p.chesdai.entity.Preset;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.model.LoanContract;
import com.tpy.p2p.chesdai.spring.service.ContractService;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.chesdai.spring.service.PresetService;
import com.tpy.p2p.chesdai.spring.util.FileUtil;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.RepaymentrecordService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 获取标的详细信息
 * 
 * @author RanQiBing 2014-04-11
 * 
 */
@Controller
@RequestMapping("/loaninfo")
public class LoanInfoController {

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
	private RepaymentrecordService repaymentrecordService;

	/**
	 * 获取标的详细信息
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@RequestMapping("getLoanInfo.htm")
	public String getLoanInfo(Long id, HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		Double reMoney = 0.0000;
		Double tenderMoney = 0.0000;
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		// 更新浏览数
		loanInfoService.save(loan);
		
		int days=loan.getLoansignbasics().getBidTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Long bidEndTime=0L;
		try {
			bidEndTime=sdf.parse(loan.getPublishTime()).getTime();
			bidEndTime+=days*24*60*60*1000;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		request.setAttribute("bidEndTime", bidEndTime);

		// 获取标的认购金额
		request.setAttribute("scale",Arith.div(loanSignQuery.getLoanrecordMoneySum(id), loan.getIssueLoan(), 2));
		request.setAttribute("loan", loan);
		// 得到结束时间
		// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		 request.setAttribute("attachment",loanInfoService.getAttachment(id));
		// 得到还款记录

		request.setAttribute("creditRating", loanInfoService.getCreditRating(loan.getUserbasicsinfo().getId()));
		// 查询购买该标的人数
		Integer count = loanSignQuery.getBuyCount(id.toString());
		request.setAttribute("buyCount", count);
		// 查询剩余金额
		tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
		reMoney = loan.getIssueLoan() - tenderMoney;

		if (null != user) {
			// 获取当前用户的最新信息
			Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(user
					.getId().toString());

			// 判断当前用户最大认购份数
			int maxcount = loanInfoService.getCount(loan, userinfo);

			request.setAttribute("maxMoney", maxcount * loan.getLoanUnit());
			request.setAttribute("maxCopies", maxcount);
			request.setAttribute("money", userinfo.getUserfundinfo().getMoney());
			request.setAttribute("logo", "logo");
		} else {
			request.setAttribute("maxMoney", 0);
			request.setAttribute("maxCopies", 0);
			request.setAttribute("money", 0);
			request.setAttribute("logo", "logoNot");
		}
		request.setAttribute("user",user);
		request.setAttribute("reMoney", reMoney);

		return "WEB-INF/views/member/loan/loaninfo";
	}

	/* 优金开始 */
	/**
	 * 查询优金理财详情
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("getYouxuanInfo.htm")
	public String getYouxuanInfo(HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		Double reMoney = 0.0000;
		Double tenderMoney = 0.0000;
		Double lastMoney = 0.0000;
		Double last = 0.0000;
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getYouxuan();
		if (loan != null) {
			last = presetService.getlastMoney(loan.getId());
			if (last != null) {
				lastMoney = loan.getIssueLoan() - last;
				request.setAttribute("lastMoney", lastMoney);
			} else {
				tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
				lastMoney = loan.getIssueLoan() - tenderMoney;
				request.setAttribute("lastMoney", lastMoney);
			}
		} else {

			loan = loanSignQuery.getYouxuanlast();
			if (loan != null) {
				last = presetService.getlastMoney(loan.getId());
				if (last != null) {
					lastMoney = loan.getIssueLoan() - last;
					request.setAttribute("lastMoney", lastMoney);
				} else {
					tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan
							.getId());
					lastMoney = loan.getIssueLoan() - tenderMoney;
					request.setAttribute("lastMoney", lastMoney);
				}
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
				Calendar c11 = Calendar.getInstance();
				Calendar c22 = Calendar.getInstance();
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
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
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
					request.setAttribute("state", state);
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
		return "WEB-INF/views/member/loan/youxuaninfo";
	}

	/**
	 * 预定
	 * 
	 * @param request
	 * @param money
	 * @param id
	 * @return
	 */
	@RequestMapping("reserve.htm")
	public ModelAndView reserve(HttpServletRequest request, Double money,
			Long loanid) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		Loansign ls = loanSignQuery.getLoansignById(String.valueOf(loanid));
		Preset ps = presetService.getPresetByUserId(user.getId(), ls.getId());

		try {
			ps.setLoanMoney(money);
			ps.setState(1);
			ps.setPresetTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
			ps.setPayTime(DateUtils.add("yyyy-MM-dd HH:mm:ss", DateUtils
					.format("yyyy-MM-dd HH:mm:ss"), Calendar.DATE, ls
					.getLoansignbasics().getBidTime()));
			presetService.updateUcode(ps);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String msg = "1";
		request.setAttribute("msg", msg);
		return new ModelAndView("/WEB-INF/views/member/loan/youxuaninfo");
	}

	/**
	 * 理财合同下载
	 * 
	 * @param request
	 * @param response
	 * @param loansignId
	 */
	@RequestMapping("lccontact")
	public void buildLiCaiContact(HttpServletRequest request,
			HttpServletResponse response, String loansignId) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		LoanContract contract = new LoanContract();
		// 获取当前标详情
		Loansign loan = loanSignQuery.getLoansignById(loansignId);
		String refundtype = "";
		if (loan != null) {
			if (loan.getRefundWay() == 1) {
				refundtype = "按月等额本息";
			} else if (loan.getRefundWay() == 2) {
				refundtype = "按月付息到期还本";
			} else if (loan.getRefundWay() == 3) {
				refundtype = "到期一次性还本息";
			}
		}

		//
		List list = repaymentrecordService.queryRepaymentrecord(loansignId);
		Double repaymoney = 0.00;
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				Object[] str = (Object[]) obj;
				repaymoney = repaymoney + Double.valueOf(str[3].toString());
			}

			contract.setBonaType(refundtype); // 还款方式
			contract.setBorrowMonth(loan.getMonth().toString()); // 借款期限(月份天数)
			contract.setContractId(loan.getLoansignbasics().getpContractNo()); // 合同编号
			contract.setPartyA(user.getName()); // 甲方（出借人）
			contract.setPartyB(loan.getUserbasicsinfo().getName()); // 乙方 （借入者）
			contract.setIdCardA(user.getUserrelationinfo().getCardId()); // 甲方（出借人）身份证
			contract.setIdCardB(loan.getUserbasicsinfo().getUserrelationinfo().getCardId()); // 乙方（出借人）身份证
			contract.setDateTime(loan.getLoansignbasics().getCreditTime().substring(0, 10)); // 协议签署日期(借款日期)
			contract.setBehoof(loan.getLoansignbasics().getBehoof());// 用途
			contract.setRepaymoney(repaymoney);// 还款本息
			Object[] object = (Object[]) list.get(0);
			contract.setRepayMonthMoney(object[3].toString());// 月偿还本息
			contract.setMonthBack(object[2].toString()); // 还款日期
			contract.setMonthBackDay(object[2].toString().substring(8, 10));// 还款日
			contract.setUsernameA(user.getUserName());// 甲方太平洋理财用户名
			contract.setUsernameB(loan.getUserbasicsinfo().getUserName());// 乙方太平洋理财用户名
			contract.setIps(loan.getUserbasicsinfo().getUserfundinfo().getpIdentNo());// 环迅账号
			contract.setRate(loan.getRate() * 100); // 借款年利润
			contract.setSignedAddress("中国地球"); // 协议签订地点
			contract.setPdfPassword("123"); // pdf密码 为用户手机号
			try {
				contract.setLoanMoney(loan.getIssueLoan()); // 甲方 借出的 金额（人民币 元）
															// 阿拉伯数字
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			contract.setLoanMoneyUpper("十万八千"); // 已方 借入的 金额（人民币 元） 中文大写数字
			try {
				// 获取环境地址
				String realPath = request.getSession().getServletContext()
						.getRealPath("")
						+ "/upload/"
						+ loan.getId()
						+ "_"
						+ loan.getLoansignbasics().getLoanNumber();
				String fullTempFilePath = realPath + "_temp.pdf";
				String fullFilePath = realPath + ".pdf";
				OutputStream ots = new FileOutputStream(fullTempFilePath);
				contractService.born(contract, ots);
				ots.close();
				// 盖章
				/*
				 * File fileFBB =
				 * ResourceUtils.getFile("classpath:/config/biceng/seals/FBB.xml"
				 * ); File filePFX =
				 * ResourceUtils.getFile("classpath:/config/biceng/certs/FBB.pfx"
				 * ); String signXml = fileFBB.getPath(); String signPfx =
				 * filePFX.getPath() ; contractService.sign(realPath +
				 * "/upload/" + loan.getLoansignbasics().getLoanNumber() +
				 * ".pdf", signXml, signPfx, "1234", "2", "100", "450");
				 */
				File filePFX = ResourceUtils
						.getFile("classpath:/config/biceng/certs/guokaidai.p12");
				File img = ResourceUtils
						.getFile("classpath:/config/biceng/seals/guokaidai.png");
				com.tpy.p2p.pay.util.SignProvider.sign(fullTempFilePath, fullFilePath,
                        filePFX.getPath(), img.getPath());

				// 下载合同
				FileUtil.downFile(fullFilePath, loan.getId() + "_"
                                + loan.getLoansignbasics().getLoanNumber() + ".pdf",
                        response);
				new File(fullTempFilePath).delete();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/* 优金结束 */

	/**
	 * 查询该标的所有购买记录
	 * 
	 * @param id
	 *            标编号
	 * @return 查询结果
	 */
	@RequestMapping("loanRecord.htm")
	public String getLoanrecord(Long id, Integer pageno,
			HttpServletRequest request) {
		PageModel page = new PageModel();
		page.setPageNum(pageno);
		page = loanInfoService.getLoanRecord(id, page);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/loan/loanrecord";
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
	@RequestMapping("loanSignRecord.htm")
	public String getLoanSignRecord(Long id, Integer pageNo,
			HttpServletRequest request) {
		PageModel page = new PageModel();
		page.setPageNum(pageNo);
		page = loanInfoService.getLoanSignRecord(id, page);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/loan/loansignrecord";
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
	@RequestMapping("loanList.htm")
	public String getLoanlist(HttpServletRequest request, String money,
			String month, String loanstate, String rank, String loanType,
			Integer no) {
		PageModel page = new PageModel();
		page.setPageNum(no);
		page = loanManageService.getLoanList(money, month, loanstate, rank,
				loanType, page);
		List<Object[]> objList = new ArrayList<Object[]>();
		if (null != page.getList() && page.getList().size() > 0) {
			for (int i = 0; i < page.getList().size(); i++) {
				Object[] obj = (Object[]) page.getList().get(i);
				obj[2] = loanInfoService.getCreditRating(Long.parseLong(obj[2]
						.toString()));
				objList.add(obj);
			}
		}
		page.setList(objList);
		request.setAttribute("page", page);

		return "WEB-INF/views/member/loan/loantable";
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
	 * 获取标的详细信息
	 * 
	 * @param id
	 *            标编号
	 * @return 返回标详细信息页面
	 */
	@RequestMapping("getLoanCirInfo.htm")
	public String getLoanCirInfo(Long id, HttpServletRequest request) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		// 剩余还需投标多少
		Double reMoney = 0.0000;
		Double tenderMoney = 0.0000;
		// 获取标的详细信息
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		// 更新浏览数
		loanInfoService.save(loan);

		// 获取标的认购金额
		request.setAttribute("scale",Arith.div(loanSignQuery.getLoanrecordMoneySum(id),loan.getIssueLoan(), 2));
		request.setAttribute("loan", loan);
		// 得到结束时间
		// request.setAttribute("time",DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		// request.setAttribute("attachment",loanInfoService.getAttachment(id));
		// 得到还款记录

		/*
		 * request.setAttribute("creditRating", loanInfoService
		 * .getCreditRating(loan.getUserbasicsinfo().getId()));
		 */
		// 获取转账类型
		String userId = loanSignQuery.getUserDebt(id.toString());
		// 得到还款记录
		String flowid = loanSignQuery.getflowId(id.toString(), userId);
		Loansignflow loanSignflow = loanSignQuery.getLoansignflow(flowid.toString());
		request.setAttribute("pcrettype", loanSignflow.getPcrettype()
				.intValue());
		// 查询购买该标的人数
		Integer count = loanSignQuery.getBuyCount(id.toString());
		request.setAttribute("buyCount", count);
		// 查询剩余金额
		tenderMoney = loanSignQuery.getLoanrecordMoneySum(loan.getId());
		reMoney = loan.getIssueLoan() - tenderMoney;

		if (null != user) {
			Userbasicsinfo userinfo = userInfoServices.queryBasicsInfoById(user
					.getId().toString());
			int maxcount = loanInfoService.getCount(loan, userinfo);
			request.setAttribute("maxMoney", maxcount * loan.getLoanUnit());
			request.setAttribute("maxCopies", maxcount);
			request.setAttribute("money", userinfo.getUserfundinfo().getMoney());
			request.setAttribute("logo", "logo");
		} else {
			request.setAttribute("maxMoney", 0);
			request.setAttribute("maxCopies", 0);
			request.setAttribute("money", 0);
			request.setAttribute("logo", "logoNot");
		}
		request.setAttribute("reMoney", reMoney);
		return "WEB-INF/views/member/loan/debtinfo";
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
	@RequestMapping("loanCirList.htm")
	public String getLoanCirlist(HttpServletRequest request, String money,
			String month, String loanstate, String rank, String loanType,
			Integer no) {
		PageModel page = new PageModel();
		page.setPageNum(no);
		page = loanManageService.getLoanListCir(money, month, loanstate, rank, loanType, page);
		List<Object[]> objList = new ArrayList<Object[]>();
		if (null != page.getList() && page.getList().size() > 0) {
			for (int i = 0; i < page.getList().size(); i++) {
				Object[] obj = (Object[]) page.getList().get(i);
				obj[2] = loanInfoService.getCreditRating(Long.parseLong(obj[2].toString()));
				objList.add(obj);
			}
		}
		page.setList(objList);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/loan/debttable";
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

	/**
	 * 投资方下载合同
	 * 
	 * @param request
	 */
	@RequestMapping("contact")
	public void buildLoanContact(HttpServletRequest request,
			HttpServletResponse response, String loansignId) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		LoanContract contract = new LoanContract();
		// 获取当前标详情
		Loansign loan = loanSignQuery.getLoansignById(loansignId);
		String refundtype = "";
		if (loan != null) {
			if (loan.getRefundWay() == 1) {
				refundtype = "按月等额本息";
			} else if (loan.getRefundWay() == 2) {
				refundtype = "按月付息到期还本";
			} else if (loan.getRefundWay() == 3) {
				refundtype = "到期一次性还本息";
			}
		}

		//
		List list = repaymentrecordService.queryRepaymentrecord(loansignId);
		Double repaymoney = 0.00;
		if (null != list && list.size() > 0) {
			for (Object obj : list) {
				Object[] str = (Object[]) obj;
				repaymoney = repaymoney + Double.valueOf(str[3].toString());
			}
			Object[] object = (Object[]) list.get(0);
			contract.setRepayMonthMoney(object[3].toString());// 月偿还本息
			contract.setMonthBack(object[2].toString()); // 还款日期
			contract.setMonthBackDay(object[2].toString().substring(8, 10));// 还款日
		} else {
			contract.setRepayMonthMoney("");// 月偿还本息
			contract.setMonthBack(""); // 还款日期
			contract.setMonthBackDay("");// 还款日
		}

		contract.setBonaType(refundtype); // 还款方式
		contract.setBorrowMonth(loan.getMonth().toString()); // 借款期限(月份天数)
		contract.setContractId(loan.getLoansignbasics().getpContractNo()); // 合同编号
		contract.setPartyA(user.getName()); // 甲方（出借人）
		contract.setPartyB(loan.getUserbasicsinfo().getName()); // 乙方 （借入者）
		contract.setIdCardA(user.getUserrelationinfo().getCardId()); // 甲方（出借人）身份证
		contract.setIdCardB(loan.getUserbasicsinfo().getUserrelationinfo()
				.getCardId()); // 乙方（出借人）身份证
		String datetime = loan.getLoansignbasics().getCreditTime();
		if (null != datetime) {
			contract.setDateTime(datetime.substring(0, 10)); // 协议签署日期(借款日期)
		} else {
			contract.setDateTime("");
		}
		contract.setBehoof(loan.getLoansignbasics().getBehoof());// 用途
		contract.setAssure(loan.getLoansignbasics().getAssure());// 担保方
		contract.setRepaymoney(repaymoney);// 还款本息

		contract.setUsernameA(user.getUserName());// 甲方太平洋理财用户名
		contract.setUsernameB(loan.getUserbasicsinfo().getUserName());// 乙方太平洋理财用户名
		contract.setIps(loan.getUserbasicsinfo().getUserfundinfo()
				.getpIdentNo());// 环迅账号
		contract.setRate(loan.getRate() * 100); // 借款年利润
		contract.setSignedAddress("中国地球"); // 协议签订地点
		contract.setPdfPassword("123"); // pdf密码 为用户手机号
		try {
			contract.setLoanMoney(loan.getIssueLoan()); // 甲方 借出的 金额（人民币 元）
														// 阿拉伯数字
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		contract.setLoanMoneyUpper("十万八千"); // 已方 借入的 金额（人民币 元） 中文大写数字
		try {
			// 获取环境地址
			String realPath = request.getSession().getServletContext()
					.getRealPath("")
					+ "/upload/"
					+ loan.getId()
					+ "_"
					+ loan.getLoansignbasics().getLoanNumber();
			String fullTempFilePath = realPath + "_temp.pdf";
			System.out.println("temp pdf path=" + fullTempFilePath);
			String fullFilePath = realPath + ".pdf";
			System.out.println("pdf path=" + fullFilePath);
			OutputStream ots = new FileOutputStream(fullTempFilePath);
			contractService.born(contract, ots);
			ots.close();
			// 盖章
			/*
			 * File fileFBB =
			 * ResourceUtils.getFile("classpath:/config/biceng/seals/FBB.xml" );
			 * File filePFX =
			 * ResourceUtils.getFile("classpath:/config/biceng/certs/FBB.pfx" );
			 * String signXml = fileFBB.getPath(); String signPfx =
			 * filePFX.getPath() ; contractService.sign(realPath + "/upload/" +
			 * loan.getLoansignbasics().getLoanNumber() + ".pdf", signXml,
			 * signPfx, "1234", "2", "100", "450");
			 */
			File filePFX = ResourceUtils
					.getFile("classpath:/config/biceng/certs/guokaidai.p12");
			File img = ResourceUtils
					.getFile("classpath:/config/biceng/seals/guokaidai.png");
			com.tpy.p2p.pay.util.SignProvider.sign(fullTempFilePath, fullFilePath,
                    filePFX.getPath(), img.getPath());
			
			// 下载合同
			FileUtil.downFile(fullFilePath, loan.getId() + "_"
					+ loan.getLoansignbasics().getLoanNumber() + ".pdf",
					response);
			new File(fullTempFilePath).delete();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	/**
	 * 借款方下载合同
	 * 
	 * @param request
	 */
	@RequestMapping("bcontact")
	public void buildBorrowContact(HttpServletRequest request,
			HttpServletResponse response, String loansignId, String investor) {

		LoanContract contract = new LoanContract();
		// 获取当前标详情
		Loansign loan = loanSignQuery.getLoansignById(loansignId);
		String refundtype = "";
		if (loan != null) {
			if (loan.getRefundWay() == 1) {
				refundtype = "按月等额本息";
			} else if (loan.getRefundWay() == 2) {
				refundtype = "按月付息到期还本";
			} else if (loan.getRefundWay() == 3) {
				refundtype = "到期一次性还本息";
			}
		}
		Userbasicsinfo userinfo = userInfoServices
				.queryBasicsInfoById(investor);
		//
		List list = repaymentrecordService.queryRepaymentrecord(loansignId);
		Double repaymoney = 0.00;
		if (null != list && list.size() > 0) {
			for (Object obj : list) {
				Object[] str = (Object[]) obj;
				repaymoney = repaymoney + Double.valueOf(str[3].toString());
			}
			Object[] object = (Object[]) list.get(0);
			contract.setRepayMonthMoney(object[3].toString());// 月偿还本息
			contract.setMonthBack(object[2].toString()); // 还款日期
			contract.setMonthBackDay(object[2].toString().substring(8, 10));// 还款日
		} else {
			contract.setRepayMonthMoney("");// 月偿还本息
			contract.setMonthBack(""); // 还款日期
			contract.setMonthBackDay("");// 还款日
		}
		contract.setBonaType(refundtype); // 还款方式
		if (null != loan.getMonth()) {
			contract.setBorrowMonth(loan.getMonth().toString()); // 借款期限(月份天数)
		} else {
			contract.setBorrowMonth("");
		}
		contract.setContractId(loan.getLoansignbasics().getpContractNo()); // 合同编号
		contract.setPartyA(userinfo.getName()); // 甲方（出借人）
		contract.setPartyB(loan.getUserbasicsinfo().getName()); // 乙方 （借入者）
		// contract.setIdCardA(user.getUserrelationinfo().getCardId()); //
		// 甲方（出借人）身份证
		contract.setIdCardB(loan.getUserbasicsinfo().getUserrelationinfo()
				.getCardId()); // 乙方（出借人）身份证
		String datetime = loan.getLoansignbasics().getCreditTime();
		if (null != datetime) {
			contract.setDateTime(loan.getLoansignbasics().getCreditTime()
					.substring(0, 10)); // 协议签署日期(借款日期)
		} else {
			contract.setDateTime("");
		}
		contract.setBehoof(loan.getLoansignbasics().getBehoof());// 用途
		contract.setRepaymoney(repaymoney);// 还款本息

		contract.setUsernameA(userinfo.getUserName());// 甲方太平洋理财用户名
		contract.setUsernameB(loan.getUserbasicsinfo().getUserName());// 乙方太平洋理财用户名
		contract.setIps(loan.getUserbasicsinfo().getUserfundinfo()
				.getpIdentNo());// 环迅账号
		contract.setRate(loan.getRate() * 100); // 借款年利润
		contract.setSignedAddress("中国地球"); // 协议签订地点
		contract.setPdfPassword("123"); // pdf密码 为用户手机号
		try {
			contract.setLoanMoney(loan.getIssueLoan()); // 甲方 借出的 金额（人民币 元）
														// 阿拉伯数字
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		contract.setLoanMoneyUpper("十万八千"); // 已方 借入的 金额（人民币 元） 中文大写数字
		try {
			// 获取环境地址
			String realPath = request.getSession().getServletContext()
					.getRealPath("")
					+ "/upload/"
					+ loan.getId()
					+ "_"
					+ loan.getLoansignbasics().getLoanNumber();
			String fullTempFilePath = realPath + "_temp.pdf";
			String fullFilePath = realPath + ".pdf";
			OutputStream ots = new FileOutputStream(fullTempFilePath);
			contractService.born(contract, ots);
			ots.close();
			// 盖章
			/*
			 * File fileFBB =
			 * ResourceUtils.getFile("classpath:/config/biceng/seals/FBB.xml" );
			 * File filePFX =
			 * ResourceUtils.getFile("classpath:/config/biceng/certs/FBB.pfx" );
			 * String signXml = fileFBB.getPath(); String signPfx =
			 * filePFX.getPath() ; contractService.sign(realPath + "/upload/" +
			 * loan.getLoansignbasics().getLoanNumber() + ".pdf", signXml,
			 * signPfx, "1234", "2", "100", "450");
			 */
			File filePFX = ResourceUtils
					.getFile("classpath:/config/biceng/certs/guokaidai.p12");
			File img = ResourceUtils
					.getFile("classpath:/config/biceng/seals/guokaidai.png");
			com.tpy.p2p.pay.util.SignProvider.sign(fullTempFilePath, fullFilePath,
                    filePFX.getPath(), img.getPath());
			// 下载合同
			FileUtil.downFile(fullFilePath, loan.getId() + "_"
					+ loan.getLoansignbasics().getLoanNumber() + ".pdf",
					response);
			new File(fullTempFilePath).delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
