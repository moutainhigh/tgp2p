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
<script type="text/javascript" src="/resources/js/youxuan/useryouxuan.js"></script>
<div id="user-search-panel">
	<div>
		<form action="" method="post" id="searchfrom">
		<span class="label">用户名：</span>
		<input type="text" name="userName" class="input-text" />
		<span class="label">会员等级：</span> 
		<input name="errorNum" id="search-type" />
		<span class="label">注册时间：</span>
		<input name="createTime" id="start-time"  readonly="readonly" style="width: 118px" />
		<span class="label">至：</span>
		<input name="failTime" id="end-time"  readonly="readonly" style="width: 118px" />
		
		<span id="user-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0"  class="pageContent">
<div class="panelBar">
	<ul class="toolBar">
	    <li><a class="add" href="javascript:void(0);" id="addUser"><span>新增用户</span></a></li>
		<li class="line">line</li>
		<li><a class="edit" href="javascript:void(0);" id="addAuto"><span>自动投标设置</span></a></li>
		<li class="line">line</li>
		<li><a class="add" href="javascript:regist_bf();" id="registerips"><span>注册宝付</span></a></li>
	</ul>
</div>
<table id="user_list"></table>

<div class="panelBar" style="display:none" id="panelbar_2">
	<ul class="toolBar">
		<li><a id="en_auto" class="edit" ><span>启用</span> </a></li>
		<li class="line">line</li>
		<li><a id="dis_auto" class="edit" ><span>停用</span> </a>
		</li>
	</ul>
</div>
<table id="user_auto_list"></table>
</div>
