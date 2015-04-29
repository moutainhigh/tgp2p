<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/adminmanager/adminlist201401051604.js"></script>

<div class="panelBar">
	<ul class="toolBar">
		<li><a class="add" href="role/transit?pageName=adminmanager/edit_admin" width="480" height="460" target="dialog" mask="true" maxable="false"  title="添加角色"><span>添加</span></a></li>
		<li class="line">line</li>
		<li><a class="delete" href="javascript:void(0);" id="deladmin_a"><span>删除</span></a></li>
		<li class="line">line</li>
		<li><a class="edit" id="updateadmin_a"><span>修改</span></a></li>
		<li class="line">line</li>
		<li>用户名/真实姓名:<input id="query_str" type="text"></li>
		<li class="line"></li>
		<li><a class="icon" id="admin_query" href="javascript:void(0);"><span>查询</span></a></li>
	</ul>
</div>
 <table id="admin_show_list"></table>