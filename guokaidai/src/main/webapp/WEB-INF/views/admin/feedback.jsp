<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/feedback/open">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
<%--	<input type="hidden" name="orderField" value="${param.orderField}" />--%>
<%--	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />--%>
</form>
<div class="pageContent">
	<div id="w_list_print">
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="80">序号</th>
				<th>反馈人姓名</th>
				<th>反馈人邮件</th>
				<th>反馈人电话</th>
				<th>反馈内容</th>
				<th>反馈类型</th>
				<th>反馈时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${emails}" var="e">
			<tr target="u_id" rel="${e.uploadfile.id}" class="checkall"  style="cursor: pointer;">
<%--				<td><input name="uid" type="radio" value="${e.uploadfile.id}"/></td>--%>
				<td>${e.id}</td>
				<td>${e.name}</td>
				<td>${e.uploadfile.name}</td>
				<td>${e.phone}</td>
				<td>${e.context}</td>
				<td>${e.feedbacktype.typeName}</td>
				<td>${e.addTime}</td>
				<td><a class="add" href="/feedback/downFile?id=${e.uploadfile.id}"><span>下载</span></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>