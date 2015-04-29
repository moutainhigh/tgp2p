<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 3.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财</title>

<link href="/resources/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="/resources/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="/resources/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="/resources/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="/resources/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="/resources/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/resources/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="/resources/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="/resources/dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="/resources/dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="/resources/dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="/resources/dwz/chart/raphael.js"></script>
<script type="text/javascript" src="/resources/dwz/chart/g.raphael.js"></script>
<script type="text/javascript" src="/resources/dwz/chart/g.bar.js"></script>
<script type="text/javascript" src="/resources/dwz/chart/g.line.js"></script>
<script type="text/javascript" src="/resources/dwz/chart/g.pie.js"></script>
<script type="text/javascript" src="/resources/dwz/chart/g.dot.js"></script>

<!--
<script src="/resources/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.print.js" type="text/javascript"></script>
-->

<script src="/resources/dwz/bin/dwz.min.js" type="text/javascript"></script>
<script src="/resources/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>

<%--第三方operamasks插件--%>
<link href="/resources/operamasks-ui/themes/default/operamasks-ui.css"  rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/resources/operamasks-ui/operamasks-ui.js"> </script>


<script type="text/javascript">
$(function(){
	DWZ.init("/resources/dwz/dwz.frag.xml", {
		loginUrl:"/resources/dwz/login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:true,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"/resources/dwz/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});

</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="<%=basePath %>">标志</a>
				<ul class="nav">
<%--					<li id="switchEnvBox"><a href="javascript:">（<span>北京</span>）切换城市</a>--%>
<%--						<ul>--%>
<%--							<li><a href="/resources/dwz/sidebar_1.html">北京</a></li>--%>
<%--							<li><a href="/resources/dwz/sidebar_2.html">上海</a></li>--%>
<%--							<li><a href="/resources/dwz/sidebar_2.html">南京</a></li>--%>
<%--							<li><a href="/resources/dwz/sidebar_2.html">深圳</a></li>--%>
<%--							<li><a href="/resources/dwz/sidebar_2.html">广州</a></li>--%>
<%--							<li><a href="/resources/dwz/sidebar_2.html">天津</a></li>--%>
<%--							<li><a href="/resources/dwz/sidebar_2.html">杭州</a></li>--%>
<%--						</ul>--%>
<%--					</li>--%>
<%--					--%>
					<li><a href="/resources/dwz/login.html">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!-- <li theme="red"><div>红色</div></li> -->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
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
						<h2><span>Folder</span>用户管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">


							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">会员管理</a></li>
							<li><a href="/adminuser/querypage" target="navTab" rel="jielist">借款人管理</a></li>
							<li><a href="/resources/dwz/tabsPage.html" target="navTab">用户管理</a>

								<ul>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">用户信息</a></li>
									<li><a href="javascript:void(0);" target="navTab" rel="page1">资料上传</a></li>
									<li><a href="/videobroadcast/videopage"  target="navTab" rel="videolist" >视频播报</a></li>
									<li><a href="/resources/dwz/demo_page1.html" target="navTab" rel="page1" fresh="false">替换页面一</a></li>
									<li><a href="/resources/dwz/demo_page2.html" target="navTab" rel="page2">页面二</a></li>
									<li><a href="/resources/dwz/demo_page4.html" target="navTab" rel="page3" title="页面三（自定义标签名）">页面三</a></li>
									<li><a href="/resources/dwz/demo_page4.html" target="navTab" rel="page4" fresh="false">测试页面（fresh="false"）</a></li>
									<li><a href="/resources/dwz/w_editor.html" target="navTab">表单提交会话超时</a></li>
									<li><a href="/resources/dwz/demo/common/ajaxTimeout.html" target="navTab">navTab会话超时</a></li>
									<li><a href="/resources/dwz/demo/common/ajaxTimeout.html" target="dialog">dialog会话超时</a></li>
									<li><a href="/resources/dwz/index_menu.html" target="_blank">横向导航条</a></li>
								</ul>
							</li>
							
							<li><a>产品管理</a>
								<ul>
									<li><a href="/resources/dwz/w_panel.html" target="navTab" rel="w_panel">面板</a></li>
									<li><a href="/resources/dwz/w_tabs.html" target="navTab" rel="w_tabs">选项卡面板</a></li>
									<li><a href="/resources/dwz/w_dialog.html" target="navTab" rel="w_dialog">弹出窗口</a></li>
									<li><a href="/resources/dwz/w_alert.html" target="navTab" rel="w_alert">提示窗口</a></li>
									<li><a href="/resources/dwz/w_list.html" target="navTab" rel="w_list">CSS表格容器</a></li>
									<li><a href="/resources/dwz/demo_page1.html" target="navTab" rel="w_table">表格容器</a></li>
									<li><a href="/resources/dwz/w_removeSelected.html" target="navTab" rel="w_table">表格数据库排序+批量删除</a></li>
									<li><a href="/resources/dwz/w_tree.html" target="navTab" rel="w_tree">树形菜单</a></li>
									<li><a href="/resources/dwz/w_accordion.html" target="navTab" rel="w_accordion">滑动菜单</a></li>
									<li><a href="/resources/dwz/w_editor.html" target="navTab" rel="w_editor">编辑器</a></li>
									<li><a href="/resources/dwz/w_datepicker.html" target="navTab" rel="w_datepicker">日期控件</a></li>
									<li><a href="/resources/dwz/demo/database/db_widget.html" target="navTab" rel="db">suggest+lookup+主从结构</a></li>
									<li><a href="/resources/dwz/demo/database/treeBringBack.html" target="navTab" rel="db">tree查找带回</a></li>
									<li><a href="/resources/dwz/demo/sortDrag/1.html" target="navTab" rel="sortDrag">单个sortDrag示例</a></li>
									<li><a href="/resources/dwz/demo/sortDrag/2.html" target="navTab" rel="sortDrag">多个sortDrag示例</a></li>
								</ul>
							</li>
									
							<li><a>资金管理</a>
								<ul>
									<li><a href="/fund/fundlist" target="navTab" rel="fundlist">资金统计</a></li>
									<li><a href="/resources/dwz/w_button.html" target="navTab" rel="w_button">按钮</a></li>
									<li><a href="/resources/dwz/w_textInput.html" target="navTab" rel="w_textInput">文本框/文本域</a></li>
									<li><a href="/resources/dwz/w_combox.html" target="navTab" rel="w_combox">下拉菜单</a></li>
									<li><a href="/resources/dwz/w_checkbox.html" target="navTab" rel="w_checkbox">多选框/单选框</a></li>
									<li><a href="/resources/dwz/demo_upload.html" target="navTab" rel="demo_upload">iframeCallback表单提交</a></li>
									<li><a href="/resources/dwz/w_uploadify.html" target="navTab" rel="w_uploadify">uploadify多文件上传</a></li>
								</ul>
							</li>
							<li><a>系统设置</a>
								<ul>
									<li><a href="/link/linkpage" target="navTab" rel="linklist">友情链接设置</a></li>
									<li><a href="/banner/bannerpage" target="navTab" rel="bannerlist">banner图片设置</a></li>
									<li><a href="/footer/getfooter" target="navTab" rel="footerlist">系统信息设置</a></li>
									<li><a href="/log/loglist" target="navTab" rel="loglist">日志管理</a></li>
									<li><a href="/test/index" target="navTab" rel="testlist">多个分页测试页面</a></li>
									<li><a href="/loanSign/index" target="navTab" rel="testlist">普通标</a></li>
								</ul>
							</li>
							<li><a>图表</a>
								<ul>
									<li><a href="/resources/dwz/chart/test/barchart.html" target="navTab" rel="chart">柱状图(垂直)</a></li>
									<li><a href="/resources/dwz/chart/test/hbarchart.html" target="navTab" rel="chart">柱状图(水平)</a></li>
									<li><a href="/resources/dwz/chart/test/linechart.html" target="navTab" rel="chart">折线图</a></li>
									<li><a href="/resources/dwz/chart/test/linechart2.html" target="navTab" rel="chart">曲线图</a></li>
									<li><a href="/resources/dwz/chart/test/linechart3.html" target="navTab" rel="chart">曲线图(自定义X坐标)</a></li>
									<li><a href="/resources/dwz/chart/test/piechart.html" target="navTab" rel="chart">饼图</a></li>
								</ul>
							</li>
							<li><a href="/resources/dwz/dwz.frag.xml" target="navTab" external="true">dwz.frag.xml</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>借款标管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/resources/dwz/tabsPage.html" target="navTab">标准产品</a>
								<ul>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品一</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品二</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品三</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品四</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品五</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品六</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">默认产品七</a></li>
								</ul>
							</li>
							<li><a href="/resources/dwz/tabsPage.html" target="navTab">定制产品</a>
								<ul>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">定制产品一</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">定制产品二</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">定制产品三</a></li>
									<li><a href="/adminuser/querypage" target="navTab" rel="userlist">定制产品四</a></li>
								</ul>
							</li>
							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">债券库</a></li>
							<li><a href="/resources/dwz/demo_page1.html" target="navTab" rel="demo_page1">查询我的客户</a></li>
							<li><a href="/resources/dwz/demo_page1.html" target="navTab" rel="demo_page2">表单查询页面</a></li>
							<li><a href="/resources/dwz/demo_page4.html" target="navTab" rel="demo_page4">表单录入页面</a></li>
							<li><a href="/resources/dwz/demo_page5.html" target="navTab" rel="demo_page5">有文本输入的表单</a></li>
							<li><a href="javascript:;">有提示的表单输入页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">选项卡和图形的页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">选项卡和图形切换的页面</a></li>
							<li><a href="javascript:;">左右两个互动的页面</a></li>
							<li><a href="javascript:;">列表输入的页面</a></li>
							<li><a href="javascript:;">双层栏目列表的页面</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>资金管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/recharge/list" target="navTab" rel="userlist">充值记录</a></li>
							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">提现记录</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>系统设置</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="javascript:;">栏目管理</a>
								<ul>
									<li><a href="/admincolum/queryAllTopics" target="navTab" rel="toplist">一级栏目管理</a></li>
									<li><a href="/admincolum/queryAllDeputysections" target="navTab" rel="deputysectionlist">二级栏目管理</a></li>
									<li><a href="/admincolum/queryAllDepuy1" target="navTab" rel="danyelist" fresh="false">单页内容管理</a></li>
									<li><a href="/admincolum/openArticles" target="navTab" rel="articlelist">文章管理</a></li>
									<li><a href="/video/open" target="navTab" rel="page3" title="视频维护">视频维护</a></li>
									<li><a href="/feedback/open" target="navTab" rel="feedbacelist" fresh="false">邮件反馈信息管理</a></li>
								</ul>
							</li>
							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">Banner图片</a></li>
							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">友情链接</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>管理员设置</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">用户管理</a></li>
							<li><a href="/adminuser/querypage" target="navTab" rel="userlist">角色权限管理</a></li>
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
							
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
				
				</div>
			</div>
		</div>

	</div>

	<div id="footer">技术支持：成都顶呱呱投资集团有限公司</div>

</body>
</html>
