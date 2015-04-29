<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
	<form action="/role/edit" method="post"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
		<c:choose>
			<c:when  test="${pageName == 'edit_role'}">
				<input type="hidden" name="id" value="${updateroleinfo.id }">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="id" value="${updateroleinfo.id }">
				<input type="hidden" name="createTime" value="${updateroleinfo.createTime }">
				<input type="hidden" name="createUser" value="${updateroleinfo.createUser }">
		</c:otherwise>
		</c:choose>


			<p>
				<label>角色名称：</label>
				<input name="roleName" value="${updateroleinfo.roleName }" class="required textInput" type="text"  alt="请输入角色名称"/>
			</p>
			<p>
				<label>角色备注：</label>
				<textarea rows="5"  cols="27" name="roleRemark" class="textInput" maxlength="80">${updateroleinfo.roleRemark }</textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>