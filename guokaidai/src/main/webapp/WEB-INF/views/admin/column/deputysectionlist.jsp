<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/deputysection/queryAllDeputysections">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="topicId" value="${topicId}" />
</form>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/deputysection/queryAllDeputysections" method="post" onsubmit="return navTabSearch(this);">
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
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/deputysection/add_upt_deputy?operation=add&id=0" target="dialog" rel="adddeputy" mask="true" maxable="false" resizable="false" width="520" height="315"><span>添加</span></a></li>
			<li><a class="delete" href="/deputysection/deleteDeputysection" title="确实要删除选中的二级栏目吗?" warn="请选择您要删除的二级栏目！" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
			<li><a class="edit" href="/deputysection/add_upt_deputy?operation=upt&id={deputysection_id}" target="dialog" rel="adddeputy" mask="true" resizable="false" maxable="false" warn="请选择您要修改的二级栏目！" width="520" height="315"><span>修改</span></a></li>
		</ul>
	</div>

	<div id="w_list_print">
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="30px;">序号</th>
				<th>栏目名称</th>
				<th>是否显示</th>
<!-- 				<th>是否在推荐区</th> -->
				<th>栏目类型</th>
				<th>所属一级栏目</th>
				<th>网页标题</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${deputysections_list}" var="deputysection" varStatus="d">
			<tr target="deputysection_id" rel="${deputysection.id}" class="checkall" onclick="javascript:selecteddefault(${topic.id});" style="cursor: pointer;">
				<td><input name="ids" value="${deputysection.id}" type="checkbox"></td>
<%-- 				<td>${deputysection.id}</td> --%>
				<td>${d.index+1 }</td>
				<td>${deputysection.name}</td>
				<td>${enum_show_state[deputysection.isShow]}</td>
<%-- 				<td>${enum_show_state[deputysection.isRecommend]}</td> --%>
				<td>${deputysection.sectiontype.name}</td>
				<td>${deputysection.topic.name}</td>
				<td>${deputysection.pageTitile}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>