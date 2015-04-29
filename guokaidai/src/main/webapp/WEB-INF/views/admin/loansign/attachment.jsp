<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageContent">
	<form method="post" action="/attachment/uploadAttchment" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<input type="hidden" name="loansign.id"  value="${id}"/>
				<input type="hidden" name="id" value="${type}"> 
			</div>
			<div class="unit">
				<label>图片上传：</label>
				<input type="file" name="fileurl"  value=""/>
			</div>
			<div class="unit">
				<label>所属位置：</label>
				<input type="radio" name="attachmentType" value="1" checked="checked"/>标图
				<input type="radio" name="attachmentType" value="2" />借款方资料
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