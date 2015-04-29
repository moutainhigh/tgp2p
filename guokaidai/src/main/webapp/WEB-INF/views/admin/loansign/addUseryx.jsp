<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
$.validator.addMethod(
  "idcard",
  function(value, element) {
    var idcheck = /^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)$/;
    return this.optional(element) || idcheck.test(value);
  }, "身份证格式不正确");
$.validator.addMethod(
  "phoneNum",
  function(value, element) {
    var idcheck = /^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
    return this.optional(element) || idcheck.test(value);
  }, "联系电话格式不正确");
function isTrueValidateCodeBy18IdCard(a_idCard) {   
	var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];    // 加权因子   
	var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];            // 身份证验证位值.10代表X 
    var sum = 0;                             // 声明加权求和变量   
    if (a_idCard[17].toLowerCase() == 'x') {   
        a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作   
    }   
    for ( var i = 0; i < 17; i++) {   
        sum += Wi[i] * a_idCard[i];            // 加权求和   
    }   
    valCodePosition = sum % 11;                // 得到验证码所位置   
    if (a_idCard[17] == ValideCode[valCodePosition]) {   
        return true;   
    } else {   
        return false;   
    }   
}
function check(){
	var idcheck = /^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)$/;
	if(idcheck.test($("input[name='cardId']").val())&&!isTrueValidateCodeBy18IdCard($("input[name='cardId']").val()+"")){
		alertMsg.error("不是真实的身份证号码！");
		$("input[name='cardId']").focus();
		return;
	}
	$("#form-saveUser").submit();
}
</script>
<style>
span.error{width:150px;left:315px;}
</style>
<div class="pageContent">
	<form id="form-saveUser" action="<%=basePath %>loanSign/saveUser" method="post"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="70">
			<input type="hidden" name="id" value="${updateuser.id }">
			<p>
				<label>用户名：</label>
				<input name="userName" value="${updateuser.username }"  class="required" type="text" size="30" maxlength="20" minlength="5" alt="请输入用户名"/>
			</p>
			<p>
				<label>真实姓名：</label>
				<input name="name" value="${updateuser.realname }"  class="required" type="text" size="30" maxlength="4" alt="请输入真实姓名"/>
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
				<label>身份证号：</label>
				<input name="cardId" value="${updateuser.cardId }"  class=" idcard required" type="text" size="30" maxlength="30" alt="请输入身份证号码"/>
			</p>
			<p>
				<label>邮箱：</label>
				<input name="email" value="${updateuser.email }"  class=" email required" type="text" size="30" maxlength="30" alt="请输入邮箱"/>
			</p>
			<p>
				<label>联系电话：</label>
				<input name="phone" value="${updateuser.phone }"  class=" phoneNum required" type="text" size="30" maxlength="30" alt="请输入联系电话"/>
			</p>
			<p>&nbsp;</p>
			<p>温馨提示：新增理财用户后，必须注册成为环迅用户，才能实现正常理财！</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="check()">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>