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
		action="/deputysection/addOrUpdateDeputysection?operation=${operation }"
		method="post" class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<c:if test="${operation == 'upt'}">
			<input type="hidden" name="id" value="${deputysection.id }" />
			<input type="hidden" name="sectiontype.id"
				value="${deputysection.sectiontype.id }" />
			<input type="hidden" name="url" value="${deputysection.url }" />
			<input type="hidden" name="orderNum" value="${id }" />

			<textarea style="display: none;" name="pageHtml">${deputysection.pageHtml}</textarea>

			<input type="hidden" name="isfixed" value="${deputysection.isfixed }" />
		</c:if>
		<c:if test="${operation == 'add'}">
			<input type="hidden" name="id" value="0" />
		</c:if>
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>栏目名称：</label> <input type="text" class="required textInput"
					id="name" name="name" value="${deputysection.name }">
			</p>
			<p>
				<label>是否显示：</label>
				<c:if test="${deputysection.isShow == '1'}">
					<input type="checkbox" name="isShow" checked="checked" value="1">
				</c:if>
				<c:if test="${deputysection.isShow != '1'}">
					<input type="checkbox" name="isShow" value="1">
				</c:if>
			</p>
			<p>
				<label>是否显示在推荐区：</label>
				<c:if test="${deputysection.isRecommend == '1'}">
					<input id="isRecommend" type="checkbox" readonly="readonly"
						name="isRecommend" checked="checked" value="1"
						<c:if test="${deputysection.sectiontype.id != '2'}">disabled="disabled"</c:if>>
				</c:if>
				<c:if test="${deputysection.isRecommend != '1'}">
					<input id="isRecommend" type="checkbox" readonly="readonly"
						name="isRecommend" value="1"
						<c:if test="${deputysection.sectiontype.id != '2'}">disabled="disabled"</c:if>>
				</c:if>
			</p>
			<p>
				<label>是否显示在页脚：</label>
				<c:if test="${deputysection.isfooter == '1'}">
					<input id="isfooter" type="checkbox" readonly="readonly"
						name="isfooter" checked="checked" value="1">
				</c:if>
				<c:if test="${deputysection.isfooter != '1'}">
					<input id="isfooter" type="checkbox" readonly="readonly"
						name="isfooter" value="1">
				</c:if>
			</p>
			<p>
				<label>网页标题：</label> <input type="text" name="pageTitile"
					value="${deputysection.pageTitile }">
			</p>
			<p>
				<label>栏目类型：</label> <select id="sectiontype" name="sectiontype.id"
					style="width: 135px;" onchange="enable();"
					<c:if test="${operation == 'upt'}">disabled="disabled"</c:if>>
					<c:choose>
						<c:when test="${deputysection.sectiontype.id == 1 }">
							<option value="1" selected="selected">单页</option>
							<option value="2">列表</option>
						</c:when>
						<c:when test="${deputysection.sectiontype.id == 2 }">
							<option value="1">单页</option>
							<option value="2" selected="selected">列表</option>
						</c:when>
						<c:otherwise>
							<option value="1">单页</option>
							<option value="2">列表</option>
						</c:otherwise>
					</c:choose>
				</select>
			</p>
			<p>
				<label>所属一级栏目：</label> <select name="topic.id" style="width: 135px;">
					<c:forEach items="${topics}" var="t">
						<c:if test="${operation == 'upt'}">
							<option
								<c:if test="${t.id eq topicId}">selected="selected"</c:if>
								value="${t.id}">${t.name}</option>
						</c:if>
						<c:if test="${operation == 'add'}">
							<option value="${t.id}">${t.name}</option>
						</c:if>
					</c:forEach>
				</select>
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