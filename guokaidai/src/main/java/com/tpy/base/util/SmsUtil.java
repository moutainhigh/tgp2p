package com.tpy.base.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.tpy.base.sms.SmsResult;

public class SmsUtil {

	private static final String addr = "http://api.sms.cn/mt/";

	/*
	 * 线生成地址：http://www.sms.cn/password
	 */
	private static final String encode = "utf8";

	public static SmsResult sendSMS(String userId, String pwd, String msgContent, String mobile) throws Exception {

		// 组建请求
		String straddr = addr + "?uid=" + userId + "&pwd=" + pwd + "&mobile="
				+ mobile + "&encode=" + encode + "&content=" + URLEncoder.encode(msgContent,"utf-8");

		StringBuffer sb = new StringBuffer(straddr);
		System.out.println("URL:" + sb);

		// 发送请求
		URL url = new URL(sb.toString());
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("POST");
		BufferedReader in = new BufferedReader(new InputStreamReader(
				url.openStream()));

		// 返回结果
		String inputline = in.readLine();
		LOG.info("sms response:" + inputline);

		String[] results = inputline.split("&");
		// state
		String[] sStats = results[1].split("=");
		if(sStats.length < 2) {
			return null;
		}
		String sStat = sStats[1];
		boolean bStat = false;
		if(sStat.equals("100") ){
			bStat = true;
		}
		// msg
		String[] sMsgs = results[2].split("=");
		if(sMsgs.length < 2) {
			return null;
		}
		String sMsg = sMsgs[1];
		if(results.length > 2) {
			return new SmsResult(bStat, results[0], sMsg);
		}
		else {
			return null;
		}
	}

}