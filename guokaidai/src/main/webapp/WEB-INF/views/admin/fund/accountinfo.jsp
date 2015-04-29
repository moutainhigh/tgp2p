<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  id="pagerForm" action="/fund/queryaccountinfo" method="post" onsubmit="return divSearch(this, 'jbsxBox')">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						时间
						<input type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="beginDate" value="${beginDate}" readonly="readonly"/> 至 
						<input type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="endDate" value="${endDate}" readonly="readonly"/>
					</td>
					<td>
					类型：
					</td>
					<td>
						<select name="typeid">
							<option value="">全部 </option>
							<c:forEach items="${type}" var="t">
								<option value="${t[0]}" <c:if test="${typeid eq  t[0]}">selected="selected"</c:if>>${t[1]}</option>
							</c:forEach>
						</select>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<table class="table" width="100%"  rel="jbsxBox" layoutH="101">
	<thead>
		<tr>
			<th width="20%">日期</th>
			<th width="20%">类型</th>
			<th width="20%">支出</th>
			<th width="20%">收入</th>
			<th width="20%">余额</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="accinfo">
		<tr  style="cursor: pointer;">
			<td>${accinfo[1]}</td>
			<td>${accinfo[2]}</td>
			<td>${accinfo[3]}</td>
			<td>${accinfo[4]}</td>
			<td>${accinfo[5]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="panelBar" style="margin-bottom: 0px;">
	<div align="left"></div>
	<div class="pages">
	<div align="left">
		<span>显示</span>
		<select  name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox');">
			<option value="10">10</option>
			<option value="20" <c:if test="${page.numPerPage eq 20}">selected="selected"</c:if>>20</option>
			<option value="50" <c:if test="${page.numPerPage eq 50}">selected="selected"</c:if>>50</option>
			<option value="100" <c:if test="${page.numPerPage eq 100}">selected="selected"</c:if>>100</option>
			<option value="200" <c:if test="${page.numPerPage eq 200}">selected="selected"</c:if>>200</option>
		</select>
		<span>条，共${page.totalCount}条,每页显示${page.numPerPage}条</span>
	</div>
	</div>
	<div class="pagination" targetType="navTab" rel="jbsxBox" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.pageNum}"></div>
</div>
</div>