<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
	$(function($){
		  $('#combo1').omCombo({
			  editable : false,
			  forceSelction : true,
			  emptyText:'请选择角色',
              dataSource : 'role/querycom',
              onSuccess:function(data, textStatus, event){
			    if(data.length==0){
				    alertMsg.info("没有角色信息，请先添加角色");
			    }else{
					var value=$("#combo1").attr("valstr");
					if(value){
						$('#combo1').omCombo('value',value);
					}
			    } 
			}
          });
	});
//-->
</script>
<div class="pageContent">
	<form action="<%=basePath %>adminuser/edit" method="post"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="70">
			<input type="hidden" name="id" value="${updateuser.id }">
			<p>
				<label>用户名：</label>
				<input name="username" value="${updateuser.username }"  class="required" type="text" size="30" maxlength="20" minlength="5" alt="请输入用户名"/>
			</p>
			<p>
				<label>真实姓名：</label>
				<input name="realname" value="${updateuser.realname }"  class="required" type="text" size="30" maxlength="4" alt="请输入真实姓名"/>
			</p>
			<p <c:if test="${!empty updateuser}">style="display: none;"</c:if> >
				<label>密码：</label>
				<input <c:if test="${!empty updateuser}">disabled="disabled"</c:if> name="password" id="v_password" value="${updateuser.password }"  class="required" type="password" size="30" minlength="6" maxlength="15"/>
			</p>
			<p <c:if test="${!empty updateuser}">style="display: none;"</c:if>>
				<label>确认密码：</label>
				<input <c:if test="${!empty updateuser}">disabled="disabled"</c:if>  equalto="#v_password" value=""  class="required" type="password" size="30" minlength="6" maxlength="15"/>
			</p>
			<p>
				<label>联系电话：</label>
				<input name="phone" value="${updateuser.phone }"  class=" phone required" type="text" size="30" maxlength="30" alt="请输入联系电话"/>
			</p>
			<p>
				<label>年龄：</label>
				<input name="age" value="${updateuser.age }"  class="required" type="text" size="30" maxlength="30" alt="请输入年龄"/>
			</p>
			<p>
				<label>邮箱：</label>
				<input name="email" value="${updateuser.email }"   class="required email" type="text" size="30" maxlength="30" alt="请输入邮箱地址"/>
			</p>
			<p>
				<label>性别：</label>
				<input  <c:if test="${updateuser.sex!=0 ||empty updateuser }">checked="checked" </c:if> type="radio" name="sex" value="1"  > 男
				<input <c:if test="${updateuser.sex!=1 }">checked="checked"</c:if> type="radio" name="sex" value="0" > 女
			</p>
			<p>
				<label>是否启用：</label>
				<input <c:if test="${empty updateuser || updateuser.status!=0 }">checked="checked"</c:if> type="radio" name="status" value="1" > 启用
				<input <c:if test="${updateuser.status!=1 }">checked="checked"</c:if> type="radio" name="status" value="0" > 禁用
			</p>
			<p>
				<label>居住地址：</label>
				<input name="address" value="${updateuser.address }"   class="required" type="text" size="30" maxlength="30" alt="请输入居住地址"/>
			</p>
			<p>
				<label>角色名称:</label>
				<input id="combo1" name="role.id" valstr="${updateuser.role.id }" style="width:70px;" class="required" />
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>