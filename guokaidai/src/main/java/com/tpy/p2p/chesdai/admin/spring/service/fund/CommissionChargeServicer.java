package com.tpy.p2p.chesdai.admin.spring.service.fund;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.YJKCost;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.YJKCost;

@Service
public class CommissionChargeServicer {
	@Resource
	private HibernateSupport commonDao;
	
	public YJKCost find(){
		       List<YJKCost> list= commonDao.find("from YJKCost");
		       if(list.size()>0){
		    	   return list.get(0);
		       }
		       return null;
	}
	
	public void SaveOrUpdate(YJKCost yjkCost){
		commonDao.saveOrUpdate(yjkCost);
	}
}
