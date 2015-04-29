<%--    
创建时间：2014年2月24日上午10:05:24   
创 建 人：LiNing   
相关说明：   理财计划认购记录显示页面
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="/resources/js/usermanager/purchaseercords201402241015.js"></script>
<div class="pageFormContent" layoutH="0">
	<p>
				<label>回购中投资:</label>
				<input class="textInput" value="${loan_0 }" readonly="readonly" />
			</p>
			<p>
				<label>累计投资金额:</label>
				<input class="textInput" value="${SumMoney }" readonly="readonly" />
			</p>
			<p>
				<label>已完成投资:</label>
				<input class="textInput" value="${loan_1 }" readonly="readonly" />
			</p>
			<p>
				<label>累计投资收益:</label>
				<input class="textInput" value="${sumRate }" readonly="readonly" />
			</p>
			<p>
				<label>待分配投资:</label>
				<input class="textInput" value="${loan_2 }" readonly="readonly" />
			</p>
		<input type="hidden" id="ids" value="${ids }" />
		<table id="purchase_list"></table>
		<table id="creditor_pay_list"></table>
</div>