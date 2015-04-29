<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>太平洋理财会员中心-收藏列表</title>
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
				<!--vipLeft-->
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--End vipLeft-->

				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">收藏列表</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，下列收藏列表能为您快捷服务。
							</h1>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipCollectTable">
								<thead>
									<tr>
										<th>借款编号</th>
										<th>借款标题</th>
										<th>借款人</th>
										<th>借款金额</th>
										<th>年利化率</th>
										<th>借款期限</th>
										<th>还款方式</th>
										<th>投资进度</th>
										<th>收藏时间</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${collects}" var="collect" varStatus="no">
										<tr>
											<td>${no.index+1}</td>
											<td>${collect[2]}</td>
											<td>${collect[3]}</td>
											<td>￥
											<fmt:formatNumber
												value="${collect[4]}" pattern="##.##" minFractionDigits="2" />
											</td>
											<td><fmt:formatNumber
												value="${collect[5]}" pattern="##.##" />%</td>
											<td>${collect[6]}天</td>
											<td>
											<c:choose>
												<c:when test="${collect[7] eq 1}">按月等额本息</c:when>
												<c:when test="${collect[7] eq 2}">按月付息到期还本</c:when>
												<c:when test="${collect[7] eq 3}">到期一次性还本息</c:when>
											</c:choose>
											</td>
											<td>${collect[8]}%</td>
											<td>${collect[9]}</td>
											<td>
											<c:choose>
												<c:when test="${collect[8] eq 100}">
													<a>已完成</a>
												</c:when>
												<c:otherwise>
													<a href="loaninfo/getLoanInfo.htm?id=${collect[10]}">可投标</a>
												</c:otherwise>
											</c:choose>
											</td>
											<td><span><a href="javascript:deleteCollect(${collect[0]})">删除</a></span></td>
										</tr>
									</c:forEach>
									<c:if test="${empty collects}">
										<tr><td colspan="11">你还没有任何收藏！</td></tr>
									</c:if>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="11">
											<jsp:include page="/WEB-INF/views/member/communal/collet_page.jsp" />
										</td>
									</tr>
								</tfoot>
							</table>

						</form>
						<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />

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
</body>
</html>
