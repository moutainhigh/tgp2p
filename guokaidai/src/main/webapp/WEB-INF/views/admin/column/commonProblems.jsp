<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<style>
.feed {
	text-align: left;
}
</style>
<form id="pagerForm" method="post" action="/commonproblem/open">
	<input type="hidden" name="pageNum" value="1" /> <input type="hidden"
		name="numPerPage" value="${page.numPerPage}" /> <input type="hidden"
		name="title" value="${title}" /> <input type="hidden" name="isShow"
		value="${isShow}" /> <input type="hidden" name="type" value="${type}" />
</form>
<div class="pageHeader" style="border: 1px #B8D0D6 solid">
	<form action="/commonproblem/open" method="post"
		onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" /> <input type="hidden"
			name="numPerPage" value="${page.numPerPage}" />
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>问题标题：<input type="text" name="title" style="width: 100px;" value="${title}">
					</td>
					<td>是否显示：<select style="margin-left: 10px;" name="isShow">
							<option value="-1"
								<c:if test="${isShow eq  -1}">selected="selected"</c:if>>请选择</option>
							<option value="1"
								<c:if test="${isShow eq  1}">selected="selected"</c:if>>是</option>
							<option value="0"
								<c:if test="${isShow eq  0}">selected="selected"</c:if>>否</option>
					</select>
					</td>
					<td>问题类型：<select style="margin-left: 10px;" name="type">
							<option value="-1"
								<c:if test="${type eq  -1}">selected="selected"</c:if>>请选择</option>
							<option value="0"
								<c:if test="${type eq  0}">selected="selected"</c:if>>借款问题</option>
							<option value="1"
								<c:if test="${type eq  1}">selected="selected"</c:if>>投资问题</option>
							<option value="2"
								<c:if test="${type eq  2}">selected="selected"</c:if>>平台运营问题</option>
					</select>
					</td>
					<td><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/commonproblem/add_upt_problem?operation=add&id=0" target="dialog" rel="adddeputy" mask="true" maxable="false" resizable="false" width="520" height="330"><span>添加</span></a></li>
			<li><a class="delete" href="/commonproblem/deleteProblem" title="确实要删除选中的常见问题吗?" warn="请选择您要删除的常见问题！" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
			<li><a class="edit" href="/commonproblem/add_upt_problem?operation=upt&id={p_id}" target="dialog" rel="adddeputy" mask="true" resizable="false" maxable="false" warn="请选择您要修改的二级栏目！" width="520" height="330"><span>修改</span></a></li>
		</ul>
	</div>

	<div id="w_list_print">
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
				<!-- 				<th width="80">序号</th> -->
				<th width="22"><input value="" type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th>问题标题</th>
				<th>回复内容</th>
				<th>是否显示</th>
				<th>问题类型</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${problems}" var="p">
				<tr target="p_id" rel="${p.id}" class="checkall"
					onclick="javascript:selecteddefault(${p.id});"
					style="cursor: pointer;">
					<td><input name="ids" value="${p.id}" type="checkbox"></td>
					<td>${p.title}</td>
					<td>${p.replyContent}</td>
					<td><c:if test="${p.isShow eq 1 }">是</c:if>
					<c:if test="${p.isShow != 1 }">否</c:if></td>
					<td><c:if test="${p.type == 0 }">借款问题</c:if>
					<c:if test="${p.type == 1 }">投资问题</c:if>
					<c:if test="${p.type == 2 }">平台运营问题</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp" />
</div>
<script src="/resources/js/feedback.js" type="text/javascript"></script>