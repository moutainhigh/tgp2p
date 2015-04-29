<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	#assginment-search-panel span.om-combo,#assginment-search-panel span.om-calendar{
			vertical-align: middle;
		}
</style>
<script type="text/javascript" src="/resources/js/usermanager/assignmenter.js"></script>
<div layoutH="0">
		<div id="assginment-search-panel">
		   			<div>
		   				<form action="" method="post" id="searchborrowfrom">
		   				<span class="label">用户名：</span>
			   			<input type="text" name="userName" style="width: 88px;" class="input-text" />
			   			<span class="label">借款标号：</span>
			   			<input type="text" name="nickname" style="width: 88px;" class="input-text" />
			   			<span class="label">是否通过：</span>
			   			<input name="isLock" style="width: 88px;" id="bsearch-type" />
			   			<span id="button-bsearch">搜索</span>
			   			</form>
		   			</div>
		   		</div>
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javascript:void(0);" id="assignment-auditOne" ><span>待审批</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="assignment-noaudit"><span>审核通过</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="assignment-noauditOne"><span>审核不通过</span></a></li>
				<li class="line">line</li> 
			</ul>
		</div>
		<table id="assignment_show_list"></table>
		<div id="make-table">
			<ul>
				<li><a id="assignmentinfo1" href="javascript:void(0);">基本信息</a></li>
				<li><a id="assignmentinfo2" href="javascript:void(0);">借款标信息</a></li>
			</ul>
			
			<div id="userbaseinfo" >
				<table>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
       		</div>
			
		</div>
</div>
