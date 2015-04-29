<%--    
创建时间：2014年2月19日下午4:37:04   
创 建 人：LiNing   
相关说明：   推广收益
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财会员中心-推广方式</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/jquery-1.8.2.min.js"></script>
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
							<li><a href="generalize/generalize_list">我的收益</a></li>
							<%--
							<li>
							<a href="generalize/genmoney_list"
								<c:if test="${gen eq 'gmoney' }">class="vipHeadLink"</c:if>>推广奖励</a>
							</li>
							--%>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox" >
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财会员，以下是您在太平洋理财的推广所产生的收益记录，敬请审阅！
							</h1>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0" class="vipCollectTable">

								<thead>
									<tr>
										<td colspan="4" align="left">推广收益</td>
									</tr>
									<tr>
										<th>编号</th>
										<th>收益月份</th>
										<th>收益金额</th>
										<th>详情</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${earnings }" var="earning" varStatus="status">
									<tr>
										<%-- <td>${generlize.id }</td> --%>
										<td>${status.index+1 }</td>
										<td>${earning.month}</td>
										<td>￥${earning.total}</td>
										<td><a class="detail_info" month="${earning.month}" cat="1">查看</a></td>
									</tr>
									</c:forEach>
								</tbody>
								<c:if test="${fn:length(earnings)<=0 }">
								<tfoot>
									<tr>
										<td colspan="4">
											<div>
												<span>没有您的推广收益记录</span>
											</div>
										</td>
									</tr>
								</tfoot>
								</c:if>
							</table>
							<br/>
							<table cellpadding="0" cellspacing="0" border="0" class="vipCollectTable">
								<thead>
								<tr>
									<td colspan="4" align="left">受邀请收益</td>
								</tr>
								<tr>
									<th>编号</th>
									<th>收益月份</th>
									<th>收益金额</th>
									<th>详情</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${invite_earnings }" var="inv_earning" varStatus="status">
									<tr>
										<td>${status.index+1 }</td>
										<td>${inv_earning.month}</td>
										<td>￥${inv_earning.total}</td>
										<td><a class="detail_info" month="${inv_earning.month}" cat="2">查看</a></td>
									</tr>
								</c:forEach>
								</tbody>
								<c:if test="${fn:length(invite_earnings)<=0 }">
									<tfoot>
									<tr>
										<td colspan="4">
											<div>
												<span>没有受邀请收益记录</span>
											</div>
										</td>
									</tr>
									</tfoot>
								</c:if>
							</table>


						</form>
					</div>
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->
		</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script type="text/javascript">
		$(".detail_info").each(function(){
			 $(this).click(function(){
				 var m = $(this).attr("month")
				 var c = $(this).attr("cat")
				 $.layer({
					 type: 2,
					 shadeClose: true,
					 title: false,
					 closeBtn: [0, false],
					 shade: [0.8, '#000'],
					 border: [0],
					 offset: ['200px',''],
					 area: ['750px', ($(window).height() - 500) +'px'],
					 iframe: {src: '/earnings/detail?month='+m +'&type='+c}
				 });
			 });
		});
	</script>
</body>
</html>