<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财-用户登录</title>
<link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<link rel="stylesheet" href="/resources/css/validationEngine.jquery.css"
	type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script type='text/javascript' src='/resources/js/jquery.md5.js'></script>
<style>
#loginDiv li input[type="text"],#loginDiv li input[type="password"]{border:1px solid #fff;border-bottom: 1px solid #d8e0e2}
#loginDiv li input[type="text"]:focus,#loginDiv li input[type="password"]:focus{border:0;border:1px solid #ccc;}
</style>
<script>
function checkLogin(){
	if($("#loginName").val()==""){
		ymPrompt.alert({title:"提示",message:"请输入用户名",closeTxt:"关闭"});
		document.getElementById("loginName").focus();
		return false;
	}else if($("#loginPwd").val()==""){
		ymPrompt.alert("请输入密码",null,null,"提示",null);
		document.getElementById("loginPwd").focus();
		return false;
	}else if($("input[name='captcha']").val()==""){
		ymPrompt.alert("请输入验证码",null,null,"提示",null);
		document.getElementById("captcha").focus();
		return false;
	}else{
		$("#loginPwd").val($.md5($("#loginPwd").val()));
		return true;
	}
}
</script>
</head>
<body>
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--End head-->

	<!--Content-->
	<div style="width:1000px;height:500px;margin:0 auto;">
		<img src="/resources/images/img/login_bg.jpg" style="float:left"/>
		<form id="loginForm" action="/registration/login" method="post" id="df_login" onsubmit="return checkLogin();">
		<div style="height:425px;margin-top:10px;border:1px solid #e1e1e1;background-color:#f0f0f0;float:left;">
			<div id="loginDiv" style="width:365px;height:340px;margin:20px 0 0 10px;border-bottom:1px solid #dfdfdf">
				<ul>
					<li style="width:310px;padding:10px 0 15px 20px;">
						<img src="/resources/images/img/login_logo.png" />
					</li>
					<li style="margin:0 0 15px 20px;position:relative;">
						<span style="position: absolute;display: block;width: 21px;height: 21px;top: 10px;left: 8px;background: url(/resources/images/img/user.png) no-repeat 4px 1px;"></span>
						<input type="text" name="userName" id="loginName" value="${userName }" placeholder="用户名" style="width:270px;height:20px;padding:10px 0 10px 40px;font-size:14px;" />
					</li>
					<li style="margin:0 0 15px 20px;position:relative;">
						<span style="position: absolute;display: block;width: 21px;height: 21px;top: 10px;left: 8px;background: url(/resources/images/img/pwd.png) no-repeat 3px 1px;"></span>
						<input type="password" name="pwd" id="loginPwd" value="${pwd }" placeholder="密码" style="width:270px;height:20px;padding:10px 0 10px 40px;font-size:14px;" />
					</li>
					<li style="width:310px;margin:0 0 20px 20px;position:relative;height:41px;">
						<span style="position: absolute;display: block;width: 21px;height: 21px;top: 10px;left: 8px;background: url(/resources/images/img/captcha.png) no-repeat 2px 1px;z-index:2"></span>
						<input type="text" name="captcha" id="captcha" placeholder="请输入验证码" style="position:absolute;left:0;width:170px;height:20px;padding:10px 0 10px 40px;font-size:14px;z-index:1" />
						<img src="/cic/code?name=user_login" onclick="this.src='/cic/code?name=user_login&amp;id='+new Date();" title="看不清，点击换一张" style="cursor: pointer;width:90px;height:39px;margin-left:10px;float:right" />
					</li>
					<li style="width:335px;height:30px;">
						<span onclick="" style="display:block;height:30px;font-size:13px;color:#6a6a6a;line-height:30px;margin-left:25px;float:left;cursor: pointer;">
							<img src="/resources/images/img/jzyhm.png" style="margin-right:4px;" />记住用户名
						</span>
						<span style="float:right;height:30px;line-height:30px;">
							<img src="/resources/images/img/mfzc.png" /><a href="/visitor/to-regist"><font style="font-size:13px;color:#244b74;margin:0 10px 0 5px;">免费注册</font></a><a href="/find_password/init.do"><font style="font-size:13px;color:#cf5502">忘记密码？</font></a>
						</span>
					</li>
					<li style="margin:15px 0 0 20px;">
						<input type="submit" id="loginEnter" style="cursor: pointer;background-color: #E70012;border: none;width: 310px;height: 40px;line-height: 40px;text-align: center;color: #fff;font-size: 20px;border-radius: 3px;transition-property: background-color;" value="立即登录">
					</li>
					<script>
						<c:if test="${!empty user_error}">
							ymPrompt.alert("${user_error }", null,null, '提示', null);
						</c:if> <c:if test="${msg eq 1}">
							ymPrompt.alert("验证码错误", null,null, '提示', null);
						</c:if> <c:if test="${error gt 0 && error lt 5}">
							ymPrompt.alert("密码错误，还有${5-error}次机会。", null,null, '提示', null);
						</c:if> <c:if test="${!empty isLock }">
							ymPrompt.alert("对不起你的账号在${isLock}已经锁定。", null,null, '提示', null);
						</c:if> <c:if test="${!empty lock }">
							ymPrompt.alert("${lock}", null,null, '提示', null);
						</c:if> <c:if test="${!empty admin_lock }">
							ymPrompt.alert("${admin_lock}", null,null, '提示', null);
						</c:if> <%--<c:if test="${!empty please_login }">
							ymPrompt.alert("${please_login}", null,null, '提示', null);
						</c:if>--%>
					</script>
				</ul>
			</div>
			<!--
			<span style="display:block;height:50px;line-height:50px;margin-left:40px;color:474747;font-size:14px;float:left">
				其他方式登录：
			</span>
			<a class="login_1" href="javascript:void(0)"></a>
			<a class="login_2" href="javascript:void(0)"></a>
			<a class="login_3" href="javascript:void(0)"></a>
			-->
		</div>
		</form>
	</div>
	<!--End Content-->
	
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->
	
	<script>
	function initPlaceHolders(){
	    if('placeholder' in document.createElement('input')){ //如果浏览器原生支持placeholder
	        return ;
	    }
	    function target (e){
	        var e=e||window.event;
	        return e.target||e.srcElement;
	    };
	    function _getEmptyHintEl(el){
	        var hintEl=el.hintEl;
	        return hintEl && g(hintEl);
	    };
	    function blurFn(e){
	        var el=target(e);
	        if(!el || el.tagName !='INPUT' && el.tagName !='TEXTAREA') return;//IE下，onfocusin会在div等元素触发 
	        var    emptyHintEl=el.__emptyHintEl;
	        if(emptyHintEl){
	            //clearTimeout(el.__placeholderTimer||0);
	            //el.__placeholderTimer=setTimeout(function(){//在360浏览器下，autocomplete会先blur再change
	                if(el.value) emptyHintEl.style.display='none';
	                else emptyHintEl.style.display='';
	            //},600);
	        }
	    };
	    function focusFn(e){
	        var el=target(e);
	        if(!el || el.tagName !='INPUT' && el.tagName !='TEXTAREA') return;//IE下，onfocusin会在div等元素触发 
	        var emptyHintEl=el.__emptyHintEl;
	        if(emptyHintEl){
	            //clearTimeout(el.__placeholderTimer||0);
	            emptyHintEl.style.display='none';
	        }
	    };
	    if(document.addEventListener){//ie
	        document.addEventListener('focus',focusFn, true);
	        document.addEventListener('blur', blurFn, true);
	    }
	    else{
	        document.attachEvent('onfocusin',focusFn);
	        document.attachEvent('onfocusout',blurFn);
	    }
	
	    var elss=[document.getElementsByTagName('input'),document.getElementsByTagName('textarea')];
	    for(var n=0;n<2;n++){
	        var els=elss[n];
	        for(var i =0;i<els.length;i++){
	            var el=els[i];
	            var placeholder=el.getAttribute('placeholder'),
	                emptyHintEl=el.__emptyHintEl;
	            if(placeholder && !emptyHintEl){
	                emptyHintEl=document.createElement('span');
	                emptyHintEl.innerHTML=placeholder;
	                emptyHintEl.className='emptyhint';
	                emptyHintEl.onclick=function (el){return function(){try{el.focus();}catch(ex){}}}(el);
	                if(el.value) emptyHintEl.style.display='none';
	                el.parentNode.insertBefore(emptyHintEl,el);
	                el.__emptyHintEl=emptyHintEl;
	            }
	        }
	    }
	}
	
	initPlaceHolders();


	
	</script>
</body>
</html>
