package com.tpy.p2p.chesdai.spring.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.Adminuser;
import com.tpy.p2p.chesdai.util.GetIpAddress;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.Adminuser;
import com.tpy.p2p.chesdai.entity.Log;
import com.tpy.p2p.chesdai.util.GetIpAddress;

@Service
public class AdminLoginLogService {
	
	@Resource
	private HibernateSupport dao;
	
	//记录后台管理人员登录日志
	public void addlog_TRAN(Adminuser adminuser,HttpServletRequest request){
		
		Log loginlog=new Log();
		
		loginlog.setIp(GetIpAddress.getIp(request));
		loginlog.setLoginId(adminuser.getId()+"");
		loginlog.setUserName(adminuser.getRealname());
		loginlog.setLogTime(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		
		//保存登录日志
		dao.save(loginlog);
	}
}
