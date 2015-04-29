<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String title = "太平洋理财贷款平台";
request.getSession().setAttribute("title",title);

%>
<base href="<%=basePath%>" />
<script language="javascript" type="text/javascript"
	src="resources/js/menu.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="logo12.ico" />
<link rel="stylesheet" href="resources/css/Validform.css"
	type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="resources/css/skin/simple_gray/ymPrompt.css" />
<link rel="stylesheet" href="resources/css/black.css" type="text/css"
	media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="resources/css/base-min.css?v=1383893322" />
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link type="text/css" rel="stylesheet" href="resources/css/user.css" />
<link type="text/css" rel="stylesheet" href="resources/css/style.css" />
<script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery_v1.6.2.js" type="text/javascript"></script>
<%--<script src="resources/js/jquery-1.4.2.min.js" type="text/javascript"></script>
--%><script type="text/javascript" src="resources/js/pagesettool.js"></script>
<script type="text/javascript" src="resources/js/dialog.js"></script>
<script type="text/javascript" src="resources/js/ymPrompt.js"></script>
<script src="resources/js/shade.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/js/style.js"></script>
<script type="text/javascript" src="resources/js/member/listloan.js"></script>
<script type="text/javascript" src="resources/js/jquery.artDialog.js"></script>
<script type="text/javascript" src="resources/js/loadMask.js"></script>
	<script type="text/javascript" src="resources/js/default.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/js/global.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/head.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/huitou.css" />
