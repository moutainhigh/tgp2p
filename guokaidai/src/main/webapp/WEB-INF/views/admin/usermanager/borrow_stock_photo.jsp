<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="width: 100%;border: 1px #F9EAC8 solid;height: 82px;">
<c:forEach items="${list}" var="photo"><img style="margin: 0px 10px 0px 10px;" src="${photo[0]}" width="80px" height="80px;"/></c:forEach>
</div>
<table class="table" width="40%" layoutH="70" style="margin-top: 10px;">
	<thead>
		<tr>
			<th width="50%">文件名</th>
			<th width="50%">上传时间</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="photo">
		<tr style="cursor: pointer;height: 20px;">
			<td align="center">${photo[1]}</td>
			<td align="center">${photo[2]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
