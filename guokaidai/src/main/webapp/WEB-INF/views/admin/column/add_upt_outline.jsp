<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type="text"]{top:0;width:190px}
input[type="file"]{top:0; width:190px}
</style>

<div class="pageContent">
	<form action="/outline/add_upt_outline?operation=${operation }" method="post"
		class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<c:if test="${operation == 'upt'}">
				<input type="hidden" name="id" value="${outline.id }" />
			</c:if>
			<c:if test="${operation == 'add'}">
				<input type="hidden" name="id" value="0" />
			</c:if>
			<div class="unit">
				<label>图片上传：</label>
				<input type="file" name="fileurl" <c:if test="${empty outline.imgUrl}">class="required"</c:if> value="${outline.imgUrl}"/>
				<span style="color: red;">（提示：图片规格：110*110）</span>
				<input type="hidden" name="imgUrl" value="${outline.imgUrl}"/>
			</div>
			<p>
				<label>是否显示：</label>
				<c:if test="${outline.isShow == '1'}">
					<input type="checkbox" name="isShow" checked="checked" value="1">
				</c:if>
				<c:if test="${outline.isShow != '1'}">
					<input type="checkbox" name="isShow" value="1">
				</c:if>
			</p>
			<p>
					<label>内容编辑器：</label>
					<textarea class="editor" name="content" rows="13" cols="80"
					upImgUrl="/admincolum/uploadFile" upImgExt="jpg,jpeg,gif,png" >${outline.content }</textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>