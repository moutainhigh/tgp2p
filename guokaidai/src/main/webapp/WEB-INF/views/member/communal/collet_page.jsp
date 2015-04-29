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
			<a href="/collectlist/collect?pageNum=1">首页</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.pageNum eq 1}">
			<span>上一页</span>
		</c:when>
		<c:otherwise>
			<a href="/collectlist/collect?pageNum=${page.pageNum-1}">上一页</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.pageNum < page.totalPage}">
			<a href="/collectlist/collect?pageNum=${page.pageNum+1}">下一页</a>
		</c:when>
		<c:otherwise>
			<span>下一页</span>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.pageNum ne page.totalPage}">
			<a href="/collectlist/collect?pageNum=${page.totalPage}">尾页</a>
		</c:when>
		<c:otherwise>
			<span>尾页</span>
		</c:otherwise>
	</c:choose>
	跳转<input type="text" class="tabPageJumpTx" name="pageNum" id="pageNum"/>
	   <input type="button" value="确定" class="tabPageJumpBnt" onclick="jumpPage();"/>
</div>
<script type="text/javascript">
		function jumpPage(){
			var re=/^[0-9]*[1-9][0-9]*$/;
			var pageNum=+$("#pageNum").val();
			if(!re.test(pageNum)){
				ymPrompt.errorInfo('请输入大于0的整数!', 220, 160, '警告', null);
				return;
			}
			window.location.href='/collectlist/collect?pageNum='+pageNum;
		}
		
		function deleteCollect(id){
			ymPrompt.confirmInfo('确定删除？', 220, 160, '是否删除', function(tp) {
				if(tp == 'ok'){
					window.location.href="/collectlist/deleteCollect?id="+id;
				}
			});
		}
</script>