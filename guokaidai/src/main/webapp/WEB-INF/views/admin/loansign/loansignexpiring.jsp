<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="pagerForm" action="/baseLoanSign/toLoanSignExpiring" method="post">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="loanType" value="${loanType}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/baseLoanSign/openMessage?loanId={cid}" target="dialog" rel="addcreditor" mask="true" width=492 height=330 ><span>到期提醒</span></a></li>
		</ul>
	</div>
 <table class="table" layoutH="110" targetType="dialog" style="width:100%;">
		<thead>
			<tr>
				<th orderfield="">序号</th>
				<th orderfield="">借款标号</th>
				<th orderfield="">标题</th>
				<th orderfield="">借款人</th>
				<th orderfield="">最小出借单位</th>
				<th orderfield="">借款金额</th>
				<c:if test="${loanType==1}"><th orderfield="">还款期限</th></c:if>
				<th orderfield="">借款标类型</th>
				<c:if test="${loanType ne 2}">
				<th orderfield="">借款标管理费比例</th>
				<th orderfield="">借款标管理费</th>
				</c:if>
				<c:if test="${loanType==1}"><th orderfield="">年化利率</th></c:if>
				<c:if test="${loanType==2}"><th orderfield="">天利率</th></c:if>
				<th orderfield="">平台奖励</th>
				<c:if test="${loanType==1}">
					<th orderfield="">还款方式</th>
				</c:if>
				<th orderfield="">借款标状态</th>
				<th orderfield="">是否放款</th>
				<th orderfield="">发布时间</th>
				<th orderfield="">放款时间</th>
				<th orderfield="">是否显示</th>
				<th orderfield="">推荐到首页</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${loanSignExpir}" var="uu">
		<tr target="cid" rel="${uu[0]}" class="checkall" onclick="javascript:selecteddefault(${uu[0]});" style="cursor: pointer;">
			<td>${uu[0]}</td>
			<td>${uu[1]}</td>
			<td>${uu[2]}</td>
			<td>${uu[3]}</td>
			<td>${uu[4]}元</td>
			<td><fmt:formatNumber value="${uu[5]}" pattern="0.00" type="number"/>元</td>
			
			<c:if test="${loanType==1}"><td>${uu[6]}个月</td></c:if>
			<td>${uu[7]}</td>
			<c:if test="${loanType ne 2}">
				<td><fmt:formatNumber value="${uu[9]}" type="currency" pattern="0.00%"/></td>
				<td><fmt:formatNumber value="${uu[9]}" pattern="0.00" type="number"/>元</td>
			</c:if>
			<td><fmt:formatNumber value="${uu[9]}" type="currency" pattern="0.00%"/></td>
			<td><fmt:formatNumber value="${uu[10]}" type="currency" pattern="0.00%"/></td>
			<c:if test="${loanType==1}"><td>${uu[11]}</td></c:if>
			<td>${uu[12]}</td>
			<td>${uu[13]}</td>
			<td>${uu[14]}</td>
			<td>${uu[15]}</td>
			<td>${uu[16]}</td>
			<td>${uu[17]}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="panelBar">
		<div class="pages"><span>每页 ${page.numPerPage}条，共${page.totalCount}条</span></div>
		<div class="pagination" targetType="dialog" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="5" currentPage="${page.pageNum}"></div>
	</div>
	
</div>
</body>
</html>