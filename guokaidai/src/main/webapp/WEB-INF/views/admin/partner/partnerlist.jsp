<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="/resources/js/checkboxselected.js" type="text/javascript"></script>
<style>
td{text-align: center;}
th{text-align:center;}
.operating{color: green;}
</style>
<script type="text/javascript">
//双击编辑视频播报信息
function dbltr(id){
	$.pdialog.open("/partners/partneropen?id="+id,"dialog", "编辑", { max:false,width: 520, height: 250,mask:true});
}
</script>
<form id="pagerForm" method="post" action="/partners/partner_list" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/partners/partneropen" target="dialog" height="250" width="520" rel="addusertab" mask="true"><span>添加</span></a></li>
			<li><a class="delete" href="/partners/partner_deletes" target="selectedTodo" rel="ids"  title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
</div>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/partners/partner_list" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						附件备注：<input type="text" name="remark"/>
					</td>
					<td>
						是否显示：
						<select name="isShow">
							<option value="">请选择</option>
							<option value="0">不显示</option>
							<option value="1">显示</option>
						</select>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="115" height="100%" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="10%">序号</th>
			<th width="20%">附件备注</th>
			<th width="15%">是否显示</th>
			<th width="25%">附件</th>
			<th width="25%">链接地址</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="partner">
		<tr target="sid_obj" rel="${partner[0]}" class="checkall" onclick="javascript:selecteddefault(${partner[0]});" style="cursor: pointer;" ondblclick="javascript:dbltr(${partner[0]});" >
			<td width="5%"><input name="ids" value="${partner[0]}" type="checkbox" class="checkboxSelected" onclick="javascript:selecteddefault(${partner[0]});"/></td>
			<td width="10%">${partner[0]}</td>
			<td width="20%">${partner[1]}</td>
			<td width="15%">${partner[2] eq 1 ? "显示":'不显示'}</td>
			<td width="25%"><img height="20px" width="120px" src="${partner[3]}" title="附件"/></td>
			<td width="25%">${partner[4]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>