<%--    
相关说明： 自动积分查询
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/usermanager/borrowautointe.js"></script>

<div layoutH="0">
	<input type="hidden" id="bid" value="${bid}" />
	<font>&nbsp;自动积分总和：${sumautoint}分</font>
	<table id="borrow_integrat_list"></table>
</div>