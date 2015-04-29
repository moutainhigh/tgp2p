package com.tpy.base.sms.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import com.tpy.base.util.TimeUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tpy.base.sms.SmsProxy;
import com.tpy.base.sms.SmsResult;
import com.tpy.base.util.CryptUtils;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.util.StringUtil;

/**
 * 
 * @author wdai_admin
 * 
 */
public class SMSmanages implements SmsProxy {

	private static final Logger logger = LoggerFactory
			.getLogger(SMSmanages.class);

	private static DefaultHttpClient urlClient = null;

	public static Map<String, String> smsMesg = new HashMap<String, String>(8,
			1.0f);

	private static final int SEND_OK = 100;

	/**
	 * 短信类型 实名认证
	 */
	public static final String SMS_REALNAME = "realName";

	/**
	 * 短信类型 手机认证
	 */
	public static final String SMS_PHONE = "phone";

	/**
	 * 短信类型 修改手机号
	 */
	public static final String SMS_UPDATE_PHONE = "updatePhone";

	/**
	 * 短信类型 修改邮箱
	 */
	public static final String SMS_UPDATE_EMAIL = "updateEmail";

	/**
	 * 短信类型 提现申请
	 */
	public static final String SMS_APPLY_CASH = "applyCash";

	/**
	 * 短信类型 修改银行卡信息
	 */
	public static final String SMS_APPLY_BANK = "applyBank";

	/**
	 * 短信类型 找回支付密码
	 */
	public static final String SMS_PAYPWD = "payPwd";

	/**
	 * 短信类型 找回登陆密码
	 */
	public static final String SMS_LOGINPWD = "loginPwd";

	/**
	 * 短信类型 注册
	 */
	public static final String SMS_REGISTER = "register";

	public static final String __session__key__register__phone__code__ = "__session__key__register__phone__code__";

	/**
	 * 短信发送url请求地址
	 */
	public static String sms_host = "http://api.sms.cn/mt/?";

	/**
	 * 短信发送登陆 id
	 */
	private String sms_uid;

	/**
	 * 短信发送登陆 密码
	 */
	private String sms_pwd;

	/**
	 * 90秒超时
	 */
	public static final long TIME_OUT = 120;

	@Override
	public void init(String username, String password, String etc)
			throws UnsupportedEncodingException {
		urlClient = new DefaultHttpClient();
		sms_uid = username;
		sms_pwd = password;
	}

	@Override
	public SmsResult sendSMS(String content, String... telNos)
			throws UnsupportedEncodingException {
		String msg = "短信发送失败！";
		boolean status = false;
		try {
			String date = TimeUtils.stringOfUnixtimestampNow();
			boolean ok = sendSingleSMS(parseTelNo(telNos), content, date);
			if (ok) {
				LOG.info("发送成功");
				status = true;
				msg = "短信发送成功！";
			}

		} catch (Exception e) {
			logger.error("6位随机数生成异常....", e);
		}
		return new SmsResult(status, "sms", msg);

	}

	/**
	 * 格式化电话号码
	 * 
	 * @param telNos
	 *            电话号码数组
	 * @return 格式化后的电话号码
	 */
	private String parseTelNo(String[] telNos) {

		if (telNos.length == 1) {
			return telNos[0];
		}
		StringBuilder sb = new StringBuilder();
		for (String telNo : telNos) {
			sb.append(telNo).append(",");
		}
		return sb.substring(0, sb.length());
	}

	/**
	 * 单条发送短信
	 * 
	 * @param mobiles
	 *            接收号码
	 * @param cont
	 *            短信内容
	 * @param msgid
	 *            短信ID
	 * @return String
	 */
	private boolean sendSingleSMS(String mobile, String cont, String msgId) {

		boolean sendOk = false;
		try {
			String contEncode = URLEncoder.encode(cont, "gbk"); // 短信内容需要编码
			StringBuilder builder = new StringBuilder();
			builder.append(sms_host);
			builder.append("uid=");
			builder.append(sms_uid);
			builder.append("&pwd=");
			builder.append(sms_pwd);
			builder.append("&mobile=");
			builder.append(mobile);
			builder.append("&encode=");
			builder.append("gbk");
			// builder.append("&msgid=");
			// builder.append(msgId);
			builder.append("&content=");
			builder.append(contEncode);

			logger.info(
					"sendSingleSMS begin submit:time={},mobiles={},content={}",
					new Object[] {
							TimeUtils.dateFormat2yyyyMMddHHmmss().format(
									new Date()), mobile, cont });

			NameValuePair[] data = {
			// new NameValuePair("user_name", "user_name")
			};
			String result = submit(builder.toString(), data);
			/*
			 * result的格式：sms&stat=100&message=xxx
			 * 100——发送成功，101——验证失败，102——短信不足，103
			 * ——操作失败，104——非法字符，105——内容过多，106——号码过多
			 * ，107——频率过快，108——号码内容空，109——账号冻结
			 * ，110——禁止频繁单条发送，111——系统暂定发送，112——号码错误
			 * ，113——定时时间格式不对，114——账号被锁，10分钟后登录，115——连接失败，116——禁止接口发送，120——系统升级
			 */
			String[] results = result.split("&");
			String sResult = "0";
			if (results.length > 1) {
				results = results[1].split("stat=");
				if (results.length > 1) {
					sResult = results[1];
				}
			}
			logger.info(
					"sendSingleSMS end submit:time={},mobiles={},content={},result={}",
					new Object[] {
							TimeUtils.dateFormat2yyyyMMddHHmmss().format(
									new Date()), mobile, cont, sResult });
			if (SEND_OK == Integer.parseInt(sResult)) {
				sendOk = true;
			}
		} catch (Exception e) {
			logger.error("短信发送异常 with exception ...", e);
		}
		return sendOk;
	}

