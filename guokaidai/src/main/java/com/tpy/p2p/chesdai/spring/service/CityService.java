package com.tpy.p2p.chesdai.spring.service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.City;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hsq on 2015/3/3.
 */
public class CityService {

    @Resource
    private HibernateSupport dao;

    public List getCityList(int provinceId){
        StringBuffer sb = new StringBuffer( "SELECT id,city_id,name,province_id from city where province_id=").append(provinceId);
        List<City> list = dao.findBySql(sb.toString(), City.class);
        return list;
    }

}
