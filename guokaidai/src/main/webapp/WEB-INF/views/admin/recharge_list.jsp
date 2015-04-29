<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
//location = "/recharge/outPutExcel?"+$("#pagerForm").serialize();
	function test(){
		$.each($("#datas tr"),function(i,item){
			$(item).bind("dblclick",function(){
				alert("您双击了 此行！");
			});
			
		});
	}
</script>
<form id="pagerForm" method="post" action="/recharge/list" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="name" value="${name}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="userName" value="${userName}" />
	<input type="hidden" name="date1" value="${date1}"/>
	<input type="hidden" name="date2" value="${date2}"/>
	<input type="hidden" name="rechargeType" value="${rechargeType}"/>
	<input type="hidden" name="toAccountType" value="${toAccountType}"/>
</form>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/recharge/list" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<div class="pageFormContent" >
				<p>
					<label>用户名：</label>
					<input type="text" name="userName" value="${userName}" />
					<div class="buttonActive"><div class="buttonContent"><button type="submit">搜索</button></div></div>
				</p>
				<p>
					<label>日期：</label>
					<input type="text" name="date1" class="date" value="${date1}" dateFmt="yyyy-MM-dd HH:mm" readonly="true"/>
					<a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>至</label>
					<input type="text" name="date2" class="date" value="${date2}" dateFmt="yyyy-MM-dd HH:mm" readonly="true"/>
					<a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
				<label>充值类型：</label>
					<select class="combox" name="rechargeType">
						<option value="">不限</option>
						<c:forEach items="${enum_recharge}"  var="recharge" varStatus="i">
							<option value="${i.index}" <c:if test="${i.index eq rechargeType}">selected="selected"</c:if> >${recharge}</option>
						</c:forEach>
					</select></p>
				<p><label>到账状态：</label>
					<select class="combox" name="toAccountType">
					<option value="">不限</option>
					<c:forEach items="${enum_to_account}"  var="to_account" varStatus="i">
						<option value="${i.index}" <c:if test="${i.index eq toAccountType}">selected="selected"</c:if> >${to_account}</option>
					</c:forEach>
					</select>
				</p>
			</div>
		</div>
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon" href="javascript:outPutExcel(0);" id="iconall"><span>导出数据</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="200" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="80">真实姓名</th>
				<th>用户名</th>
				<th>充值金额</th>
				<th>到账金额</th>
				<th>到账状态</th>
				<th>到账时间</th>
				<th>充值方式</th>
			</tr>
		</thead>
		<tbody id="datas">
		<c:forEach items="${list}" var="charge">
			<tr target="sid_obj" rel="${user[0]}" class="checkall" style="cursor: pointer;">
				<td>${charge.userinfo.name}</td>
				<td>${charge.userinfo.userName}</td>
				<td>${charge.rechargeAmount}</td>
				<td>${charge.reAccount}</td>
				<td>${enum_to_account[charge.tpstatus]}</td>
				<td>${charge.time}</td>
				<td>${enum_recharge[charge.status]}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>

<script>

function outPutExcel(){
	
	var win = window.open("/recharge/outPutExcel?&"+$("#pagerForm").serialize(),"","height=200,width=320,status=no,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no");
	
	win.document.title = "正在生成Excel，请稍后...";
	
}

</script>