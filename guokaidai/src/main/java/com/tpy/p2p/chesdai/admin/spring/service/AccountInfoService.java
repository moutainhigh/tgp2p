package com.tpy.p2p.chesdai.admin.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.constant.enums.ENUM_FINANCIAL_EXCEPTION;
import com.tpy.p2p.chesdai.entity.ExceptionNoteInfo;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.AnnotationUtil;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.constant.enums.ENUM_FINANCIAL_EXCEPTION;
import com.tpy.p2p.chesdai.entity.ExceptionNoteInfo;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;

/**   
 * Filename:    AccountInfo.java   
 * Company:     太平洋金融  
 * @version:    1.0   
 * @since:  JDK 1.7.0_25  
 * Create at:   2014年2月11日 上午11:49:57   
 * Description:  流水账操作服务层
 *   
 * Modification History:   
 * 时间    			作者   	   	版本     		描述 
 * ----------------------------------------------------------------- 
 * 2014年2月11日 	LiNing      1.0     	1.0Version   
 */

/**
* <p>Title:AccountInfo</p>
* <p>Description: 流水账操作服务层</p>
* <p>Company: 太平洋金融</p>
* @author LiNing
* <p>date 2014年2月11日</p>
*/
@Service
public class AccountInfoService {

    
    /** 注入数据库操作层*/
    @Resource
    private HibernateSupport dao;
    
    /**
    * <p>Title: queryPageByUser</p>
    * <p>Description: 后台查询会员的流水账明细</p>
    * @param ids 会员编号
    * @param page 分页信息
    * @return 返回查询结果
    */
    public List queryPageByUser(String ids,PageModel page){
        
        List accountList=new ArrayList();
        
        //判断会员主键是否为数字
        if(StringUtil.isNotBlank(ids)&& StringUtil.isNumberString(ids)){
            StringBuffer sqlBuffer=new StringBuffer("SELECT accountinfo.time,accounttype.`name`,expenditure,income,money,explan  FROM accountinfo");
            
            sqlBuffer.append(" INNER JOIN accounttype ON accounttype_id=accounttype.id WHERE accountinfo.userbasic_id="+ids);
            
            accountList= dao.pageListBySql(page, sqlBuffer.toString(), null);
        }
       
        
        return accountList;
    }
    
    public void addExceptionNote(ExceptionNoteInfo info,Long userId,ENUM_FINANCIAL_EXCEPTION type,String exchange,String remark,String balance ){
    	Userbasicsinfo user = dao.get(Userbasicsinfo.class, userId);
        info.setCurTime(DateUtils.formatSimple());
        info.setErrorType(AnnotationUtil.getFieldConfigValue(type));
        info.setMoneyExchange(exchange);
        info.setRemark(remark);
        info.setStatus(0);
        info.setUserCurBalance(String.valueOf(user.getUserfundinfo().getCashBalance()));
        info.setUserAimBalance(balance);
        info.setUserIps(user.getUserfundinfo().getpIdentNo());
        info.setUserLoginName(user.getUserName());
        info.setUserRealName(user.getName());
        
        dao.save(info);//向数据库插入数据
    }
    
}
