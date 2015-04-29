<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	#borrow-search-panel span.om-combo,#borrow-search-panel span.om-calendar{
			vertical-align: middle;
		}
</style>
<script type="text/javascript" src="/resources/js/usermanager/withdrawApplyList.js"></script>
<div layoutH="0">
		<div id="borrow-search-panel">
		   			<div>
		   				<form action="" method="post" id="searchborrowfrom">
			   			<span class="label">申请提现时间：</span>
			   			<input type="text" id="beginDate" style="width: 88px;"  name="beginDate" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="endDate" style="width: 88px;"  name="endDate" class="input-text"/>
			   			<span id="button-bsearch">搜索</span>
			   			</form>
		   			</div>
		   		</div>
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javascript:void(0);" id="audit"><span>审核通过</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="noaudit"><span>审核不通过</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="loan"><span>放款</span></a></li>
			</ul>
		</div>
		<table id="withdrawApplyList"></table>
</div>
