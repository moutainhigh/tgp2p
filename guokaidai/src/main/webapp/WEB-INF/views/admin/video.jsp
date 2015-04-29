<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/video/open">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
<%--	<input type="hidden" name="orderField" value="${param.orderField}" />--%>
<%--	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />--%>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/admincolum/queryDeputysectionById?operation=add&id=0" target="dialog" rel="adddeputy" mask="true" width="500" height="500"><span>添加</span></a></li>
			<li><a class="delete" href="/admincolum/deleteDeputysection?id={deputysection_id}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个用户"><span>删除</span></a></li>
			<li><a class="add" href="/admincolum/queryDeputysectionById?operation=upt&id={deputysection_id}" target="dialog" rel="adddeputy" mask="true" width="500" height="350"><span>修改</span></a></li>
		</ul>
	</div>

	<div id="w_list_print">
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="80">序号</th>
				<th>标题</th>
				<th>图片路径</th>
				<th>是否显示</th>
				<th>显示顺序</th>
				<th>备注</th>
				<th>提交时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${videoes}" var="v">
			<tr target="v_id" rel="${v.id}" class="checkall"  style="cursor: pointer;">
				<td>${v.id}</td>
				<td>${v.title}</td>
				<td>${v.filePath}</td>
				<td>${v.isShow == '1' ? '是' : '否'}</td>
				<td>${v.showNum}</td>
				<td>${v.remark}</td>
				<td>${v.addTime}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>