	/**
	 * 查询他人回复短信内容 10002#13590234458#0 最后一位表示状态码 状态码：0表示成功，1表示失败
	 * 
	 * @return String
	 */
	public List<String[]> getMO() {

		List<String[]> resultList = null;
		try {

			StringBuilder builder = new StringBuilder();
			builder.append(sms_host);
			builder.append("cmd=getmo&uid=");
			builder.append(sms_uid);
			builder.append("&psw=");
			builder.append(getMd5Pwd(sms_pwd));
			String result = submit(builder.toString());
			if (StringUtil.isNotEmpty(result)) {
				String[] arrayLine = result.split("\n");
				for (int i = 0; i < arrayLine.length; i++) {
					if (i == 0) {
						if (SEND_OK != Integer.parseInt(arrayLine[0])) {
							return null;// 未查询到信息
						} else {
							resultList = new ArrayList<String[]>();
							continue;
						}
					}
					resultList.add(arrayLine[i].split("#"));
				}
			}

		} catch (Exception e) {
			logger.error("短信接收异常 with exception ...", e);
		}
		return resultList;
	}

	/**
	 * 查询短信发送情况 [0] 结果 100有数据 其他 查询错误 [1] 已发送短信数 [2] 还可发送短信数
	 * 
	 * @return
	 */
	public String[] getSendNum() {

		String[] result = null;
		try {

			StringBuilder builder = new StringBuilder();
			builder.append(sms_host);
			builder.append("cmd=getnum&uid=");
			builder.append(sms_uid);
			builder.append("&psw=");
			builder.append(getMd5Pwd(sms_pwd));
			String response = submit(builder.toString());
			result = response.split("#");

		} catch (Exception e) {
			logger.error("短信发送次数查询异常 with exception ...", e);
		}
		return result;
	}

	/**
	 * 取发送状态
	 * 
	 * @return String
	 */
	public String getStatus() {
		String result = null;
		try {

			StringBuilder builder = new StringBuilder();
			builder.append(sms_host);
			builder.append("cmd=getstatus&uid=");
			builder.append(sms_uid);
			builder.append("&psw=");
			builder.append(getMd5Pwd(sms_pwd));
			result = submit(builder.toString());
		} catch (Exception e) {
			logger.error("获取短信发送状态异常 with exception ...", e);
		}
		return result;
	}

	/**
	 * 发送Get请求
	 * 
	 * @param url
	 * @param params
	 * @return
	 */
	public static String submit(String url) {
		String body = null;
		try {
			// Get请求
			HttpGet httpget = new HttpGet(url);
			// 发送请求
			HttpResponse httpresponse = urlClient.execute(httpget);
			// 获取返回数据
			HttpEntity entity = httpresponse.getEntity();
			body = EntityUtils.toString(entity);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return body;
	}

	/**
	 * 发送 Post请求
	 * 
	 * @param url
	 * @param reqXml
	 * @return
	 */
	public static String submit(String newUrl, NameValuePair[] data) {
		String body = null;
		try {
			urlClient.getParams().setParameter("http.protocol.content-charset",
					HTTP.UTF_8);
			urlClient.getParams().setParameter(HTTP.CONTENT_ENCODING,
					HTTP.UTF_8);
			urlClient.getParams().setParameter(HTTP.CHARSET_PARAM, HTTP.UTF_8);
			urlClient.getParams().setParameter(HTTP.DEFAULT_PROTOCOL_CHARSET,
					HTTP.UTF_8);
			// Post请求
			HttpPost httppost = new HttpPost(newUrl);
			// 设置post编码
			httppost.getParams().setParameter("http.protocol.content-charset",
					HTTP.UTF_8);
			httppost.getParams()
					.setParameter(HTTP.CONTENT_ENCODING, HTTP.UTF_8);
			httppost.getParams().setParameter(HTTP.CHARSET_PARAM, HTTP.UTF_8);
			httppost.getParams().setParameter(HTTP.DEFAULT_PROTOCOL_CHARSET,
					HTTP.UTF_8);

			// 设置参数
			httppost.setEntity(new UrlEncodedFormEntity(Arrays.asList(data),
					HTTP.UTF_8));
			// 设置报文头
			httppost.setHeader("Content-Type", "text/xml;charset=UTF-8");
			// 发送请求
			HttpResponse httpresponse = urlClient.execute(httppost);
			// 获取返回数据
			HttpEntity entity = httpresponse.getEntity();
			body = EntityUtils.toString(entity);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return body;
	}

	private static String getMd5Pwd(String pwd) {
		return CryptUtils.md5(pwd);
	}

	/**
	 * 校验手机号码格式
	 * 
	 * @param mobiles
	 * @return
	 */
	public boolean isMobileNumber(String mobile) {
		if (StringUtil.isNotEmpty(mobile)) {
			return Pattern
					.compile("^((13[0-9])|(15[^4,\\D])|(18[^1^4,\\D]))\\d{8}")
					.matcher(mobile).matches();
		} else {
			return false;
		}
	}

	public String getSms_uid() {
		return sms_uid;
	}

	public void setSms_uid(String sms_uid) {
		this.sms_uid = sms_uid;
	}

	public String getSms_pwd() {
		return sms_pwd;
	}

	public void setSms_pwd(String sms_pwd) {
		this.sms_pwd = sms_pwd;
	}

}
