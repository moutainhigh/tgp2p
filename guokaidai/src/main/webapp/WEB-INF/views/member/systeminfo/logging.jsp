<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.pomo.org/page-core" prefix="po"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财-会员中心-安全中心</title>
<link rel="stylesheet" href="/resources/css/skin/default.css" type="text/css"></link>
<script type="text/javascript" src="/resources/js/page/page-table.js"></script>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>

<body>
<!--mainBox-->
<div class="mainBox">
  <!--header-->
    <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
  <!--End header-->
  <div class="clear"></div>
  
  <!--content-->
  <div class="content">
    <div class="w960box vipboxbor curvyCorners_2" style="background:#fff;">
      <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp"/>
      <div class="vipcenterright">
         <div class="vipconttabs">
           <ul>
             <li><span>系统消息</span></li>
             <li><span class="vipconttabsLink">登录日志</span></li>
           </ul>
         </div>
         <div class="vipconttext">
         <po:pageTable url="/member/loglist">page/log-list.xml</po:pageTable>
           
         </div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!--End content-->
  <!--footer-->
 <jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
  <!--End footer-->
<div class="clear"></div>
</div>
<!--End mainBox-->
</body>
</html>
