<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="pagerForm" action="/baseLoanSign/assignmentbaseList" >
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="username" value="${username}" />
	<input type="hidden" name="loanTitle" value="${loanTitle}" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" method="post" action="/baseLoanSign/assignmentbaseList" onsubmit="return dwzSearch(this, 'dialog');">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>用户名: <input class="textInput" name="username" value="${username }" type="text"></td>
				 <td>借款标题:<input class="textInput" name="loanTitle" value="${loanTitle}" type="text"></td>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" layoutH="90" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th style="display: none" orderfield="id">编号</th>
				<th orderfield="userName" width="20%">用户名</th>
				<th orderfield="name" width="20%">借款人</th>
				<th orderfield="loanTitle" width="25%">借款标题</th>
				<th orderfield="tenderMoney" width="25%">借款金额</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="people">
			<tr>
				<td style="display: none"><input type="hidden" value="${people[0]}"/> </td>
				<td>${people[1]}</td>
				<td>${people[2]}</td>
				<td>${people[4]}</td>
				<td>${people[3]}</td>
				<td>
					  <!--   <a class="btnSelect" href="javascript:$.bringBack({id:'${people[0]}', name:'${people[1]}', userName:'${people[2]}'})" title="借款人选择">选择</a> -->
					  <a class="btnSelect" href="/loanSignOfCir/queryDetails?operNumber=2&id=${people[0]}&userName=${people[1]}" title="添加" target="navTab" height="500" width="750" rel="addloanSignSic" mask="true">选择</a>
				</td>
			</tr>
		</c:forEach>	
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages"><span>每页 ${page.numPerPage}条，共${page.totalCount}条</span></div>
		<div class="pagination" targetType="dialog" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="5" currentPage="${page.pageNum}"></div>
	</div>
</div>