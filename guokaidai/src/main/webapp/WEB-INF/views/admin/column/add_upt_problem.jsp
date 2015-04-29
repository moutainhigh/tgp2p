<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.div_01 {
	width: 100%;
	float: left;
	margin-top: 20px;
}

.left {
	width: 110px;
	text-align: right;
	float: left;
}

.right {
	width: 150px;
	text-align: left;
	float: left;
}
</style>
<div class="pageContent">
	<form
		action="/commonproblem/addOrUpdateProblem?operation=${operation }"
		method="post" class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<c:if test="${operation == 'upt'}">
			<input type="hidden" name="id" value="${problem.id }" />
		</c:if>
		<c:if test="${operation == 'add'}">
			<input type="hidden" name="id" value="0" />
		</c:if>
		<div class="pageFormContent" layoutH="56">
			<p style="margin-bottom: 10px;">
				<label>问题类型：</label> 
				<input type="radio" name="type" value="0" checked="checked" <c:if test="${problem.type == 0 }">checked="checked"</c:if>/>借款问题
				<input type="radio" name="type" value="1"<c:if test="${problem.type == 1 }">checked="checked"</c:if>>投资问题
				<input type="radio" name="type" value="2"<c:if test="${problem.type == 2 }">checked="checked"</c:if>>平台运营问题
			</p>
			<p style="margin-bottom: 35px;">
				<label>问题标题：</label>
				<textarea rows="3" cols="30" name="title">${problem.title }</textarea>
			</p>
			<p style="margin-bottom: 60px;">
				<label>回复内容：</label>
				<textarea rows="5" cols="30" name="replyContent">${problem.replyContent }</textarea>
			</p>
			<p>
				<label>是否显示：</label>
				<input type="radio" name="isShow" value="1" checked="checked"<c:if test="${problem.isShow == 1 }">checked="checked"</c:if>>是
				<input type="radio" name="isShow" value="0"<c:if test="${problem.isShow == 0 }">checked="checked"</c:if>>否
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
<script>
	//启用/禁用“是否显示在推荐区”的复选框
	function enable() {
		if (document.getElementById("sectiontype").value == 2) {
			document.getElementById("isRecommend").disabled = false;
		} else {
			document.getElementById("isRecommend").disabled = true;
			document.getElementById("isRecommend").checked = false;
		}
	}
</script>