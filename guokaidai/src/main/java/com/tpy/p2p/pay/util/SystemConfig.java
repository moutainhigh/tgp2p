package com.tpy.p2p.pay.util;

/**
 * Created by hsq on 2015/2/14.
 */
public class SystemConfig {

    /**
     *
     */
    public static String  reqURL = "https://www.sumapay.com";

    /**
     * 跳转支付页面
     */
    public static String url = reqURL + "/sumapay/pay_bankPayForNoLoginUser";


    /**
     * 服务器域名地址
     */
    public static String server_domain = "http://www.tpyjr.com.cn";
//    public static String server_domain = "http://501d9fb.nat123.net";      //http://localhost:8080";
    /**
     * 丰付异步返回地址
     */
    //public static String notify_url = server_domain + "/recharge/ff_notify?nid=";
    public static String notify_url = server_domain + "/return/ff_notify?nid=";

    /**
     * 丰付同步返回地址
     */
    //public static String return_url = server_domain + "/recharge/ff_return?nid=";
    public static String return_url = server_domain + "/return/ff_return?nid=";

}