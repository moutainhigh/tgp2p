<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="${application_keyword.keywords}"/>
<meta http-equiv="description" content="${application_keyword.description}"/>
<title>太平洋理财-安全验证</title>
<%-- <link type="text/css" rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/Validform.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="/resources/css/skin/simple_gray/ymPrompt.css" />

<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/shade.js"></script>
<script type="text/javascript" src="/resources/js/ymPrompt.js"></script>
<script type="text/javascript" src="/resources/js/Validform_v5.3_min.js"></script>
<script type="text/javascript" src="/resources/js/Validform_Datatype.js"></script>
<script type="text/javascript" src="/resources/js/jquery.form.js"></script>--%>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<jsp:include page="/WEB-INF/views/member/verification/welcome.jsp" />
<jsp:include page="/WEB-INF/views/member/verification/email.jsp" />
<jsp:include page="/WEB-INF/views/member/verification/realName.jsp" />
<jsp:include page="/WEB-INF/views/member/verification/security.jsp" />
<jsp:include page="/WEB-INF/views/member/verification/telphone.jsp" />
<jsp:include page="/WEB-INF/views/member/verification/complete.jsp" />
<script type="text/javascript">
function myDivColse(){
	window.location.href='/member_index/member_center';
}
var time =5;
function number(){ 
    window.setTimeout("number()",1000);
    if(time==0){
  	  window.location.href='/member_index/member_center';
    }
    if(time >= 0){  
       var obj = document.getElementById("number");  
       obj.innerHTML = "";
       obj.innerHTML = "系统会在"+time+"秒之后返回网站首页";
       time--;
    }
}
	var msg = "${security_verifiy}";
	if (msg == 0 && msg!=null && msg!="") {
		ShowDiv('MyDiv', 'fade');
	} else if (msg == 1) {
		ShowDiv('MyDiv1', 'fade1');
	} else if (msg == 2) {
		ShowDiv('MyDiv2', 'fade2');
	} else if (msg == 3) {
		ShowDiv('MyDiv3', 'fade3');
	} else if (msg == 4) {
		ShowDiv('MyDiv4', 'fade4');
	}else if (msg == 100) {
		number();
		ShowDiv('MyDiv5', 'fade5');
	} else {
		window.location.href = '/member_index/member_center';
	}
</script>
</body>
</html>
