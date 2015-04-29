package com.tpy.p2p.chesdai.spring.controller.debt;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.invest.InvestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Loansignflow;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.AssignmentService;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.pay.entity.LoanNew;

/**
 * 债权转让
 * @author lkl
 *
 */
@Controller
@RequestMapping("/member_debt")
@CheckLogin(value=CheckLogin.WEB)
public class AssignmentController {
	 @Resource
	 private HibernateSupport dao;
	 
	 @Resource
	 private AssignmentService asssignmentDao;
	 
	 @Resource
	 private LoanSignQuery loanSignQuery;
	 
	 /**
     * 注入InvestService
     */
    @Resource
    private InvestService investService;
    

	 /**
		 * 债权转让申请
		 * @return
		 */
	 @RequestMapping("/init_assignment")
	public String assignmentAsk(Model model, HttpServletRequest request,HttpServletResponse response,
				@RequestParam(value="no",required=false,defaultValue="1")Integer no)throws ParseException{

		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		List loanrecordlist=investService.getLoanRecordTwo(3,user.getId(),(no-1)*10,1);
		List<Object> loannlist= investService.getLoanGlF(loanrecordlist);
		List<LoanNew> list=new ArrayList<LoanNew>();
		for(int i=(no-1)*10;i<loannlist.size();i++){
			LoanNew loan=(LoanNew) loannlist.get(i);
			list.add(loan);
		}
		PageModel pager = getPager(no, loannlist.size());
		request.setAttribute("pager", pager);
		request.setAttribute("loanNew", list);
		return "/WEB-INF/views/member/debt/assignmentdebt";
	}
	 
	 /**
		 * 提交债权转让申请
		 * @return
		 */
	@RequestMapping("/assignmentPost")
	@ResponseBody
	public Integer saveassignment(HttpServletRequest request,HttpServletResponse response){
		try{
			String loanId=request.getParameter("loanId");
		    Double tenderMoney=Double.parseDouble(request.getParameter("tenderMoney"));
		    Integer distype=Integer.parseInt(request.getParameter("distype"));
		    Integer pcrettype=Integer.parseInt(request.getParameter("pcrettype"));
		    String appreciation=request.getParameter("appreciation");
		    Integer share=Integer.parseInt(request.getParameter("share"));
		    Double loanUnit=Double.parseDouble(request.getParameter("loanUnit"));
			Loansignflow loansignflow=new Loansignflow();
			Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
			Integer overdueRepayment=asssignmentDao.selOverdueRepayment(loanId);
			String createDate=loanSignQuery.getcreditTime(Long.parseLong(loanId));
			String newDate=DateUtils.format("yyyy-MM-dd"); //获得当前时间
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date d1=df.parse(createDate.substring(0, 10));
			Date d2=df.parse(newDate);
			if(d1.getTime()==d2.getTime()){
				return 5;
			}
			if(overdueRepayment==0){
				String sql="select flowid from loansignflow where user_debt='"+user.getId()+"' and tenderMoney ='"+tenderMoney+"' and loan_id="+loanId;
				Object flowid=dao.findObjectBySql(sql);
				if(flowid!=null&&!flowid.equals("")){
					return 1;
				}else{
					if(tenderMoney.doubleValue()==loanUnit.doubleValue()){
						pcrettype=1;
					}
					loansignflow.setUserDebt(user.getId());
					loansignflow.setAuditResult(2);
					loansignflow.setAuditStatus(1);
					loansignflow.setLoanId(Long.parseLong(loanId));
					if(pcrettype.equals("1")){
						loansignflow.setTenderMoney(tenderMoney);
					}else{
						loansignflow.setTenderMoney(loanUnit*share);
					}
					loansignflow.setFlowstate(1);
					loansignflow.setDistype(distype);
					loansignflow.setShare(share);
					loansignflow.setPcrettype(pcrettype);
					loansignflow.setAppreciation(Double.parseDouble(appreciation)/100);
					asssignmentDao.save(loansignflow);
				    return 0;
				}
			}else{
				return 3;
			}
		}catch(Exception e){
			e.printStackTrace();
			return 2;
		}
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
   
   /***
    * 查询个人剩余本金
    * @param request
    * @param response
    * @param loanId
    * @return
    */
   @RequestMapping("/assignmentMoeny")
   @ResponseBody
   public Double OverdueMoney(HttpServletRequest request,HttpServletResponse response){
	        String loanid=request.getParameter("loanId");
	        Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
	        Double duemoney=asssignmentDao.getOverdueMoney(loanid, user.getId().toString());
			return duemoney;	
	}
}
