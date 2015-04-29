<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/checkboxselected.js" type="text/javascript"></script>

<form id="pagerForm" method="post" action="/log/loglist" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="name" value="${name}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="delete" href="/log/deletelist" target="selectedTodo" rel="ids"  title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
</div>

<table class="table" width="100%" layoutH="70" height="100%" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="25%">登录时间</th>
			<th width="20%">登录IP</th>
			<th width="15%">登录名</th>
			<th width="15%">姓名</th>
			<th width="20%">备注</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="log">
		<tr target="sid_obj" rel="${log[0]}" class="checkall" onclick="javascript:selecteddefault(${log[0]});" style="cursor: pointer;">
			<td><input name="ids" value="${log[0]}" class="checkboxSelected" onclick="javascript:selecteddefault(${log[0]});" type="checkbox"/></td>
			<td>${log[1]}</td>
			<td>${log[2]}</td>
			<td>${log[3]}</td>
			<td>${log[4]}</td>
			<td>${log[5]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>
