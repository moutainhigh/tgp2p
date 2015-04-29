<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财-会员中心-安全中心</title>
<link rel="stylesheet" href="/resources/css/skin/default.css" type="text/css"></link>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>

<body>
<!--mainBox-->
<div class="mainBox">
  <!--header-->
    <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
    <script src="/resources/js/personalinfo.js" type="text/javascript"></script>
    <script type="text/javascript" src="/resources/js/artDialog.js"></script>
  <!--End header-->
  <div class="clear"></div>
  
  <!--content-->
  <div class="content">
    <div class="w960box vipboxbor curvyCorners_2" style="background:#fff;">
      <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp"/>
      <div class="vipcenterright">
         <div class="vipconttabs">
           <ul>
				<li><span onclick="window.location.href='/member/fowardUploadPhoto'" class="vipconttabsLink">我的头像</span></li>
				<li><span onclick="window.location.href='/update_info/forword_url?url=updatePwd'">修改登录密码</span></li>
				<li><span onclick="window.location.href='/update_info/forword_url?url=updateTransPwd'">修改交易密码</span></li>
				<li><span onclick="window.location.href='/update_info/forword_url?url=updateNick'">修改昵称</span></li>
				<!-- <li><span>账户提现</span></li><li><span>资金记录</span></li> -->
			</ul>
         </div>
         <div class="right_con">
            	<img src="/resources/images/i_icon.gif" align="absmiddle" />&nbsp;<b> 您可以通过修改用户头像来展示自己 </b><br />
                <p style="border-bottom:1px dotted #94a2b5;">
                	1、用户头像能直观的向其他用户展示自己，推荐使用真实照片以作为头像，也可以使用系统推荐头像。<br />
                    2、使用上传图片时请不要小于156 * 119 像素，不要大于512KB。
                </p>
                <div class="vchaderbox">
                <input id="uid" type="hidden" value="${u.id }"/>
                	<div class="header_l">
                    	<div class="header_l_t">当前头像</div>
                        <div class="header_l_c">
                        	<div class="header_l_img"><img id="header_img" src="${u.userrelationinfo.imgUrl }" width="154" height="116" /></div>
                        </div>
                    </div>
                	<div class="header_r">
                		<div class="header_r_t">当前头像</div>
                    	<ul class="sys_head">
                        	<li><a href="javascript:;" onclick="updatePhoto('img01');"><img id="img01" src="/resources/images/h1.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img02');"><img id="img02" src="/resources/images/h2.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img03');"><img id="img03" src="/resources/images/h3.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img04');"><img id="img04" src="/resources/images/h4.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img05');"><img id="img05" src="/resources/images/h5.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img06');"><img id="img06" src="/resources/images/h6.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img07');"><img id="img07" src="/resources/images/h7.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img08');"><img id="img08" src="/resources/images/h8.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img09');"><img id="img09" src="/resources/images/h9.jpg" width="60" height="60"/></a></li>
                            <li><a href="javascript:;" onclick="updatePhoto('img10');"><img id="img10" src="/resources/images/h10.jpg" width="60" height="60"/></a></li>
                        </ul>
                        <div class="header_r_t">使用上传头像</div>
                         <form id="form_upload" action="/member/uploadPhoto" method="post" enctype="multipart/form-data">
                        <p style="padding:20px;">
                        	<input id="file_txt" type="file" name="file" /><input id="file" type="button" value="修改图片" class="VFupdataimgbnt" onclick="updatePhoto('file');"/>
                        </p>
                        </form>
                    </div>
                </div>
                
        	</div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!--End content-->
  <!--footer-->
 <jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
  <!--End footer-->
<div class="clear"></div>
</div>
<!--End mainBox-->
</body>
</html>
