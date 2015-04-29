<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/outline/queryAllOutline" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<div class="panelBar">
		<ul class="toolBar">
		<li><a class="edit" href="/outline/forwardAddOrUpt?operation=upt&outlineId={outline_id}" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false"  warn="请选择您要修改的提纲！" width="610" height="400"><span>编辑</span></a></li>
		<li><a class="add" href="/outline/forwardAddOrUpt?operation=add&outlineId=0" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false" width="610" height="400"><span>新增</span></a></li>
		<li><a class="delete" href="/outline/deleteOutline" title="确实要删除选中提纲吗?"  warn="请选择您要删除的提纲！" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
<!-- 				<th width="80">序号</th> -->
				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>是否显示</th>
				<th>图片地址</th>
				<th>内容</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${outlineList}" var="outline">
			<tr target="outline_id" rel="${outline.id}" class="checkall" onclick="javascript:selecteddefault(${outline.id});" style="cursor: pointer;">
<%-- 				<td>${outline.id}</td> --%>
                <td><input name="ids" value="${outline.id}" type="checkbox"></td>
				<td>${outline.isShow }</td>
				<td>${outline.imgUrl }</td>
				<td>${outline.content }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>