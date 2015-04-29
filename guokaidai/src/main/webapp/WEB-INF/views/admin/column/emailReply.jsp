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
		action="/feedback/reply"
		method="post" class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<input type="hidden" name="fid" value="${feedbackinfo.id }">
		<div class="pageFormContent" layoutH="56">
			<div style="float: left;margin-top: 20px;">
				<div style="float: left;margin-left: 45px;margin-right: 20px;">反馈内容：</div>
				<div style="float: left;"><textarea rows="5" cols="50" readonly="readonly">${feedbackinfo.context }</textarea></div>
			</div>
			<div style="float: left;margin-top: 20px;">
				<div style="float: left;margin-left: 45px;margin-right: 20px;">回复内容：</div>
				<div style="float: left;"><textarea rows="5" cols="50" name="replyContext"></textarea></div>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">提交</button>
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