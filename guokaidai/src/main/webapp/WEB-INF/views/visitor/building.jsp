<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财 - 敬请期待</title>
<link type="text/css" rel="stylesheet" href="resources/css/new.css" />
<link type="text/css" rel="stylesheet" href="resources/css/style.css" />
<link type="text/css" rel="stylesheet" href="resources/css/other.css" />
<link type="text/css" rel="stylesheet" href="resources/css/user.css" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" href="resources/css/base_index.css" />
<link rel="stylesheet" href="resources/css/index_1.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<base href="<%=basePath%>" />
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<div style="width:100%;height:490px;background:url(/resources/images/img/building.jpg) no-repeat center center"></div>
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
