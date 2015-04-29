package com.tpy.p2p.pay.util;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import com.tpy.base.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sumavision.sumapay.util.SignatureUtil;
/**
 * 丰付
 * @author hsq
 *
 */
public class SumaPayUtils {

	public static int channelid = 60;

	/**
	 *
	 */
	private static String charset = "GBK";

	/**
	 * 丰付商户号
	 */
	private static String suma_member_id = "4410000070";

	/**
	 * 商户秘钥
	 */
	private static String suma_private_key = "qmhNvDSASgKJUi0MWjItilWiNvex9UaS";

	/**
	 * 不带银行编码的支付地址
	 */
	private static String gateway1 = "https://www.sumapay.com/sumapay/unitivepay_bankPayForNoLoginUser";

	/**
	 * 带银行编码的支付地址
	 */
	private static String gateway2 = "https://www.sumapay.com/sumapay/pay_bankPayForNoLoginUser";

	private static String nid = "suma";

	/**
	 * 业务类型代码： 投资理财(BIZ01101)
	 */
	private static String totalBizType = "BIZ01101";

	private static String NotifyUrl = SystemConfig.notify_url + nid;

	private static String PageUrl = SystemConfig.return_url + nid;

	private static final Logger logger = LoggerFactory.getLogger(SumaPayUtils.class);

	/**
	 *
	 * @param money
	 * @param bankCode
	 * @param userid
	 * @return
	 */
	public String doRecharge(String money,String bankCode,int userid) {
		Date now = new Date();
		String addtime = UUIDUtil.stringOfUnixtimestamp(now);
		String tradeNo = UUIDUtil.createRecargeTradeNo(addtime, userid);
		String payUrl = createPayUrl(Double.parseDouble(money), tradeNo, bankCode);

		return payUrl;
	}
	
	public static Map<String, String> createPayParameters(double OrderAmount, Date now, String OrderNo, String InstCode, String BuyerIp) {
		OrderAmount = MathUtils.roundHalfUp(OrderAmount);
		String SendTime = TimeUtils.format(TimeUtils.dateFormatyyyyMMddHHmmss(), now), OrderTime = SendTime;
		// 支付请求签名原始串是：Origin＝Name + Version + Charset + MsgSender + SendTime +
		// OrderNo + OrderAmount + OrderTime + PayType + InstCode + PageUrl +
		// NotifyUrl + ProductName + BuyerContact + BuyerIp + Ext1 + SignType；

		Double data = Double.valueOf(OrderAmount);
		boolean isNumber = data.intValue() == OrderAmount;
		String dataOrderAmount = isNumber ? String.valueOf(data.intValue()) : String.valueOf(OrderAmount);

		Map<String, String> parameter = new LinkedHashMap<String, String>();
		parameter.put("Name", "B2CPayment");
		parameter.put("Version", "V4.1.1.1.1");
		parameter.put("Charset", charset);
		parameter.put("MsgSender", "171140");
		parameter.put("SendTime", SendTime);
		parameter.put("OrderNo", OrderNo);
		parameter.put("OrderAmount", dataOrderAmount);
		parameter.put("OrderTime", OrderTime);
		parameter.put("PayType", "PT001");
		parameter.put("InstCode", InstCode);// 银行编码，参考接口文档
		// String [] resultUrl=dealReturnUrl();
		parameter.put("PageUrl", PageUrl);
		parameter.put("NotifyUrl", NotifyUrl);
		parameter.put("ProductName", "shengfutong");
		parameter.put("BuyerContact", "");
		parameter.put("BuyerIp", BuyerIp);
		parameter.put("Ext1", "");
		parameter.put("SignType", "MD5");

		StringBuilder builder = new StringBuilder();
		for (Map.Entry<String, String> entry : parameter.entrySet()) {
			if (!StringUtil.isBlank(entry.getValue())) {
				builder.append(entry.getValue());
			}
		}
		builder.append(suma_private_key);
		String sign = CryptUtils.md5(builder.toString(), charset).toUpperCase();// php一般用GBK编码格式加密，所以，把java这边的编码格式转成GBK格式的字节数组就行了
		parameter.put("SignMsg", sign);
		
		parameter.put("gateway", gateway1);

		return parameter;
		// //由于要用form表单post过去所以把参数用特殊符号分隔
		// StringBuilder argBuffer = new StringBuilder();
		// for (Map.Entry<String, String> entry : parameter.entrySet()) {
		// argBuffer.append("&#&" + entry.getKey() + "=#=" + entry.getValue());
		// }
		// String arg = argBuffer.substring(3);
		//
		// StringBuilder url = new StringBuilder();
		// url.append(gateway+"?#?");
		// url.append(arg);
		//
		// return url.toString();

	}

