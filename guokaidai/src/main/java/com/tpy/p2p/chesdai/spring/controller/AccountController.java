package com.tpy.p2p.chesdai.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.model.PageModel;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**   
 * Filename:    AccountController.java   
 * Company:     太平洋金融  
 * @version:    1.0   
 * @since:  JDK 1.7.0_25  
 * Create at:   2014年2月20日 下午4:16:37   
 * Description:  
 *   
 * Modification History:   
 * 时间    			作者   	   	版本     		描述 
 * ----------------------------------------------------------------- 
 * 2014年2月20日 	LiNing      1.0     	1.0Version   
 */

/**
* <p>Title:AccountController</p>
* <p>Description: 前台会员资金明细控制层</p>
* <p>Company: 太平洋金融</p>
* @author LiNing
* <p>date 2014年2月20日</p>
*/
@Controller
@RequestMapping("/member_account")
@CheckLogin(value=CheckLogin.WEB)
public class AccountController {

    /** 资金明细服务层*/
    @Resource
    private AccountService accountService;
    
    /**
    * <p>Title: queryPage</p>
    * <p>Description: </p>
    * @param starttime 开始时间
    * @param endtime 结束时间
    * @param request HttpServletRequest
    * @param page 分页信息
    * @return 数据展示页面
    */
    @RequestMapping("/query_page")
    public String queryPage(String starttime,String endtime,HttpServletRequest request,PageModel page){
        
        //获取当前登录人
        Userbasicsinfo userBasic= (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
        
        request.setAttribute("accountlist", accountService.queryPage(starttime, endtime, page, userBasic));
        
        request.setAttribute("page", page);
        
        return "/WEB-INF/views/member/money_record";
        
    }
    
}
