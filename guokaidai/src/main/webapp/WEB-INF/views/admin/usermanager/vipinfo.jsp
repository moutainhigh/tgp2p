
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/js/usermanager/customer.js"></script>

<form method="post" action="<%=basePath%>userinfo/update_vip"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent" layoutH="50">
			<fieldset>
				<legend>修改会员等级</legend>
				<dl>
					<dt>用户名：</dt>
					<dd>
						<input name="userName" value="${vusername }" readonly="readonly">
						<input type="hidden" name="uid" value="${vid}" />
					</dd>
				</dl>
				<dl>
					<dt>会员等级：</dt>
					<dd>
						<c:if test="${!empty vipendTime }">
							<input name="isvip" value="特权会员" readonly="readonly">
						</c:if>
						<c:if test="${empty vipendTime }">
							<input name="isvip" value="普通会员" readonly="readonly">
						</c:if>
					</dd>
				</dl>
				<dl>
					<dt>到期时间：</dt>
					<dd>
						<c:if test="${!empty vipendTime }">
							<input name="endTime" value="${vipendTime}" readonly="readonly">
						</c:if>
						<c:if test="${empty vipendTime }">
							<input name="endTime" value="永久" readonly="readonly">
						</c:if>
						
					</dd>
				</dl>
				<dl>
					<dt>会员期限：</dt>
					<dd>
						<input name="vipTime" id="vipTime" type="text" class="required" style="width: 85px;">
					</dd>
				</dl>
			</fieldset>
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
	</div>
</form>