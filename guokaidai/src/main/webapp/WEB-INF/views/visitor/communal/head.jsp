<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/huitou.css" />
--%><link rel="stylesheet" type="text/css"
	href="<%=basePath %>resources/css/skin/simple_gray/ymPrompt.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>resources/css/newCommon.css?v=2014080117" />
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/global.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/head.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/ymPrompt.js"></script>
<!--top-->
<style>
#wdzh{display:none;position:absolute;width:80px;top:40px;right:135px;text-align:center;z-index:999;border-top: 1px solid #ddd;}
#wdzh a{display:block;width:80px;font-size:12px;color:#444;height:30px;line-height:30px;background-color:#fff;margin:0;padding:0;border:1px solid #ddd;border-top:none}
#wdzh a:hover{background-color:#dedede;color:#cc6600}
.navBox b,#wdzh b{position: absolute;left: 50%;top: -13px;overflow: hidden;margin-left: -6px;width: 0;height: 0;font-size: 0;border-width: 6px;border-style: dashed dashed solid dashed;border-color: transparent transparent #adadad transparent;}
.navBox .arrow_up_in,#wdzh .arrow_up_in{top: -12px;border-color: transparent transparent #fff transparent;}
</style>
<input type="hidden" id="security_verifiy" value="${security_verifiy }">
<%--会员未登录 --%>
<c:if test="${empty session_user }">
	<div class="topBox">
		<div class="w960px pot_r">
			<div class="clear"></div>
			<div class="topLeftMenu">
				<a href="javascript:AddFavorite('太平洋理财',location.href)" style="background:url(/resources/images/img/scbz.png) no-repeat;">收藏本站</a>
			</div>
			<div class="topRightMenu">
				<a href="/visitor/to-login" style="color:#fd903d;padding:0 15px 0 0;margin:0">登录</a>
				<a href="/visitor/to-regist" style="color:#62a6f7;padding:0 15px 0 0;margin:0">免费注册</a>
				<a href="/member_index/member_center" style="width:60px;padding:0;margin:0">
					<span style="padding:0 2px 0 0 ;">个人中心</span>
				</a>
		    	<c:set var="i" value="1" />
		    	<a href="<c:forEach items="${topics }" var="t">
		    		<c:if test="${t.name eq '帮助中心'}">
		    			<c:set var="i" value="2" />
		    			${t.url }
		    		</c:if>
		    	</c:forEach><c:if test="${i eq 1 }">/to/single-11-101.htm</c:if>" style="width:70px;padding:0;margin:0">
					<span style="padding:0 2px 0 10px;">帮助中心</span>
				</a>
				<%-- <a href="/to/single-11-101.htm" style="width:45px;padding:0;margin:0">
					<span style="padding:0 2px 0 10px;">论坛</span>
				</a> --%>
				<div class="bdsharebuttonbox" style="float:left;width:40px;height:40px;margin:0 20px 0 10px">
					<a href="#" class="bds_more" data-cmd="more"
						style="background:none;padding:0;margin:0;font-size:13px;color:#fff;line-height:40px;width:40px;height:40px;">分享</a>
				</div>
				<script>
					window._bd_share_config = {
						"common" : {
							"bdSnsKey" : {},
							"bdText" : "太平洋理财专业理财",
							"bdMini" : "2",
							"bdPic" : "",
							"bdStyle" : "0",
							"bdSize" : "16",
							"bdDesc" : "太平洋理财是国内首创P2C互联网金融交易模式的平台。致力于为个人和企业搭建一个高效、直接的融资桥梁，构筑更轻松自由的投融资环境，寻找个人与企业之间安全与效率的平衡点，推动解决利率市场化进程中投资渠道窄和实体企业融资难的问题，实现合作共赢。"
						},
						"share" : {}
					};
					with (document)
						0[(getElementsByTagName('head')[0] || body)
								.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
								+ ~(-new Date() / 36e5)];
				</script>
			</div>
			<div class="clear"></div>
		</div>
		<div id="erweima"></div>
	</div>
