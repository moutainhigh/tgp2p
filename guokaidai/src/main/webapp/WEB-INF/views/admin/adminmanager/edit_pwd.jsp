<%--    
创建时间：2014年3月18日上午8:39:35   
创 建 人：LiNing   
相关说明：   修改后台用户密码
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="<%=basePath %>adminuser/update_pwd" class="pageForm" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>原密码：</label>
				<input type="password" name="oldstr" value="" size="15" class="required"/>
			</div>
			<div class="unit">
				<label>新密码：</label>
				<input type="password" name="newpwd" id="newpwd" size="30" minlength="6" maxlength="15" class="required"/>
			</div>
			<div class="unit">
				<label>确认密码：</label>
				<input class="required" equalto="#newpwd" type="password" size="30" />
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
	
</div>

