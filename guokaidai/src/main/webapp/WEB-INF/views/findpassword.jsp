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
<title>太平洋理财贷款平台-借款列表</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="resources/css/huitou.css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<!--End head-->

<!--Content-->
<div class="Content">
 <div class="w960px">
 <!--mapLinkBox-->
 <div class="mapLinkBox"><span>您当前的位置：</span><a href="/">太平洋理财</a>><a href="/find_password/init.do">找回登录密码</a></div>
 <!--End mapLinkBox-->
 
 <!--找回密码-->
  <div class="contwrap">
   <div class="forgotpwdBox">
   <form>
    <div class="forgotpwdHead">
     <span class="forgotpwdone iconPwd_one"></span><span class="forgotpwdtwo iconPwd_twos"></span>
    </div>
    <div class="clear"></div>
	     <table cellspacing="0" cellpadding="0" class="forgotpwdTable" id="forgotpwdMobile" style="display:none;">
	      <tbody>
	       <tr><th>手机号码：</th><td><input type="text" class="forgotpwdTx curvyCorners_2 w120px" id="yhphone" name="phone" onkeyup="value=value.replace(/[^\d\.]/g,'')" /></td></tr>
	        <tr><th>验证码：</th><td><input type="text" class="forgotpwdTx curvyCorners_2 w50px" 	id="yhmphone" name="smsCode"  onkeyup="value=value.replace(/[^\d\.]/g,'')"  /><span class="forgotpwdBnt_two curvyCorners_2" style="height:28px; line-height:28px; margin-left:10px;" id="getcode" onkeyup="value=value.replace(/[^\d\.]/g,'')">获取验证码</span></td></tr>
	       <tr><th></th><td><input type="button" value="提交" class="forgotpwdBnt curvyCorners_5" id="findbyphone"/></td></tr>
	      </tbody>
	     </table>
     
     
     <table cellspacing="0" cellpadding="0" class="forgotpwdTable" id="forgotpwdEmail">
      <tbody>
       <tr><th>邮箱地址：</th><td><input type="text" class="forgotpwdTx curvyCorners_2 w120px" id="yhemail" /></td></tr>
       <tr><th></th><td><input type="button" id="findbyemail" value="提交" class="forgotpwdBnt curvyCorners_5"/></td></tr>
      </tbody>
     </table>
     </form>
   </div>
   <center><b style="red;">${msg}</b></center>
   <p class="forgotpwdSevers">若您无法使用上述方法找回，请联系客服${footer.phone}</p>
 </div>
 <!--End 找回密码-->
 
 </div>
</div>
<!--End Content-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<!--End footer-->


</body>
<script type="text/javascript">
$(function(){
		//手机号码
		$("#getcode").click(function(){
			 var yhphone=$("#yhphone").val();
			 
			 if(yhphone.length!=11){
				 ymPrompt.errorInfo("请输入11位的移动电话号码",300,160,"温馨提示",null);
				 return false;
			 }
			 $.ajax({
					type:'post',
					data:{phone:yhphone},
					url:'/find_password/findphone.do',
					success:function(msg){
						if(msg==1){
							ymPrompt.succeedInfo("找回密码短信发送成功!",300,160,"温馨提示",null);
						}else if(msg==2){
							ymPrompt.errorInfo("你输入的电话号码不存在！",300,160,"温馨提示",null);
						}else if(msg==4){
							ymPrompt.errorInfo("短信发送频繁，请2分钟后再发！",300,160,"温馨提示",null);
						}else{
							ymPrompt.errorInfo("短信发送失败！",300,160,"温馨提示",null);
						}
					}
				});
		});
		
		$("#findbyphone").click(function(){
			 var yhmphone=$("#yhmphone").val();
			 if(yhmphone.length!=6){
				 ymPrompt.errorInfo("请输入6位的短信验证码",300,160,"温馨提示",null);
				 return false;
			 }
 			 var yhphone=$("#yhphone").val();
			 if(yhphone.length!=11){
				 ymPrompt.errorInfo("请输入11位的移动电话号码",300,160,"温馨提示",null);
				 return false;
			 }
			 $.ajax({
					type:'post',
					data:{phone:yhphone,smsCode:yhmphone},
					url:'/find_password/checksmsCode',
					success:function(msg){
						if(msg==1){
							//跳转到更改页面
							window.location.href="/find_password/toUpdate";
						}else if(msg==2){
							ymPrompt.errorInfo("请重新发送短新验证码！",300,160,"温馨提示",null);
						}else if(msg==3){
							ymPrompt.errorInfo("验证码输入错误！",300,160,"温馨提示",null);
						}else if(msg==5){
							ymPrompt.errorInfo("该手机号码不存在！",300,160,"温馨提示",null);
						}else{
							ymPrompt.errorInfo("找回密码失败！",300,160,"温馨提示",null);
						}
					}
				});
		});
		
		//邮箱
		$("#findbyemail").click(function(){
			 var yhemail=$("#yhemail").val();
			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
			if(!reg.test(yhemail))
		    {
		        ymPrompt.errorInfo("请输入正确的邮箱！",260,160,"温馨提示",null);
		        return false;
		    }
			 $.ajax({
					type:'post',
					data:{email:yhemail},
					url:'/find_password/findemail.do',
					success:function(msg){
						if(msg==1){
							ymPrompt.succeedInfo("找回密码邮件发送成功!",300,160,"温馨提示",null);
						}else if(msg==2){
							ymPrompt.errorInfo("找回密码邮件发送频繁！",300,160,"温馨提示",null);
						}else if(msg==3){
							ymPrompt.errorInfo("你输入的邮箱不存在！",300,160,"温馨提示",null);
						}else{
							ymPrompt.errorInfo("发送失败！",300,160,"温馨提示",null);
						}
					}
				});
		});
		
	});
</script>
</html>

