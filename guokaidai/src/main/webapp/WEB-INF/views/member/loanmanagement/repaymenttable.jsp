<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
	<thead>
		<tr>
			<th>编号</th>
			<th>借款标题</th>
			<th>借款金额</th>
			<th>年化利率</th>
			<th>还款方式</th>
			<th>借款期限</th>
			<th>借款时间</th>
			<th>还款时间</th>
			<th>还款金额</th>
			<th>状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list}" var="loan">
			<tr>
				<td>${loan[0]}</td>
				<td>${loan[2]}</td>
				<td><fmt:formatNumber value="${loan[3]}" pattern="0.00" /></td>
				<td><fmt:formatNumber value="${loan[4]*100}" pattern="0.00" />%</td>
				<td>${loan[5]}</td>
				<c:if test="${loan[7]>0}">
					<td>${loan[7]}天</td>
				</c:if>
				<c:if test="${loan[6]>0}">
					<td>${loan[6]}个月</td>
				</c:if>
				<td>${loan[8]}</td>
				<td>${loan[9]}</td>
				<td><fmt:formatNumber value="${loan[10]}" pattern="0.00" /></td>
				<c:if test="${loan[11]==1}">
					<td>已还款</td>
				</c:if>
				<c:if test="${loan[11]==2}">
					<td>逾期未还款</td>
				</c:if>
				<c:if test="${loan[11]==3}">
					<td>提前已还款</td>
				</c:if>
				<c:if test="${loan[11]==4}">
					<td>未还款</td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
	<tr>
		<td colspan="10" style="border: 0px;"><div class="quotes"><jsp:include
					page="/WEB-INF/views/member/communal/page.jsp" /></div></td>
	</tr>
</table>


<!--End footer-->
</body>
</html>
