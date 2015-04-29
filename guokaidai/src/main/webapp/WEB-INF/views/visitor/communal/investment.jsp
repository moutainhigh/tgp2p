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
<title>Insert title here</title>
<link href="/resources/css/project.css" rel="stylesheet"  type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<!--mainBox-->
<div class="mainBox">
  <!--header-->
    <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
    <script type="text/javascript" src="/resources/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="/resources/js/highcharts.js"></script>
	<script type="text/javascript" src="/resources/js/exporting.js"></script>
	<script type="text/javascript" src="/resources/js/data.js"></script>
	<script type="text/javascript" src="/resources/js/investment.js"></script>
  <!--End header-->
  <div class="clear"></div>
 
  <!--content-->
  <div class="content">
    <div class="w960box pot_r curvyCorners_3 mainBorder" style="padding:10px 0px;">
    <div class="webfileMap"><a href="#">太平洋理财首页</a>><a href="#">投资推荐</a>><a href="#">项目介绍</a></div>
    <div class="projectbox mar_top10">
    <!--projectLeft-->
     <div class="projectLeft">
       <div class="projectheadbox">
         <ul>
           <li><span class="curvyCorners_t5 bold projectheadLink">项目简介</span></li>
         </ul>
         <a href="#" class="more">更多</a>
       </div>
       <div class="projectcontbox">
         <h2>ZH周满盈</h2>
         <p style="padding-bottom:10px; border-bottom:1px dashed #e2e2e2;">投资指的是用某种有价值的资产，其中包括资金、人力、知识产权等投入到某个企业、项目或经济活动，以获取经济回报的商业行为或过程。</p>
         <h2>单个产品情况</h2>
         <div class="pot_r">
         <table cellpadding="0" cellspacing="0" class="projectTab1 pjtTabrow" style="height:200px;">
          <tr>
          <td>投资期限</td>
          <td colspan="3">7天</td>
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
         <div class="pot_a" style="top:0px; right:0px; width:209px; overflow:hidden; height:202px; border:1px solid #e8e7e7;"><img src="/resources/images/projectimgnoe.jpg"/></div>
         </div>
         <h2>投资收益比较</h2>
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
         <h2>历史产品情况</h2>
         <table cellpadding="0" cellspacing="0" class="projectTab3 pjtTabrow">
          <thead><tr>
           <td>序号</td>
           <td>产品名称</td>
           <td>产品开始时间</td>
           <td>产品总金额</td>
           <td>到期收益</td>
           <td>该期投资客户数</td>
           <td>累计投资客户数</td>
           <td>累计投资金额</td>
          </tr></thead>
          <tbody>
          <tr>
             <td>10</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>09</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>08</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>07</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>06</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>05</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>04</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>03</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>02</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
           <tr>
             <td>01</td>
             <td>Zh周满盈</td>
             <td>2013-12-12</td>
             <td>20,000,000</td>
             <td>24,000,000</td>
             <td>500</td>
             <td>5000</td>
             <td>124,000,000</td>
           </tr>
          </tbody>
         </table>
         <p>文字介绍往期案例，客户后台可自行添加文字。</p>
       </div>
         
     </div>
     <!--End projectLeft-->
     <!--projectRight-->
     <div class="projectRight">
      <div class="projectMok curvyCorners_5">
        <div class="Moktitlebox  curvyCorners_t5">
          <h2>常见问题</h2>
          <a href="#" class="more">更多</a>
        </div>
        <ul class="Mokul1">
         <li><a href="#">投资人是否要支付费用？</a></li>
         <li><a href="#">我通过稳盈-安e贷达成的交易有什么...</a></li>
         <li><a href="#">我可以投资吗？</a></li>
         <li><a href="#">债权出让人向陆金所提交转让申请的...</a></li>
         <li><a href="#">转让需要支付什么费用吗？</a></li>
        </ul>
      </div>
      <div class="projectMok curvyCorners_5 mar_top10">
        <div class="Moktitlebox  curvyCorners_t5">
        <h2>在线申请</h2>
        </div>
         <table cellpadding="0" cellspacing="0" class="Applicationtab">
          <tr><td>您的姓名：</td><td><input type="text" class="ACabtext" value="请输入您的真实姓名" /></td></tr>
          <tr><td>所在城市：</td><td>
          <select>
            <option>-请选择-</option>
          </select><select>
            <option>-请选择-</option>
          </select></td>
          </tr>
          <tr><td>联系手机：</td><td><input type="text" class="ACabtext" value="请输入手机号码" /></td></tr>
          <tr><td>服务内容：</td><td><input type="radio" value="太平洋理财" checked="checked" style="display:inline-block; margin:0px 3px;" />太平洋理财</td></tr>
          <tr><td>乘以金额：</td><td><input type="text" class="ACabtext" value="" />&nbsp; 万元</td></tr>
          <tr><td>&nbsp;</td><td><input type="submit" value="提交信息"  class="ACabBnt" /></td></tr>
         </table>
      </div>
     </div>
     <!--End projectRight-->
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
