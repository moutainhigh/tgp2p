<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="/resources/js/checkboxselected.js" type="text/javascript"></script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<script type="text/javascript">
//双击编辑视频播报信息
function dbltr(id){
	$.pdialog.open("/videobroadcast/openvideo?id="+id,"dialog", "编辑", { max:false,width: 520, height: 350});
}
</script>
<form id="pagerForm" method="post" action="/videobroadcast/videopage" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/videobroadcast/openvideo" target="dialog" height="350" width="520" rel="addusertab" mask="true"><span>添加</span></a></li>
<%--			<li><a class="edit" href="/videobroadcast/openvideo?id={sid_obj}" height="350" width="520" target="dialog" rel="updateuser" mask="true"><span>编辑</span></a></li>--%>
			<li><a class="delete" href="/videobroadcast/deletevideo" target="selectedTodo" rel="ids"  title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
</div>

<table class="table" width="100%" layoutH="70" height="100%" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="8%">编号</th>
			<th width="15%">标题</th>
			<th width="23%">图片路径</th>
			<th width="6%">是否显示</th>
			<th width="6%">显示顺序</th>
			<th width="22%">备注</th>
			<th width="25%">提交时间</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="video">
		<tr target="sid_obj" rel="${video[0]}" class="checkall" onclick="javascript:selecteddefault(${video[0]});" style="cursor: pointer;" ondblclick="javascript:dbltr(${video[0]});" >
			<td><input name="ids" class="checkboxSelected" value="${video[0]}" onclick="javascript:selecteddefault(${video[0]});" type="checkbox"/></td>
			<td>${video[0]}</td>
			<td>${video[1]}</td>
			<td>${video[2]}</td>
			<td><c:if test="${video[3] eq 1}">显示</c:if><c:if test="${video[3] eq 0}">不显示</c:if></td>
			<td>${video[4]}</td>
			<td>${video[5]}</td>
			<td>
				<fmt:parseDate value="${video[6]}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/> 
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>
