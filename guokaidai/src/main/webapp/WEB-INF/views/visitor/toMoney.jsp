<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>
<link href="/resources/css/project.css" rel="stylesheet" type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<style>
.borrowDiv {float: left;width: 320px;height: 370px;border: 1px solid #ddd;border-radius: 5px;/*opacity: 1;filter: alpha(opacity=80);*/background-color:#fff;}
/*.borrowDiv:hover{opacity: 1;filter: alpha(opacity=100);}*/
.borrowDiv .headSpan {display: block;padding: 0 20px;height: 60px;border-radius: 5px 5px 0 0;font-size: 20px;color: #fff;line-height: 60px;}
.ui-list {margin-left: 20px}
.ui-list li{line-height: 26px;}
.ui-list li i{ background: none repeat scroll 0 0 #09d;border-radius: 50%;display: block;float: left;height: 4px;margin: 12px 6px 0 0;vertical-align: middle;width: 4px;background-color: #656565 !important;}
.review-button a{border-radius: 5px !important;font-size: 18px !important;height: 40px !important;line-height: 40px !important;text-align: center;width: 160px !important;}
.ui-button-blue { background-color: #0697da;border: 0 none;color: #fff;}
.ui-button-mid { border-radius: 15px;font-size: 16px;height: 30px;line-height: 30px;min-width: 50px;text-align: center;}
.ui-button { border-radius: 2px;cursor: pointer;display: inline-block;padding: 0 15px;text-align: center;text-decoration: none;vertical-align: middle;background-color:#a4a4a4;color:#fff;}
.ui-button-1:hover{background-color:#376191;}
.ui-button-2:hover{background-color:#16ad5e;}
.ui-button-3:hover{background-color:#f07927;}
.review-button a:hover{color:#fff;}
.w70 { width: 70px;}
</style>
</head>
<body>
	<!--mainBox-->
	<div class="mainBox">
		<!--header-->
		<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
		<!-- <script type="text/javascript" src="/resources/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="/resources/js/highcharts.js"></script>
		<script type="text/javascript" src="/resources/js/exporting.js"></script>
		<script type="text/javascript" src="/resources/js/data.js"></script>
		<script type="text/javascript" src="/resources/js/receipts.js"></script> -->
		<!--End header-->

		<div style="width:1000px;height:380px;margin:40px auto">
			<div class="borrowDiv" style="margin-right:16px;">
				<span class="headSpan" style="background: #376191;">太平洋理财理财投资</span>
				<p>&nbsp;</p>
				<p style="padding-left:20px;padding-right: 20px;">加入太平洋理财理财计划，资金以用户认可的既定规则自动进行投标，用户每月的回款也会循环复利再投资，更安全，更便捷，更高效。</p>
				<ul class="ui-list">
                    <li class="fn-clear"><i></i><span>收益稳定，预期年化收益12%-14%</span></li>
                    <li class="fn-clear"><i></i><span>资金安全，投资标的适用本金保障计划</span></li>
                    <li class="fn-clear"><i></i><span>系统优先投标，精选优质债权</span></li>
                    <li class="fn-clear"><i></i><span>多种收益处理方式，灵活方便</span></li>
                    <li class="fn-clear"><i></i><span>低门槛，10,000元起步</span></li>
                    <li class="fn-clear"><i></i><span>锁定期12个月，期满可随时退出</span></li>
                  </ul>
                  <p>&nbsp;</p>
                  <p class="review-button" style="text-align: center">
                      <a href="loaninfo/getYouxuanInfo.htm" class="ui-button ui-button-mid w70 ui-button-1">去加入</a>
                    </p>
                    
			</div>
			<div class="borrowDiv" style="margin-right:16px;">
				<span class="headSpan" style="background: #16ad5e;">太平洋理财散标投资 </span>
				<p>&nbsp;</p>
				<p style="padding-left:20px;padding-right: 20px;">平台提供信用认证标、机构担保标、实地认证标等多类产品，用户根据审核后的信息，自选合适的借款标的，构建符合个人意愿的投资组合。</p>
				<ul class="ui-list">
                    <li class="fn-clear"><i></i><span>收益稳定，预期年化收益12%-14%</span></li>
                    <li class="fn-clear"><i></i><span>资金安全，投资标的适用本金保障计划</span></li>
                    <li class="fn-clear"><i></i><span>系统优先投标，精选优质债权</span></li>
                    <li class="fn-clear"><i></i><span>多种收益处理方式，灵活方便</span></li>
                    <li class="fn-clear"><i></i><span>低门槛，10,000元起步</span></li>
                    <li class="fn-clear"><i></i><span>锁定期12个月，期满可随时退出</span></li>
                  </ul>
                  <p>&nbsp;</p>
                  <p class="review-button" style="text-align: center">
                      <a href="loaninfo/openLoan.htm" class="ui-button ui-button-mid w70 ui-button-2">去加入</a>
                    </p>
			</div>
			<div class="borrowDiv">
				<span class="headSpan" style="background: #f07927;"> 太平洋理财债权转让 </span>
				<p>&nbsp;</p>
				<p style="padding-left:20px;padding-right: 20px;">平台提供债权转让功能，用户可自行转让资产组合中符合条件的债权，也可购买其他用户转让的债权，从而获得折让收益及借款标的后续收益。</p>
				<ul class="ui-list">
                    <li class="fn-clear"><i></i><span>收益稳定，预期年化收益12%-14%</span></li>
                    <li class="fn-clear"><i></i><span>资金安全，投资标的适用本金保障计划</span></li>
                    <li class="fn-clear"><i></i><span>系统优先投标，精选优质债权</span></li>
                    <li class="fn-clear"><i></i><span>多种收益处理方式，灵活方便</span></li>
                    <li class="fn-clear"><i></i><span>低门槛，10,000元起步</span></li>
                    <li class="fn-clear"><i></i><span>锁定期12个月，期满可随时退出</span></li>
                  </ul>
                  <p>&nbsp;</p>
                  <p class="review-button" style="text-align: center">
                      <a href="loaninfo/openLoanCir.htm" class="ui-button ui-button-mid w70 ui-button-3">去加入</a>
                    </p>
			</div>
		</div>

		<div class="clear"></div>
		<!--footer-->
		<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
		<!--End footer-->
		<div class="clear"></div>
	</div>
	<!--End mainBox-->
</body>
</html>
