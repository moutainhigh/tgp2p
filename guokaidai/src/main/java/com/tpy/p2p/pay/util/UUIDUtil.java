package com.tpy.p2p.pay.util;

import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * Created by hsq on 2015/2/14.
 */
public class UUIDUtil {
    private static final Random r = new Random();

    public static synchronized String getUUID()
    {
        String uuid = UUID.randomUUID().toString();
        return uuid.replace("-", "");
    }

    /**
     * 生成充值订单号
     *
     * @param addtime 可为null, 当为null时自动获取当前时间
     *
     * @param userid
     * @return
     */
    public static String createRecargeTradeNo(String addtime, int userid) {
        if (addtime == null) addtime = TimeUtils.stringOfUnixtimestampNow();
        return addtime + userid + getRandomNumber();
    }

    /**
     * 产生0~9随机数
     *
     * @return
     */
    public static int getRandomNumber() {
        return r.nextInt(10);
    }

    /**
     *
     * @param date
     * @return
     */
    public static String stringOfUnixtimestamp(Date date) {
        return String.valueOf(date.getTime() / 1000);
    }
    /**
     *
     * @param args
     */
    public static void main(String[] args){
        System.out.println(getUUID());
    }
}
