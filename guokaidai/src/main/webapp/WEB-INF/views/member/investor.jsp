<%--    
创建时间：2014年4月11日上午10:22:25   
创 建 人：LiNing   
相关说明：   回款计划页面
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财会员中心-回款计划</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link type="text/css" rel="stylesheet" href="resources/css/lhgcalendar.css" />

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
  <li><a href="javascript:void(0);" class="vipHeadLink">回款计划</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的回款计划，按照还款日期排列。</h1>
<p>您目前待收的本息总额是：<font>￥${allMonth }</font>未扣除佣金，共<font>${investment_count }</font>笔投资，最后一笔还款时间在  结束。</p>
</div>
<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
 <thead>
  <tr>
  	<th></th>
  	<th>未来一月</th>
  	<th>未来三月</th>
  	<th>未来半年</th>
  	<th>全部</th>
  </tr>
 </thead>
 <tbody>
  <tr><td>待收本息总额</td><td>￥${oneMonth }</td><td>￥${threeMonth }	</td><td>￥${sixMonth }	</td><td>￥${allMonth }</td></tr>
 </tbody>
</table>
<form action="<%=basePath%>contract/query_page" method="post">
<table cellpadding="0" cellspacing="0" class="vipQueries">
<tbody>
 <tr><th>查询我的详细回购计划：</th><td></td></tr>
 <tr>
 	<th>快捷查询：</th>
 	<td>
 		<a href="<%=basePath%>contract/query_page?minTime=a" <c:if test="${quick eq 'a' }">class="QueriesLink"</c:if> >未来一月</a>
 		<a href="<%=basePath%>contract/query_page?minTime=b" <c:if test="${quick eq 'b' }">class="QueriesLink"</c:if>>未来三月</a>
 		<a href="<%=basePath%>contract/query_page?minTime=c" <c:if test="${quick eq 'c' }">class="QueriesLink"</c:if>>未来半年</a>
 		<a href="<%=basePath%>contract/query_page?minTime=d" <c:if test="${quick eq 'd' }">class="QueriesLink"</c:if>>全部</a>
 	</td>
 </tr>
 <tr>
 	<th valign="top">自定义查询：</th>
 	<td>时间从<input type="text" value="${minTime }" id="inp11" onclick="" name="minTime" readonly="readonly" class="timeInput_Day QueriesDate" />至<input type="text" onclick="" value="${maxTime }" id="inp12" name="maxTime" readonly="readonly" class="timeInput_Day QueriesDate" /><br />
                     金额从<input type="text" value="${minMoeny}" name="minMoeny" class="QueriesDate" />至<input type="text" name="maxMoney" value="${maxMoney}" class="QueriesDate" />
        <input type="submit" value="查询" class="QueriesBnt" />
 	</td>
 </tr>
</tbody>
</table>
</form>
<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
 <thead>
  <tr>
  	<th>借款编号</th>
  	<th>回收日期</th>
  	<th>回收金额</th>
  	<th>本金+利息-佣金</th>
  	<th>查询期数/总期数</th>
  	<%--<th>123</th>--%>
  	</tr>
 </thead>
 <tbody>
 	 <c:if test="${empty datalist ||fn:length(datalist)==0 }">
      	<tr height="30">
	        <td align="center" colspan="5">
	        	没有查询到数据
	        </td>
	      </tr>
     </c:if>
      <c:if test="${fn:length(datalist)>0 }">
	 	<c:forEach items="${datalist }" var="obj">
	 		<tr>
	 			<td>${obj[0] }</td>
	 			<td>${obj[2] }</td>
	 			<td>￥<fmt:formatNumber value="${obj[3]}" pattern="0.00"/> 	</td>
	 			<td>${obj[4]}	</td>
	 			<td>${obj[5]}	</td>

	 			<%--<td>${obj[6]}	</td>--%>
	 		</tr>
	 	</c:forEach>
         <tr>
		   <td colspan="5">
			   <div class="tablePage">
				    <span>共${page.totalCount}条${page.totalPage}页</span>
				    <span>当前第${page.pageNum}页</span>
				    <a href="<%=basePath %>contract/query_page?pageNum=1&minTime=${minTime}&maxTime=${maxTime}&minMoney=${minMoney}&maxMoney=${maxMoney}">首页</a>
				    <a href="<%=basePath %>contract/query_page?pageNum=${page.pageNum <= 1?1:page.pageNum-1 }&minTime=${minTime}&maxTime=${maxTime}&minMoney=${minMoney}&maxMoney=${maxMoney}">上一页</a>
				    <a href="<%=basePath %>contract/query_page?pageNum=${page.pageNum >= page.totalPage?page.totalPage:page.pageNum+1 }&minTime=${minTime}&maxTime=${maxTime}&minMoney=${minMoney}&maxMoney=${maxMoney}">下一页</a>
				    <a href="<%=basePath %>contract/query_page?pageNum=${page.totalPage }&minTime=${minTime}&maxTime=${maxTime}&minMoney=${minMoney}&maxMoney=${maxMoney}">尾页</a>跳转
				    <input type="text" class="tabPageJumpTx" />
				    <input type="button" value="确定" class="tabPageJumpBnt" />
			    </div>
		   </td>
		 </tr>
 	</c:if>
 </tbody>
</table>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

</div>
<!--End vipContBox-->
</div>
<!--End vipRight-->
</div>
<!--End vipcontent-->
 
 </div>
</div>
<!--End vipContent-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<script type="text/javascript" src="resources/js/lhgcalendar.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#inp11').calendar({
			maxDate : '#inp12'
		});
		$('#inp12').calendar({
			minDate : '#inp11'
		});
	});
</script>
</body>
</html>
