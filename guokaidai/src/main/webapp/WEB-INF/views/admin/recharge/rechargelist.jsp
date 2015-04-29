<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(function(){
	var ids="";
	//批量导出
	$("#iconbatch").click(function(){
		var flag=false;
		$('input[type="checkbox"][name="ids"]').each(function(){
			if(this.checked){
				ids=ids+this.value+",";
				flag=true;
			}
		});
		if(flag){
			window.location.href="/recharge/export_excel?ids="+ids;
		}else{
			alertMsg.error('请选择导出内容!');
		}
	});
	//导出全部
	$("#iconall").click(function(){
		window.location.href="/recharge/export_excel";
	});
});
</script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/recharge/open" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon" href="javascript:void(0);" id="iconbatch"><span>批量导出</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:void(0);" id="iconall"><span>导出全部</span></a></li>
		</ul>
</div>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/recharge/open" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						日期：<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="beginDate"  readonly="readonly"/>至
						<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="endDate"  readonly="readonly"/>
					</td>
					<td>
						用户名:<input  style="width: 100px;" type="text" name="userName"/>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="110" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="5%">真实姓名</th>
			<th width="10%">用户名</th>
			<th width="15%">充值金额</th>
			<th width="15%">到账金额</th>
			<th width="15%">订单号</th>
			<th width="15%">ips订单号</th>
			<th width="20%">充值时间</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="recharge">
		<tr target="sid_obj" rel="${recharge[0]}" class="checkall" onclick="javascript:selecteddefault(${recharge[0]});" style="cursor: pointer;">
			<td><input name="ids" class="checkboxSelected" value="${recharge[0]}" onclick="javascript:selecteddefault(${recharge[0]});" type="checkbox"/></td>
			<td>${recharge[1]}</td>
			<td>${recharge[2]}</td>
			<td><fmt:formatNumber pattern="0.00" value="${recharge[3]}"/></td>
			<td><fmt:formatNumber pattern="0.00" value="${recharge[4]}"/></td>
			<td>${recharge[5]}</td>
			<td>${recharge[6]}</td>
			<td>${recharge[7]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>