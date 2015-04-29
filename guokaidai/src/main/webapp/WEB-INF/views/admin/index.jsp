<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<title>太平洋理财</title>

<link href="resources/themes/azure/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="resources/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="resources/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="resources/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>

<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
<script src="resources/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="resources/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="resources/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="resources/uploadify/scripts/jquery.uploadify.min.js" type="text/javascript"></script>
<script src="resources/js/dwz.min.js" type="text/javascript"></script>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>

<%--第三方operamasks插件--%>
<link href="/resources/operamasks-ui/themes/default/operamasks-ui.css"  rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/resources/operamasks-ui/operamasks-ui.js"> </script>
<script src="resources/js/systemOs.js" type="text/javascript"></script>

<script type="text/javascript">
var errorcount=0;
$(function(){
	DWZ.init("/resources/dwz.frag.xml", {
		loginUrl:"/views/login_dialog.jsp", loginTitle:"登录",	
		statusCode:{ok:200, error:300, timeout:301}, 
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, 
		debug:false,	
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"resources/themes"}); 
		}
	});
	
	

	$("#loginout").click(function(){
		alertMsg.confirm('是否安全退出系统?', {
            okCall: function(){

				window.location.href="<%=basePath%>adminuser/loginout";
            }
      });
	});
	
	$.ajax({
		url:'<%=basePath%>userinfo/user_count',
		tpye:'POST',
			global:false,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
		success:function(msg){
				var a=msg.split(',');
			$(".msgs").html(a[0]);	
			$(".sum_count").html("<a href='javascript:void(0);'>会员总数:"+a[1]+"</a>");
		$(".vip_count").html("<a href='javascript:void(0);'>特权会员总数:"+a[2]+"</a>");
			$(".ordinary_count").html("<a href='javascript:void(0);'>普通会员总数:"+a[3]+"</a>");
			$(".online_count").html("<a href='javascript:void(0);'>在线会员总数:"+a[4]+"</a>");
			errorcount=0;
		},
		error:function(){
				if(errorcount>=5){
			var a="服务器失去响应，查询失败";
			$(".msgs").html(a);	
					$(".sum_count").html("<a href='javascript:void(0);'>会员总数:"+a+"</a>");
					$(".vip_count").html("<a href='javascript:void(0);'>特权会员总数:"+a+"</a>");
				$(".ordinary_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
					$(".online_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
					clearInterval(errorid);
				alertMsg.error("太平洋理财服务器失去响应，或已出现异常，请联系相关人员解决！");
			}else{
				var a="服务器失去响应，正在尝试第"+(errorcount+1)+"次查询";
				$(".msgs").html(a);
				$(".sum_count").html("<a href='javascript:void(0);'>会员总数:"+a+"</a>");
					$(".vip_count").html("<a href='javascript:void(0);'>特权会员总数:"+a+"</a>");
				$(".ordinary_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
					$(".online_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
					errorcount=errorcount+1;
			}
		}
	});
	
	
	var errorid=setInterval(function(){
		$.ajax({
			url:'<%=basePath%>userinfo/user_count',
			tpye:'POST',
 			global:false,
 			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			success:function(msg){
 				var a=msg.split(',');
 				$(".msgs").html(a[0]);
				$(".sum_count").html("<a href='javascript:void(0);'>会员总数:"+a[1]+"</a>");
			$(".vip_count").html("<a href='javascript:void(0);'>特权会员总数:"+a[2]+"</a>");
				$(".ordinary_count").html("<a href='javascript:void(0);'>普通会员总数:"+a[3]+"</a>");
				$(".online_count").html("<a href='javascript:void(0);'>在线会员总数:"+a[4]+"</a>");
				errorcount=0;
			},
			error:function(){
 				if(errorcount>=5){
				var a="服务器失去响应，查询失败";
				$(".msgs").html(a);
 					$(".sum_count").html("<a href='javascript:void(0);'>会员总数:"+a+"</a>");
 					$(".vip_count").html("<a href='javascript:void(0);'>特权会员总数:"+a+"</a>");
					$(".ordinary_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
 					$(".online_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
 					clearInterval(errorid);
					alertMsg.error("太平洋理财服务器失去响应，或已出现异常，请联系相关人员解决！");
				}else{
					var a="服务器失去响应，正在尝试第"+(errorcount+1)+"次查询";
					$(".msgs").html(a);
					$(".sum_count").html("<a href='javascript:void(0);'>会员总数:"+a+"</a>");
 					$(".vip_count").html("<a href='javascript:void(0);'>特权会员总数:"+a+"</a>");
					$(".ordinary_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
 					$(".online_count").html("<a href='javascript:void(0);'>普通会员总数:"+a+"</a>");
 					errorcount=errorcount+1;
				}
			}
 		});
	},60000);
 	var errorid_runtime=setInterval(function(){
 		$.ajax({
 			url:'<%=basePath%>/run_time/get_info', 
 			type:'POST',
 			global:false,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
 			success:function(msg){
				var a=msg.split('-');
 				$("#cpu_cout").html(a[0]+"个");
				$("#free_memory").html(a[1]+"M");
 				$("#total_memory").html(a[2]+"M");
 				$("#max_memory").html(a[3]+"M");
			},
 			error:function(msg){
 			}
		});
	},60000);
	
});
</script>
</head>

<body scroll="no" onload="systemOS.init();">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="/" target="_blank">标志</a>
				<ul class="nav">
					<li><a href="/userinfo/messagelist.htm" target="dialog" mask="true" width="620" height="470">未读信息总数:<span class="msgs"></span></a></li>
					<li class="online_count">
						<a href="javascript:void(0);">在线会员总数:</a>
						<img src="resources/img/load_img.gif" alt="在线会员总数" width="10" height="10" />
					</li>
					<li class="sum_count">
						<a href="javascript:void(0);">会员总数:</a>
						<img src="resources/img/load_img.gif" alt="会员总数" width="10" height="10" />
					</li>
					<li class="vip_count">
						<a href="javascript:void(0);" >特权会员总数:</a>
						<img src="resources/img/load_img.gif" alt="特权会员总数" width="10" height="10" />
					</li>
					<li class="ordinary_count">
						<a href="javascript:void(0);" >普通会员总数:</a>
						<img src="resources/img/load_img.gif" alt="普通会员总数" width="10" height="10"  />
					</li>
					<li><a href="/role/transit?pageName=/adminmanager/edit_pwd" target="dialog" mask="true" width="450">修改密码</a></li>
					<li><a href="javascript:void(0);" id="loginout">退出</a></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>太平洋理财</h2>
					</div>
					<div class="accordionContent">
						
						<ul class="tree treeFolder">
							<c:forEach items="${onemenulist}" var="onerolemenu">
								<li>
									<a>${onerolemenu.smenCaption }</a>
									<ul>
										<c:forEach items="${sendmenulist}" var="sendmenu">
											<c:if test="${onerolemenu.id==sendmenu.menu.id}">
												<li><a href="${sendmenu.resourceUrl}" target="navTab" rel="main${sendmenu.id }">${ sendmenu.smenCaption}</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div id="mainpage" class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>太平洋理财P2P投资管理平台</span></p>
							<p><a href="/" target="_blank">太平洋理财首页</a></p>
						</div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">

<div class="divider"></div>
<h2>系统异常信息:</h2>
<p>
	<noscript>
<font size="4" color="red">您的浏览器禁止了javascript脚本的执行！本系统已无法正常使用！请您到设置中允许javascript执行，然后再刷新本页面</font>
	</noscript>
</p>
	
<div class="divider"></div>
<h2>当前客户端系统信息</h2>

<p id="pc_info" style="width: 100%;height: 100px;">
</p>
<div class="divider"></div>
<h2>服务器资源情况</h2>
<pre style="margin:5px;line-height:1.4em">
CPU个数:<font id="cpu_cout">0个</font>
空闲内存:<font id="free_memory">0M</font>
总内存:<font id="total_memory">0M</font>
最大可用内存:<font id="max_memory">0M</font>
</pre>

	<div class="divider"></div>
						<h2>技术支持:太平洋理财</h2>
<pre style="margin:5px;line-height:1.4em;">
联系地址：广东省深圳市南山区桃园地铁口田厦国际中心B座2038
联系电话：0755-86707492
</pre>

						</div>
						
					</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2013 <a href="demo_page2.html" target="dialog">太平洋理财</a> </div>
</body>
</html>
