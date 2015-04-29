package com.tpy.p2p.chesdai.spring.controller;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.SystemConfigService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.service.*;
import com.tpy.p2p.chesdai.spring.service.invest.InvestService;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Preset;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.entity.Usermessage;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.LoanManageService;
import com.tpy.p2p.chesdai.spring.service.MemberCenterService;
import com.tpy.p2p.chesdai.spring.service.VipInfoService;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.pay.payservice.RegisterService;

/**
 * 会员中心首页
 * 
 * @author ransheng
 * 
 */
@Controller
@RequestMapping(value = { "member_index", "/" })
@CheckLogin(value = CheckLogin.WEB)
@SuppressWarnings("rawtypes")
public class MemberCenterController {

	/**
	 * 会员中心首页接口
	 */
	@Resource
	private MemberCenterService memberCenterService;

	@Resource
	private SystemConfigService sysConfService;
	/**
	 * vip会员接口
	 */
	@Resource
	private VipInfoService vipInfoService;

	@Resource
	private LoanSignQuery loanSignQuery;

	@Resource
	private PresetService presetService;
	
	 /**
     * 注入InvestService
     */
    @Resource
    private InvestService investService;
    
    @Resource
	private LoanManageService loanManageService;
    
    @Resource
	private LoanInfoService loanInfoService;
    
    @Resource
	private com.tpy.p2p.chesdai.spring.service.UserBaseInfoService UserBaseInfoService;
    
    @Resource 
    private MyMoneyService moneyService;
    
    @Resource 
    private RegisterService registerService;

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
	 * 跳转到Ucode页面
	 * 
	 * @return
	 */
	@RequestMapping("ucode.htm")
	public String Ucode(HttpServletRequest request) {
		Userbasicsinfo user = queryUser(request);
		request.setAttribute("user", user);
		return "/WEB-INF/views/member/ucode";

	}

	/**
	 * 跳转到自动投标
	 * @param request
	 * @return
	 */
	@RequestMapping("autoBid.htm")
	public String autoBid(HttpServletRequest request) {
		return "/WEB-INF/views/member/autoBid/autoBid";

	}

