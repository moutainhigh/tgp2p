package com.tpy.p2p.core.userinfo;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.BorrowersApply;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.chesdai.entity.Vipinfo;

/**
 * 关于userfundinfo 和userbasicinfo 的一些查询
 * 
 * @author hsq 2014-5-27
 */
@Service
public class UserInfoQuery {

    /** dao */
    @Resource
    private HibernateSupport dao;

    /**
     * 通过基础信息编号找到用户资金信息
     * 
     * @param userbasicId
     *            基础信息编号
     * @return 用户资金信息
     */
    public Userfundinfo getUserFundInfoBybasicId(Long userbasicId) {
        StringBuffer sb = new StringBuffer(
                "SELECT * from userfundinfo where id=")
                .append(userbasicId);
        List<Userfundinfo> userFundList = dao.findBySql(sb.toString(),
                Userfundinfo.class, null);
        return userFundList.size() > 0 ? userFundList.get(0) : null;
    }

    /***
     * 判断传入的用户目前是否是特权会员
     * 
     * @param userbasicsinfo
     *            会员基础信息
     * @return 是否成功
     */
    public boolean isPrivilege(Userbasicsinfo userbasicsinfo) {
        try {
            StringBuffer sb = new StringBuffer(
                    "SELECT MAX(endtime) from vipinfo where user_id=")
                    .append(userbasicsinfo.getId());
            Object obj = dao.findObjectBySql(sb.toString(), null);
            if (obj != null
                    && DateUtils.isBefore(Constant.DEFAULT_TIME_FORMAT,
                            obj.toString())) {
                return true;
            } else {
                return false;
            }
        } catch (ParseException e) {
            return false;
        }
    }
    /**
     * 
     * @param id
     * @return
     */
    public BorrowersApply getBorrowersApply(Integer typeid){
    	String hql = "from BorrowersApply where type=?";
    	List<BorrowersApply> borr =  dao.find(hql,typeid);
    	return borr.size()>0 ? borr.get(0):null;
    }
    /**
     * 通过id获取BorrowersApply对象
     * @param id
     * @return
     */
    public BorrowersApply getBorrowersApplys(Long id){
    	return dao.get(BorrowersApply.class,id);
    }
    /**
     * 通过borrowers_apply id获取user id
     * @param id borrowers_apply 的id
     * @return user id
     */    
	public Long getUserId(Long id) {
		String sql="select user_id from borrowers_apply where id="+id;
		Object obj=dao.findBySql(sql).get(0);
		return Long.valueOf(obj.toString());
	}
	
	public List<Vipinfo> getisPrivilege(){
		String hql="From Vipinfo where status=2";
		
		List<Vipinfo> list=dao.find(hql);
		
		return list;
	}

}
