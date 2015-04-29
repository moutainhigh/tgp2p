<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type="text"]{top:0;width:190px}
input[type="file"]{top:0; width:190px}
</style>
<script>

</script>
<div class="pageContent">
	<form action="/manual/add_upt_manual?operation=${operation }" method="post"
		class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<c:if test="${operation == 'upt'}">
				<input type="hidden" name="id" value="${manual.id }" />
			</c:if>
			<c:if test="${operation == 'add'}">
				<input type="hidden" name="id" value="0" />
			</c:if>
			
			<p>
				<label>是否显示：</label>
				<c:if test="${manual.isShow == '1'}">
					<input type="checkbox" name="isShow" checked="checked" value="1">
				</c:if>
				<c:if test="${manual.isShow != '1'}">
					<input type="checkbox" name="isShow" value="1">
				</c:if>
			</p>
			<p>
				<label>标题：</label> <input type="text" name="title"
					value="${manual.title }">
			</p>
			<div class="unit" id="unit">
				<label>说明图片上传：</label>
				<input type="file" name="imgExplain1" <c:if test="${empty manual.imgExplain}">class="required"</c:if> value="${manual.imgExplain}"/>
				<input type="hidden" name="imgExplain" value="${manual.imgExplain}"/>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit" onclick="sumbmitSave()">保存</button>
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
