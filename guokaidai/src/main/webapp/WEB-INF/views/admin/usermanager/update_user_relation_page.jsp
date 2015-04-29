<%--    
创建时间：2014年1月27日下午2:01:33   
创 建 人：LiNing   
相关说明：   修改会员信息页面
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" action="<%=basePath %>userinfo/update_user"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent">
			<dl>
				<dt>用户名：</dt>
				<dd>
					<input readonly="readonly" name="userName" value="${baseinfo.userName}" type="text">
					<input type="hidden" name="ids" value="${ baseinfo.id}" />
				</dd>
			</dl>
			<dl>
				<dt>注册时间：</dt>
				<dd>
					<input readonly="readonly" name="createTime" value="${baseinfo.createTime}"
						type="text" />
				</dd>
			</dl>
			<dl>
				<dt>邮箱地址：</dt>
				<dd>
					<input type="text" name="email" value="${relation.email}" class="required email" />
				</dd>
			</dl>
			<dl>
				<dt>真实姓名：</dt>
				<dd>
					<input type="text" name="name" value="${baseinfo.name}" class="required" />
				</dd>
			</dl>
			<dl>
				<dt>身份证号码：</dt>
				<dd>
					<input type="text" name="cardId" value="${relation.cardId}" minlength="18" maxlength="18" class="required number" />
				</dd>
			</dl>
			<dl>
				<dt>昵称：</dt>
				<dd>
					<input type="text" name="nickname" value="${baseinfo.nickname}" class="required" />
				</dd>
			</dl>
			<dl>
				<dt>手机号码：</dt>
				<dd>
					<input type="text" name="phone" value="${relation.phone}" class="required phone" />
				</dd>
			</dl>
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
