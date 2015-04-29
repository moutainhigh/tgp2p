<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type="text"]{top:0;width:190px}
input[type="file"]{top:0; width:190px}
textarea{top:0; height:70px; width:190px}
</style>

<div class="pageContent">
	<form method="post" action="/link/updatelink" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<input type="hidden" name="id"  value="${link.id}"/>
				<label>链接名：</label>
				<input type="text" name="name"   minlength="2" maxlength="50" class="required textInput" alt="请输入连接名" value="${link.name}"/>
			</div>
			<div class="unit">
				<label>链接地址：</label>
				<input type="text" name="url"   minlength="2" maxlength="100" class="required url" alt="请输入链接地址" value="${link.url}"/>
			</div>
			<div class="unit">
				<label>链接备注：</label>
				<textarea rows="5"   maxlength="100" name="remark">${link.remark}</textarea>
			</div>
			<div class="unit">
				<label>是否显示：</label>
				<label><input type="radio" name="isShow" value="1" <c:if test="${link.isShow eq 1 }">checked="checked"</c:if>checked="checked"/>显示</label>
				<label><input type="radio" name="isShow" value="0" <c:if test="${link.isShow eq 0}">checked="checked"</c:if>/>不显示</label>
			</div>
			<div class="unit">
				<label>显示类型：</label>
				<label><input id="radio1" type="radio" name="type" value="1" checked="checked"/>友情链接</label>
				<%--<label><input id="radio1" type="radio" name="type" value="0" <c:if test="${link.type eq 1 }">checked="checked"</c:if>checked="checked" onclick="click_radio1();"/>友情链接</label>
				<label><input id="radio2" type="radio" name="type" value="1" <c:if test="${link.type eq 1}">checked="checked"</c:if> onclick="click_radio2();"/>网址认证</label>--%>
			</div>
			<div class="unit" id="uploadimg">
				<label>图片上传：</label>
				<input id="file" type="file" name="fileurl" value="${link.verifyImg}"/>
				<input type="hidden" name="imgurl" value="${link.verifyImg}"/>
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

<script>
function click_radio1(){
	$("#uploadimg").hide();
}
function click_radio2(){
	$("#uploadimg").show();
	$("#file").attr("class","required");
}
</script>