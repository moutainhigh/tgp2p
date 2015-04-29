<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-更改登录密码</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="resources/css/huitou.css" />
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script src="/resources/js/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script>
<script src="/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<!--End head-->

<!--Content-->
<div class="Content">
 <div class="w960px">
 <!--mapLinkBox-->
 <div class="mapLinkBox"><span>您当前的位置：</span><a href="/">太平洋理财</a>><a href="/find_password/init.do">找回登录密码</a></div>
 <!--End mapLinkBox-->
 
 <!--修改密码-->
  <div class="contwrap">
   <div class="forgotpwdBox">
    <form id="find_password_form" action="" method="post" onsubmit="return false;">
    <div class="clear"></div>
     <table cellspacing="0" cellpadding="0" class="forgotpwdTable" id="forgotpwdEmail">
      <tbody> 
      	<input type="hidden" value="${updateuser.id}" name="id" />
      	<tr><th>用户名：</th><td><input type="text" class="forgotpwdTx curvyCorners_2 w120px" readonly="readonly" value="${updateuser.userName}" /></td></tr>
       	<tr><th>新密码：</th><td><input type="password" class="forgotpwdTx curvyCorners_2 w120px validate[required,maxSize[12],minSize[6]]"  name="passwordfd" id="passwordfd" /></td></tr>
        <tr><th>确认密码：</th><td><input type="password" class="forgotpwdTx curvyCorners_2 w120px validate[required,equals[passwordfd],maxSize[12],minSize[6]]" name="passwordfd_again" id="passwordfd_again"/></tr>
       <tr><th></th><td><input type="submit" value="重置密码" class="forgotpwdBnt curvyCorners_5"/></td></tr>
      </tbody>
     </table>
     </form>
   </div>
   <p class="forgotpwdSevers">若您无法使用上述方法找回，请联系客服400-1234567</p>
 </div>
 <!--End update密码-->
 </div>
</div>
<!--End Content-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<!--End footer-->

</body>
<script type="text/javascript">
function reset() {
	window.location.href='/visitor/to-login';
}
	function check_sms_code(){
		$.post("/find_password/checkpasswordbylink",{"password":$("#passwordfd").val(),"passwordagain":$("#passwordfd_again").val()},function(data){
			if(data==-1){
				location.href = "/find_password/init.do";
			}else if(data==-3){
				ymPrompt.errorInfo("密码为空，或者两次密码输入不同！",320,160,"温馨提示",null);
			}else if(data==1){
				ymPrompt.succeedInfo("密码重置成功！",300,160,"温馨提示",reset);
			}
		});
	}
	
	jQuery(document).ready(function(){
		jQuery("#find_password_form").validationEngine({
			onValidationComplete : function(form, valid) {
				if(valid){
					check_sms_code();
				}
			}
		});
	});

</script>
</html>

