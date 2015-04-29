package com.tpy.p2p.chesdai.admin.spring.service;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import com.tpy.p2p.core.userinfo.UserInfoQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.chesdai.entity.Loanrecord;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Userfundinfo;
import com.tpy.p2p.core.loansignfund.LoanSignFund;
import com.tpy.p2p.core.userinfo.UserInfoQuery;

/***
 * 自动投标设置
 * 
 * @author longyang 2014-1-2
 * 
 * 
 */
@Service
@Transactional
public class AutomaticService {

    /** commonDao */
    @Resource
    private HibernateSupport commonDao;

    /** userInfoQuery */
    @Resource
    private UserInfoQuery userInfoQuery;

    /** loanSignFund */
    @Autowired
    private LoanSignFund loanSignFund;

    /**
     * 普通标发布时调用的方法*******只针对于普通标
     * 
     * @param loansign
     *            借款标
     * @return 是否成功
     */
    public boolean automaticRelease(Loansign loansign) {
        // 获取当前有效的自动设置参数
        StringBuffer sb = new StringBuffer(
                "SELECT a.* FROM automatic a LEFT JOIN vipinfo ON a.userbasicinfo_id = vipinfo.user_id WHERE a.state = 1 AND a.toborrow =")
                .append(loansign.getMonth()).append(
                        " ORDER BY vipinfo.endtime DESC");
        List<Automatic> automList = commonDao.findBySql(sb.toString(),
                Automatic.class);
        try {
            Object obj = null;
            int copiesNum = 0;
            for (Automatic automatic : automList) {
                // 判断投标的参数是否起作用
                // 自己的借款标自己不能认购
                if (loansign.getLoanType() != 3
                        && automatic.getUserbasicsinfo().getId()
                                .equals(loansign.getUserbasicsinfo().getId())) {
                    continue;
                }
                // 判断年化利率
               /* if (loansign.getRate() < automatic.getYearratebegin()) {
                    continue;
                }
                if (loansign.getRate() > automatic.getYearrateend()) {
                    continue;
                }*/

                Userfundinfo userfundinfo = userInfoQuery
                        .getUserFundInfoBybasicId(automatic.getUserbasicsinfo()
                                .getId());
                // 判断账号余额
                /*if (automatic.getAcount() != null
                        && userfundinfo != null
                        && userfundinfo.getCashBalance() < automatic
                                .getAcount()) {
                    continue;
                }*/

                // 判断用户是否对该标进行了购入
                sb = new StringBuffer(
                        "SELECT COUNT(1) from loanrecord where userbasicinfo_id=")
                        .append(automatic.getUserbasicsinfo().getId())
                        .append(" and loanSign_id=").append(loansign.getId());
                obj = (Object) commonDao.findObjectBySql(sb.toString());
                if (obj != null && Integer.parseInt(obj.toString()) > 0) {
                    continue;
                }

                // 判断投标金额是否小于等于该标剩余的金额
                sb = new StringBuffer(
                        "SELECT ls.issueLoan-IFNULL(SUM(lr.tenderMoney),0) FROM loanrecord lr,loansign ls where lr.loanSign_id=ls.id and lr.isSucceed=1 and ls.id=")
                        .append(loansign.getId());
                obj = (Object) commonDao.findObjectBySql(sb.toString());
                /*if (automatic.getTenderprice() > Integer.parseInt(obj
                        .toString())) {
                    continue;
                }
                if (automatic.getTenderprice() % loansign.getLoanUnit() != 0) {
                    continue;
                }*/

                // 获取到该用户最多可以买多少份-----------
               /* copiesNum = Integer.parseInt(automatic.getTenderprice()
                        / loansign.getLoanUnit() + "");
*/
                // 保存认购记录
                Loanrecord loanrecord = new Loanrecord();
                // 判断用户是否是特权会员
                loanrecord.setIsPrivilege(userInfoQuery.isPrivilege(automatic
                        .getUserbasicsinfo()) == true ? 1 : 0);
                loanrecord.setIsSucceed(1);
                loanrecord.setLoansign(loansign);
                loanrecord.setTenderMoney(copiesNum
                        * loansign.getLoanUnit().doubleValue());
                loanrecord.setTenderTime(DateUtils
                        .format(Constant.DEFAULT_TIME_FORMAT));
                loanrecord.setUserbasicsinfo(automatic.getUserbasicsinfo());
                commonDao.update(loanrecord);

                // 资金操作
                loanSignFund.updateMoney(
                        new BigDecimal(loanrecord.getTenderMoney())
                                .multiply(new BigDecimal(-1)), Long
                                .valueOf("18"), loanrecord.getTenderTime(),
                        automatic.getUserbasicsinfo().getId(), "自动投标认购", null,
                        loansign.getId());
                loanSignFund.updatePlatformMoney(
                        new BigDecimal(loanrecord.getTenderMoney()),
                        Long.valueOf("18"), loanrecord.getTenderTime(),
                        "自动投标认购", null);
            }
            return true;
        } catch (Exception e) {
            return false;
        }

    }
    
    /**
     * 查询自动投标规则是否启用
     * @param ids
     * @return
     */
    public boolean hasAutoEn(String ids){
    	StringBuffer sqlcount = new StringBuffer(
                "SELECT count(1) from automatic where state=1 and id in (")
                .append(ids.substring(0, ids.length() - 1)).append(")");
        Object obj = commonDao.findObjectBySql(sqlcount.toString());
        if (Integer.parseInt(obj.toString()) > 0) {
            return true;
        }
        return false;
    }
    
    /**
     * 查询自动投标规则是否停用
     * @param ids
     * @return
     */
    public boolean hasAutoDis(String ids){
    	StringBuffer sqlcount = new StringBuffer(
                "SELECT count(1) from automatic where state=2 and id in (")
                .append(ids.substring(0, ids.length() - 1)).append(")");
        Object obj = commonDao.findObjectBySql(sqlcount.toString());
        if (Integer.parseInt(obj.toString()) > 0) {
            return true;
        }
        return false;
    }
    
    /**
     * 启用或停用自动投标规则
     * @param ids
     * @param state
     * @return
     */
    public String updateAuto(String ids, String state) {
        // 如果确认修改的字符串不为空
        if (ids.length() > 0) {
            // 先判断是否全部都能审核
            StringBuffer updatesql = new StringBuffer(
                    "update automatic set state=")
                    .append(state).append(" where id in (")
                    .append(ids.substring(0, ids.length() - 1)).append(")");
            // 批量修改
            if (commonDao.executeSql(updatesql.toString()) <= 0) {
                return "error";
            }
        }
        return "success";
    }
}
