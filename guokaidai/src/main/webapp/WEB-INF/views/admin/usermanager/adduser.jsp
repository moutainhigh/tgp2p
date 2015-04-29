<%--    
创建时间：2014年2月18日下午1:59:36   
创 建 人：LiNing   
相关说明：   新增会员
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" action="<%=basePath %>userinfo/add_user"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent">
			<dl>
				<dt>用户名：</dt>
				<dd>
					<input name="userName" remote="/userinfo/check_name" minlength="5" type="text" class="required">
				</dd>
			</dl>
			<dl>
				<dt>密码：</dt>
				<dd>
					<input name="password" type="password" minlength="6" maxlength="12" class="required" />
				</dd>
			</dl>
			<dl>
				<dt>邮箱地址：</dt>
				<dd>
					<input type="text" remote="/registration/checkOnly_email" name="email" class="required email" />
				</dd>
			</dl>
			<dl>
				<dt>手机号码：</dt>
				<dd>
					<input type="text" name="phone" class="required phone" />
				</dd>
			</dl>
			<dl>
				<dt>身份证号码：</dt>
				<dd>
					<input type="text" name="cardId" class="required" />
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