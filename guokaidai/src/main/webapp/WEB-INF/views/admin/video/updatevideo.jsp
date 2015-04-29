<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type="text"]{top:0; height:20px; width:190px}
input[type="file"]{top:0; height:20px; width:190px}
textarea{top:0; height:70px; width:190px}
</style>

<div class="pageContent">
	<form method="post" enctype="multipart/form-data" action="/videobroadcast/updatevideo" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<input type="hidden" name="id"  value="${video.id}"/>
				<label>视频标题：</label>
				<input type="text" name="title"   minlength="2" maxlength="20" class="required textInput" alt="请输入视频标题" value="${video.title}"/>
			</div>
			<div class="unit">
				<label>视频地址：</label>
				<input type="text" name="url" minlength="2" maxlength="20" value="${video.url}"/>
			</div>
			<div class="unit">
				<label>图片地址：</label>
				<input type="hidden" name="filePath" value="${video.filePath}"/>
				<input type="file" name="imgurl" <c:if test="${empty video.filePath}">class="required"</c:if>/>
			</div>
			<div class="unit">
				<label>是否显示：</label>
				<label><input type="radio" name="isShow" value="1" <c:if test="${empty video}">checked="checked"</c:if> <c:if test="${video.isShow eq 1 }">checked="checked"</c:if>/>显示</label>
				<label><input type="radio" name="isShow" value="0" <c:if test="${video.isShow eq 0}">checked="checked"</c:if>/>不显示</label>
			</div>
			<div class="unit">
				<label>显示顺序：</label>
				<input type="text" name="num"  value="${video.showNum}"/>
			</div>
			<div class="unit">
				<label>视频备注：</label>
				<textarea rows="5"   maxlength="100" name="remark">${video.remark}</textarea>
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