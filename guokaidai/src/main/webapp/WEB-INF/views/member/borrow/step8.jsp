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
<title>太平洋理财贷款平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script type="text/javascript" src="/resources/js/recharge.js"></script>

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
							<li><a href="javascript:void(0);" class="vipHeadLink">我要借款</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>通过提交您的审核记录，太平洋理财将进行初步审核。
							</h1>
						</div>
						<form>
							<div class="upDataStep curvyCorners_5">
								<a href="../borrow/forwardPersoninfo">个人资料</a> <a href="../borrow/forwardContact">联系方式</a> <a
									href="../borrow/forwardCompany">单位资料</a> <a href="../borrow/forwardFinanes">财务状况</a> <a href="../borrow/forwardOthercontact">联保情况</a> <a
									href="../borrow/forwardBusinessImg">商业图片</a> <a href="../borrow/forwardDataUpload">资料上传</a> <a class="stepLink">审核记录</a>
							</div>

							<table cellpadding="0" cellspacing="0" border="0"
								class="creditData">
								<tbody>
									<tr height="37" bgcolor="#f7f7f7">
								<td align="center" width="175">提交时间</td>
								<td align="center" width="155">审核状态</td>
								<td align="center" width="175">审核结果</td>
								<td align="center" width="225">最高借入额度(已审核)</td>
							</tr>
							<tr height="30">
								<td align="center">${borrower.committime }</td>
								<td align="center">
								<c:if test="${borrower.auditStatus==1}">未提交</c:if>
								<c:if test="${borrower.auditStatus==2}">未审核</c:if>
								<c:if test="${borrower.auditStatus==3}">正在审核</c:if>
								<c:if test="${borrower.auditStatus==4}">已审核</c:if>
								</td>
								<td align="center">
								<c:if test="${borrower.auditResult==0}">不通过</c:if>
								<c:if test="${borrower.auditResult==1}">通过</c:if>
								</td>
								<td align="center">${borrower.credit }</td>
							</tr>
								</tbody>
							</table>
						</form>
					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<!--End vipRight-->
	</div>
	<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
