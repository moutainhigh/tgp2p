<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String payurl = (String)request.getAttribute("payurl");
	String status = (String)request.getAttribute("status");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link rel="stylesheet" href="../resources/css/validationEngine.jquery.css" type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include><style type="text/css">
.recharge-bank-item{
	width: 149px;
	height: 45px;
	line-height: 45px;
	float: left;
	display: inline-block;
	cursor: pointer;
	border: 1px dashed #c9c9c9;
	text-align: center;
	margin: 0 20px 20px 0;
	position: relative;
}
.recharge-label{
	width: 125px;
	padding-right: 10px;
	text-align: right;
	display: inline-block;
}
.current{
	border: 1px solid #86bb2a;
}
.icon{
	width: 20px;
	height: 18px;
	background: url(/resources/img/icon/recharge-current.jpg) no-repeat;
	display: block;
	position: absolute;
	bottom: 0px;
	right: 0px;
	display: none;
}
.ui-dialog{
	display:none;
	background-color: #fff;
	border: 1px solid #ccc;
	outline: none;
	FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorstr=#88000000, endColorstr=#88000000);
	/* padding: 10px; */
	box-shadow: 0 0 2px 1px #ccc;
}

</style>
		<%if(payurl!=null && payurl.length()>0){%>
			<!--如果存在payurl,直接跳转到银行支付页面-->
			<script>window.location.href='<%=payurl%>';</script>
		<%}%>

		<%if(status!=null && status.length()>0){%>

		<%}%>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script src="/resources/js/jquery.validationEngine.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.validationEngine-zh_CN.js" type="text/javascript"></script>
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--vipRight-->
				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">在线充值</a></li>
							<li><a href="/recharge/openRechargeRecord">充值记录</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>温馨提示：
							</h1>
							<p>
								单笔充值金额必须大于<font>100元</font>。为遵守国家反洗钱和套现行为的相关法律规定：信用卡充值，不投标要超过30天
								后才能提现： 储蓄卡充值，不投标要等7天后才能提现
							</p>
						</div>
						<form action="/recharge/ffsign" id="from-data-tjcz" method="post" >
							<input type="hidden" id="bankcode" name="bankcode" value="" />
							<table cellpadding="0" cellspacing="0" border="0" class="vipVerification lineTables">
								<tbody>
									<tr>
										<td>
											<!--
											<p>您好，请选择支付方式</p><br />
											<input type="radio" name="rechargeType" value="1" checked="checked" />在线充值
											<label class="recharge-label" style="height: 50px;">选择银行：</label>
											-->
											<br />
											<div  id="recharge-bank">
												<span class="recharge-bank-item" value="ICBC"><img src="resources/img/bank/icbc.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="boc"><img src="resources/img/bank/boc.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="CCB"><img src="resources/img/bank/ccb.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="ABC"><img src="resources/img/bank/abc.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="CMB"><img src="resources/img/bank/cmb.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="cgb"><img src="resources/img/bank/gdb.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="cmsb"><img src="resources/img/bank/cmbc.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="cncb"><img src="resources/img/bank/citic.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="spdb"><img src="resources/img/bank/pf.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="psbc"><img src="resources/img/bank/yz.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="hxb"><img src="resources/img/bank/hx.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="COMM"><img src="resources/img/bank/comm.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="CEB"><img src="resources/img/bank/ceb.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="pab"><img src="resources/img/bank/pab.jpg" alt=""><em class="icon"></em></span>
												<!--
												<span class="recharge-bank-item" value="snb"><img src="resources/img/bank/snb.jpg" alt=""><em class="icon"></em></span>
												<span class="recharge-bank-item" value="bjb"><img src="resources/img/bank/bjb.jpg" alt=""><em class="icon"></em></span>
												-->
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
								<tbody>
									<tr>
										<th>请输入充值金额:</th>
										<td>
											<!-- class="vipTextBox validate[required,custom[integerNullZero]]" -->
											<input type="text" name="tranAmt"  class="vipTextBox"/> 元
										</td>
									</tr>
								<!-- 	<tr>  //去除选择银行的选项
										<th>请选择银行:</th>
										<td><select style="width: 160px;" name="bankinfo" class="validate[required]">
											<option value>----请选择银行----</option>
											<c:forEach items="${banks}" var="bank"><option value="${bank.bankNumber}">${bank.bankName}</option></c:forEach>
										</select></td>
									</tr> -->
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input type="submit" value="提交" id="commit" />
								<input type="reset" value="取消" />
							</div>
						</form>
					</div>
				</div>
				<!--End vipRight-->
			</div>
		</div>
	</div>

	<div class="ui-dialog" tabindex="-1" data-widget-cid="widget-4" style="width: 500px; z-index: 99999; position: absolute; left: 701px; top: 624.5px;">
		<div class="ui-dialog-close" title="关闭本框" data-role="close" style="display: block;">
			×
		</div>
		<div class="ui-dialog-content" data-role="content" style="height: 100%; zoom: 1; background: rgb(255, 255, 255);">
			<div id="afterSub" class="afterSub">
				<h3>请您在新打开的网上银行页面上完成付款</h3>
				<p>付款完成前请不要关闭此窗口。</p>
				<p>完成付款后请根据您的情况点击下面的按钮：</p>
				<a class="ui-button ui-button-mid ui-button-green" id="finishRecharge">已完成付款</a> <a class="ui-button ui-button-mid ui-button-green" id="troubleRecharge">付款遇到问题</a>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script>
		$(document).ready(function(){
			$("#from-data-tjcz").validationEngine({});
			var recharge_bank = $("#recharge-bank").find(".recharge-bank-item");
			var bankCode = "ICBC";
			$("#recharge-bank").find(".recharge-bank-item").click(function(){
				recharge_bank.removeClass("current").find(".icon").hide();
				$(this).addClass("current").find(".icon").show();
				bankCode=$(this).attr("value");
				$("#bankcode").val(bankCode);
				console.log("bankcode",$("#bankcode").val());
			})
			$(".recharge-finish").live('click', function(e){
				/*
				 $('.webox').css({display:'none'});
				 $('.background').css({display:'none'});
				 */
				window.location = 'account-log.html';
			});
			$("#commit").click(function(){
				if(!$("#bankcode").val()){
					alert("请选择银行");
					return false;
				}
			});
		})
	</script>
</body>
</html>