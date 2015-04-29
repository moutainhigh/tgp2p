
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/bankrate.js"></script>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="addbankrate"><span>添加</span></a></li>
			<li><a class="edit" id="editbankrate" href="javascript:void(0);" height="350" width="520"><span>修改</span></a></li>
			<li><a class="delete" id="deleteAll" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<table id="bankratemygrid"></table>
	<div id="dialog-edit-form">
			<div class="pageFormContent">
				<div class="unit">
						期限：
					<input name="during" id=="during" />
					<input name="id"  type="hidden" />
				</div>
				<div class="unit">
						利率：
					<input name="rate" style="width: 123px;"  id="rate"  />%
				</div>
			</div>
	</div>
	</div>
