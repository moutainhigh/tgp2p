<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/checkboxselected.js" type="text/javascript"></script>
<style>
td{text-align: center;}
th{text-align:center;}
.operating{color: green;}
</style>
<form id="pagerForm" method="post" action="banner/bannerpage" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="name" value="${name}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/banner/banneropen" target="dialog" height="320" width="520" rel="addusertab" mask="true"><span>添加</span></a></li>
			<li><a class="delete" href="/banner/deletebanner" target="selectedTodo" rel="ids"  title="确定要删除吗?"><span>删除</span></a></li>
		<li><a class="edit" href="/banner/banneropen?id={sid_obj}" height="350" width="520" target="dialog" rel="updatebanner" mask="true"><span>编辑</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="/banner/bannerup?id={sid_obj}" target="ajaxTodo" title="确定要上移吗？" warn="请选择某一行"><span>上移</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="/banner/bannerdown?id={sid_obj}"  target="ajaxTodo" title="确定要下移吗？" warn="请选择某一行"><span>下移</span></a></li>
		</ul>
</div>

<table class="table" width="100%" layoutH="70" height="100%" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="10%">图片顺序</th>
			<th width="25%">图片名称</th>
			<th width="30%">链接地址</th>
			<th width="30%">位置</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="banner">
		<tr target="sid_obj" rel="${banner[0]}" class="checkall" onclick="javascript:selecteddefault(${banner[0]});" style="cursor: pointer;" ondblclick="javascript:dbltr(${banner[0]});" >
			<td><input type="hidden" class="number" value="${banner[1]}"/><input name="ids" value="${banner[0]}" type="checkbox" class="checkboxSelected" onclick="javascript:selecteddefault(${banner[0]});"/></td>
			<td>${banner[1]}</td>
			<td>${banner[2]}</td>
			<td>${banner[3]}</td>
			<td>${banner[4] eq 1 ? '首页':(banner[4] eq 2 ? '我要投资':'我要借款')}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>