package com.tpy.p2p.chesdai.admin.spring.service.systemset;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Costratio;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Costratio;

/**
 * 费用比例设置业务处理
 * @author RanQiBing 2014-02-24
 *
 */
@Service
public class ExpenseRatioService {
    
    @Resource
    private HibernateSupport dao;
    
    /**
     * 查询费用比例设置
     * @return 返回费用比例设置对象
     */
    public Costratio findCostratio(){
        
        List<Costratio> list = dao.find("from Costratio");
        
        if(list.size() > 0){
            return list.get(0);
        }
        
        return null;
        
    }
    /**
     * 新增费用比例
     * @param costratio 费用比例对象
     */
    public void save(Costratio costratio){
        dao.save(costratio);
    }
    
    /**
     * 修改费用比例设置
     * @param costratio 费用比例对象
     */
    public void update(Costratio costratio){
        dao.update(costratio);
    }
}
