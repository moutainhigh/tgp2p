package com.tpy.p2p.chesdai.spring.service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Province;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hsq on 2015/3/3.
 */
public class ProvinceService {

    @Resource
    private HibernateSupport dao;

    public List getProvinceList(){
        StringBuffer sb = new StringBuffer( "SELECT * from province");
        List<Province> list = dao.findBySql(sb.toString(), Province.class);
        return list;
    }

}
