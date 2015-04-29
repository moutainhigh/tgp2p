<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-会员中心</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="resources/css/vip.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script src="resources/js/shade.js" type="text/javascript"></script>

	<!--Content-->
	<div class="Content">
		<div class="w960px">

			<!--vipContent-->
			<div class="vipContentBox">
				<!--vipLeft-->
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--End vipLeft-->

				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a class="vipHeadLink">会员升级</a></li>
							<li><a href="userinfovip/vipRecords.htm">历史记录</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipSeverHeadBox">
							<p>VIP会员有什么特权？</p>
							<p>
								<font>保本又保利！提现更快！佣金更低！及时代偿！享受特殊产品！</font>
							</p>
							<a href="#">点击查看会员体系详情 >></a>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="vipSeverTable">
							<tr>
								<th>您当前会员级别：</th>
								<td><c:if test="${typeVip==0}">普通会员</c:if> <c:if
										test="${typeVip==1}">特权会员</c:if></td>
								<th>到期时间：</th>
								<td><c:if test="${!empty time}">${time}</c:if> <c:if
										test="${empty time}">永久</c:if>
								</td>
							</tr>
						</table>
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /> </span>请点击下列套餐，购买您所需要的会员服务。
							</h1>
						</div>
						<div class="vipSeversShop">
							<div>
								<img src="resources/images/vipsevers_img.png" />
							</div>
							<span>购买VIP会员服务</span> <label>年费:<font id="vipMoney">${vipUpgrade}</font>
							</label> <a id="upgradeId" style="display: block;"
								onclick="FreeUpgrade()"><img
								src="resources/images/vipseversBnt.png" title="立即升级" alt="" />
							</a>
							<!-- <a ><img src="resources/images/vipseversBnt.png" title="立即升级" alt="" /></a> -->
						</div>
						<!-- <div class="vipContPrompt">
							<h2 class="vipContTitle">
								<span><img src="resources/images/vipsevers_03.jpg" /> </span>温馨提示:
							</h2>
							<p>活动期间：免费升级半年</p>
						</div> -->
					</div>
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<div class="clear"></div>
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">
		<div class="white_d">
			<div class="notice_t">
				<span class="fl"
					style="height:36px; line-height:36px; background:url(resources/images/notice.jpg) no-repeat left center; padding-left:45px;">太平洋理财提醒您</span>
				<span class="fr" style="margin-top:7px; cursor:pointer;"
					onclick="CloseDiv('MyDiv','fade')"><img
					src="resources/images/close.gif" /> </span>
			</div>
			<table border="0" align="center"
				style="width:375px; font-size:14px; margin-top:30px;"
				cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td width="100"><img src="resources/images/warn.jpg"
						width="50" height="200" /></td>

					<td align="center" style="padding-top:40px;">
						<p>
							支付方式： <select name="Gateway_Type" id="gateway_Type">
								<option value="01" selected="selected">借记卡</option>
								<option value="04">IPS账户支付</option>
								<option value="08">IB支付</option>
								<option value="16">电话支付</option>
								<option value="64">储值卡支付</option>
							</select>
						</p> <!--                             	<p>您好，您选择了升级特级会员，系统将扣除你50元手续费！</p> -->
						<p style="padding-top:40px;">

							<a id="query"><img src="resources/images/btn_s.jpg" /> </a> <a
								onclick="CloseDiv('MyDiv','fade')"><img
								src="resources/images/btn_c.jpg" /> </a>
						</p>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->

</body>
<script type="text/javascript">
	$(function() {
		$("#query").click(
				function() {
					var $moeny = $("#vipMoney").text();
					var $gateway = $("#gateway_Type").val();
					window.location.href = 'userinfovip/payment.htm?money='
							+ $vipUpgrade + "&type=" + $gateway;
				});
	});

	function FreeUpgrade() {
		var vipUpgrade = "${vipUpgrade}";
		if (vipUpgrade == "免费") {
			location.href = "/userinfovip/freeUpgrade?userId=${session_user.id}";
			document.getElementById("upgradeId").style.display = "none";
		} else {
			window.location.href = 'userinfovip/paymentBF.htm?money='
					+ vipUpgrade;
		}

	}
</script>
</html>
