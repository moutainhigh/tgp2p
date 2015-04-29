
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
#search-online-panel span.om-combo,#search-online-panel span.om-calendar {
	vertical-align: middle;
}
 button::-moz-focus-inner,input::-moz-focus-inner{border:none;}
 
 </style>
<script type="text/javascript" src="/resources/js/online_apply.js"></script>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="editonline"><span>已联系</span></a></li>
			<li><a class="delete" id="deleteonline" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div id="search-online-panel">
   			<div >
   				<form action="" method="post" id="searchonlinefrom">
				<span class="label">状态：</span>
				<input id="state" style="width: 88px" name="state" />
	   			<span type="submit" id="button-search">搜索</span>
	   			</form>
   			</div>
   		</div>
	<table id="onlinemygrid"></table>
	
	</div>
