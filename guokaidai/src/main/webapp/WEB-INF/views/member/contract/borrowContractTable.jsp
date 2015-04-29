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
	  <table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
		 <thead>
		  <tr><th>投标人</th><th>利率</th><th>投标金额</th><th>状态</th><th>投标时间</th><th>合同</th></tr>
		 </thead>
		 <tbody>
		 <c:forEach items="${page.list}" var="record">
		  <tr>
			  <td>${record[0]}</td>
			  <td><fmt:formatNumber value="${record[1]*100}" pattern="#.##" type="number"/>%</td>
			  <td><fmt:formatNumber value="${record[2]}" pattern="#.##" type="number"/>元</td>
			  <td>${record[3]}</td>
			  <td>${record[4]}</td>
			  <td><a href="/loaninfo/bcontact?investor=${record[8]}&loansignId=${record[7]}">合同下载</a></td>
		  </tr>
		 </c:forEach>
		 <tr>
		 	<td colspan="6" >
		 		<jsp:include page="/WEB-INF/views/member/communal/page.jsp"/>
		 	</td>
		 </tr>
		 </tbody>
	  </table>
 
  <!-- End借出记录 -->
