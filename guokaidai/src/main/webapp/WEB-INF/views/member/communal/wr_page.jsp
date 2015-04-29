<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="tablePage">
	<span>共${page.totalCount}条${page.totalPage}页</span>
	<span>当前第${page.pageNum}页</span>
	<c:choose>
		<c:when test="${page.pageNum eq 1}">
			<span>首页</span>
		</c:when>
		<c:otherwise>
			<a href="javascript:jumpPage(1);">首页</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.pageNum eq 1}">
			<span>上一页</span>
		</c:when>
		<c:otherwise>
			<a href="javascript:jumpPage(${page.pageNum-1});">上一页</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.pageNum < page.totalPage}">
			<a href="javascript:jumpPage(${page.pageNum+1});">下一页</a>
		</c:when>
		<c:otherwise>
			<span>下一页</span>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.pageNum ne page.totalPage}">
			<a href="javascript:jumpPage(${page.totalPage});">尾页</a>
		</c:when>
		<c:otherwise>
			<span>尾页</span>
		</c:otherwise>
	</c:choose>
	跳转<input type="text" class="tabPageJumpTx" name="pageNum" id="pageNum"/>
	   <input type="button" value="确定" class="tabPageJumpBnt" onclick="jumpPage2();"/>
</div>