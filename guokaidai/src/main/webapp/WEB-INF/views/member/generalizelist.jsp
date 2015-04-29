<%--    
创建时间：2014年2月19日下午4:37:04   
创 建 人：LiNing   
相关说明：   推广记录
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
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />

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
							<li><a href="generalize/generalize_list"
								<c:if test="${gen eq 'gen' }">class="vipHeadLink"</c:if>>我的推广</a></li>
							<%-- <li><a href="generalize/genmoney_list"
								<c:if test="${gen eq 'gmoney' }">class="vipHeadLink"</c:if>>推广奖励</a></li> --%>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox"
						<c:if test="${gen eq 'gmoney' }">style="display: none;"</c:if>>
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财会员，以下是您在太平洋理财的推广记录，敬请审阅！
							</h1>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipCollectTable">
								<thead>
									<tr>
										<th>推广编号</th>
										<th>推广日期</th>
										<th>被推广人用户名</th>
										<th>获得推广积分</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${generlist }" var="generlize" varStatus="status">
										<tr>
											<%-- <td>${generlize.id }</td> --%>
											<td>${status.index+1 }</td>
											<td>${fn:substring(generlize.adddate,0,10) }</td>
											<td>${generlize.uanme }</td>
											<td>5</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<c:if test="${fn:length(generlist)>0 }">
										<tr>
											<td colspan="4">
												<div class="tablePage">
													<span>共${page.totalCount}条${page.totalPage}页</span><span>当前第${page.pageNum}页</span><a
														href="#">首页</a><a href="#">上一页</a><a href="#">下一页</a><a
														href="#">尾页</a>跳转<input type="text" class="tabPageJumpTx" /><input
														type="button" value="确定" class="tabPageJumpBnt" />
												</div>
											</td>
										</tr>
									</c:if>
									<c:if test="${fn:length(generlist)<=0 }">
										<tr>
											<td colspan="4">
												<div>
													<span>没有您的推广记录</span>
												</div>
											</td>
										</tr>
									</c:if>
								</tfoot>
							</table>
						</form>
					</div>
					<!--End vipContBox-->

					<!--vipContBox-->
					<%-- <div class="vipContBox"
						<c:if test="${gen eq 'gen' }">style="display:none;"</c:if>>
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财会员，以下是您在太平洋理财的推广奖金记录，敬请审阅！
							</h1>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipCollectTable">
								<thead>
									<tr>
										<th>推广编号</th>
										<th>推广日期</th>
										<th>被推广人</th>
										<th>获奖积分</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gmoney }" var="genmoney">
										<tr>
											<td>${genmoney.id }</td>
											<td>${genmoney.userbasicsinfo.userName }</td>
											<td>${genmoney }</td>
											<td><fmt:formatNumber value="${genmoney.tgPoints }"
													pattern="0.00" /></td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<c:if test="${!empty gmoney && fn:length(gmoney)>0}">
										<tr>
											<td colspan="4">
												<div class="tablePage">
													<span>共${page.totalCount}条${page.totalPage}页</span><span>当前第${page.pageNum}页</span><a
														href="#">首页</a><a href="#">上一页</a><a href="#">下一页</a><a
														href="#">尾页</a>跳转<input type="text" class="tabPageJumpTx" /><input
														type="button" value="确定" class="tabPageJumpBnt" />
												</div>
											</td>
										</tr>
									</c:if>
									<c:if test="${empty gmoney || fn:length(gmoney)<=0}">
										<tr>
											<td colspan="4">
												<div>
													<span>没有您的奖金记录</span>
												</div>
											</td>
										</tr>
									</c:if>
								</tfoot>
							</table>
						</form>
						<br /> <br />

					</div> --%>
					<!--End vipContBox-->

				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->
		</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
