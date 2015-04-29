package com.tpy.p2p.chesdai.admin.spring.transaction;

import java.text.ParseException;

import javax.annotation.Resource;

import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.Creditor;
import com.tpy.p2p.chesdai.entity.CreditorPayRecord;
import com.tpy.p2p.chesdai.entity.ProductPayRecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;

/**
 * 债权认购长事务
 * 
 * @author ldd
 * 
 */
@Service
public class CreditorPayRecordTransaction {

    /**
     * HibernateSupport
     */
    @Resource
    HibernateSupport dao;

    /**
     * 添加债权认购记录
     * 
     * @param productPayRecordId
     *            产品认购记录
     * @param userbasicsinfo
     *            认购用户
     * @param creditorids
     *            债权们
     * @param moneys
     *            金额们
     * @param timeStarts
     *            开始时间们
     * @param timeEnds
     *            结束时间们
     * @throws java.text.ParseException
     *             时间格式转化异常
     */
    public void addRecord(long productPayRecordId,
            Userbasicsinfo userbasicsinfo, Long[] creditorids, Double[] moneys,
            String[] timeStarts, String[] timeEnds) throws ParseException {

        ProductPayRecord productPayRecord = dao.get(ProductPayRecord.class,
                productPayRecordId);

        Session session = dao.getSession();

        for (int i = 0; i < creditorids.length; i++) {

            CreditorPayRecord record = new CreditorPayRecord();

            record.setTimeStart(timeStarts[i]);
            record.setTimeEnd(timeEnds[i]);
            record.setCreditor(new Creditor(creditorids[i]));
            record.setDayDuring(DateUtils.differenceDateSimple(timeStarts[i],
                    timeEnds[i]));
            record.setMoney(moneys[i]);
            record.setProductPayRecord(productPayRecord);
            record.setUserbasicsinfo(userbasicsinfo);

            session.save(record);

//            if (i % 20 == 0) {
//                session.flush();
//                session.clear();
//            }

        }

    }

}
