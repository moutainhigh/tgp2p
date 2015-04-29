package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.UserBank;
import com.tpy.p2p.chesdai.entity.Validcodeinfo;
import org.springframework.stereotype.Service;

/**
 * 用户银行卡账号业务处理
 * @author RanQiBing 2014-02-12
 *
 */
@Service
public class UserBankService {
    
    @Resource
    private HibernateSupport dao;
    /**
     * 根据用户编号查询银行卡信息
     * @param userId 用户编号
     * @return
     */
    public UserBank getUserBank(Long userId){
        String hql = "from UserBank b where b.userbasicsinfo.id=?";
        List<UserBank> list = dao.find(hql,userId);
        if(list.size() > 0){
            return list.get(0);
        }
        return null;
    }
    /**
     * 添加用户银行卡信息
     * @param userbank 银行卡信息
     */
    public void save(UserBank userbank){
        dao.save(userbank);
    }
    /**
     * 根据当前登录用户查询用户发送的验证码
     * @param id 用户编号
     * @return 用户所发送的验证码信息
     */
    public Validcodeinfo codeUserId(Long id){
        String hql = "from Validcodeinfo v where v.userbasicsinfo.id=?";
        List<Validcodeinfo> list = dao.find(hql,id);
        if(list.size() > 0){
            return list.get(0);
        }
        return null;
    }

    public void delete(Long id){
        dao.delete(dao.get(UserBank.class,id));
    }
}
