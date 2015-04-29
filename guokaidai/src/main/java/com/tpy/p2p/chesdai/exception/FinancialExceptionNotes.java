package com.tpy.p2p.chesdai.exception;

import javax.annotation.Resource;

import com.tpy.base.spring.exception.ResponseException;
import com.tpy.base.spring.exception.ResponseExceptionFactory;
import com.tpy.base.util.AnnotationUtil;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.admin.spring.service.AccountInfoService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.enums.ENUM_FINANCIAL_EXCEPTION;
import com.tpy.p2p.chesdai.entity.ExceptionNoteInfo;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.springframework.stereotype.Component;

import com.tpy.p2p.chesdai.spring.service.EmailService;

/**
 * 资金异常记录者
 * @author ldd
 *
 */
@Component
public class FinancialExceptionNotes {

    /**
     * EmailService
     */
    @Resource
    private EmailService serviceEmail;
    
    /**
     * ResponseExceptionFactory
     */
    @Resource
    private ResponseExceptionFactory factory;
    
    @Resource
    private AccountInfoService accountInfoService;
    
    /**
     * 记录
     * @param type  类型
     * @param remark    备注
     * @param user  用户
     * @param exchange  流动资金
     * @param balance   余额
     * @param json  json
     * @throws ResponseException 响应式异常
     */
    public void note(ENUM_FINANCIAL_EXCEPTION type,String remark,Userbasicsinfo user,String exchange,String balance,String json) throws ResponseException {
        
       
        
        ExceptionNoteInfo info = new ExceptionNoteInfo();
        
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
        
        accountInfoService.addExceptionNote(info,user.getId(),type,exchange,remark,balance);
        
        serviceEmail.sendEmail(Constant.PROJECT_NAME+"-异常邮件", info.toString(), Constant.SYSTEM_EXCEPTION_RECEIVE);
        
        throw factory.born(type.toString(), AnnotationUtil.getFieldConfigValue(type)+"失败！",null, null, remark, json);
    }
}
