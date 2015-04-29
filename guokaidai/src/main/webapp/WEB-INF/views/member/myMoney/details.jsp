<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="/resources/css/page.css" rel="stylesheet"  type="text/css" />

<table border="0" align="center" class="inves_jh" id="inves_jh" style="width:773px; margin-top:20px;" cellspacing="0" cellpadding="0">
     <tr height="37" style="color:#494343;">
       <td align="center" width="146">日期</td>
       <td align="center" width="136">类型</td>
       <td align="center" width="116">支出</td>
       <td align="center" width="116">收入</td>
       <td align="center" width="116">余额</td>
       <td align="center" width="140">说明</td>
    </tr>
    <c:forEach items="${list}" var="li">
      <tr height="30">
        <td align="center">${li[0]} </td>
        <td align="center">${li[1]}</td>
        <td align="center"><fmt:formatNumber value="${li[2]}" pattern="0.00"/> </td>
        <td align="center"><fmt:formatNumber value="${li[3]}" pattern="0.00"/></td>
        <td align="center"><fmt:formatNumber value="${li[4]}" pattern="0.00"/></td>
        <td align="center">${li[5]}</td>
      </tr>
    </c:forEach>
    <tr height="30">
    <td colspan="6">
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
		<ul class="pag_ul">
		<!--小于10页全部页码都显示  -->
		<c:if test="${page.totalPage<10}">
			<li><a href="javascript:" onclick="jumpPage(${page.pageNum-1 })"
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
				onclick="<c:if test="${page.pageNum!=1}">jumpPage(1)</c:if>"
				class="pag_s">首页</a></li>
			<li><a href="javascript:" onclick="jumpPage(${page.pageNum-1 })"
				class="pag_s">上一页</a></li>
			<c:forEach var="no" begin="${startNo}" end="${startNo+3}"
				varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
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
		<li><a href="javascript:" onclick="jumpPage(${page.pageNum+1 })"
			class="pag_s">下一页</a></li>
 		<li>&nbsp;共&nbsp;${page.pageNum}/${page.totalPage}&nbsp;页&nbsp;/&nbsp;共查询到&nbsp;${page.totalCount}&nbsp;条记录</li>
		</ul>
		</div>
		</td>
	</tr>
</table>
<script type="text/javascript">
function jumpPage(pageno){
	if(pageno<=0 || pageno>${page.totalPage}){
		return;
	}
	reload(pageno);
}
</script>