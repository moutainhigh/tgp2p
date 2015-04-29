<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品介绍</title>
<link href="resources/css/project.css" rel="stylesheet"  type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<!--End header-->
	<div class="clear"></div>
<!--content-->
  <div class="content">
    <div class="w960box pot_r curvyCorners_3 mainBorder" style="padding:10px 0px;">
    <div class="webfileMap"><a href="/">太平洋理财首页</a>><a href="visitor/product-list">投资推荐</a>>项目介绍</div>
    <div class="projectbox mar_top10">
    <!--projectLeft-->
     <div class="projectLeft">
       <div class="projectheadbox">
         <ul>
           <li><span class="curvyCorners_t5 bold projectheadLink">项目简介</span></li>
         </ul>
         <a href="pdt/product-pay?id=${data.id}" class="more">更多</a>
       </div>
       <div class="projectcontbox">
         <h2>${data.name}</h2>
         <p style="padding-bottom:10px; border-bottom:1px dashed #e2e2e2;">${data.remark}</p>
         <h2>单个产品情况</h2>
         <div class="pot_r">
         <table cellpadding="0" cellspacing="0" class="projectTab1 pjtTabrow" style="height:200px;">
          <tr>
          <td>投资期限</td>
          <td colspan="3">${data.productType.dayDuring}</td>
          </tr>
          <tr>
          <td>产品名称</td>
          <td colspan="3">${data.name}</td>
          </tr>
           <tr>
          <td>投资金额（元）</td>
          <td colspan="3">${data.investMax}</td>
          </tr>
           <tr>
          <td>到期利息</td>
          <td>
          	<fmt:formatNumber value="${data.investMax*data.rate}"  pattern="#0.00"/>
          </td>
          <td>利息支付方式</td>
          <td>${data.productType.ratePayType}</td>
          </tr>
          <tr>
          <td>到期本息</td>
          <td><fmt:formatNumber value="${data.investMax*data.rate+data.investMax}"  pattern="#0.00"/></td>
          <td>本金支付方式</td>
          <td>${data.productType.principalPayType}</td>
          </tr>
         </table>
         <div class="pot_a" style="top:0px; right:0px; width:209px; overflow:hidden; height:202px; border:1px solid #e8e7e7;"><img src="resources/images/projectimgnoe.jpg"/></div>
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
          <td style="font-weight:bold; color:#ca2020;"><fmt:formatNumber value="${data.investMax*data.rate}"  pattern="#0.00"/></td>
          </tr>
          <tr>
          <th>银行</th>
          <td><fmt:formatNumber value="${data.bankValue}"  pattern="#0.00"/></td>
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
          
          <c:forEach items="${list}" var="p" >
          	
          	<tr>
             <td>${p[0]}</td>
             <td>${p[1]}</td>
             <td>${p[2]}</td>
             <td>${p[3]}</td>
             <td><fmt:formatNumber value="${p[4]}"  pattern="#0.00"/></td>
             <td>${p[5]}</td>
             <td>${p[6]}</td>
             <td>${p[7]}</td>
           </tr>
          </c:forEach>
          
          </tbody>
         </table>
         
       </div>
         
     </div>
     
     <jsp:include page="/WEB-INF/views/visitor/communal/product-right.jsp"/>
    </div>
  </div>
  </div>
  <!--End content-->
  <jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
</body>
<script type="text/javascript" src="resources/js/highcharts.js"></script>
<script type="text/javascript" src="resources/js/exporting.js"></script>
<script type="text/javascript" src="resources/js/data.js"></script>
<script type="text/javascript">	
$(function(){
	
	
          $('#container').highcharts({
        data: {
            table: document.getElementById('datatable')
        },
        chart: {
            type: 'column'
        },
        title: {
            text: '太平洋理财与银行对比'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: ''
            }
        },
		exporting:{
			enabled:false
			},
		legend:{
			enabled:false
			},
         tooltip: {
            formatter: function() {
                return '<b>'+ this.series.name +'</b><br/>'+
                    this.y;
            }
        }
    });
});
</script>
</html>
