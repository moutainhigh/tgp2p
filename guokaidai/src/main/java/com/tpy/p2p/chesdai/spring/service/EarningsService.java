package com.tpy.p2p.chesdai.spring.service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Earnings;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hsq on 2015/3/18.
 */
@Service
public class EarningsService {
    @Resource
    private HibernateSupport dao;

    @Resource
    private UserBaseInfoService userBaseInfoService;

    @Resource
    private LoanSignQuery loanSignQuery;

    /**
     * 获取收益列表
     * @return
     */
    public List getMyEarnings(Long id,String month){
        String hql = "from Earnings where genuid=" + id + " and month = '" + month +"'";
        List<Earnings> list = dao.find(hql);
        Userbasicsinfo user = null;

        Loansign loan = null;
        for(Earnings e:list){
            user = userBaseInfoService.queryUserById(e.getUid());
            e.setUser(user);
            loan = loanSignQuery.getLoansignById(e.getLoan_id().toString());
            e.setLoan(loan);
        }
        return list;
    }

    /**
     * 被推广人收益列表
     * @return
     */
    public List getMyInviteEarnings(Long id,String month){
        String hql = "from Earnings where uid=" + id + " and month = '" + month +"'";
        List<Earnings> list = dao.find(hql);
        Userbasicsinfo user = null;
        Loansign loan = null;
        for(Earnings e:list){
            user = userBaseInfoService.queryUserById(e.getGenuid());
            e.setUser(user);
            loan = loanSignQuery.getLoansignById(e.getLoan_id().toString());
            e.setLoan(loan);
        }
        return list;
    }

    /**
     * 每月推广产生的总收益
     * @param id
     * @return
     */
    public List getEarningsByMonth(Long id){
        Earnings earnings = null;
        String sql =  "select month,sum(money),genuid from earnings where genuid= " +id +" group by month order by month desc";
        List list = dao.findBySql(sql);
        List<Earnings> elist = new ArrayList<Earnings>();
        for(int i=0;i<list.size();i++){
            Object ob[]=(Object[]) list.get(i);
            earnings = new Earnings();
            earnings.setMonth(ob[0].toString());
            earnings.setTotal(BigDecimal.valueOf(Double.parseDouble(ob[1].toString())));
            earnings.setGenuid(Long.parseLong(ob[2].toString()));
            elist.add(earnings);
        }
        return elist;
    }

    /**
     * 每月受邀请产生的总收益
     * @param id
     * @return
     */
    public List getInviteEarningsByMonth(Long id){
        Earnings earnings = null;
        String sql =  "select month,sum(umoney),uid from earnings where uid= " +id +" group by month order by month desc";
        List list = dao.findBySql(sql);
        List<Earnings> elist = new ArrayList<Earnings>();

        for(int i=0;i<list.size();i++){
            Object ob[]=(Object[]) list.get(i);
            earnings = new Earnings();
            earnings.setMonth(ob[0].toString());
            earnings.setTotal(BigDecimal.valueOf(Double.parseDouble(ob[1].toString())));
            earnings.setGenuid(Long.parseLong(ob[2].toString()));
            elist.add(earnings);
        }
        return elist;
    }

}
