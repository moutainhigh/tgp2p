<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="${application_keyword.keywords}" http-equiv="keywords"/>
<meta content="${application_keyword.description}" http-equiv="description"/>
<title>太平洋理财贷款平台-个人基本资料</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/Validform.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/skin/simple_gray/ymPrompt.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>resources/css/lhgcalendar.css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/global.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/Validform_v5.3_min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/Validform_Datatype.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/lhgcalendar.min.js"></script>

</head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<!--End top-->

<!--Content-->
<div class="Content">
 <div class="w960px">

<!--vipContent-->
<div class="vipContentBox">
<!--vipLeft-->
<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
<!--End vipLeft-->

<!--vipRight-->
<div class="vipRightBox">
<div class="vipHeadMenuBox">
 <ul>
  <li><a href="<%=basePath%>update_info/forword_url?url=head" class="vipHeadLink">我的头像</a></li>
  <li><a href="<%=basePath%>update_info/basicinfo">个人资料</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="<%=basePath %>resources/images/vipcenterziliao_viod.png" /></span>您可以通过修改用户头像来展示自己。</h1>
<p>1、用户头像能直观的向其他用户展示自己，推荐使用真实照片以作为头像，也可以使用系统推荐头像。</p>
<p>2、使用上传图片时请不要小于100x100像素，不要大于512KB。</p>
</div>
<div class="vipUserUpdateBox">
 <div class="addUserImg">
  <h2>我的当前头像</h2>
  <c:if test="${empty user.userrelationinfo.imgUrl}">
   <span style="width: 100px; height: 100px;"><img src="<%=basePath %>resources/images/img/user.gif"/></span>
  </c:if>
   <c:if test="${!empty user.userrelationinfo.imgUrl}">
  <span style="width: 100px; height: 100px;"><img src="${user.userrelationinfo.imgUrl}"/></span>
  </c:if>
<form action="/update_info/upload_head" method="post" id="myform" enctype="multipart/form-data">
  <span>
  <a href="javascript:;"><i></i>上传头像</a>
  <input type="file" name="imgUrl" id="file_upload"/>
  </span>
 </form>
 </div>
 <div class="userImgList">
 <div class="userImgListBox">
  <h3><font>系统头像</font></h3>
  <ul id="head_img">
  <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user1.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user2.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user3.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user4.png" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user5.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user6.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user7.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user8.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user9.jpg" title="" alt="" /></a></li>
   <li><a href="javascript:void();"><img style="width: 100px; height: 100px;" src="<%=basePath %>resources/images/img/user10.jpg" title="" alt="" /></a></li>
  </ul>
  <script type="text/javascript">
  function reset(){
	  window.location.href="/update_info/forword_url?url=head";
  }
  if("${msg}"=="1"){
	  reset();
  }
  	$(function(){
  		$("#head_img li a img").click(function(){
  			var imgUrl=$(this).attr("src");
  			$.ajax({
  				url:'/update_info/update_head',
  				data:'imgUrl='+imgUrl,
  				type:'post',
  				success:function(msg){
  					if(msg){
  						window.location.reload();
  					}else{
  						ymPrompt.errorInfo('修改失败！', 260, 160, '失败', null);
  					}
  				}
  			});
  		});
  		
  		
  		$("#file_upload").change(function(){
  			var srcc=$("#file_upload").val();
  			start = srcc.lastIndexOf(".");
  			end = srcc.length;
  			ts = srcc.substring(start + 1, end);
  			nts = ts.toLowerCase();
  			if(srcc.length>0){
  				if (nts!='jpg' && nts!='png'&& nts!='gif' && nts!='jpeg' ) {
  					document.getElementById("myform").reset();
  					ymPrompt.errorInfo('图片格式错误！',226,150,'失败',null);
  				}else{
  					$('#myform').submit();
  				}
  			}
  		});

  	});
  </script>
  <div class="clear"></div>
 </div>
 </div>
 <div class="clear"></div>
</div>
</div>
</div>
</div>
<!--End vipcontent-->
 
 </div>
</div>
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
