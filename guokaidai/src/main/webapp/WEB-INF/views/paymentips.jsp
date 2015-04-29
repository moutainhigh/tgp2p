<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 该页面为测试环讯注册页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
	<h3>正在提交支付信息......</h3>
	<form action="http://pay.ips.net.cn/ipayment.aspx" id="f456" method="post">
		<input type="hidden" name="Mer_code" value="${payment.mer_code}">
		<input type="hidden" name="Billno" value="${payment.billno}">
		<input type="hidden" name="Amount" value="${payment.amount}">
		<input type="hidden" name="Date" value="${payment.date}">
		<input type="hidden" name="Currency_Type" value="${payment.currency_Type}">
		<input type="hidden" name="Gateway_Type" value="${payment.gateway_Type}">
		<input type="hidden" name="Lang" value="${payment.lang}">
		<input type="hidden" name="Merchanturl" value="${payment.merchanturl}">
		<input type="hidden" name="FailUrl" value="${payment.failUrl}">
		<input type="hidden" name="Attach" value="${payment.attach}">
		<input type="hidden" name="OrderEncodeType" value="${payment.orderEncodeType}">
		<input type="hidden" name="RetEncodeType" value="${payment.retEncodeType}">
		<input type="hidden" name="Rettype" value="${payment.rettype}">
		<input type="hidden" name="ServerUrl" value="${payment.serverUrl}">
		<input type="hidden" name="SignMD5" value="${payment.signMD5}">
	</form>
	<script type="text/javascript">
      document.getElementById("f456").submit();
    </script> 
</html>