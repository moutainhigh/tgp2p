<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script type="text/javascript" src="/resources/js/recharge.js"></script>

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />


				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">我要借款</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>这是您的申请记录表，请仔细核对。
							</h1>
						</div>
						<form>
							<div class="upDataStep curvyCorners_5">
								<a href="../borrow/start-apply?type=${curType}">申请表单</a> <a class="stepLink">申请结果</a>
							</div>
							<table cellpadding="0" cellspacing="0" border="0"
								class="creditData">
								<tbody>
									<tr height="37" bgcolor="#f7f7f7">
								<td align="center" width="175">提交时间</td>
								<td align="center" width="155">申请金额</td>
								<td align="center" width="155">贷款类型</td>
								<td align="center" width="175">审核状态</td>
							</tr>
							<c:forEach items="${list}" var="ba">
								<tr height="30">
									<td align="center">${ba.time}</td>
									<td align="center">${ba.money}</td>
									<td align="center">
								  <c:if test="${ba.type eq 1 }">太平洋宝</c:if>
								  <c:if test="${ba.type eq 2}">转盈宝</c:if>
								  <c:if test="${ba.type eq 7}">太平洋理财理财计划</c:if>
									</td>
									<td align="center">
									<c:if test="${ba.status eq 0}">审核中</c:if>
									<c:if test="${ba.status eq 1}">已通过</c:if>
									<c:if test="${ba.status eq 2}">未通过</c:if>
									</td>
								</tr>
							</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<!--End vipRight-->
	</div>
	<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
