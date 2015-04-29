<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财-新手指引</title>
<link type="text/css" rel="stylesheet" href="resources/css/new.css" />
<link type="text/css" rel="stylesheet" href="resources/css/style.css" />
<link type="text/css" rel="stylesheet" href="resources/css/other.css" />
<link type="text/css" rel="stylesheet" href="resources/css/user.css" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<script type="text/javascript" src="resources/js/loanSign/loaninfo.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.7.js"></script>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<base href="<%=basePath%>" />
<style>
.guide-banner{ width:100%; height:270px; background:#eaf3fa url(/resources/images/img/banner.png) no-repeat center center}
.guid_cont h2{ padding:25px; font-size:40px; text-align:center; font-weight:normal}
.guid_cont a.btn{ margin:0 auto 20px; width:220px; height:50px; line-height:50px; display:block; background:#fc8936; border-radius:3px; font-size:18px; color:#fff; text-decoration:none; text-align:center}
.guid_cont img.pd{ padding:40px 0 60px}
.guid_cont .line{ position:relative; margin-top:65px; width:1000px; height:40px; background:url(/resources/images/img/line.png) no-repeat}
.guid_cont .icons-tit{ margin:0 auto; width:63px; height:71px; top:-30px; left:468px; position: absolute; background: url(/resources/images/img/tit.png) no-repeat; display:block}
.guid_cont .col_1{ background-position:0 0}
.guid_cont .col_2{ background-position:0 -75px}
.guid_cont .col_3{ background-position:0 -150px}
.guid_cont .col_4{ background-position:0 -225px}
.guid_cont .col_5{ background-position:0 -300px}
.guid_cont .desc{ text-align:center}
.guid_cont .desc p{ font-size:18px; line-height:32px}
.guide-sum { position:relative; margin: 45px 75px 90px 0; overflow:hidden}
.guide-sum dl { float:left; text-align:right; width:35%; line-height:normal; /*border-left:1px solid #c8c8c8; margin-left:-1px*/}
.guide-sum dt { color:#366792; font-size:30px; line-height:normal; font-weight:normal; padding:0 55px 5px 0; font-family:Tahoma, Geneva, sans-serif }
.guide-sum dt em { font-size:26px; font-style:normal; color:#366792; font-weight:normal; font-family:Microsoft YaHei }
.guide-sum dd { color:#666}
.guide-sum dl.last {width:29%}
.guide-sum-1,.guide-sum-2,.guide-sum-3 { background: url(/resources/images/img/guide-sum.png);width: 130px;height: 81px;margin-bottom:10px;}
.guide-sum-1 { background-position: -190px 0;margin-left:150px;}
.guide-sum-2 { background-position: -450px 0;margin-left:115px;}
.guide-sum-3 { background-position: -725px 0;margin-left:80px;}
.investMain { position:relative; height:540px; text-align:center}
.investbox { width:693px; height:447px; margin:0 auto; position:relative; overflow:hidden ;border:1px solid #ccc}
.invesSlider { position:absolute; top:0px; left:0px; width:2780px}
.invesSlider li{ float:left; display:inline; position:relative; width:693px; height:447px}
.invesSlider li p{ font-size:16px; line-height:36px}
.investMain a{position:absolute; top:170px; width:57px; height:114px; display:block; opacity:0.5;filter:alpha(opacity=50); background:url(/resources/images/img/guide.png) no-repeat; z-index:999}
.investMain a.prev{ background-position:0 bottom; left:0px}
.investMain a.next{ background-position:right bottom; right:8px}
.investMain a:hover{opacity:1;filter:alpha(opacity=100)}
.investMain a.disabled,.investMain a.disabled:hover{opacity:0.3;filter:alpha(opacity=30); cursor:default}
.investMain #idNum{position: absolute;width:695px;height:44px;top: 470px;left: 152px;text-align:center}
.investMain #idNum span{display: inline-block;width:44px;height:44px;padding-left:40px;background:url(/resources/images/img/guide_1.png) no-repeat -93px 0 }
.investMain #idNum .active{background-position: -1px 0;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<div class="guide-banner"></div>
<div class="guid_cont" style="width:1000px;margin:0 auto 30px auto;overflow:hidden;">
   <c:forEach items="${manualList}" var="manual" varStatus="s">
        <div class="line"><i class="icons-tit col_${s.count }"></i></div>
		<h2 id="title${s.count }">${manual.title }</h2>
		<c:if test="${fn:contains(manual.imgExplain,',')}">
		     <div class="investMain"> 
		     <a href="javascript:void(0);" class="prev" id="idPrev"></a> 
		     <a href="javascript:void(0);" class="next" id="idNext"></a>
             <div class="investbox" id="idFormView" style="overflow: hidden; position: relative;">
             <ul class="invesSlider" id="idSlider" style="width: 3465px; position: absolute; left: 0px; top: 0px;">
		        <c:forTokens items="${manual.imgExplain}" delims="," var="img">
				   <li><img src="${img }" width="693" height="447"></li>
				</c:forTokens>
		      </ul>
              </div>  
              <div id="idNum">
                    <span class="active"></span>
                    <c:forTokens items="${manual.imgExplain}" delims="," var="img" varStatus="c">
                        <c:if test="${c.count>1 }">
		                   <span></span>
		                </c:if>
		            </c:forTokens>
		        </div>
             </div>   
		</c:if>
		<c:if test="${!fn:contains(manual.imgExplain,',')}">
		<p style="text-align:center"><img src="${manual.imgExplain }" /></p>
		</c:if>
   </c:forEach>
   <h2></h2>
    <p style="text-align:center">
    	<c:if test="${empty session_user }">
    		<a href="/visitor/to-login" class="btn">马上进行</a> 
    	</c:if>
    	<c:if test="${!empty session_user }">
    		<a href="/" class="btn">马上进行</a> 
    	</c:if>
    </p>
    <script>
  	function guideSlider(param){
  		var w = parseInt($("#idSlider").css("width"));
  		var l = parseInt($("#idSlider").css("left"));
  		if(param=="left"&&l<=-693){
  			var index = (0-l)/693;
  			$("#idNum span:nth-child("+index+")").addClass("active");
  			$("#idNum span:nth-child("+(index+1)+")").removeClass("active");
  			$("#idSlider").animate({left:"+=693px"}, 500);
  		}else if(param=="right"&&(w+l)>693){
  			var index = (0-l)/693+2;
  			$("#idNum span:nth-child("+index+")").addClass("active");
  			$("#idNum span:nth-child("+(index-1)+")").removeClass("active");
  			$("#idSlider").animate({left:"-=693px"}, 500);
  		}else if(parseInt(param)){
  			var num = parseInt(param)-1;
  			var v_l = 0-num*693;
  			if(l!=v_l){
  				$("#idSlider").animate({left:v_l}, 500);
  			}
  		}
  	}
	$("#idNext").click(function(){
		guideSlider("right");
	});
	$("#idPrev").click(function(){
		guideSlider("left");
	});
	$("#idNum span").click(function(){
		guideSlider($(this).index()+1);
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
	});
	</script>
</div>
<%--<div style="width:100%;background-color:#f1f1f1;height:630px;">
	<div style="width:1000px;height:630px;margin:0 auto;background:url(/resources/images/img/xszy.jpg) no-repeat 0 0;position:relative">
		<a href="/visitor/to-regist" style="display:block;width:130px;height:35px;position:absolute;top:579px;left:435px"></a>
	</div>
</div>
<div style="width:100%;background-color:#fff;height:450px;">
	<div style="width:1000px;height:450px;margin:0 auto;background:url(/resources/images/img/xszy.jpg) no-repeat 0 -635px;position:relative">
		<a href="/to/single-12-102.htm" style="display:block;width:75px;height:25px;position:absolute;top:160px;left:205px"></a>
	</div>
</div>
<div style="width:100%;background-color:#f1f1f1;height:460px;">
	<div style="width:1000px;height:460px;margin:0 auto;background:url(/resources/images/img/xszy.jpg) no-repeat 0 -1090px;position:relative">
		<a href="//to/single-11-101.htm" style="display:block;width:90px;height:30px;position:absolute;top:190px;left:365px"></a>
		<a href="//to/single-11-101.htm" style="display:block;width:90px;height:30px;position:absolute;top:190px;left:910px"></a>
	</div>
</div>
<div style="width:100%;background-color:#fff;height:660px;">
	<div style="width:1000px;height:650px;margin:0 auto;background:url(/resources/images/img/xszy.jpg) no-repeat 0 -1565px;position:relative">
		<a href="/visitor/to-regist" style="display:block;width:130px;height:35px;position:absolute;top:603px;left:435px"></a>
	</div>
</div>
<div style="width:100%;background-color:#f0f4f7">
	<div
		style="width: 1000px; height: 50px; margin: 0 auto; padding: 10px 0">
		<a style="display:block;width:206px;float:left" href="javascript:void(0)"><img src="resources/images/img/bottom1.jpg" />
		</a><a style="display:block;width:206px;float:left" href="javascript:void(0)"><img src="resources/images/img/bottom2.jpg" />
		</a><a style="display:block;width:206px;float:left" href="javascript:void(0)"><img src="resources/images/img/bottom3.jpg" />
		</a><a style="display:block;width:206px;float:left" href="javascript:void(0)"><img src="resources/images/img/bottom4.jpg" />
		</a><a style="display:block;width:175px;float:left" href="javascript:void(0)"><img src="resources/images/img/bottom5.jpg" />
		</a>
	</div>
</div>
--%>
<%@ include file="/WEB-INF/views/visitor/footer.jsp"%>
</body>
</html>
