<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>太平洋理财-客服中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<!--top-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--End top-->
	<!--Content-->
	<div class="Content">
		<div class="w960px" style="margin-top: 20px">
			<div style="height: 225px; position: relative">
				<span
					style="position: absolute; left: 55px; top: 30px; color: #0093d8; font-size: 22px; font-style: italic; line-height: 40px; font-weight: 600">欢迎光临太平洋理财互联网金融平台客服中心</span>
				<span
					style="position: absolute; left: 55px; top: 70px; color: #0093d8; font-size: 22px; font-style: italic; line-height: 40px; font-weight: 600">让客服满意是我们的最终标准</span>
				<span
					style="position: absolute; left: 58px; top: 115px; color: #585858; font-size: 20px; line-height: 40px">客服热线：${footer.phone }</span>
				<img width="960" src="/resources/images/img/servise.jpg" />
			</div>

			<div
				style="width: 960px; border: 1px solid #dddddd; margin-bottom: 30px">
				<div
					style="background: url('/resources/images/img/btn-1.gif') repeat-x scroll 0 0 #dbe8f1; height: 28px;">
					<h2
						style="font-size: 14px; font-weight: bold; height: 32px; line-height: 32px; font-family: Tahoma​, 宋体; color: #036; padding-left: 15px;">在线客服</h2>
				</div>
				<div>
					<table border="0" cellspacing="0"
						style="width: 960px; border-collapse: collapse; margin: 15px 0;"
						id="servicesList">
						<tbody>
							<c:if test="${(list)!= null && fn:length(list) > 0}">
							<tr>
								<c:forEach var="customerService" items="${list}"
									varStatus="index">
									
									<c:if test="${((index.count-1)%3)==0 && index.count!=1}">
									</tr>
									<tr>
										<td>
											<table width="320px" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr style="height: 25px;">
														<td width="160px" height="115px" align="center"
															rowspan="4"><img width="100px" height="100px"
															style="border: 1px solid #bad1de;"
															src="${customerService[4]}" /></td>
														<td>
															<div class="biaoti1"
																style="color: #425f9d; font-family: Tahoma​, 宋体; font-size: 14px; font-weight: bold; height: 28px; line-height: 28px; margin-top: 3px;">太平洋理财-${customerService[1]}</div>
														</td>
													</tr>
													<tr style="height: 25px;">
														<td style="color: #666; font-size: 12px;">QQ：${customerService[3]}</td>
													</tr>
													<tr style="height: 25px">
														<td align="left"><a target="_blank"
															href="http://wpa.qq.com/msgrd?v=3&uin=${customerService[3]}&site=qq&menu=yes"><img
																border="0"
																src="http://wpa.qq.com/pa?p=2:${customerService[3]}:41"
																alt="点击这里给我发消息" title="点击这里给我发消息" /></a></td>
													</tr>
													<tr style="height: 40px;">
														<td></td>
													</tr>
												</tbody>
											</table>
											<div style="height: 15px; overflow: hidden"></div>
										</td>
							</c:if>
							<c:if test="${((index.count-1)%3)!=0||index.count==1}">
								<td>
									<table width="320px" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr style="height: 25px;">
												<td width="160px" height="115px" align="center" rowspan="4">
													<img width="100px" height="100px"
													style="border: 1px solid #bad1de;"
													src="${customerService[4]}" />
												</td>
												<td>
													<div class="biaoti1"
														style="color: #425f9d; font-family: Tahoma​, 宋体; font-size: 14px; font-weight: bold; height: 28px; line-height: 28px; margin-top: 3px;">太平洋理财-${customerService[1]}</div>
												</td>
											</tr>
											<tr style="height: 25px;">
												<td style="color: #666; font-size: 12px;">QQ：${customerService[3]}</td>
											</tr>
											<tr style="height: 25px">
												<td align="left"><a target="_blank"
													href="http://wpa.qq.com/msgrd?v=3&uin=${customerService[3]}&site=qq&menu=yes"><img
														border="0"
														src="http://wpa.qq.com/pa?p=2:${customerService[3]}:41"
														alt="点击这里给我发消息" title="点击这里给我发消息" /></a></td>
											</tr>
											<tr style="height: 40px;">
												<td></td>
											</tr>
										</tbody>
									</table>
									<div style="height: 15px; overflow: hidden"></div>
								</td>
							</c:if>					
							</c:forEach>
							</tr>						
							</c:if>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script type="text/javascript"
		src="<%=basePath%>resources/js/autolist.js"></script>
	<!--End footer-->
</body>
</html>

