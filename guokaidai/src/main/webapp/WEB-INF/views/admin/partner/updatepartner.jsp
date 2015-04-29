<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type="text"]{top:0;width:190px}
input[type="file"]{top:0; width:190px}
.activityProfile{top:0; height:70px; width:390px}
</style>

<div class="pageContent">
	<form method="post" action="/partners/update_partner" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<input type="hidden" name="id"  value="${partner.id}"/>
				<label>附件备注：</label>
				<input type="text" name="remark"   minlength="1" maxlength="10" class="required textInput" alt="请输入附件备注" value="${partner.remark}"/>
			</div>
			<div class="unit">
				<label>是否显示：</label>
				<label><input type="radio" name="isShow" value="1" <c:if test="${partner.isShow eq 1 || empty partner.isShow}">checked="checked"</c:if>/>显示</label> 
				<label><input type="radio" name="isShow" value="0" <c:if test="${partner.isShow eq 0}">checked="checked"</c:if>/>不显示</label>
			</div>
			<div class="unit">
				<label>上传图片：</label>
				<input type="file" name="fileurl" <c:if test="${empty partner.imgUrl}">class="required"</c:if>/>
				<input type="hidden" name="imgUrl" value="${partner.imgUrl}"/>
			</div>
			<div class="unit">
				<label>链接地址：</label>
				<input type="text" name="url"  maxlength="100" class="required textInput" alt="请输入链接地址" value="${partner.url}"/>
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