	/**
	 * 生成充值链接
	 * @param OrderAmount
	 * @param OrderNo
	 * @param InstCode
	 * @return
	 */
	public static String createPayUrl(double OrderAmount, String OrderNo, String InstCode) {
		OrderAmount = MathUtils.roundHalfUp(OrderAmount);
		Double data = Double.valueOf(OrderAmount);
		boolean isNumber = data.intValue() == OrderAmount;
		String dataOrderAmount = isNumber ? String.valueOf(data.intValue()) : String.valueOf(OrderAmount);
		StringBuilder sb = new StringBuilder();
		sb.append(OrderNo);
		sb.append(suma_member_id);
		sb.append(totalBizType);
		sb.append(dataOrderAmount);
		sb.append(PageUrl);
		sb.append(PageUrl);
		sb.append(NotifyUrl);
			
		String signature = SignatureUtil.keyedEncode(sb.toString(),	suma_private_key);
		
		StringBuilder urlBuilder = new StringBuilder();
		String gateway = "";
//		if(InstCode == null || "".equals(InstCode.trim())){//无银行编码
//			gateway = gateway1;
//			urlBuilder.append(gateway).append('?');
//		}else{ //有银行编码
		    String instcode =  InstCode.toLowerCase();
//		    logger.info("instcode="+instcode);
			gateway = gateway2;
			urlBuilder.append(gateway).append('?').append("bankcode=").append(instcode).append('&');
//		}
	
		urlBuilder.append("requestId=").append(OrderNo);
		urlBuilder.append("&tradeProcess=").append(suma_member_id);
		urlBuilder.append("&totalBizType=").append(totalBizType);
		urlBuilder.append("&totalPrice=").append(dataOrderAmount);
		urlBuilder.append("&backurl=").append(PageUrl);
		urlBuilder.append("&returnurl=").append(PageUrl);
		urlBuilder.append("&noticeurl=").append(NotifyUrl);
		urlBuilder.append("&mersignature=").append(signature);
		urlBuilder.append("&productId=renrenhuirecharge");
		urlBuilder.append("&productName=充值");
		urlBuilder.append("&fund=").append(dataOrderAmount);
		urlBuilder.append("&merAcct=").append(suma_member_id);
		urlBuilder.append("&bizType=").append(totalBizType);
		urlBuilder.append("&productNumber=1");
	//	logger.info("返回的string="+urlBuilder.toString());
		return urlBuilder.toString();
	}
/**
 * 商户流水号+支付系统交易流水号+支付系统会计日期+透传信息
 */
	private static String[] signOrder = new String[] { "requestId", "payId", "fiscalDate", "description"};
    /**
     * 获取通知的
     * @param dataMap
     * @return
     */
	public static String verifyNotify(Map<String, String> dataMap) {
		String SignMsg = dataMap.get("resultSignature");
		String TransStatus = dataMap.get("status");
		if (CommonUtils.isEmpty(SignMsg) || CommonUtils.isEmpty(TransStatus))
			throw new IllegalStateException("NOT FOUND [resultSignature]=" + SignMsg + " OR [status]=" + TransStatus);
		StringBuilder builder = new StringBuilder();
		for (String key : signOrder) {
			String value = dataMap.get(key);
			if (!CommonUtils.isEmpty(key)) {
				builder.append(value);
			}
		}
		String sign =  SignatureUtil.keyedEncode(builder.toString(),	suma_private_key);
		return (SignMsg.equalsIgnoreCase(sign) && "2".equals(TransStatus)) ? dataMap.get("requestId") : null;
	}

	public static void main(String[] args) {
		//logger.info(createPayUrl(1000.0,"112234",null));
		System.out.println(SignatureUtil.keyedEncode("14213936244681024410000065BIZ011010.01http://www.wdai.cn/return.do?nid=sumahttp://www.wdai.cn/return.do?nid=sumahttp://www.wdai.cn/notify.do?nid=suma", "JYcKrAQp7wF270WAkQlEcDKnzNIu46sa"));
		
	}
}
