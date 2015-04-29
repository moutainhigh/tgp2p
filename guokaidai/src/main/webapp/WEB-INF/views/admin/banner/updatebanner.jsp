<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type="text"]{top:0;width:190px}
input[type="file"]{top:0; width:190px}
textarea{top:0; height:70px; width:190px}
</style>

<div class="pageContent">
	<form method="post" action="/banner/updatebanner" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<input type="hidden" name="id"  value="${banner.id}"/>
				<label>图片名称：</label>
				<input type="text" name="picturename"   minlength="2" maxlength="50" class="required textInput" alt="请输入图片名称" value="${banner.picturename}"/>
			</div>
			<div class="unit">
				<label>图片上传：</label>
				<input type="file" name="fileurl" <c:if test="${empty banner.imgurl}">class="required"</c:if> value="${banner.imgurl}"/>
				<input type="hidden" name="imgurl" value="${banner.imgurl}"/>
				<input type="hidden" name="number" value="${banner.number}"/>
			</div>
			<div class="unit">
				<label>链接地址：</label>
				<input type="text" name="url"   alt="请输入链接名" value="${banner.url}"/>
			</div>
			<div class="unit">
				<label>所属位置：</label>
				<input type="radio" name="type" value="1" <c:if test="${banner.type eq 1 || empty banner.type}">checked="checked"</c:if>/>首页
<%-- 				<input type="radio" name="type" value="2" <c:if test="${banner.type eq 2}">checked="checked"</c:if>/>我要投资 --%>
				<input type="radio" name="type" value="3" <c:if test="${banner.type eq 3}">checked="checked"</c:if>/>我要借款
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>