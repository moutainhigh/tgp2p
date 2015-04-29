<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-会员中心</title>
<base href="<%=basePath %>" />
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="resources/js/vipinfo.js"></script>

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
  <li><a href="userinfovip/upgrade.htm">会员升级</a></li>
  <li><a class="vipHeadLink">历史记录</a></li>
 </ul>
</div>
<!--vipContBox-->

<!--End vipContBox-->

<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>以下是您在太平洋理财的vip会员充值记录。</h1>
<div class="vipTable">
</div>
</div>
</div>
<!--End vipContBox-->
</div>
<!--End vipRight-->
</div>
<!--End vipcontent-->
 
 </div>
</div>
<!--End vipContent-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<!--End footer-->
</body>
</html>
