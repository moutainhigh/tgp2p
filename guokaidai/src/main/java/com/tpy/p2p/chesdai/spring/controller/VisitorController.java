package com.tpy.p2p.chesdai.spring.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.admin.spring.service.ColumnManageService;
import com.tpy.p2p.chesdai.admin.spring.service.column.ManualService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.enums.ENUM_SHOW_STATE;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.creditor.ProductService;
import com.tpy.p2p.chesdai.constant.enums.ENUM_PUBLISH_STATE;
import com.tpy.p2p.chesdai.spring.annotation.ProductVerification;
import com.tpy.p2p.chesdai.spring.service.VisitorService;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.CityInfoService;

/**
 * 普通请求
 * 
 * @author dgg
 * 
 */
@RequestMapping({ "visitor", "/" })
@Controller
public class VisitorController {

    /**
     * HibernateSupport
     */
    @Resource
    HibernateSupport dao;

    /**
     * VisitorService
     */
    @Resource
    VisitorService visitorservice;
    
    @Resource
	private LoanInfoService loanInfoService;
    
    @Resource
	private LoanSignQuery loanSignQuery;
    
    /**
     * CityInfoService
     */
    @Resource
    CityInfoService cityInfoService;

    /**
     * ColumnManageService
     */
    @Resource
    ColumnManageService columnservice;

    /**
     * ProductService
     */
    @Resource
    ProductService productService;
    
    /**
     * ProductService
     */
    @Resource
    ManualService manualService;
    /**首页产品显示最大行数*/
    private static final int maxRows=6; 
    /**
     * 根据省份id查询城市
     * 
     * @param request
     *            请求
     * @param provinceId
     *            省份编号
     * @return url
     */
    @SuppressWarnings("rawtypes")
    @RequestMapping("/querycity")
    public String queryCity(HttpServletRequest request, Long provinceId) {
        List list = cityInfoService.queryCityByProvince(provinceId);
        request.setAttribute("list", list);
        return "WEB-INF/views/visitor/city";
    }

    /**
     * 跳转到登陆界面
     * 
     * @return 登陆界面
     */
    @RequestMapping("to-login")
    public String toLogin() {
        return "WEB-INF/views/visitor/login";
    }

    /**
     * 跳转到注册界面
     * 
     * @return 注册界面
     */
    @RequestMapping("to-regist")
    public String toRegist() {
        return "WEB-INF/views/visitor/regist";
    }

    /**
     * 跳转到我的认购记录
     * 
     * @return 页面
     */

    @RequestMapping("my-product-list")
    public String toMyProductList() {
    	
        return "WEB-INF/views/member/product-list";
    }
    
    
    /**
	 * 跳转到我要理财
	 * @param request
	 * @return
	 */
	@RequestMapping("manageFinances.htm")
	public String  toMoney(){
		return "WEB-INF/views/visitor/toMoney";
	}

	/**
	 * 跳转到新手指引
	 * @return
	 */
	@RequestMapping("newLine.htm")
	public String  newLine(HttpServletRequest request){
		request.setAttribute("manualList",productService.getManual());
		return "WEB-INF/views/visitor/newLine";
	}
	
	/**
	 * 开放平台
	 * @return
	 */
	@RequestMapping("openPlatform.htm")
	public String  openPlatform(){
		return "WEB-INF/views/visitor/openPlatform";
	}
	
	@RequestMapping("building.htm")
	public String building(){
		
		return "WEB-INF/views/visitor/building";
	}
	
    // /**
    // * 页面跳转
    // *
    // * @param pageUrl
    // * (页面路径)
    // * @param request 请求
    // * @return 返回路径
    // */
    // @RequestMapping("jumpToPage")
    // @Deprecated
    // public String jumpToPage(String pageUrl, HttpServletRequest request) {
    // LOG.error("该方法存在安全问题，请勿使用！URL:"+request.getRequestURI());
    // return "WEB-INF/views/" + pageUrl;
    // }

