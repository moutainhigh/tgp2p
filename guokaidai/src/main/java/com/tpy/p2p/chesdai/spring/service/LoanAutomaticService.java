package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Automatic;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/***
 * 自动投标service*/
@Service
@Transactional
public class LoanAutomaticService {
	 /**
     * 注入HibernateSupport
     */
    @Resource
    private HibernateSupport dao;
    
    /**
     * 查询*/
	public List<Automatic> getAutomaticList(String id, String userid, int no) {
        // 根据用户和标状态查新投资标信息
        String sql = "select * from automatic a where 1=1";
        if(userid!=null){
        	sql+=" and a.userbasicinfo_id="+userid.trim();
        }
        if(id!=null){
        	sql+=" and a.id="+id;
        }
        sql = sql +" group by a.id desc  LIMIT " + no + ",10";
        
        List<Automatic> automaticlist = dao.findBySql(sql, Automatic.class);
        return automaticlist;
    }
   
	public Automatic getAutomaticById(String id) {
        try {
            return dao.get(Automatic.class, Long.valueOf(id));
        } catch (DataAccessException e) {
            return null;
        }
    }
}
