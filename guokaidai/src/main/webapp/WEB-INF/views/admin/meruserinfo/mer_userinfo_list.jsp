<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	/**
	 * 修改用户信息
	 */
	$("#researchIpsInfo").click(function(){
		//获取选中行数据
		var identNo="";
		var userName="";
		 $("input[name='ids']:checked").each(function(){
			 	if(this.checked==true&&$(this).val()!="undefined"){
			 			if(identNo==""){
			 				identNo=$(this).attr("identNo");
			 				userName=$(this).attr("userName");
			 			}
			 	}
		 });
		 if(identNo.length>0){
			 $.pdialog.open('/merUserInfo/queryIpsUserInfo?pIdentNo='+identNo+"&userName="+userName, 'loginpage', 'IPS开户信息' , { width:480,height:400,mask:true,maxable:false });
		 }else{
			alertMsg.warn("您还没有选择要查看的用户"); 
		 }
		
	});
	
	$("#admin_query").click(function(){
		$('#admin_show_list').omGrid('setData','/adminuser/querypage?username='+$("#query_str").val());
		
	});
	
});
</script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/merUserInfo/open" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/merUserInfo/open" method="post" onsubmit="return navTabSearch(this);">
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
					<td><div class="buttonActive"><div class="buttonContent"><button type="button" id="researchIpsInfo">查看IPS开户信息</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="110" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="10%">真实姓名</th>
			<th width="10%">用户名</th>
			<th width="15%">IPS开户流水单号</th>
			<th width="15%">IPS开户时间</th>
			<th width="15%">IPS开户账号</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="merUserInfo">
		<tr target="sid_obj" rel="${merUserInfo[0]}" class="checkall"  style="cursor: pointer;">
			<td><input name="ids" class="checkboxSelected" value="${merUserInfo[0]}" 
				identNo="${merUserInfo[5]}"  userName="${merUserInfo[2]}"
			   type="checkbox"
			/></td>
			<td>${merUserInfo[1]}</td>
			<td>${merUserInfo[2]}</td>
			<td>${merUserInfo[3] } </td>
			<td>${merUserInfo[4]}</td>
			<td>${merUserInfo[5]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>