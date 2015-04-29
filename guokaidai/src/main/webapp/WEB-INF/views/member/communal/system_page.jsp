<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set value="1" var="startNo"/>
<c:if test="${page.totalPage > 10}">
		<c:if test="${page.pageNum <= 5}">
			<c:set var="startNo" value="1" />
		</c:if>
		<c:if test="${page.pageNum>4 && page.pageNum<page.totalPage-3}">
			<c:set var="startNo" value="${page.pageNum-3}" />
		</c:if>
		<c:if test="${page.pageNum>4 && page.pageNum>=page.totalPage-3}">
			<c:set var="startNo" value="${page.totalPage-6}" />
		</c:if>
</c:if>

<div class="tablePage">
	<span>共${page.totalPage}页</span>
	<c:choose>
		<c:when test="${page.pageNum eq 1 }">
			<span>第一页</span>
			<span>上一页</span>
		</c:when>
		<c:otherwise>
			<a href="/member_index/system_message?pageNum=1">第一页</a>
			<a href="/member_index/system_message?pageNum=${page.pageNum-1}">上一页</a>
		</c:otherwise>
	</c:choose>
	
	<!-- 小于10页全部显示 -->
	<c:if test="${page.totalPage <= 10}">
		<c:forEach begin="1" end="${page.totalPage }" var="no">
			<c:choose>
				<c:when test="${page.pageNum eq no}">
					<span class="tablePageLink">${no}</span>
				</c:when>
				<c:otherwise>
					<a href="/member_index/system_message?pageNum=${no}">${no}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>
	
	<!-- 大于10页全部显示 -->
	<c:if test="${page.totalPage > 10}">
		<c:forEach begin="${startNo}" end="${startNo+4}" var="no">
			<c:choose>
				<c:when test="${page.pageNum eq no}">
					<span class="tablePageLink">${no}</span>
				</c:when>
				<c:otherwise>
					<a href="/member_index/system_message?pageNum=${no}">${no}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.pageNum+3<page.totalPage}">...</c:if>
		<c:forEach begin="${page.totalPage-1}" end="${page.totalPage}" var="no">
			<c:choose>
				<c:when test="${page.pageNum eq no}">
					<span class="tablePageLink">${no}</span>
				</c:when>
				<c:otherwise>
					<a href="/member_index/system_message?pageNum=${no}">${no}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>
	
	<c:choose>
		<c:when test="${page.pageNum ne page.totalPage }">
			<a href="/member_index/system_message?pageNum=${page.pageNum+1}">下一页</a>
			<a href="/member_index/system_message?pageNum=${page.totalPage}">末页</a>
		</c:when>
		<c:otherwise>
			<span>下一页</span>
			<span>末页</span>
		</c:otherwise>
	</c:choose>
</div>