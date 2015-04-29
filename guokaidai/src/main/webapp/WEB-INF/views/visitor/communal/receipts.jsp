<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>
<link href="/resources/css/project.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/new.css" rel="stylesheet" type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<style>
.borrowDiv {
	float: left;width: 483px;border: 1px solid #e0e0e0;border-radius: 3px;opacity: .9;filter: alpha(opacity=90);
}
.borrowDiv:hover{
	opacity: 1;filter: alpha(opacity=100);
}
.borrowDiv .headSpan {
	display: block;height: 60px;border-radius: 3px 3px 0 0;font-size: 28px;color: #fff;line-height: 60px;text-align: center;text-shadow:1px 1px 1px #666;
}
.borrowDiv .centerDiv{
	height: 120px;border-bottom: 1px dotted #e0e0e0;margin:10px 15px;
}
.requirement{
	width:453px;height:120px;
}
.requirement li{
	float:left;height:30px;line-height:30px;font-size:16px;color:#727272;font-weight:500;margin-left:15px;
}
.shuoming .title{
	display:block;width:100px;height:25px;line-height:25px;font-size:15px;letter-spacing:4px;font-weight:500;text-shadow:0px 0px 0px #666;float:left
}
.shuoming .jked{
	display:block;width:250px;height:25px;line-height:25px;font-size:14px;color:#c45856;float:left;
}
.shuoming .jkqx{
	display:block;width:250px;height:25px;line-height:25px;font-size:14px;color:#666;float:left;margin-left:2px;
}
.shuoming .shsj{
	display:block;width:160px;height:25px;line-height:25px;font-size:14px;color:#666;float:left;margin-left:5px;
}
.shuoming .jknll{
	display:block;width:70px;height:25px;line-height:25px;font-size:14px;color:#c27f55;float:left;margin-left:10px;
}
.shuoming .title2{
	display:block;width:350px;height:25px;line-height:25px;font-size:16px;color:#666;text-shadow:0px 0px 0px #666;float:left;margin-left:20px;
}
.shuoming .myhke{
	display:block;width:350px;height:25px;line-height:25px;font-size:13px;color:#777;float:left;margin-left:18px;
}
.shuoming .qcfwf{
	display:block;width:130px;height:20px;line-height:20px;font-size:13px;color:#4676b4;float:left;margin-left:20px;
}
.credit-levels {
	width:306px;height:30px;background-image:url(/resources/images/img/credit-levels.png);float:left;
}
.fwfl{
	display:block;height:39px;line-height:39px;font-size:14px;color:#777;float:left;
}
</style>
</head>
<body>
	<!--mainBox-->
	<div class="mainBox">
		<!--header-->
		<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
		<!-- <script type="text/javascript" src="/resources/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="/resources/js/highcharts.js"></script>
		<script type="text/javascript" src="/resources/js/exporting.js"></script>
		<script type="text/javascript" src="/resources/js/data.js"></script>
		<script type="text/javascript" src="/resources/js/receipts.js"></script> -->
		<!--End header-->

		<div style="width:1000px;margin:20px auto 20px auto;background:#fff">
			<div class="borrowDiv" style="margin-right:30px;">
				<span class="headSpan" style="background: #ECA83C;"> 太平洋宝 </span>
				<div class="centerDiv">
					<span style="display:block;width:453px;height:30px;line-height:30px;font-size:22px;color:#ca7c00;text-align:center;font-weight:500;">
						申请条件
					</span>
					<ul class="requirement" style="margin-top:10px">
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />22-55周岁的中国公民</li>
						<li style="width:180px;"><img src="/resources/images/img/li.jpg" style="float:left" />月收入2000以上</li>
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />在现单位工作满三个月</li>
					</ul>
				</div>
				<div class="centerDiv">
					<span style="display:block;width:453px;height:30px;line-height:30px;font-size:22px;color:#ca7c00;text-align:center;font-weight:500;">
						必要申请资料
					</span>
					<ul class="requirement" style="margin-top:10px">
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />个人信用报告</li>
						<li style="width:180px;"><img src="/resources/images/img/li.jpg" style="float:left" />身份证</li>
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />近3个月工资卡银行流水</li>
						<li style="width:180px;"><img src="/resources/images/img/li.jpg" style="float:left" />劳动合同或在职证明</li>
					</ul>
				</div>
				<div style="width:316px;">
					<a href="to/single-3-71.htm" style="width:185px;height:40px;">
						<span style="display:block;width:185px;height:40px;line-height:40px;background-color:#ECA83C;border-radius:5px;text-align:center;margin:30px 0 40px 149px;font-size:18px;color:#fff;text-shadow:1px 0px 1px #666">
							立即申请
						</span>
					</a>
				</div>
			</div>
			<div class="borrowDiv" style="margin-right:0px;">
				<span class="headSpan" style="background: #2e9fdf;"> 转盈宝 </span>
				<div class="centerDiv">
					<span style="display:block;width:453px;height:30px;line-height:30px;font-size:22px;color:#0083cb;text-align:center;font-weight:500;">
						申请条件
					</span>
					<ul class="requirement" style="margin-top:10px">
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />22-55周岁的中国公民</li>
						<li style="width:180px;"><img src="/resources/images/img/li.jpg" style="float:left" />申请人限于法人代表</li>
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />企业经营时间满一年</li>
					</ul>
				</div>
				<div class="centerDiv">
					<span style="display:block;width:453px;height:30px;line-height:30px;font-size:22px;color:#0083cb;text-align:center;font-weight:500;">
						必要申请资料
					</span>
					<ul class="requirement" style="margin-top:10px">
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />个人信用报告</li>
						<li style="width:180px;"><img src="/resources/images/img/li.jpg" style="float:left" />身份证</li>
						<li style="width:230px;"><img src="/resources/images/img/li.jpg" style="float:left" />近6个月常用银行卡流水</li>
						<li style="width:180px;"><img src="/resources/images/img/li.jpg" style="float:left" />经营证明</li>
					</ul>
				</div>
				<div style="width:316px;">
					<a href="to/single-3-72.htm" style="width:185px;height:40px;">
						<span style="display:block;width:185px;height:40px;line-height:40px;background-color:#3b8bd4;border-radius:5px;text-align:center;margin:30px 0 40px 149px;font-size:18px;color:#fff;text-shadow:1px 0px 1px #666">
							立即申请
						</span>
					</a>
				</div>
			</div>

			<div class="clear"></div>
		</div>
		
		<div class="shuoming" style="width:1000px;height:155px;margin:20px auto 20px auto;border:1px solid #e0e0e0;background:#fff">
			<div style="width:1000px;height:45px;border-bottom:1px solid #e0e0e0">
				<span id="jkfsSpan" style="display:block;width:498px;height:45px;line-height:45px;border-right:1px solid #e0e0e0;float:left;text-align:center;font-size:19px;font-weight:500;color:#666;text-shadow: 0px 0px 0px #666;cursor: pointer;">
					借款方式<img src="/resources/images/img/down.jpg" align="absmiddle" />
				</span>
				<span id="fysmSpan" style="display:block;width:499px;height:45px;line-height:45px;float:left;text-align:center;font-size:19px;font-weight:500;color:#666;text-shadow: 0px 0px 0px #666;cursor: pointer;">
					费用说明<img src="/resources/images/img/right.jpg" align="absmiddle" />
				</span>
			</div>
			<div style="width:973px;height:60px;margin:20px 0 0 25px;" class="jkfs">
				<div style="width:375px;height:55px;float:left;border-right:1px solid #e0e0e0">
					<span class="title">借款额度</span>
					<span class="jked">￥3,000-500,000</span>
					<span class="title">借款期限</span>
					<span class="jkqx">3、6、9、12、15、18、24个月</span>
				</div>
				<div style="width:275px;height:55px;float:left;border-right:1px solid #e0e0e0;margin-left:40px">
					<span class="title">审核时间</span>
					<span class="shsj">1-5个工作日</span>
					<span class="title">还款方式</span>
					<span class="shsj">等额本息，每月还款</span>
				</div>
				<div style="width:200px;height:55px;float:left;margin-left:40px">
					<span class="title">借款年利率</span>
					<span class="jknll">12%-15.6%</span>
				</div>
			</div>
			
			<div style="width:973px;height:60px;margin:20px 0 0 25px;display:none" class="fysm">
				<div style="width:375px;height:80px;float:left;">
					<span class="title2">每月还款额</span>
					<span class="myhke"><img src="/resources/images/img/span.jpg" align="absmiddle" />&nbsp;本金及利息支付给理财人</span>
					<span class="myhke"><img src="/resources/images/img/span.jpg" align="absmiddle" />&nbsp;借款管理费由太平洋理财平台收取，借款本金的<font color="#ce8002">0.3%</font></span>
					<span></span>
				</div>
				<div style="width:1px;height:55px;float:left;background:#e0e0e0"></div>
				<div style="width:587px;height:80px;float:left;margin-left:10px">
					<div style="width:150px;height:50px;float:left;margin-top:10px;">
						<span class="title2">期初服务费</span>
						<span class="qcfwf">由太平洋理财平台收取：</span>
					</div>
					<div style="width:410px;height:79px;float:left;">
						<div style="width:410px;height:39px;border-bottom:1px solid #e0e0e0">
							<span style="display:block;width:70px;height:35px;line-height:35px;float:left;font-size:13px">
								信用等级
							</span>
							<div class="credit-levels"></div>
						</div>
						<div style="width:410px;height:39px">
							<span style="display:block;width:76px;height:35px;line-height:35px;float:left;font-size:13px">
								服务费率
							</span>
							<span class="fwfl" style="width:45px;">0%</span>
							<span class="fwfl" style="width:43px;">1%</span>
							<span class="fwfl" style="width:50px;">1.5%</span>
							<span class="fwfl" style="width:43px;">2%</span>
							<span class="fwfl" style="width:49px;">2.5%</span>
							<span class="fwfl" style="width:46px;">3%</span>
							<span class="fwfl" style="width:45px;">5%</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		$("#jkfsSpan").click(function(){
			if($(".jkfs").css("display")=="none"){
				$(".jkfs").css("display","block");
				$(".fysm").css("display","none");
				$(this).find("img").attr("src","/resources/images/img/down.jpg");
				$("#fysmSpan").find("img").attr("src","/resources/images/img/right.jpg");
			}
		});
		$("#fysmSpan").click(function(){
			if($(".fysm").css("display")=="none"){
				$(".fysm").css("display","block");
				$(".jkfs").css("display","none");
				$(this).find("img").attr("src","/resources/images/img/down.jpg");
				$("#jkfsSpan").find("img").attr("src","/resources/images/img/right.jpg");
			}
		});
		</script>
		<!-- 合作伙伴 -->
		<div class="hezuo" style="margin-bottom:30px">
			<div
				style="width: 1000px; height: 50px; border-bottom: 1px solid #ddd">
				<span style="display: block; height: 35px; float: left; font-size: 18px; font-weight: bold; color: #003366; line-height: 35px; margin-left: 10px; margin-top: 7px;padding-left: 5px;background-color: #E74A3B;width: 79px;">合作伙伴</span>
				<%-- <span
					style="display: block; height: 50px; float: right; line-height: 50px; margin-right: 10px;">
					<a style="font-size: 14px; color: #164674;">更多&gt;</a>
				</span> --%>
			</div>
	            <%--<div class="move" style="margin: 10px 0;">
				<ul style="margin: 15px;">
				<c:forEach items="${application_link}" var="link">
					<c:if test="${link.type eq 1 && link.isShow eq 1 }">
						<li><a href="${link.url }" target="_blank"><img src="${link.verifyImg }" alt="${link.name }"></img> </a></li>
					</c:if>
				</c:forEach>
				</ul>
			</div> --%>
			<div class="move" id="demo">
			<table>
				<tr>
				<td id="item1">
				<table>
				<tr>
				<c:forEach items="${application_link}" var="link">
					<c:if test="${link.type eq 1 && link.isShow eq 1 }">
						<td><a href="${link.url }" target="_blank"><img style="height:40px;" src="${link.verifyImg }" alt="${link.name }"></img> </a></td>
					</c:if>
				</c:forEach>
				</tr>	
				</table>
				</td>	
				<td id="item2"></td>
				<td id="item3"></td>
				</tr>
			</table>
			</div>
				<script language="javascript" type="text/javascript">
					var demo = document.getElementById("demo");
					var demo1 = document.getElementById("item1");
					var demo2 = document.getElementById("item2");
					var demo3 = document.getElementById("item3");
					var speed=20;    //数值越大滚动速度越慢
					demo2.innerHTML = demo1.innerHTML;
					demo3.innerHTML = demo1.innerHTML;
					function Marquee(){
					    if(demo3.offsetWidth-demo.scrollLeft<=0)
					        demo.scrollLeft-=demo1.offsetWidth;
					    else{
					        demo.scrollLeft++;
					    }
					}
					var MyMar = setInterval(Marquee,speed);
					demo.onmouseover = function(){clearInterval(MyMar);};
					demo.onmouseout = function(){MyMar = setInterval(Marquee,speed);};
				</script>		
		</div>
		</div>
	
		<%--<div
			style="width: 1000px; height: 50px; margin: 0 auto; padding: 10px 0">
			<a href="javascript:void(0)"><img
				src="resources/images/img/bottom1.jpg" /></a><a href=""><img
				src="resources/images/img/bottom2.jpg" /></a><a href=""><img
				src="resources/images/img/bottom3.jpg" /></a><a href=""><img
				src="resources/images/img/bottom4.jpg" /></a><a href=""><img
				src="resources/images/img/bottom5.jpg" /></a>
		</div>
		--%>
		<div class="clear"></div>
		<!--footer-->
		<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
		<!--End footer-->
		<div class="clear"></div>
	</div>
	<!--End mainBox-->
</body>
</html>