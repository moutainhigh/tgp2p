<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/checkboxselected.js" type="text/javascript"></script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/link/linkpage" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="name" value="${name}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/link/openlist" target="dialog" height="350" width="520" rel="addusertab" mask="true"><span>添加</span></a></li>
			<li><a class="edit" href="/link/openlist?id={sid_obj}" height="350" width="520" target="dialog" rel="updatelink" mask="true"><span>编辑</span></a></li>
			<li><a class="delete" href="/link/deletelist" target="selectedTodo" rel="ids"  title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
</div>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/link/linkpage" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						链接名：<input type="text" name="name" value="${name}"/>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="110" height="100%" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="10%">编号</th>
			<th width="25%">链接名</th>
			<th width="30%">链接地址</th>
			<th width="20%">链接备注</th>
			<th width="10%">是否显示</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="link">
		<tr target="sid_obj" rel="${link[0]}" class="checkall" onclick="javascript:selecteddefault(${link[0]});" style="cursor: pointer;" ondblclick="javascript:dbltr(${link[0]});" >
			<td><input name="ids" value="${link[0]}" class="checkboxSelected" onclick="javascript:selecteddefault(${link[0]});" type="checkbox"/></td>
			<td>${link[0]}</td>
			<td>${link[1]}</td>
			<td>${link[2]}</td>
			<td>${link[3]}</td>
			<td><c:if test="${link[4] eq 1}">显示</c:if><c:if test="${link[4] eq 0}">不显示</c:if></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>