</c:if>
<%--会员已经登录 --%>
<c:if test="${!empty session_user }">
<div class="topBox">
		<div class="w960px pot_r">
			<div class="topLeftMenu">
				<a href="javascript:AddFavorite('太平洋理财',location.href)" style="background:url(/resources/images/img/scbz.png) no-repeat;">收藏本站</a>
			</div>
			<div class="topRightMenu">
				<span>你好，</span>
				<a href="/member_index/member_center" style="margin:0;padding:0 10px 0 0">${session_user.userName }</a>
				<a href="/member_index/member_center" class="account" style="width:70px;padding:0;margin:0">
					<span style="padding:0 2px 0 10px ;">个人中心</span>
				</a>
				<div id="wdzh" class="account" style="display: none;">
					<b class="arrow_up"></b>
					<b class="arrow_up_in"></b>
				    <a href="/member_index/member_center">我的账户</a>
				    <a href="javascript:void(0);" id="loginOut">安全退出</a>
		    	</div>
		    	<c:set var="i" value="1" />
		    	<a href="<c:forEach items="${topics }" var="t">
		    		<c:if test="${t.name eq '帮助中心'}">
		    			<c:set var="i" value="2" />
		    			${t.url }
		    		</c:if>
		    	</c:forEach><c:if test="${i eq 1 }">/to/single-11-101.htm</c:if>" style="width:70px;padding:0;margin:0">
					<span style="padding:0 2px 0 10px;">帮助中心</span>
				</a>
				<%-- <a href="/to/single-11-101.htm" style="width:45px;padding:0;margin:0">
					<span style="padding:0 2px 0 10px;">论坛</span>
				</a> --%>
				<div class="bdsharebuttonbox" style="float:left;width:40px;height:40px;margin:0 20px 0 10px">
					<a href="#" class="bds_more" data-cmd="more"
						style="background:none;padding:0;margin:0;font-size:13px;color:#fff;line-height:40px;width:40px;height:40px;">分享</a>
				</div>
				<script>
					window._bd_share_config = {
						"common" : {
							"bdSnsKey" : {},
							"bdText" : "太平洋理财专业理财",
							"bdMini" : "2",
							"bdPic" : "",
							"bdStyle" : "0",
							"bdSize" : "16",
							"bdDesc" : "太平洋理财是国内首创P2C互联网金融交易模式的平台。致力于为个人和企业搭建一个高效、直接的融资桥梁，构筑更轻松自由的投融资环境，寻找个人与企业之间安全与效率的平衡点，推动解决利率市场化进程中投资渠道窄和实体企业融资难的问题，实现合作共赢。"
						},
						"share" : {}
					};
					with (document)
						0[(getElementsByTagName('head')[0] || body)
								.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
								+ ~(-new Date() / 36e5)];
				</script>
			</div>
		</div>
		<div id="erweima"></div>
	</div>
</c:if>
<!--End top-->
<!--head-->
<script>
$(".account").hover(function(){
	$("#wdzh").css("display","block");
	$(".navBox").css("position","static");
	$(".navBox span").css("position","static");
	},function(){
	$("#wdzh").css("display","none");
	$(".navBox").css("position","relative");
	$(".navBox span").css("position","relative");
});
</script>
<div class="head" style="background-color:#f3f3f3;box-shadow: 0 1px 4px rgba(0,0,0,.2);">
	<div class="w960px" id="main">
		<div class="logo">
			<a href="/"><img src="<%=basePath %>resources/images/logo.png" title="太平洋理财平台" /></a>
		</div>
		<!--nav-->
		<div class="navBox" style="float:right">
			<c:forEach items="${topics }" var="t">
				<c:if test="${t.isShow == 1 }">
					<span><a href=<c:choose>
								<c:when test="${t.name eq '首页'}">
									"<%=basePath %>index"
								</c:when>
								<c:when test="${t.name eq '我的账户'}">
									"<%=basePath %>member_index/member_center"
								</c:when>
								<c:when test="${t.name eq '我要借款'}">
									"<%=basePath %>to/single-7-27.htm"
								</c:when>
								<c:when test="${t.name eq '我要投资'}">
									"<%=basePath %>manageFinances.htm"
								</c:when>
								<c:when test="${t.name eq '新手引入'}">
									"<%=basePath %>newLine.htm"
								</c:when>
								<c:otherwise>
									"<%=basePath %>${t.url }"
								</c:otherwise>
							</c:choose>
						<c:if test="${t.id eq topicId }">class="navLink"</c:if> id="dh1">${t.name }</a>
						<c:set var="o" value="0" /> <c:forEach items="${appDeputys }"
							var="appDeputy">
							<c:if test="${appDeputy.topic.id eq t.id && o eq 0 && t.name ne '首页'}">
								<div>
									<b class="arrow_up"></b>
									<b class="arrow_up_in"></b>
									<c:forEach items="${appDeputys }" var="d">
										<c:if test="${d.topic.id == t.id }">
											<a href="<%=basePath %>${d.url }">${d.name }</a>
										</c:if>
									</c:forEach>
								</div>
								<c:set var="o" value="${o+1 }" />
							</c:if>
						</c:forEach>
					</span>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function($){
		$("#loginOut").click(function(){
			ymPrompt.confirmInfo('是否确认安全退出？', 320, 160, '是否退出', function(tp) {
				if (tp == 'ok') {
					window.location.href='<%=basePath%>update_info/login_out';
												}
											});
						});

	});
</script>
<!--End head-->
<jsp:include page="/WEB-INF/views/visitor/communal/safeverify.jsp" />
