<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>太平洋理财贷款平台-散标投资列表</title>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resources/css/loanlist.css" />
<base href="<%=basePath%>" />

</head>
<body>
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/condition.js"></script>
	<script type="text/javascript" src="resources/js/loanSign/loanlist.js"></script>

	<!--End head-->

	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--mapLinkBox-->
			<%--<div class="mapLinkBox"><span>您当前的位置：</span><a href="#">太平洋理财</a>><a href="#">借款列表</a></div>
 --%>
			<!--End mapLinkBox-->

			<!--搜索条件-->
			<div style="background-color:#fff;border-radius:5px;">
				<%--<h1>筛选借款项目</h1>
   --%>
				<ul class="conditionList" style="padding:10px 0 10px 0px;border:1px solid #ddd">
					<li>
						<dl>
							<dt>项目类型&nbsp;</dt>
							<dd name="loanType">
								<span value="0" class="active">全部</span><span value="2">太平洋宝</span><span
									value="3">转盈宝</span>
							</dd>
						</dl></li>
					<li>
						<dl>
							<dt>项目期限&nbsp;</dt>
							<dd name="deadline">
								<span value="0" class="active">全部</span><span value="1">3个月以下</span><span
									value="2">3-6个月</span><span value="3">6-9个月</span><span
									value="4">9-12个月</span><span value="5">12个月以上</span>
							</dd>
						</dl></li>
					<li>
						<dl>
							<dt>项目状态&nbsp;</dt>
							<dd name="type">
								<span value="0" class="active">全部</span><span value="1">投标中</span><span
									value="2">投标完成</span><span value="3">还款中</span><span value="4">还款完成</span>
							</dd>
						</dl></li>
				</ul>
				<div class="clear"></div>
			</div>
			<!--End 搜索条件-->

			<!--jiekuanList-->
			<div class="jiekuanList"></div>
			<!--End jiekuanList-->
		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->
</body>
</html>
