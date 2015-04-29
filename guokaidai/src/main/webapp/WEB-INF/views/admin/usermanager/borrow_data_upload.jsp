<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){
			if($(this).attr("checked")){
				$(".check").each(function(){
					$(this).attr("checked","true");
				});
			}else{
				$(".check").each(function(){
					$(this).removeAttr("checked");
				});
			}
		});
	});
	function download(id){
		window.location.href='/userinfo/download?id='+id;
	}
</script>
<table class="table" width="60%" layoutH="70">
	<thead>
		<tr>
			<th width="25%">文件名</th>
			<th width="25%">文件说明</th>
			<th width="20%">修改时间</th>
			<th width="20%">类型</th>
			<th width="5%">操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="upload">
		<tr style="cursor: pointer;height: 20px;" align="center">
			<td>${upload[0]}</td>
			<td>${upload[1]}</td>
			<td>${upload[2]}</td>
			<td>${upload[3]}</td>
			<td><a href="javascript:download(${upload[4]})">下载</a> </td>
		</tr>
	</c:forEach>
	</tbody>
</table>