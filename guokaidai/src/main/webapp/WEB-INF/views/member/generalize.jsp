<%--    
创建时间：2014年2月13日下午4:47:17   
创 建 人：LiNing   
相关说明：   前台展示会员推广链接（我要推广页面）
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财会员中心-推广方式</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/skin/simple_gray/ymPrompt.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="/resources/js/ymPrompt.js"></script>
<script src="resources/js/generalize.js" type="text/javascript"></script>
<%-- 复制按钮引用的js文件 --%>
<script type="text/javascript" src="resources/js/lib/ZeroClipboard.js"></script>
<!--Content-->
<div class="Content">
 <div class="w960px">

<!--vipContent-->
<div class="vipContentBox">
<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
<!--vipRight-->
<div class="vipRightBox">
<div class="vipHeadMenuBox">
 <ul>
  <li><a href="javascript:void(0);" class="vipHeadLink">推广方式</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财会员，您可以通过邀请好友注册太平洋理财获得太平洋理财奖金。</h1>
</div>
<form>
<table cellpadding="0" cellspacing="0" class="spreadBox">
<tbody>
<tr><th>您的邀请链接</th><td><input type="text" value="${strurl }" readonly="readonly" class="spreadTx vipconttatxt" /><input type="button" class="spreadBnt vipconttabnts" id="copybtn" value="复制链接" /><p>您可以通过QQ、MSN、微博、邮件等方式发送以上链接邀请好友加入。</p></td></tr>
</table>
</form>
<br />
<br />

</div>
<!--End vipContBox-->
</div>
<!--End vipRight-->
</div>
<!--End vipcontent-->
 
 </div>
</div>
<!--End vipContent-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
