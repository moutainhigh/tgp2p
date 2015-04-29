<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%--在360浏览器中默认启用极速模式 --%>
<meta name="renderer" content="webkit"> 
<title>系统登录</title>
<link href="/resources/css/css_admin.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resources/css/validationEngine.jquery.css" type="text/css"></link>
<link href="resources/css/login_css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script src="/resources/js/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script>
<script src="/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/iepng.js"></script>
<script type="text/javascript" language="javascript"> 
$(function ($){
	  var contentWidth = $(".loginBox").width();
	  var contentHeight =$(".loginBox").height();
	  var BgWidth = $(".loginBgBox").width();
	  var BgHeight =$(".loginBgBox").height();
	  var cotTop = ($(window).height() - contentHeight ) / 2;
	  var cotWidth = ($(window).width() - contentWidth ) / 2;
	  var bgTop = ($(window).height() - BgHeight ) / 2;
	  var bgWidth = ($(window).width() - BgWidth ) / 2;
	  $(".loginBox").css("top",cotTop+"px").css("left",cotWidth+"px");
	  $(".loginBgBox").css("top",bgTop+"px").css("left",bgWidth+"px").css("position","absolute");
	  $(".loginTable tr td:even").addClass("firstTd");
	  $(".loginTable tr td:odd span").addClass("tdSpanOne");
	  $(".loginTable tr td:odd p").addClass("tdPOne");
	  $("#loginBtn").click(function(){
			$("#myfrom").submit();									
		});
	  $("#myfrom").validationEngine({
			promptPosition : "topRight",
			autoHidePrompt:true,
			autoHideDelay:1000,
			onSuccess : function(form, valid) {
				if (valid) {
					$("#loginBtn").val("正在登录");
				} else {
					
				}
			}
		});
	  $("#username").focus();
	  $("#username").keyup(function(event){
		  if(13==event.keyCode){
			  $("#password").focus();
		  }
	  });
	  $("#password").keyup(function(event){
		  if(13==event.keyCode){
			  $("#endinput").focus();
		  }
	  });
	  $("#endinput").keyup(function(event){
		  if(13==event.keyCode){
			  $("#myfrom").submit();
		  }
	  });
	
});
</script>
</head>

<body>
<!--[if lte IE 9]>
    <div id="warning_info" class="text-warning fade" >
       <button type="button" class="close">×</button>
       <strong> 您正在使用低版本浏览器，</strong> 在本页面的显示效果可能有差异。
        建议您升级到
        <a href="http://www.google.cn/intl/zh-CN/chrome/" class="down_load" target="_blank">Chrome</a>
        或以下浏览器：
        <a href="http://www.firefox.com.cn/download/" class="down_load" target="_blank">Firefox</a> /
        <a href="http://www.apple.com.cn/safari/" class="down_load" target="_blank">Safari</a> /
        <a href="http://www.opera.com/" class="down_load" target="_blank">Opera</a> /
        <a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie" class="down_load" target="_blank">
            Internet Explorer 10</a>
    </div>
    <![endif]-->
<div class="login_div" id="mainFrame">
 <div class="login_con">
  <div class="login_ma">
  <div class="login_ts">${errormsg}</div>
  <form action="<%=basePath %>adminuser/adminlogin" id="myfrom" method="post">
   <div class="log_in_div1"><input type="text" id="username" value="${erroruser.username }" class="validate[required,minSize[5],maxSize[20]] log_pnp_c1" name="username"  style="background-position: left 5px;"/></div>
   <div class="log_in_div2"><input type="password" value="${erroruser.password }" class="validate[required,maxSize[15],minSize[5]] log_pnp_c2" id="password" name="password"  style="background-position: left -30px;"/></div>
   <div class="log_in_div3"><input id="endinput" type="text" class="validate[required,maxSize[4],minSize[4]] log_pnp_c3" name="validecade" /></div>
   <div class="log_in_div4"><img src="cic/code?name=adminrand" alt="看不清，点击换一张" title="看不清，点击换一张" onclick="this.src='cic/code?name=adminrand&id='+new Date();" style="width: 90px;height: 22px;border:0px;"/></div>
   <div class="log_but">
   <img onmouseover="this.src='resources/images/login_b22.png'" onmouseout="this.src='resources/images/login_b11.png'" src="resources/images/login_b11.png"  id="loginBtn"/>
   </div>
   </form>
  </div>
 </div>
</div>
<script type="text/javascript">
$(function () {
	var main = $("#mainFrame");
	var winWidth = window.document.body.width - 50;
	var mainHeight = main.height();
	var mainWidth = main.width();
	var rate = winWidth / mainWidth;
	main.width(winWidth);
	main.height(mainHeight * rate);
})
</script>
</body>
</html>
