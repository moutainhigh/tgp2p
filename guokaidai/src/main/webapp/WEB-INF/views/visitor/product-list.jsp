<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.pomo.org/page-core" prefix="po" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品介绍</title>
<link href="resources/css/project.css" rel="stylesheet"  type="text/css" />
<link href="resources/css/simpleTable.css" rel="stylesheet"  type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<script type="text/javascript" src="resources/js/page/page-table.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
<!--End header-->
	<div class="clear"></div>
<!--content-->
  <div class="content">
    <div class="w960box pot_r curvyCorners_3 mainBorder" style="padding:10px 0px;">
    <div class="webfileMap"><a href="/">太平洋理财首页</a>>投资推荐</div>
    <div class="projectbox mar_top10">
    <!--projectLeft-->
     <div class="projectLeft" style="width:100%;">
       <div class="projectheadbox">
         <ul>
           <li><span class="curvyCorners_t5 bold projectheadLink">项目简介</span></li>
         </ul>
       </div>
       	<br />
       	<po:pageTable url="visitor/page-product-list">page/product-list.xml</po:pageTable>
         
     </div>
     <!--End projectLeft-->
    </div>
    <div class="clear"></div>
    </div>
  </div>
  <!--End content-->
  <jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
</body>

</html>
