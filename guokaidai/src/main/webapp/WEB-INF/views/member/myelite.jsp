<%--    
创建时间：2014年4月11日上午10:22:25   
创 建 人：LiNing   
相关说明：   理财体验金页面
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财会员中心-理财体验金</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link type="text/css" rel="stylesheet" href="resources/css/elite.css?r=<%=Math.random()%>" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="resources/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.md5.js"></script>
<script type="text/javascript" src="resources/js/layer.min.js"></script>
<script type="text/javascript" src="resources/js/layer.min.js"></script>
<script type="text/javascript" src="resources/js/extend/layer.ext.js"></script>
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
  <li><a href="javascript:void(0);" class="vipHeadLink">理财体验金</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的理财体验金，请在有效期内领取收益。</h1>
</div>
	<div class="model-box wealth-items">
		<div class="items">
			<dl class="wealth-entry">
				<dt style="font-size:28px"><b>体验金额 </b><a href="javascript:;" class="icons yhelp ToolTips ToolTips ToolTipCol" data-text="用户可自由支配的理财体验金（不含已过期、投资中、已结算的）">帮助</a></dt>
				<dd><strong><ins style="font-size:24px;color:#475058">￥</ins><em id="availableElite" style="font-size:24px;color:#475058">
					<c:if test="${ elite.principal > 0}">
					<fmt:formatNumber value="${empty elite.principal ? '0.00':elite.principal}" pattern="0.00" />
						</c:if>
						<c:if test="${ elite.principal <= 0}">
							0.00
						</c:if>
						<c:if test="${empty elite.principal}">
							0.00
						</c:if>
				</em></strong></dd>
				<input type="hidden" id="availableEliteHidden" value="0.0">
			</dl>
			<dl class="wealth-entry">
				<dt><b>今日收益</b><a href="javascript:;" class="icons yhelp ToolTips ToolTips ToolTipCol" data-text="各项投资的当天收益之和">帮助</a></dt>
				<dd><strong><ins style="font-size:24px;color:#475058">￥</ins>
					<em id="todayInterest" style="font-size:24px;color:#475058">
					<c:if test="${ elite.day_earning > 0}">
						<fmt:formatNumber value="${empty elite.day_earning ? '0.00':elite.day_earning}" pattern="0.00" />
					</c:if>
					<c:if test="${ elite.day_earning <= 0}">
						0.00
					</c:if>
					<c:if test="${empty elite.day_earning}">
						0.00
					</c:if>
				</em></strong></dd>
				<input type="hidden" id="todayInterestHidden" value="0.00">
			</dl>
			<dl class="wealth-entry">
				<dt><b>待领取收益</b><a href="javascript:;" class="icons yhelp ToolTips ToolTips ToolTipCol" data-text="每笔体验金投资到期后，收益将成为待领取状态。用户领取成功后，将转入用户的有利网账户余额中">帮助</a></dt>
				<dd><strong><ins style="font-size:24px;color:#fc9b5e">￥</ins>
					<c:if test="${ elite.total_earning > 0}">
					<em id="expectInterest" style="font-size:24px;color:#fc9b5e" class="light-org">
					<fmt:formatNumber value="${empty elite.total_earning ? '0.00':elite.total_earning}" pattern="0.00" />
					</em>
					</c:if>
					<c:if test="${elite.total_earning<=0 }">
					<em id="expectInterest" style="font-size:24px;color:#fc9b5e" class="light-org">
						0.00
					</em>
					</c:if>
					<c:if test="${empty elite.total_earning}">
						<em id="expectInterest" style="font-size:24px;color:#fc9b5e" class="light-org">
							0.00
						</em>
					</c:if>
				</strong></dd>
				<input type="hidden" id="expectInterestHidden" value="0.00">
			</dl>
			<dl class="wealth-entry exbtn">
				<c:if test="${ elite.total_earning > 0}">
				<a href="javascript:;" class="gbtn gbtn-disabled" id="drawearning">领取收益</a>
				</c:if>
				<c:if test="${ elite.total_earning <= 0}">
					<a href="javascript:;" class="gbtn gbtn-disabled" style="background:#a1acb4;" id="drawearning0">领取收益</a>
				</c:if>
				<c:if test="${ empty elite.total_earning}">
					<a href="javascript:;" class="gbtn gbtn-disabled" style="background:#a1acb4;" id="drawearning0">领取收益</a>
				</c:if>
			</dl>
		</div>
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
<script type="text/javascript" src="resources/js/lhgcalendar.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#inp11').calendar({
			maxDate : '#inp12'
		});
		$('#inp12').calendar({
			minDate : '#inp11'
		});

		$("#drawearning0").click(function(){
			layer.msg('无可领取的收益', 2 );
		});
		$('#drawearning').click(function(){
			//密码文本
			layer.prompt({title: '请输入交易密码，并确认',type: 1}, function(pass){
				$.ajax({
					type:'post',
					url:'/member/getOldTradePwd',
					data:{
						oldpwd:$.md5(pass)
					},
					success:function(msg) {
						if (msg == "success") {
							$.ajax({
								type : 'post',
								url : '/elite/drawearnings',
								success : function(msg) {
									layer.msg('领取成功', 2 , 8);
									if (msg == '1') {
										$("#expectInterest").text("0.00");
										$("#drawearning").css("background","#a1acb4");
										$("#drawearning").unbind("click");
									}
								}
							});
						}else{
							layer.msg('交易密码输入错误', 2 );
						}
					}
				});
			});
		});
	});
</script>
</body>
</html>
