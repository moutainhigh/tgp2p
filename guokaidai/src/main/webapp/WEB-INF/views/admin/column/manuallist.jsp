<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/manual/queryAllManual" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<div class="panelBar">
		<ul class="toolBar">
		<li><a class="edit" href="/manual/forwardAddOrUpt?operation=upt&manualId={manual_id}" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false"  warn="请选择您要修改的提纲！" width="610" height="200"><span>编辑</span></a></li>
		<li><a class="add" href="/manual/forwardAddOrUpt?operation=add&manualId=0" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false" width="610" height="200"><span>新增</span></a></li>
		<li><a class="delete" href="/manual/deleteManual" title="确实要删除选中手册吗?"  warn="请选择您要删除的手册！" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
<!-- 				<th width="80">序号</th> -->
				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th >是否显示</th>
				<th >标题</th>
				<th >图片说明</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${manualList}" var="manual">
			<tr target="manual_id" rel="${manual.id}" class="checkall" onclick="javascript:selecteddefault(${manual.id});" style="cursor: pointer;">
<%-- 				<td>${manual.id}</td> --%>
                <td><input name="ids" value="${manual.id}" type="checkbox"></td>
				<td >${manual.isShow }</td>
				<td >${manual.title }</td>
				<td >${manual.imgExplain }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>