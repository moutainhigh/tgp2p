<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pageContent">
	<form action="/topic/add_upt_topic?operation=${operation }" method="post"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<c:if test="${operation == 'upt'}">
				<input type="hidden" name="id" value="${topic.id }" />
				<input type="hidden" name="orderNum" value="${topic.orderNum }" />
				<input type="hidden" name="url" value="${topic.url }" />
			</c:if>
			<c:if test="${operation == 'add'}">
				<input type="hidden" name="id" value="0" />
			</c:if>
			<p>
				<label>栏目名称：</label> <input type="text" class="required textInput"
					name="name" value="${topic.name }">
			</p>
			<p>
				<label>英文名称：</label> <input type="text" name="engName"
					value="${topic.engName }">
			</p>
			<p>
				<label>网页标题：</label> <input type="text" name="pageTitle"
					value="${topic.pageTitle }">
			</p>
			<p>
				<label>是否显示：</label>
				<c:if test="${topic.isShow == '1'}">
					<input type="checkbox" name="isShow" checked="checked" value="1">
				</c:if>
				<c:if test="${topic.isShow != '1'}">
					<input type="checkbox" name="isShow" value="1">
				</c:if>
			</p>
			<p>
				<label>是否显示在页脚：</label>
				<c:if test="${topic.isfooter == '1'}">
					<input type="checkbox" name="isfooter" checked="checked" value="1">
				</c:if>
				<c:if test="${topic.isfooter != '1'}">
					<input type="checkbox" name="isfooter" value="1">
				</c:if>
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