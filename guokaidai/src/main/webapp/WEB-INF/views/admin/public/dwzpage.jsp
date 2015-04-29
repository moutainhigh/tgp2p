<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="panelBar"><div align="left">
	</div><div class="pages"><div align="left">
		<span>显示</span>
		<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value});">
			<option value="10">10</option>
			<option value="20" <c:if test="${page.numPerPage eq 20}">selected="selected"</c:if>>20</option>
			<option value="50" <c:if test="${page.numPerPage eq 50}">selected="selected"</c:if>>50</option>
			<option value="100" <c:if test="${page.numPerPage eq 100}">selected="selected"</c:if>>100</option>
			<option value="200" <c:if test="${page.numPerPage eq 200}">selected="selected"</c:if>>200</option>
		</select>
		<span>条，共${page.totalCount}条,每页显示${page.numPerPage}条</span></div>
	</div>
	<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.pageNum}"></div>
</div>