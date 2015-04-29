<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<base href="<%=basePath%>" />
<title>太平洋理财贷款平台</title>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<!--top-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--End top-->
	<!--Content-->
	<div class="Content">
		<div class="w960px mapString">
			<span>您当前位置：</span><a href="/">太平洋理财</a>>${deputy.topic.name }>${deputy.name }
		</div>
		<div class="w960px">
			<jsp:include page="/WEB-INF/views/visitor/communal/left.jsp" />

			<div class="projectRightBox">
				<c:set var="n" value="0"/>
				<!--TxList Cont-->
				<c:forEach items="${articles }" var="art">
					<div class="pjRightCont">
						<span data-position="titlebox"
						<c:if test="${n%2 == 0 }">class="Green"</c:if>
						<c:if test="${n%2 != 0 }">class="Orange"</c:if>
						 >${art.title }</span>
						<!--此处标题最多只能输入30个汉字-->
						<div class="pjcontBox">
							${n }--${n/2}--${art.context }
						</div>
					</div>
					<c:set var="n" value="${n+1 }"/>
				</c:forEach>
				<!--End TxList Cont-->

			</div>

		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->
	<script type="text/javascript" src="<%=basePath %>resources/js/autolist.js"></script>
</body>
</html>
