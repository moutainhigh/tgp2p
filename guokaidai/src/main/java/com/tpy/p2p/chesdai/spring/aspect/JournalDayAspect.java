package com.tpy.p2p.chesdai.spring.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.spring.annotation.Logrecord;

/**
 * 日志记录
 * 
 * @author frank
 * 
 */
@Aspect
@Component
public class JournalDayAspect {

    /**
     * 执行成功
     * 
     * @param jp
     *            切入点
     * @param log
     *            日志
     */
    @AfterReturning("within(com.jubaopen.p2p..*) && @annotation(log)")
    public void executeSuccessful(JoinPoint jp, Logrecord log) {
        LOG.info("ol.........cg");
    }

    /**
     * 发生异常
     * 
     * @param jp
     *            切入点
     * @param log
     *            日志
     * @param ex
     *            异常
     */
    @AfterThrowing(pointcut = "within(com.jubaopen.p2p..*) && @annotation(log)", throwing = "ex")
    public void executeUnSuccessful(JoinPoint jp, Logrecord log, Exception ex) {
        LOG.info("ol.........ex");
    }
}
