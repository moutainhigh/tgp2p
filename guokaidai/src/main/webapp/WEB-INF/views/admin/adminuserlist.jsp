<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/adminuser/querypage" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="name" value="${name}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/adminuser/querypage" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户名：<input type="text" name="name" value="${name}"/>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/adminuser/querypage" target="dialog" rel="addusertab" mask="true"><span>添加</span></a></li>
			<li><a class="delete" href="<%=basePath %>userinfo/delete.htm" target="selectedTodo" rel="ids"  title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="<%=basePath %>userinfo/openpage.htm?id={sid_obj}" target="dialog" rel="updateuser" mask="true"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:void(0);" id="iconbatch"><span>批量导出</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:void(0);" id="iconall"><span>导出全部</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="80"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
				<th width="80">序号</th>
				<th>年龄</th>
				<th>邮箱</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="user">
			<tr target="sid_obj" rel="${user[0]}" class="checkall" onclick="javascript:selecteddefault(${user[0]});" style="cursor: pointer;">
				<td><input name="ids" value="${user[0]}" type="checkbox" onclick="javascript:selecteddefault(${user[0]});" class="checkboxSelected"/></td>
				<td>${user[0]}</td>
				<td>${user[1]}</td>
				<td>${user[2]}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>