    /**
     * 产品列表
     * 
     * @return 列表
     */
    @RequestMapping("/product-list")
    public Object toProductList() {

        return "WEB-INF/views/visitor/product-list";
    }

    /**
     * 产品列表
     * 
     * @param page
     *            分页
     * @return 列表
     */
    @RequestMapping("/page-product-list")
    @ResponseBody
    public Object pageProductList(Page page) {

        page.setData(dao
                .pageListByHql(
                        page,
                        "SELECT a.id,a.name,a.productType.dayDuring,a.ratePercentYear*100,a.productType.ratePayType,a.timePublish,a.investedMoeny,(a.investMax-a.investedMoeny),a.productType.dayType FROM Product a WHERE a.shows=? AND a.status=?",
                        false, ENUM_SHOW_STATE.TRUE.ordinal(),
                        ENUM_PUBLISH_STATE.PUBLISH.ordinal()));

        return page;

    }

    /**
     * 跳转到单页
     * 
     * @param topicId
     *            一级栏目id
     * @param request
     *            HttpServletRequest
     * @return 返回单页页面
     */
    @RequestMapping("showDeputPage")
    public String showDeputPage(String topicId, HttpServletRequest request) {
        request.setAttribute("topicId", topicId);
        return "WEB-INF/views/visitor/communal/danye";
    }

    /**
     * 跳转到产品详细信息
     * 
     * @param product
     *            产品id
     * @param request
     *            HttpServletRequest
     * @return 返回产品信息页面路径
     */
    @RequestMapping("product-info")
    @ProductVerification
    public String productInfo(Product product, HttpServletRequest request) {

        product = dao.get(Product.class, product.getId());

        request.setAttribute("data", product);
        request.setAttribute(
                "list",
                dao.fillQuery(
                        dao.getSession().getNamedQuery("product_info_history"),
                        product.getId()).list());

        visitorservice.putProductInfoRightCity(request);

        return "WEB-INF/views/visitor/product-info";
    }

    /**
     * 显示首页
     * 
     * @param request
     *            HttpServletRequest
     * @return 返回首页路径
     */
    @RequestMapping({ "/index", "/" })
    public String indexShow(HttpServletRequest request,Integer no) {
    	if(no==null) no=1;
        return initIndex(request,no);
    }