	/**
	 * 跳转到优选理财
	 * @param request
	 * @return
	 */
	@RequestMapping("myYouxuan.htm")
	public String youxuan(HttpServletRequest request,@RequestParam(value="no",required=false,defaultValue="1")Integer no) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		List<Preset> ps = presetService.getPresetListpage(user.getId(),(no-1)*10);
		List<Preset> ps1 = presetService.getPresetList(user.getId());
		for (Preset preset:ps) {
				Loansign loan1 = loanSignQuery.getyouxuanById(preset.getLoanSignId());
				// 是否过期支付
				GregorianCalendar gc1 = new GregorianCalendar();
				Date dt = new Date(); // 系统时间
				String s22 = dt.toString();
				Date date1;
				try {
					date1 = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.parse(preset.getPayTime());
					gc1.setTime(date1);
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					java.util.Calendar c11 = java.util.Calendar.getInstance();
					java.util.Calendar c22 = java.util.Calendar.getInstance();
					try {
						c11.setTime(df.parse(df.format(gc1.getTime())));
						c22.setTime(df.parse(s22));
					} catch (ParseException e) {
					}
					int result = c11.compareTo(c22);
					//过期是否
					preset.setSuccess(result);
					//loanTitle
					preset.setUcode(loan1.getLoansignbasics().getLoanTitle());

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		PageModel pager = getPager(no, ps1.size());
		request.setAttribute("pager", pager);
		request.setAttribute("preset", ps);
		
		return "/WEB-INF/views/member/loan/myyouxuan";
	}
	
	/**
	 * 理财产品合同页面
	 * @param request
	 * @return
	 */
	@RequestMapping("yxcontract.htm")
	public String yxcontract(HttpServletRequest request,@RequestParam(value="no",required=false,defaultValue="1")Integer no) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		List yxList=loanSignQuery.getUserAndyouxuan(user.getId().toString(),(no-1)*10);
		PageModel pager = getPager(no, yxList.size());
		request.setAttribute("pager", pager);
		request.setAttribute("yxList", yxList);		
		return "/WEB-INF/views/member/loan/yxcontract";
	}
	
	
	/**
	 * 跳转到借款合同
	 * @param request
	 * @return
	 */
	@RequestMapping("/borrowContract.htm")
	public String borrowContract(HttpServletRequest request,String beginTime,String endTime,String month,Integer no) {
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(no);
		if(null!=beginTime&&!"".equals(beginTime)&&null!=endTime&&!"".equals(endTime)){
			month = "0";
		}
		try {
			page = loanManageService.getRepaymentLoan(request, user.getId(), beginTime, endTime, page,month);
			List<Object[]> list = new ArrayList<Object[]>();
			for(int i=0;i<page.getList().size();i++){
				Object[] obj = (Object[]) page.getList().get(i);
				int num = DateUtils.differenceDate("yyyy-MM-dd", DateUtils.format("yyyy-MM-dd"), obj[9].toString());
				if(Integer.parseInt(obj[11].toString())==2 || Integer.parseInt(obj[11].toString())==5){
					obj[11] = 1;
				}else if(Integer.parseInt(obj[11].toString())==1 && num < 0){
					obj[11] = 2;
				}else if(Integer.parseInt(obj[11].toString())==3){
					obj[11] = 3;
				}else{
					obj[11] = 4;
				}
				
				list.add(obj);
			}
		page.setList(list);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("page",page);
		return "WEB-INF/views/member/contract/borrowContract";
	}
	
	/**
	 * 跳转到投资合同
	 * @param request
	 * @return
	 * @throws java.text.ParseException
	 */
	@RequestMapping("/investContract.htm")
	public String loanContract(Model model, HttpServletRequest request,@RequestParam(value="no",required=false,defaultValue="1")Integer no) throws ParseException {
		 //获取user信息
        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute("session_user");
        List loanrecordlist=investService.getLoanRecord(3, user.getId(), (no-1)*10, 9);
        
        List<Object> loannlist=investService.getLoanGlF(loanrecordlist);
        PageModel pager = getPager(no, investService.getLoanRecord(3, user.getId()));
        request.setAttribute("loanrecordlist", loannlist);
        request.setAttribute("pager", pager);
		return "WEB-INF/views/member/contract/investContract";
	}
	
	/**
	 * 查看该标借款合同
	 * @param id
	 * @param pageNo
	 * @param request
	 * @return
	 */
	@RequestMapping("borrowContractList.htm")
	public String borrowContractList(Long id, Integer pageNo,
			HttpServletRequest request) {
		PageModel page = new PageModel();
		page.setPageNum(pageNo);
		page = loanInfoService.getLoanRecord(id, page);
		request.setAttribute("page", page);
		return "WEB-INF/views/member/contract/borrowContractTable";
	}

	
	
	/**
     * 得到分页对象
     * @param curPage
     * @param total
     * @return
     * @author hulicheng
     * 2013-5-9
     * Page
     */
    private PageModel getPager(int curPage, long total){
        PageModel pager = new PageModel();
        pager.setPageNum(curPage);
        pager.setNumPerPage(Constant.PAGE_SIZE_RECHARGE_RECORD);
        pager.setTotalCount(Integer.parseInt(total+""));
        return pager;
    }
	

	/**
	 * 会员中心首页基本信息
	 * 
	 * @param request 请求
	 * @return 返回.jsp
	 */
	@RequestMapping("/member_center")
	public ModelAndView memberCenter(HttpServletRequest request) {
		// 取到登录用户sesssion
		Userbasicsinfo user = queryUser(request);
		user=UserBaseInfoService.queryUserById(user.getId());
		Userfundinfo funding = user.getUserfundinfo();
		// 查询用户是否设置安全问题
		boolean bool = memberCenterService.isSecurityproblem(user.getId());
		//刚注册的时候，关闭验证，此时funding为null
		if(null!=funding){
			//用户如果开通了宝付帐户，再做检查。
			/*
			if (null != funding.getpIdentNo()  && !("".equals(funding.getpIdentNo()))) {
				// 获取该用户的账户资金
				String balance = registerService.accountBFBalance(String.valueOf(user.getId()));
				if(balance!=null&&!"".equals(balance)&&!"-1".equals(balance)&&!"0".equals(balance)){
					// IPS账户余额
					double removeMoney = Double.parseDouble(balance);
					// 本地帐户余额
					double localMoney = funding.getCashBalance();
					if (removeMoney != localMoney) {
						LOG.info("本地账户余额"+localMoney+"跟宝付账户余额"+removeMoney+"不一致");
						funding.setCashBalance(removeMoney);
						memberCenterService.update(funding);
					}
				}
			}
			*/
		}
		Map<String,String> map = sysConfService.getSysConfig("is_elite_open");
		request.setAttribute("is_elite_open",map.get("is_elite_open"));

		// 是否为vip用户
		Object isVip = vipInfoService.isVip(user.getId());
		// 累积支付(账号资金总额=可用现金金额+待确认投标+待确认提现-累计支付)
		Object payment = memberCenterService.payment(user.getId());
		// 待确认提现
		Object noTransfer = memberCenterService.noTransfer(user.getId());
		// 待确认充值--
		Object noRecharge = memberCenterService.rechargeTobe(user.getId());
		// 累计逾期还款--
		Object overPayment = memberCenterService.overRepayment(user.getId());
		// 预计账户总收益--
		Object preRepayMoney = memberCenterService.preRepayMoney(user.getId());
		// 已得收益
		Object realMoney = moneyService.netInterest(user.getId());
				
		// 待收收益
		Object dueRepay = moneyService.interestToBe(user.getId());
		// 待收本金
		Object toMoney = moneyService.toBeClosed(user.getId());

		// 投资记录 1未发布、2进行中、3回款中、4已完成
		// 竞标中投资
		Object lentBid = memberCenterService.investmentRecords(user.getId(), 2);
		// 回收中投资
		Object recoveryLoan = memberCenterService.investmentRecords(
				user.getId(), 3);
		// 收完的投资
		Object harvestedLoan = memberCenterService.investmentRecords(
				user.getId(), 4);
		// 累计收益
		Object inCome = memberCenterService.netInterest(user.getId());

		// 借款记录 1未发布、2进行中、3回款中、4已完成
		// 发标中借款
		Object issuingThe = memberCenterService.borrowing(user.getId(), 2);
		// 偿还中借款
		Object repaymentThe = memberCenterService.borrowing(user.getId(), 3);
		// 还清的借款
		Object borrowed = memberCenterService.borrowing(user.getId(), 4);
		// 累计利息成本
		Object interest = memberCenterService.interest(user.getId());
		// 已用额度
		Object usedAmount = memberCenterService.usedAmount(user.getId());
		// 查询当前登录会员的未读信息
		Object obj = memberCenterService.queryIsReadCount(user.getId(), 0);
		if (null == obj || StringUtil.isBlank(obj.toString())) {
			obj = "0";
		}
		// 查询用户积分
		Object score = memberCenterService.score(user.getId());

		// 保存未读消息
		request.getSession().setAttribute("messagecount", obj);
		request.setAttribute("bool", bool);
		request.setAttribute("user", user);
		// 重新保存session的值
		request.getSession().setAttribute(Constant.SESSION_USER, user);
		request.setAttribute("isVip", isVip);
		request.setAttribute("payment", payment);
		request.setAttribute("noTransfer", noTransfer);
		request.setAttribute("noRecharge", noRecharge);
		request.setAttribute("lentBid", lentBid);
		request.setAttribute("recoveryLoan", recoveryLoan);
		request.setAttribute("harvestedLoan", harvestedLoan);
		request.setAttribute("inCome", inCome);
		request.setAttribute("issuingThe", issuingThe);
		request.setAttribute("repaymentThe", repaymentThe);
		request.setAttribute("borrowed", borrowed);
		request.setAttribute("interest", interest);
		request.setAttribute("usedAmount", usedAmount);
		request.setAttribute("overPayment", overPayment);
		request.setAttribute("preRepayMoney", preRepayMoney);
		request.setAttribute("realMoney", realMoney);
		request.setAttribute("toMoney", toMoney);
		request.setAttribute("dueRepay", dueRepay);
		request.setAttribute("score", score == null ? 0 : score);
		return new ModelAndView("/WEB-INF/views/member/memberCenter");
	}
	
	/**
	 * APP页面，个人中心
	 * @param request
	 * @return
	 */
	@RequestMapping("/app_member_center")
	public ModelAndView appMemberCenter(HttpServletRequest request) {
		// 取到登录用户sesssion
		Userbasicsinfo user = queryUser(request);
		user=UserBaseInfoService.queryUserById(user.getId());
		Userfundinfo funding = user.getUserfundinfo();
		// 查询用户是否设置安全问题
		boolean bool = memberCenterService.isSecurityproblem(user.getId());
		//刚注册的时候，关闭验证，此时funding为null
		if(null!=funding){
			//用户如果开通了ips帐户，再做检查。
			if (null != funding.getpIdentNo()
					&& !("".equals(funding.getpIdentNo()))) {
				// 获取该用户的账户资金
				BalanceInquiryInfo money = RegisterService.accountBalance(funding
						.getpIdentNo());
				// IPS账户余额
				double removeMoney = Double.parseDouble(money.getpBalance());
				// 本地帐户余额
				double localMoney = funding.getCashBalance();
				if (removeMoney != localMoney) {
					funding.setCashBalance(removeMoney);
					memberCenterService.update(funding);
				}
			}
		}
		// 是否为vip用户
		Object isVip = vipInfoService.isVip(user.getId());
		// 累积支付(账号资金总额=可用现金金额+待确认投标+待确认提现-累计支付)
		Object payment = memberCenterService.payment(user.getId());
		// 待确认提现
		Object noTransfer = memberCenterService.noTransfer(user.getId());
		// 待确认充值
		Object noRecharge = memberCenterService.rechargeTobe(user.getId());
		// 累计逾期还款
		Object overPayment = memberCenterService.overRepayment(user.getId());
		// 预计账户总收益
		Object preRepayMoney = memberCenterService.preRepayMoney(user.getId());
		// 已得收益
		Object realMoney = memberCenterService.realMoney(user.getId());
		// 待收收益
		Object dueRepay = memberCenterService.dueRepay(user.getId());
		// 待收本金
		Object toMoney = memberCenterService.toMoney(user.getId());

		// 投资记录 1未发布、2进行中、3回款中、4已完成
		// 竞标中投资
		Object lentBid = memberCenterService.investmentRecords(user.getId(), 2);
		// 回收中投资
		Object recoveryLoan = memberCenterService.investmentRecords(
				user.getId(), 3);
		// 收完的投资
		Object harvestedLoan = memberCenterService.investmentRecords(
				user.getId(), 4);
		// 累计收益
		Object inCome = memberCenterService.netInterest(user.getId());

		// 借款记录 1未发布、2进行中、3回款中、4已完成
		// 发标中借款
		Object issuingThe = memberCenterService.borrowing(user.getId(), 2);
		// 偿还中借款
		Object repaymentThe = memberCenterService.borrowing(user.getId(), 3);
		// 还清的借款
		Object borrowed = memberCenterService.borrowing(user.getId(), 4);
		// 累计利息成本
		Object interest = memberCenterService.interest(user.getId());
		// 已用额度
		Object usedAmount = memberCenterService.usedAmount(user.getId());
		// 查询当前登录会员的未读信息
		Object obj = memberCenterService.queryIsReadCount(user.getId(), 0);
		if (null == obj || StringUtil.isBlank(obj.toString())) {
			obj = "0";
		}
		// 查询用户积分
		Object score = memberCenterService.score(user.getId());

		// 保存未读消息
		request.getSession().setAttribute("messagecount", obj);
		request.setAttribute("bool", bool);
		request.setAttribute("user", user);
		// 重新保存session的值
		request.getSession().setAttribute(Constant.SESSION_USER, user);
		request.setAttribute("isVip", isVip);
		request.setAttribute("payment", payment);
		request.setAttribute("noTransfer", noTransfer);
		request.setAttribute("noRecharge", noRecharge);
		request.setAttribute("lentBid", lentBid);
		request.setAttribute("recoveryLoan", recoveryLoan);
		request.setAttribute("harvestedLoan", harvestedLoan);
		request.setAttribute("inCome", inCome);
		request.setAttribute("issuingThe", issuingThe);
		request.setAttribute("repaymentThe", repaymentThe);
		request.setAttribute("borrowed", borrowed);
		request.setAttribute("interest", interest);
		request.setAttribute("usedAmount", usedAmount);
		request.setAttribute("overPayment", overPayment);
		request.setAttribute("preRepayMoney", preRepayMoney);
		request.setAttribute("realMoney", realMoney);
		request.setAttribute("toMoney", toMoney);
		request.setAttribute("dueRepay", dueRepay);
		request.setAttribute("score", score == null ? 0 : score);
		return new ModelAndView("/WEB-INF/views/member/appMemberCenter");
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
	@RequestMapping("/system_message")
	public ModelAndView querySystemMessage(
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
		// 查询用户登录日志
		List logs = memberCenterService.queryLog(user.getId());
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("count", Integer.parseInt(obj.toString()));
		request.setAttribute("messagecount", Integer.parseInt(obj.toString())
				- Integer.parseInt(read.toString()));
		request.setAttribute("read", read);
		request.setAttribute("unRead", Integer.parseInt(obj.toString())
				- Integer.parseInt(read.toString()));
		request.setAttribute("logs", logs);
		return new ModelAndView("/WEB-INF/views/member/systemMessage");
	}

	/**
	 * 根据编号删除系统消息
	 * 
	 * @param page
	 *            分页对象
	 * @param ids
	 *            多个会员编号，以逗号分开
	 * @param request
	 *            请求
	 * @return 返回视图.jsp
	 */
	@RequestMapping("/deletes")
	public ModelAndView deletes(
			@ModelAttribute("PageModel") PageModel page,
			@RequestParam(value = "ids", defaultValue = "", required = false) String ids,
			HttpServletRequest request) {
		try {
			// 删除系统消息
			memberCenterService.deletes(ids);
		} catch (Exception e) {
			e.getMessage();
		}
		return querySystemMessage(page, null, null, request);
	}

	/**
	 * ajax加载我的首页数据
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/ajaxRecord")
	public void ajaxRecord(HttpServletRequest request,
			HttpServletResponse response) {
		JSONObject json = new JSONObject();
		PrintWriter out = null;
		try {
			Userbasicsinfo user = queryUser(request);
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			// 累积支付(账号资金总额=可用现金金额+待确认投标+待确认提现-累计支付)
			Object payment = memberCenterService.payment(user.getId());
			json.accumulate("payment", payment);
			// 待确认提现(冻结金额=竞标中借出+待确认提现)
			Object noTransfer = memberCenterService.noTransfer(user.getId());
			json.accumulate("noTransfer", noTransfer);

			// 投资记录 1未发布、2进行中、3回款中、4已完成
			// 竞标中投资
			Object lentBid = memberCenterService.investmentRecords(
					user.getId(), 2);
			json.accumulate("lentBid", lentBid);
			// 回收中投资
			Object recoveryLoan = memberCenterService.investmentRecords(
					user.getId(), 3);
			json.accumulate("recoveryLoan", recoveryLoan);
			// 收完的投资
			Object harvestedLoan = memberCenterService.investmentRecords(
					user.getId(), 4);
			json.accumulate("harvestedLoan", harvestedLoan);
			// 累计收益
			Object inCome = memberCenterService.netInterest(user.getId());
			json.accumulate("inCome", inCome);

			// 借款记录 1未发布、2进行中、3回款中、4已完成
			// 发标中借款
			Object issuingThe = memberCenterService.borrowing(user.getId(), 2);
			json.accumulate("issuingThe", issuingThe);
			// 偿还中借款
			Object repaymentThe = memberCenterService
					.borrowing(user.getId(), 3);
			json.accumulate("repaymentThe", repaymentThe);
			// 还清的借款
			Object borrowed = memberCenterService.borrowing(user.getId(), 4);
			json.accumulate("borrowed", borrowed);
			// 累计利息成本
			Object interest = memberCenterService.interest(user.getId());
			json.accumulate("interest", interest);
			// 已用额度
			Object usedAmount = memberCenterService.usedAmount(user.getId());
			json.accumulate("usedAmount", usedAmount);
			out.print(json);
		} catch (Throwable e) {
			json.element("msg", "读取数据出错！");
			out.print(json);
		}
	}
}
