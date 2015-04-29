<%--    
相关说明：   会员管理借入记录
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/usermanager/borrowrecordlist.js"></script>

<div class="pageFormContent" layoutH="0">
	<p>
		<label>正在招标:</label> <input class="textInput" value="￥${row_1[0]}/${row_1[1]}标"
			readonly="readonly" />
	</p>
	<p>
		<label>正在还款:</label> <input class="textInput" value="￥${row_2[0]}/${row_2[1]}标 "
			readonly="readonly" />
	</p>
	<p>
		<label>已还清:</label> <input class="textInput" value="￥${row_3[0]}/${row_3[1]}标"
			readonly="readonly" />
	</p>
	<p>
		<label>当前逾期:</label> <input class="textInput" value="￥${row_6 }元"
			readonly="readonly" />
	</p>
	<p>
		<label>累计逾期:</label> <input class="textInput" value="￥${row_7 }元"
			readonly="readonly" />
	</p>
	<p>
		<label>累计借出奖励:</label> <input class="textInput" value="￥${row_8 }元"
			readonly="readonly" />
	</p>
	<p>
		<label>支付太平洋理财:</label> <input class="textInput" value="￥${row_9 }元"
			readonly="readonly" />
	</p>
	<p>
		<label>累计借入金额:</label> <input class="textInput" value="￥${row_10 }元"
			readonly="readonly" />
	</p>
	<p>
		<label>累计利息成本:</label> <input class="textInput" value="￥${row_11 }元"
			readonly="readonly" />
	</p>
	<p>
		<label>借入利息成本:</label> <input class="textInput" value="${row_12 }%"
			readonly="readonly" />
	</p>
	<input type="hidden" id="id" value="${id}" />
	<table id="borrowjx_list"></table>
	<table id="borrowhk_list"></table>
	<table id="borrowwc_list"></table>
</div>
