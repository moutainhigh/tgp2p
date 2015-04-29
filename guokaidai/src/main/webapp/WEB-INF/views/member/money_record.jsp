<%--    
创建时间：2014年2月20日下午3:57:37   
创 建 人：LiNing   
相关说明：   
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财-会员中心-资金明细</title>
<link href="resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="resources/js/global.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/js/activation_tools.js"></script>
</head>

<body>
	<!--mainBox-->
	<div class="mainBox">
		<!--header-->
			<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
		<!--End header-->
		<div class="clear"></div>

		<!--content-->
		<div class="content">
			<div class="w960box vipboxbor curvyCorners_2"
				style="background: #fff;">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<div class="vipcenterright">
					<div class="vipconttabs">
						<ul>
							<li><span>账户充值</span></li>
							<li><span>充值记录</span></li>
							<li><span>账户提现</span></li>
							<li><span>提现记录</span></li>
							<li><span class="vipconttabsLink">资金明细</span></li>
						</ul>
					</div>
					<div class="vipconttext">
						<div class="vipconttexticon">
							<img src="resources/images/sdgd_03.jpg" />
						</div>
						<div class="vipconttextcont">
							<h3>尊敬的太平洋理财用户，太平洋理财为您记录和保存了您的提现记录，敬请审阅</h3>
						</div>
					</div>
					<div class="clear"></div>
					<div class="ConditionBox">
						记录时间：<input type="text" class="Conditiontext"
							style="width: 100px;" />到：<input type="text"
							class="Conditiontext" style="width: 100px;" /><input
							type="button" value="搜索" class="Conditionbnt" />
					</div>
					<table cellpadding="0" cellspacing="0" class="buyproject">
						<thead>
							<tr>
								<th>日期</th>
								<th>类型</th>
								<th>支出</th>
								<th>收入</th>
								<th>余额</th>
								<th>说明</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${accountlist}" var="account">
								<tr>
									<td>${account.time}</td>
									<td>${account.accounttype.name}</td>
									<td>${account.expenditure}</td>
									<td>${account.income}</td>
									<td>${account.money}</td>
									<td>${account.explan}</td>
								</tr>
							</c:forEach>
							<c:if test="${empty accountlist||fn:length(accountlist)<0 }">
								<tr>
									<td colspan="6" align="center">
										没有查询到您的资金交易记录！
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--End content-->
		<!--footer-->
		<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
		<!--End footer-->
		<div class="clear"></div>
		<div class="clear"></div>
	</div>
	<!--End mainBox-->
	
	<%-- 要选中菜单id --%>
	<input id="activation" type="hidden" value="account_page" />
</body>
</html>
