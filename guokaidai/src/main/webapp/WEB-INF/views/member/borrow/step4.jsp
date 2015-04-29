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
	<link rel="stylesheet" href="../resources/css/validationEngine.jquery.css"
	type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="/resources/js/global.js"></script>
<script type="text/javascript" src="/resources/js/recharge.js"></script>
<script src="/resources/js/jquery.validationEngine.js"
	type="text/javascript"></script>
	<script src="/resources/js/jquery.validationEngine-zh_CN.js"
	type="text/javascript"></script>
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
								<span><img src="../resources/images/vipseversicon.png" /></span>通过提交您的财务状况，太平洋理财将进行初步审核。
							</h1>
						</div>
						<form action="../borrow/updateFinanes" method="post"
								id="form-data-czzk">
							<div class="upDataStep curvyCorners_5">
								<a href="../borrow/forwardPersoninfo">个人资料</a> <a href="../borrow/forwardContact" >联系方式</a> <a
									href="../borrow/forwardCompany">单位资料</a> <a class="stepLink">财务状况</a> <a href="../borrow/forwardOthercontact">联保情况</a> <a
									href="../borrow/forwardBusinessImg">商业图片</a> <a href="../borrow/forwardDataUpload">资料上传</a> <a href="../borrow/forwardAuditRecord">审核记录</a>
							</div>

							<table cellpadding="0" cellspacing="0" border="0"
								class="creditData">
								<tbody>
							<input type="hidden" id="finanesId" name="id"
								value="${finanes.id }" />
							<tr height="35">
								<td width="100" align="right">月收入：</td>
								<td style="padding-left: 5px;"><input type="text"
									id="income" name="income" value="<fmt:formatNumber value="${finanes.income }" pattern="#0" />" class="credit validate[custom[integerNullZero]]"
									style="width: 155px;" /></td>
							</tr>
							<tr height="120">
								<td align="right">收入构成描述：</td>
								<td style="padding-left: 5px;"><textarea cols="70" rows="8" name="incomeRemark"
										id="incomeRemark">${finanes.incomeRemark }</textarea></td>
							</tr>
							<tr height="35">
								<td align="right">月均支出：</td>
								<td style="padding-left: 5px;"><input type="text" id="pay" name="pay"
									value="<fmt:formatNumber value="${finanes.pay }" pattern="#0" />" class="credit validate[custom[integerNullZero]]" style="width: 155px;" /></td>
							</tr>
							<tr height="120">
								<td align="right">支出构成描述：</td>
								<td style="padding-left: 5px;"><textarea cols="70" rows="8" name="payRemark"
										id="payRemark">${finanes.payRemark }</textarea></td>
							</tr>
							<tr height="35">
								<td align="right">住房条件：</td>
								<c:if test="${empty finanes.housecondition }">
									<td><span class="check"><input type="radio"
											name="housecondition" checked="checked" value="有商品房"/></span><label
										class="ch_label">有商品房</label> <span class="check"><input
											type="radio" name="housecondition" value="有其他(非商品房)" /></span><label class="ch_label">有其他(非商品房)</label>
										<span class="check"><input type="radio"
											name="housecondition" value="无房" /></span><label class="ch_label">无房</label></td>
								</c:if>
								<c:if test="${!empty finanes.housecondition }">
									<td><span class="check"><input type="radio"
											name="housecondition"
											<c:if test="${finanes.housecondition eq '有商品房' }">checked="checked"</c:if>
											value="有商品房" /></span><label class="ch_label">有商品房</label> <span
										class="check"><input type="radio" name="housecondition"
											<c:if test="${finanes.housecondition eq '有其他(非商品房)' }">checked="checked"</c:if>
											value="有其他(非商品房)" /></span><label class="ch_label">有其他(非商品房)</label>
										<span class="check"><input type="radio"
											name="housecondition"
											<c:if test="${finanes.housecondition eq '无房' }">checked="checked"</c:if>
											value="无房" /></span><label class="ch_label">无房</label></td>
								</c:if>
							</tr>
							<tr height="35">
								<td align="right">房产价值：</td>
								<td style="padding-left: 5px;"><input type="text"
									id="propertyValue" value="<fmt:formatNumber value="${finanes.propertyValue }" pattern="#0" />" name="propertyValue"
									class="credit validate[custom[integerNullZero]]" style="width: 155px;" /></td>
							</tr>
							<tr height="35">
								<td align="right">是否购车：</td>
								<c:if test="${empty finanes.isbuycar }">
									<td><span class="check"><input type="radio"
											name="isbuycar" checked="checked" value="是" /></span><label class="ch_label">是</label>
										<span class="check"><input type="radio" name="isbuycar" value="否" /></span><label
										class="ch_label">否</label></td>
								</c:if>
								<c:if test="${!empty finanes.isbuycar }">
									<td><span class="check"><input type="radio"
											name="isbuycar"
											<c:if test="${finanes.isbuycar eq '是'}">checked="checked"</c:if>
											value="是" /></span><label class="ch_label">是</label> <span
										class="check"><input type="radio" name="isbuycar"
											<c:if test="${finanes.isbuycar eq '否'}">checked="checked"</c:if>
											value="否" /></span><label class="ch_label">否</label></td>
								</c:if>
							</tr>
							<tr height="35">
								<td align="right">车辆价值：</td>
								<td style="padding-left: 5px;"><input type="text" name="carValue"
									id="carValue" value="<fmt:formatNumber value="${finanes.carValue }" pattern="#0" />" class="credit validate[custom[integerNullZero]]"
									style="width: 155px;" /></td>
							</tr>
							<tr height="35">
								<td align="right">参股企业名称：</td>
								<td style="padding-left: 5px;"><input type="text"
									id="companyName" value="${finanes.companyName }" name="companyName"
									class="credit " /></td>
							</tr>
							<tr height="35">
								<td align="right">参股企业出资额：</td>
								<td style="padding-left: 5px;"><input type="text" name="companyPayMoney"
									id="companyPayMoney" value="<fmt:formatNumber value="${finanes.companyPayMoney }" pattern="#0" />"
									class="credit validate[custom[integerNullZero]]" style="width: 155px;" /></td>
							</tr>
							<tr height="120">
								<td align="right">其他资产描述：</td>
								<td style="padding-left: 5px;"><textarea cols="70" rows="8" name="otherPropertyDescribe"
										id="otherPropertyDescribe">${finanes.otherPropertyDescribe }</textarea></td>
							</tr>
								</tbody>
							</table>
							<c:if test="${borrower.auditResult != 1 ||  borrower.auditStatus != 4}">
								<div class="tableSetBntBox">
									<input type="submit" value="保存继续" /> <input type="button"
										value="跳过并继续" onclick="window.location='borrow/forwardOthercontact';" />
								</div>
							</c:if>
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
	<script>
	
		$(function(){
			$("#form-data-czzk").validationEngine({});
			
		})
	
	</script>
</body>
</html>
