<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/single/queryAllDepuy1">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="topicId" value="${topicId}" />
</form>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/single/queryAllDepuy1" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
					 	一级栏目：<select name="topicId">
					 			   <option value="0">不限</option>
						    	   <c:forEach  items="${topicsList}" var="t">
						    	   <option value="${t.id}" <c:if test="${t.id eq topicId}">selected="selected"</c:if> >${t.name}</option>
						    	   </c:forEach>
						    	   </select>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/single/openEditeDanye?operation=add&id=0" target="navTab" rel="adddeputy" mask="true" maxable="false" resizable="false" width="520" height="315"><span>添加</span></a></li>
			<li><a title="确实要删除选中栏目吗?" target="selectedTodo" rel="ids" postType="string" href="/single/deleteSinglePage" class="delete"><span>删除</span></a></li>
			<li><a class="edit" href="/single/openEditeDanye?operation=upt&id={deputysection_id}" target="navTab" rel="updateuser" mask="true" warn="请选择栏目！" width="750" height="450"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="30px;">序号</th>
				<th>栏目名称</th>
				<th>是否显示</th>
				<th>栏目类型</th>
				<th>所属一级栏目</th>
				<th>网页标题</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${deputy1_list}" var="deputysection" varStatus="d">
			<tr target="deputysection_id" rel="${deputysection.id}" class="checkall" onclick="javascript:selecteddefault(${topic.id});" style="cursor: pointer;">
				<td><input name="ids" value="${deputysection.id}" type="checkbox"></td>
<%-- 				<td>${deputysection.id}</td> --%>
				<td>${d.index+1}</td>
				<td>${deputysection.name}</td>
				<td>${enum_show_state[deputysection.isShow]}</td>
				<td>${deputysection.sectiontype.name}</td>
				<td>${deputysection.topic.name}</td>
				<td>${deputysection.pageTitile}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>