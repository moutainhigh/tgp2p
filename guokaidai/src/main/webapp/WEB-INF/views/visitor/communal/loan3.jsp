<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>
<link href="/resources/css/project.css" rel="stylesheet"  type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<style>
.borrow td{
	font-size:13px;
	height:45px;
	color:#000;
}
.borrow input[type="text"]{
	float:left;
	width:200px;
	height:24px;
	border:1px solid #ccc;
}
.borrow select{
	width:204px;
	height:28px;
	border:1px solid #ccc;
	color:#666;
}
</style>
</head>
<body>
<!--mainBox-->
<div class="mainBox">
  <!--header-->
    <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
    <!-- <script type="text/javascript" src="/resources/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="/resources/js/highcharts.js"></script>
	<script type="text/javascript" src="/resources/js/exporting.js"></script>
	<script type="text/javascript" src="/resources/js/data.js"></script>
	<script type="text/javascript" src="/resources/js/receipts.js"></script> -->
  <!--End header-->
  <div class="clear" style="height:20px"></div>
  <div style="width:960px;margin:0 auto;border:1px solid #ddd;margin-bottom:50px;padding:0 10px">
  
  	<div style="padding:5px 0 5px 0;">
  		<span style="font-size:22px">车辆抵押贷</span><span style="font-size:15px;color:#666">-请填写你的信息</span>
  	</div>
  	<table class="borrow" style="margin:10px 0 50px 0;">
  		<tr>
  			<td style="width:130px" align="right">联系人：</td>
  			<td><input type="text" /></td>
  		</tr>
  		<tr>
  			<td align="right">手机号码：</td>
  			<td><input type="text" /></td>
  		</tr>
  		<tr>
  			<td align="right">意向融资金额：</td>
  			<td><input type="text" /><div style="width:40px;height:24px;border:1px solid #ccc;line-height:22px;text-align:center;border-left:none;background-color:#ededed;float:left;">万元</div></td>
  		</tr>
  		<tr>
  			<td align="right">所在区域：</td>
  			<td>
  				<select name="city">
  					<option value="深圳市">深圳市</option>
  				</select>
  			</td>
  		</tr>
  		<tr>
  			<td align="right">月薪/月固定收入：</td>
  			<td><input type="text" /></td>
  		</tr>
  		<tr>
  			<td align="right">预期融资期限：</td>
  			<td>
  				<select name="">
  				</select>
  			</td>
  		</tr>
  		<tr>
  			<td align="right" style="height:85px">备注说明：</td>
  			<td><textarea style="width:240px;height:60px;border:1px solid #ccc;"></textarea></td>
  		</tr>
  		<tr>
  			<td align="right">验证码：</td>
  			<td><input type="text" style="width:120px;height:30px;" /><img src="" alt="" width=60 height=32 style="border-left:none;background-color:#ededed" /></td>
  		</tr>
  		<tr>
  			<td style="height:80px"></td>
  			<td><a href=""><img src="/resources/images/img/sq.png" alt="" width=54 height=31 /></a>&nbsp;&nbsp;
  			&nbsp;&nbsp;&nbsp;<a href=""><img src="/resources/images/img/qx.png" alt="" width=54 height=31 /></a></td>
  		</tr>
  	</table>
  	
  </div>
  <!--content-->
  <%--<div class="content">
    <div class="w960box pot_r curvyCorners_3 mainBorder" style="padding:10px 0px;">
     <div class="securitybox">
      <jsp:include page="/WEB-INF/views/visitor/communal/left.jsp"/>
      
      <div class="securityright">
      <div class="contentTitlebox">
      <div class="webfileMap"><a href="#">太平洋理财首页</a><a href="#">${deputy.topic.name }</a>><a href="#">{deputy.name }</a></div>
       <h2><c:if test="${deputy.topic.id == topicId }">${deputy.name }</c:if></h2>
       </div>
       <div class="contentContebox">
      	  <table cellpadding="0" cellspacing="0" class="projectTab1 pjtTabrow" style="height:200px; margin-top:20px;">
          <tr>
          <td>投资期限</td>
          <td colspan="3">
            <select>
             <option>7天</option>
             <option>10天</option>
             <option>15天</option>
             <option>30天</option>
             <option>60天</option>
             <option>自定义</option>
            </select>
          </td>
          </tr>
          <tr>
          <td>产品名称</td>
          <td colspan="3">ZH周满盈</td>
          </tr>
           <tr>
          <td>投资开始时间</td>
          <td colspan="3">2014-1-5</td>
          </tr>
           <tr>
          <td>投资结束时间</td>
          <td colspan="3">2014-1-12</td>
          </tr>
           <tr>
          <td>投资金额（元）</td>
          <td colspan="3">150000</td>
          </tr>
           <tr>
          <td>到期利息</td>
          <td>172.60</td>
          <td>利息支付方式</td>
          <td>到期支付</td>
          </tr>
          <tr>
          <td>到期本息</td>
          <td>150172.60</td>
          <td>本金支付方式</td>
          <td>到期</td>
          </tr>
         </table>
         <h3 style="color:#000; font-weight:bold;">投资收益比较</h3>
         <table cellpadding="0" cellspacing="0" class="projectTab2 pjtTabrow" id="datatable">
         <thead>
		 <tr>
			<th>名称</th>
			<th>收益值</th>
		  </tr>
          </thead>
          <tbody>
          <tr>
          <th width="25%" style="font-weight:bold; color:#ca2020;">太平洋理财</th>
          <td style="font-weight:bold; color:#ca2020;">172.60</td>
          </tr>
          <tr>
          <th>银行</th>
          <td>8.75</td>
          </tr>
          </tbody>
         </table>
         <div class="statisticsBox" id="container"></div>
        <br />
        <br />
        <br />
       </div>
      </div>
    </div>
    <div class="clear"></div>
    </div> 
  </div>--%>
  <!--End content-->
  <!--footer-->
  <jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
  <!--End footer-->
<div class="clear"></div>
</div>
<!--End mainBox-->
</body>
</html>
