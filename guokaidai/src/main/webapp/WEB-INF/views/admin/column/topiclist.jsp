<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/topic/queryAllTopics" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<div class="panelBar">
		<ul class="toolBar">
		<li><a class="edit" href="/topic/forwardAddOrUpt?operation=upt&topicId={topic_id}" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false"  warn="请选择您要修改的一级栏目！" width="520" height="245"><span>编辑</span></a></li>
		<li><a class="add" href="/topic/forwardAddOrUpt?operation=add&topicId=0" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false" width="520" height="245"><span>新增</span></a></li>
		<li><a class="delete" href="/topic/deleteTopics" title="确实要删除选中一级栏目吗?"  warn="请选择您要删除的一级栏目！" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
<!-- 				<th width="80">序号</th> -->
				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>栏目名称</th>
				<th>英文名称</th>
				<th>是否显示</th>
				<th>网页标题</th>
				<th>是否显示在页脚</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${topicsList}" var="topic">
			<tr target="topic_id" rel="${topic.id}" class="checkall" onclick="javascript:selecteddefault(${topic.id});" style="cursor: pointer;">
<%-- 				<td>${topic.id}</td> --%>
				<td><input name="ids" value="${topic.id}" type="checkbox"></td>
				<td>${topic.name}</td>
				<td>${topic.engName}</td>
				<td>${enum_show_state[topic.isShow]}</td>
				<td>${topic.pageTitle}</td>
				<td>${enum_show_state[topic.isfooter]}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>