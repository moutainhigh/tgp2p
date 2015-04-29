package com.tpy.p2p.chesdai.spring.service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Banktype;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hsq on 2015/3/2.
 */
public class BankTypeService {

    @Resource
    private HibernateSupport dao;

    public List getBankList(){
        StringBuffer sb = new StringBuffer( "SELECT * from banktype");
        List<Banktype> list = dao.findBySql(sb.toString(), Banktype.class);
        return list;
    }
}
