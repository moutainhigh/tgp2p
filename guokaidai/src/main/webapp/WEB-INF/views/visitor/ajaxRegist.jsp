<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<form id="df_rigster" action="/registration/registration_1_htm"
	method="post">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="userName" value="${userName}"
				class="login_ipt validate[required,minSize[5],maxSize[20],custom[onlyLetterNumber],ajax[ajaxNameCall]]" /><br />
			</td>
		</tr>
		<tr>
			<td>邮件：</td>
			<td><input type="text" name="email" value="${email}"
				class="login_ipt validate[required,minSize[5],maxSize[20],custom[email],ajax[ajaxEmailCall]]" /><br />
			</td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" id="password" name="pwd"
				class="login_ipt validate[required,maxSize[12],minSize[6]]，" /><br />
			</td>
		</tr>
		<tr>
			<td>确认密码：</td>
			<td><input type="password"
				class="login_ipt validate[required,maxSize[12],equals[password],minSize[6]]" /><br />
			</td>
		</tr>
		<tr>
			<td>验证码：</td>
			<td><input name="captcha"
				class="login_ipt validate[required,maxSize[4],minSize[4]]"
				type="text" style="width: 60px;" /><img
				src="cic/code?name=registration"
				onclick="this.src='cic/code?name=registration&id='+new Date();"
				title="看不清，点击换一张"
				style="vertical-align: middle; display: inline-block; margin-left: 5px; width: 65px; height: 25px" /></td>
		</tr>
		<tr><td>服务人员：</td><td><input type="text" name="number" class="loginText"/></td></tr>
	</table>
	<input name="RisBnt" type="submit" value="免费注册" id="user_rigster" class="RisBnt" />
</form>