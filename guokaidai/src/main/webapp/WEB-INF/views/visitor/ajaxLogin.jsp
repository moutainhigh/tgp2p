<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form id="df_login" action="/registration/login" method="post">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>用户名：</td>
			<td><input name="userName" value="${userName}" class="login_ipt validate[required,minSize[5],maxSize[20]]" type="text" /></td>
		</tr>
		<tr>
			<td>密 码：</td>
			<td><input name="pwd" class="login_ipt validate[required,maxSize[12],minSize[6]]" type="password" /></td>
		</tr>
		<tr>
			<td>验证码：</td>
			<td><input name="captcha" class="loginText validate[required,maxSize[4],minSize[4]]" type="text"
				style="width: 60px;" /><img src="cic/code?name=user_login"
				onclick="this.src='cic/code?name=user_login&id='+new Date();"
				title="看不清，点击换一张"
				style="vertical-align: middle; display: inline-block; margin-left: 5px; width: 65px; height: 25px" /></td>
		</tr>
	</table>
	<input name="LoginBnt" type="submit" value="登 录" class="LoginBnt" /> <span
		style="margin-left: 37px; margin-top: 10px; display: block;"><img
		src="resources/images/default_07.jpg" /></span>
	<p
		style="padding-left: 37px; margin-top: 10px; padding-right: 25px; line-height: 20px; color: #8e8f90;">四川志合四海财富管理咨询服务有限公司打造的网络投资平台。</p>
</form>