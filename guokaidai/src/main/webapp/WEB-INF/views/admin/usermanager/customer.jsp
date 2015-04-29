<%--    
创建时间：2014年2月25日下午2:23:45   
创 建 人：LiNing   
相关说明：   后台会员分配客服页面
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
<script type="text/javascript" src="resources/js/usermanager/customer.js"></script>

<form method="post" action="<%=basePath %>userinfo/update_random"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
		<div class="pageFormContent" layoutH="50">
			<fieldset>
				<legend>分配服务人员</legend>
				<dl>
				<dt>用户名：</dt>
				<dd>
					<input name="userName" value="${username }" readonly="readonly">
					<input type="hidden" name="uid" value="${ids }" />
				</dd>
			</dl>
			<dl>
				<dt>服务人员：</dt>
				<dd>
					<input name="adminid" id="adminid" type="text" class="required">
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