    /**
     * 初始化首页数据
     * @param request HttpServletRequest
     * @return String
     */
    @SuppressWarnings("deprecation")
	public String initIndex(HttpServletRequest request,Integer no){
        request.setAttribute("artList01", columnservice.queryArticle("公告"));
        request.setAttribute("artList02", columnservice.queryArticle("新闻"));
        request.setAttribute("artList03", columnservice.queryArticle("风采"));
        request.setAttribute("artList04", columnservice.queryArticle("常见问题"));
        request.setAttribute("artList05", columnservice.queryArticle("理财新闻"));
        request.setAttribute("artList06", columnservice.queryArticle("理财学堂"));
        
        // 加载首页产品列表
        List<Object[]> loansignList= new ArrayList<Object[]>();
        List<Loansign> loansigns=productService.initToplatest();
		
        //投资记录
        List<Object[]> loanRecord=new ArrayList<Object[]>();
		for(int i=0;i<loansigns.size();i++){
			Object[] objs=new Object[19];//保存产品信息
			if(objs==null||objs.equals(null)){
				continue;
			}
			Object[] rd=new Object[3];//保存投资记录信息
			List<Loansignbasics> ls=new ArrayList<>(loansigns.get(i).getLoansignbasicses());
			List<Loanrecord> lr=new ArrayList<>(loansigns.get(i).getLoanrecords());
			List<Attachment> am=new ArrayList<>(loansigns.get(i).getAttachments());
			//投资记录
			for(Loanrecord item:lr){
				rd[0]=item.getUserbasicsinfo().getUserName();
				rd[1]=item.getTenderMoney();
				rd[2]=item.getTenderTime();
				loanRecord.add(rd);
			}
				
			objs[0]=loansigns.get(i).getId();//借款标ID
			objs[1]=ls.get(0).getLoanTitle();//标题
			objs[2]=loansigns.get(i).getIssueLoan();//金额
			objs[3]=loansigns.get(i).getRate();//利率
			objs[4]=loansigns.get(i).getMonth();//投标期限
			objs[5]=loansigns.get(i).getPublishTime();//标发布时间
			//投标金额
			Double tenderMoney=0.0000;
			for(int j=0;j<lr.size();j++){
				tenderMoney+=lr.get(j).getTenderMoney();
			}
			String imgUrl="";
			
			for (int k = 0; k < am.size(); k++) {
				System.out.println(imgUrl);
				imgUrl = am.get(k).getAttachmentName();
			}
			objs[6]=tenderMoney;
			objs[7]=loansigns.get(i).getIssueLoan()-tenderMoney;//还需金额
			objs[8]=loansigns.get(i).getRefundWay();//还款方式
			objs[9]=loansigns.get(i).getLoanUnit();//最小借出单位
			objs[10]=loansigns.get(i).getVipCounterparts()*loansigns.get(i).getLoanUnit();//最大借出单位
			objs[11]=loansigns.get(i).getIssueLoan()/loansigns.get(i).getLoanUnit();//总标数
			objs[12]=loansigns.get(i).getLoanstate();//借款标状态
			objs[13]=tenderMoney/loansigns.get(i).getIssueLoan();//投标进度
			objs[15]=loansigns.get(i).getLoanType();//借款标类型
			objs[16]=loansigns.get(i).getLoansignbasics().getViews();//浏览数
			objs[17]=imgUrl;
			objs[18]=loansigns.get(i).getSubType();//标种子类型
			objs[14]=null;
            if(loansigns.get(i).getProduct() == Loansign.DISPERSION_BID){
                loansignList.add(objs);
            }

		}
		//首页右边动态数据
		int lrcount=loanInfoService.getloanRecordCount();
		int bcount=loanInfoService.getloanBorrowCount();
		Double money=loanInfoService.getloanRecordSum();	
		request.setAttribute("lrcount", lrcount);
        request.setAttribute("bcount", bcount);
        request.setAttribute("money", money);
        request.setAttribute("loanlist5", loansignList);
        request.setAttribute("loanRecord", loanRecord);
        
        //加载债权转让
        List<Object[]> loansignListAssignment= new ArrayList<Object[]>();
        
        List<Loansign> loansignAssignment=productService.initToplaAssignment();
		
        //投资记录
		for(int i=0;i<loansignAssignment.size();i++){
			Object[] objs=new Object[19];//保存产品信息
			List<Loansignbasics> ls=new ArrayList<>(loansignAssignment.get(i).getLoansignbasicses());
			List<Attachment> am=new ArrayList<>(loansignAssignment.get(i).getAttachments());
			
			objs[0]=loansignAssignment.get(i).getId();//借款标ID
			objs[1]=ls.get(0).getLoanTitle();//标题
			objs[2]=loansignAssignment.get(i).getIssueLoan();//金额
			objs[3]=loansignAssignment.get(i).getRate();//利率
			objs[4]=loansignAssignment.get(i).getMonth();//投标期限
			objs[5]=loansignAssignment.get(i).getPublishTime();//标发布时间
			//投标金额
			Double tenderMoney=0.0000;
			String loanrecordMoeny=productService.getLoanrecordMoney(loansignAssignment.get(i).getId().toString());
			if(!loanrecordMoeny.equals("")&&loanrecordMoeny!=""){
				tenderMoney=Double.parseDouble(loanrecordMoeny);
			}
			
			String imgUrl="";
			
			for(int k=0;k<am.size();k++){
				imgUrl=am.get(k).getAttachmentName();
			}
			objs[6]=tenderMoney;
			objs[7]=loansignAssignment.get(i).getIssueLoan()-tenderMoney;//还需金额
			objs[8]=loansignAssignment.get(i).getRefundWay();//还款方式
			objs[9]=loansignAssignment.get(i).getLoanUnit();//最小借出单位
			objs[10]=loansignAssignment.get(i).getVipCounterparts()*loansignAssignment.get(i).getLoanUnit();//最大借出单位
			objs[11]=loansignAssignment.get(i).getIssueLoan()/loansignAssignment.get(i).getLoanUnit();//总标数
			objs[12]=loansignAssignment.get(i).getLoanstate();//借款标状态
			objs[13]=tenderMoney/loansignAssignment.get(i).getIssueLoan();//投标进度
			objs[15]=loansignAssignment.get(i).getLoanType();//借款标类型
			objs[16]=loansignAssignment.get(i).getLoansignbasics().getViews();//浏览数
			objs[17]=imgUrl;
			objs[18]=loansignAssignment.get(i).getSubType();//标种子类型
			GregorianCalendar gc=new GregorianCalendar();
			Date date;
			try {
				date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(loansignAssignment.get(i).getPublishTime());
				gc.setTime(date);
				SimpleDateFormat   df   =   new   SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				gc.add(5, +ls.get(0).getBidTime());
				objs[14]=df.format(gc.getTime());

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			loansignListAssignment.add(objs);
		}
		//获取当前优金计划
		Loansign youxuan=loanSignQuery.getyouxuaning();
		request.setAttribute("youxuan", youxuan);
        request.setAttribute("loanlistCir", loansignListAssignment);
        
        //获取提纲
        request.setAttribute("outlineList", productService.getOutline()); 

        //定存宝相关
        List<TransferPool> pools = productService.getTransferPools();
        request.setAttribute("pools",pools);
        //定存宝相关

        return "WEB-INF/views/visitor/index";
    }
    
    
    /* 首页分页*/
    
   /* @RequestMapping("getLoanList.htm")
    public String loanlist(HttpServletRequest request ,Integer no){
    	
        PageModel page=new PageModel();
        page.setPageNum(no);
        page=productService.initToplatest(page);
		System.out.println(page.getList().get(0));
    	 List<Object[]> objList = new ArrayList<Object[]>();
    	if(null!=page.getList()&&page.getList().size()>0){
			for(int i=0;i<page.getList().size();i++){
				Object[] obj = (Object[]) page.getList().get(i);
				Double issueLoan=Double.valueOf(obj[2].toString());
				Integer loanUnit=(Integer) obj[7];//最小借出
				Integer vipCount=(Integer) obj[8];//vip借出
				String pubTime=(String) obj[5];//发布时间
				Integer bidTime=(Integer) obj[4];//期限5,10,20
				obj[14]=loanUnit * vipCount;//最大借出单位
				Double tenderMoney=0.0000;				
				if(obj[12]!=null){
				tenderMoney =Double.valueOf(obj[12].toString());//投资记录
				System.out.println("kkkkkk"+obj[12]);
				}
				obj[15]=tenderMoney/issueLoan;//投标进度
				obj[16]=issueLoan/loanUnit;//总标数
				GregorianCalendar gc=new GregorianCalendar();
				Date date;
				try {
					date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pubTime);
					gc.setTime(date);
					SimpleDateFormat   df   =   new   SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
					gc.add(5, +bidTime);
					obj[17]=df.format(gc.getTime());

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				objList.add(obj);
			}
		}		
				page.setList(objList);
				request.setAttribute("page",page);
    	return "WEB-INF/views/visitor/loandiv";
    }*/
    
    /**
     * 注册
     * 
     * @param user
     *            用户
     * @param request
     *            HttpServletRequest
     * @return 返回首页路径
     * @throws Exception
     *             抛出异常
     */
    @RequestMapping("/regist")
    public String regist(Userbasicsinfo user, HttpServletRequest request)
            throws Exception {
        user.setCreateTime(DateUtils.format("yyyy:MM:dd HH:mm:ss"));// 设置注册时间
        user.setLockTime(DateUtils.format("yyyy:MM:dd HH:mm:ss"));// 设置被锁时间为当前时间
        try {
            user.getUserrelationinfo().setUserbasicsinfo(user);
            visitorservice.regist(user);
            request.setAttribute("userName", user.getUserName());
            request.setAttribute("result", 1);
            request.setAttribute("msg", "注册成功！");
            return "WEB-INF/views/member/myIndex";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("result", 0);
            request.setAttribute("msg", "注册失败！");
            return "WEB-INF/views/visitor/index";
        }

    }

    /**
     * 登陆
     * 
     * @param userName
     *            用户名
     * @param password
     *            用户密码
     * @param request
     *            HttpServletRequest
     * @return String
     */
    @RequestMapping("/login")
    public String login(String userName, String password,
            HttpServletRequest request) {
        try {
            Userbasicsinfo user = visitorservice.login(userName, password);
            if (user != null) {
                request.setAttribute("userName", userName);
                request.setAttribute("result", 1);
                request.setAttribute("msg", "登陆成功！");
                request.getSession()
                        .setAttribute(Constant.ATTRIBUTE_USER, user);
                return "WEB-INF/views/member/myIndex";
            } else {
                request.setAttribute("result", 0);
                request.setAttribute("msg", "登陆失败！");
                return "WEB-INF/views/visitor/index";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("result", 0);
            request.setAttribute("msg", "登陆失败！");
            return "WEB-INF/views/visitor/index";
        }
    }

    /**
     * 验证用户名是否重复
     * 
     * @param fieldId
     *            文本框id
     * @param fieldValue
     *            文本框值
     * @return List<Object>
     */
    @RequestMapping("/checkOnlyUsername")
    @ResponseBody
    public List<Object> checkOnlyUsername(String fieldId, String fieldValue) {

        List list = new ArrayList();
        boolean flag = visitorservice.checkUserName(fieldValue);
        list.add(fieldId);
        list.add(flag);
        return list;
    }

    /**
     * 验证用户名是否重复
     * 
     * @param fieldId
     *            文本框id
     * @param fieldValue
     *            文本框值
     * @return List<Object>
     */
    @RequestMapping("/checkOnlyEmail")
    @ResponseBody
    public List<Object> checkOnlyEmail(String fieldId, String fieldValue) {

        List list = new ArrayList();
        boolean flag = visitorservice.checkUserEmail(fieldValue);
        list.add(fieldId);
        list.add(flag);
        return list;
    }

    /**
     * 验证验证码是否正确
     * 
     * @param mes_code
     *            输入的验证码
     * @param request
     *            HttpServletRequest
     * @return boolean
     */
    @RequestMapping("/checkValideCode")
    @ResponseBody
    public boolean checkValideCode(String mes_code, HttpServletRequest request) {

        List list = new ArrayList();
        String valideCode = request.getSession().getAttribute("user_login")
                .toString();
        if (valideCode.equalsIgnoreCase(mes_code)) {
            return true;
        } else {
            return false;
        }
    }

    //
    //
    // @RequestMapping("/login")
    // public String login(Userinfo userInfo,String login_check_code,String
    // url,HttpServletRequest request,HttpServletResponse response) throws
    // Exception{
    //
    // String result = "visitor/login";
    //
    // if(!checkCode(request,Constant.ATTRIBUTE_LOGIN_CHECK_CODE,login_check_code))
    // return result;
    //
    // if(service_user.userLogin(userInfo,request,response)){
    //
    // if(url==null || url.trim().length()>0) url = Constant.URL_SUCCESS_LOGIN;
    //
    // response.sendRedirect(url);
    //
    // result = null;
    // }
    //
    // return result;
    // }

    /**
     * 验证验证码
     * 
     * @param request
     *            HttpServletRequest
     * @param name
     *            名字
     * @param value
     *            值
     * @return boolean
     */
    private boolean checkCode(HttpServletRequest request, String name, String value) {

        Object obj = request.getSession().getAttribute(name);
        if (obj == null || value == null
                || !value.equalsIgnoreCase((String) obj)) {// 校验验证码
            request.setAttribute(Constant.ATTRIBUTE_MSG, "验证码错误！");
            return false;
        }
        request.getSession().removeAttribute(name);
        return true;

    }
}
