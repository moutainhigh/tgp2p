<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
#user-search-panel .input-text {
	    border: 1px solid #6D869E;
	    height: 18px;
	    vertical-align: middle;
	    width: 137px;
	}

#user-search-panel span.label{
 	margin-left: 10px;
 }
#user-search-panel .input-text {
    border: 1px solid #6D869E;
    height: 18px;
    vertical-align: middle;
    width: 137px;
}
#user-search-panel span.om-combo,#user-search-panel span.om-calendar{
	vertical-align: middle;
}
nav-panel div.nav-item:hover{
	border: 1px solid #99A8BC;
	background-color: #C4D6EC;
	padding-left: 39px;
	line-height: 23px;
}
button::-moz-focus-inner,input::-moz-focus-inner{border:none;}
</style>
<script type="text/javascript" src="/resources/js/usermanager/userlist201401051508.js"></script>
<div id="user-search-panel">
	<div >
		<form action="" method="post" id="searchfrom">
		<span class="label">用户名：</span>
		<input type="text" name="userName" class="input-text" />
		<span class="label">身份证号：</span>
		<input type="text" name="name" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
		<span class="label">会员等级：</span> 
		<input name="errorNum" id="search-type" />
		<span class="label">是否是借款人：</span> 
		<input name="isbrow" id="search-brow" />

		<span class="label">登录次数：</span>
		<input name="isLock" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" style="width:70px"/>以上
		<br/><br/>
		<span class="label">注册时间：</span>
		<input name="createTime" id="start-time"  readonly="readonly" style="width: 118px" />
		<span class="label">至：</span>
		<input name="failTime" id="end-time"  readonly="readonly" style="width: 118px" />
		
		<span class="label">客服：</span>
		<input name="nickname" id="search-admin" />
		<span id="user-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0"  class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="javascript:void(0);" id="dis_user" ><span>禁用</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="en_user" ><span>启用</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="update_user_info"><span>修改会员信息</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="updateisvip"><span>修改会员等级</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="statistics"><span>资金统计</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="recordborr"><span>分配客服</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="browinfo"><span>借出记录</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="browtoRecordinfo"><span>借入记录</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="user-table-excel"><span>导出</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="generinfo"><span>推广信息</span></a></li>
		</ul>
	</div>
	<table id="user_show_list"></table>
	
	<table id="user_money_list"></table>
</div>
