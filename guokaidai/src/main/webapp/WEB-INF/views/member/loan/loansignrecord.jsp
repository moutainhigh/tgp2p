<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
	table.vipSeversTable{width:578px; height:auto; border:1px solid #d0d0d0; border-collapse:collapse; margin:20px auto;}
	table.vipSeversTable th,table.vipSeversTable td{width:auto; height:35px; line-height:35px; border:1px solid #d0d0d0; font-weight:normal; color:#666666; text-align:center;}
	table.vipSeversTable th{background:#f0f0f0;}
	table.vipSeversTable span{cursor:pointer; display:inline-block;}
	table.vipSeversTable font{color:#ff6600;}
</style>
<!-- 借出记录 -->
<table class="vipSeversTable">
	 <thead>
	  <tr><th>标号</th><th>借款标题</th><th>借款金额</th><th>年化利率</th><th>还款方式</th><th>借款期限</th></tr>
	 </thead>
	 <tbody>
	 <c:forEach items="${page.list}" var="loansign">
	  	<tr>
		  	<td>${loansign[0]}</td>
		  	<td>${loansign[1]} </td>
		  	<td><fmt:formatNumber value="${loansign[2]}" pattern="#.##" type="number"/>元</td>
		  	<td><fmt:formatNumber value="${loansign[3]*100}" pattern="#.##" type="number"/>%</td>
		  	<td>
		  		<c:if test="${loansign[4] eq 1}">按月等额本息</c:if>
		  		<c:if test="${loansign[4] eq 2}">按月付息到期还本</c:if>
		  		<c:if test="${loansign[4] eq 3}">到期一次性还本息</c:if>
		  	</td>
		  	<td>
		  		<c:if test="${!empty loansign[5]}">${loansign[5]}个月</c:if> 
		  		<c:if test="${!empty loansign[6] && empty loansign[5]}">${loansign[6]}天</c:if> 
		  	</td>
	  	</tr>
	 </c:forEach>
	 </tbody>
	 <tr>
		 	<td colspan="6" width="578px;">
			 	<jsp:include page="/WEB-INF/views/member/communal/page.jsp"/>
		 	</td>
		 </tr>
</table>
  <!-- End借出记录 -->
