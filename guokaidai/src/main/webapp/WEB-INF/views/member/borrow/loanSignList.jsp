<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.loanSignList_table{border:1px solid #CCCCCC;border-collapse:collapse;}
.loanSignList_table tr{border:1px solid #CCCCCC;border-collapse:collapse;}
.loanSignList_table th{border:1px solid #CCCCCC;border-collapse:collapse;background-color: #F9F9F9;padding: 0px;}
.loanSignList_table td{border:1px solid #CCCCCC;border-collapse:collapse;}
.lsinfo{text-align: center;}
</style>

<table class="loanSignList_table" width="500px">
	<tr>
		<th class="lsinfo" width="20%" >借入标号</th>
		<th class="lsinfo" width="25%">
			<c:if test="${tp==1}">发布日期</c:if>
			<c:if test="${tp==2}">借入日期</c:if>
			<c:if test="${tp==3}">创建日期</c:if>
			<c:if test="${tp==4}">应还款时间</c:if>
		</th>
		<c:if test="${tp!=4}"><th class="lsinfo" width="20%">借入金额</th></c:if>
		<c:if test="${tp==4}"><th class="lsinfo" width="20%">应还款金额</th></c:if>
		<th class="lsinfo" width="15%">年化利率</th>
		<c:if test="${tp==4}"><th class="lsinfo" width="20%">期数/总期数</th></c:if>
	</tr>
	<c:forEach var="item" items="${list}">
		<tr>
			<c:if test="${tp!=4}"><td class="lsinfo">${item.loansignbasics.loanNumber}</td></c:if>
			<c:if test="${tp==4}"><td class="lsinfo">${item[0]}</td></c:if>
			<td class="lsinfo">
				<c:if test="${tp==1}">${item.publishTime}</c:if>
				<c:if test="${tp==2}">${item.loansignbasics.creditTime}</c:if>
				<c:if test="${tp==3}">${item.loansignbasics.loanSignTime}</c:if>
				<c:if test="${tp==4}">${item[1]}</c:if>
			</td>
			<c:if test="${tp!=4}"><td class="lsinfo"><fmt:formatNumber value="${item.issueLoan}" pattern="0.00"/></td></c:if>
			<c:if test="${tp==4}"><td class="lsinfo"><fmt:formatNumber value="${item[2]}" pattern="0.00"/></td></c:if>
			<td class="lsinfo">
			   <c:if test="${tp!=4}"><fmt:formatNumber pattern="0.00" value="${item.rate*100}"/>%</c:if>
			   <c:if test="${tp==4}"><fmt:formatNumber pattern="0.00" value="${item[3]*100}"/>%</c:if>
			</td>
			<c:if test="${tp==4}"><td class="lsinfo">${item[4]}/${item[5]}</td></c:if>
		</tr>
	</c:forEach>
</table>
