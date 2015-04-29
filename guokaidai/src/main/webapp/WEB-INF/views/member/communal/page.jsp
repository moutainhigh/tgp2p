<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/page.css" rel="stylesheet"  type="text/css" />

<div class="pag_div">
	<c:set var="startNo" value="1" />
	<c:if test="${page.totalPage>=10}">
		<c:if test="${page.pageNum<=2}">
			<c:set var="startNo" value="1" />
		</c:if>
		<c:if test="${page.pageNum>2 && page.pageNum<page.totalPage-5}">
			<c:set var="startNo" value="${page.pageNum-2}" />
		</c:if>
		<c:if test="${page.pageNum>2 && page.pageNum>=page.totalPage-5}">
			<c:set var="startNo" value="${page.totalPage-6}" />
		</c:if>
	</c:if>
	<ul class="pag_ul" style="float:right">
		<!--小于10页全部页码都显示  -->
		<c:if test="${page.totalPage<10}">
			<li><a href="javascript:"
				onclick="<c:if test="${page.pageNum!=1}">jumpPage(1,${page.totalPage})</c:if>"
				class="pag_s">首页</a></li>
			<li><a href="javascript:" onclick="jumpPage(${page.pageNum-1 },${page.totalPage})"
				class="pag_s">上一页</a></li>
			<c:forEach var="no" begin="1" end="${page.totalPage}" varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
					class="<c:if test="${page.pageNum==no}">pag_s_1</c:if><c:if test="${page.pageNum!=no}">pag_s</c:if>">${no}</a></li>
			</c:forEach>
		</c:if>
		<!--大于10页根据当前页显示附近页码  -->
		<c:if test="${page.totalPage>=10}">
			<li><a href="javascript:"
				onclick="<c:if test="${page.pageNum!=1}">jumpPage(1,${page.totalPage})</c:if>"
				class="pag_s">首页</a></li>
			<li><a href="javascript:" onclick="jumpPage(${page.pageNum-1 },${page.totalPage})"
				class="pag_s">上一页</a></li>
			<c:forEach var="no" begin="${startNo}" end="${startNo+3}"
				varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no},${page.totalPage})</c:if>"
					class="<c:if test="${page.pageNum==no}">pag_s_1</c:if><c:if test="${page.pageNum!=no}">pag_s</c:if>">${no}</a></li>
			</c:forEach>
			<c:if test="${page.pageNum+2<page.totalPage-3}">
				<li>...</li>
			</c:if>
			<c:forEach var="no" begin="${page.totalPage-2}"
				end="${page.totalPage}" varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
					class="<c:if test="${page.pageNum==no}">pag_s_1</c:if><c:if test="${page.pageNum!=no}">pag_s</c:if>">${no}</a></li>
			</c:forEach>
		</c:if>
		<li><a href="javascript:" onclick="jumpPage(${page.pageNum+1 },${page.totalPage})"
			class="pag_s">下一页</a></li>
			<li><a href="javascript:"
				onclick="<c:if test="${page.pageNum!= page.totalPage}">jumpPage(${page.totalPage},${page.totalPage})</c:if>"
				class="pag_s">末页</a></li>
<%-- 		<li>&nbsp;共&nbsp;${page.pageNum}/${page.totalPage}&nbsp;页&nbsp;/&nbsp;共查询到&nbsp;${page.totalCount}&nbsp;条记录</li> --%>
	</ul>
</div>
<!-- <script type="text/javascript"> -->
<!-- // 		function jumpPage(pageno){ -->
<%-- // 			if(pageno<=0 || pageno>${page.totalPage}){ --%>
<!-- // 				return; -->
<!-- // 			} -->
<!-- // 			$.ajax({ -->
<!-- // 				type:'post', -->
<!-- // 				url:'/member_index/system_message', -->
<!-- // 				data:'pageNum='+pageno, -->
<!-- // 				success:function(msg){ -->
<!-- // 					window.location.href='/member_index/system_message?pageNum='+pageno; -->
<!-- // 				} -->
<!-- // 			}); -->
<!-- // 		} -->
</script>
