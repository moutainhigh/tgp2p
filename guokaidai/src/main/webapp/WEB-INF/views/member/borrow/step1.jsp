<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
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
<link rel="stylesheet" type="text/css" href="../resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/vipcenter.css" />

<link rel="stylesheet" href="../resources/css/validationEngine.jquery.css"
	type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="../resources/js/global.js"></script>
<script type="text/javascript" src="../resources/js/recharge.js"></script>
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
								<span><img src="../resources/images/vipseversicon.png" /></span>通过提交您的详细个人资料，太平洋理财将进行初步审核。
							</h1>
						</div>
						<form action="../borrow/borrowerbase" method="post"
								id="form-data-grzl">
							<div class="upDataStep curvyCorners_5">
								<a class="stepLink">个人资料</a> <a href="../borrow/forwardContact">联系方式</a>
								<a href="../borrow/forwardCompany">单位资料</a> <a
									href="../borrow/forwardFinanes">财务状况</a> <a
									href="../borrow/forwardOthercontact">联保情况</a> <a
									href="../borrow/forwardBusinessImg">商业图片</a> <a
									href="../borrow/forwardDataUpload">资料上传</a> <a
									href="../borrow/forwardAuditRecord">审核记录</a>
							</div>

								<table cellpadding="0" cellspacing="0" border="0"
									class="creditData">
									<tbody>
										<input type="hidden" id="isCard"
											value="${userbasic.userrelationinfo.cardId }" />
										<input type="hidden" name="id" value="${borrower.id }" />
										<tr height="35">
											<td width="65" align="right">真实姓名：</td>
											<td style="padding-left: 5px;" id="realname">${userbasic.name }</td>
										</tr>
										<tr height="35">
											<td align="right">身份证号：</td>
											<td style="padding-left: 5px;" id="idcard">${fun:substring(userbasic.userrelationinfo.cardId,0,6)}********${fun:substring(userbasic.userrelationinfo.cardId,14,18) }</td>
										</tr>
										<tr height="35">
											<td align="right">年龄：</td>
											<td style="padding-left: 5px;" id="age">${age}</td>
										</tr>
										<tr height="35">
											<td align="right">手机号码：</td>
											<td style="padding-left: 5px;" id="phone">${userbasic.userrelationinfo.phone }</td>
										</tr>
										<tr height="35">
											<td align="right">性别：</td>
											<c:if test="${empty borrower.sex }">
												<td><span class="check"><input type="radio"
														name="sex" checked="checked" value="1" /></span><label
													class="ch_label">男士</label> <span class="check"><input
														type="radio" name="sex" value="0" /></span><label
													class="ch_label">女士</label></td>
											</c:if>
											<c:if test="${!empty borrower.sex }">
												<td><span class="check"><input type="radio"
														name="sex"
														<c:if test="${borrower.sex eq '1' }">checked="checked"</c:if>
														value="1" /></span><label class="ch_label">男士</label> <span
													class="check"><input type="radio" name="sex"
														<c:if test="${borrower.sex eq '0' }">checked="checked"</c:if>
														value="0" /></span><label class="ch_label">女士</label></td>
											</c:if>
										</tr>
										<tr height="35">
											<td align="right">婚姻状况：</td>
											<c:if test="${empty borrower.marryStatus }">
												<td><span class="check"><input type="radio"
														name="marryStatus" checked="checked" value="已婚" /></span><label
													class="ch_label">已婚</label> <span class="check"><input
														type="radio" name="marryStatus" value="未婚" /></span><label
													class="ch_label">未婚</label></td>
											</c:if>
											<c:if test="${!empty borrower.marryStatus }">
												<td><span class="check"><input type="radio"
														name="marryStatus"
														<c:if test="${borrower.marryStatus eq '已婚' }">checked="checked"</c:if>
														checked="checked" value="已婚" /></span><label class="ch_label">已婚</label>
													<span class="check"><input type="radio"
														name="marryStatus"
														<c:if test="${borrower.marryStatus eq '未婚' }">checked="checked"</c:if>
														value="未婚" /></span><label class="ch_label">未婚</label></td>
											</c:if>
										</tr>
										<tr height="35">
											<td align="right">最高学历：</td>
											<c:if test="${empty borrower.qualifications }">
												<td><span class="check"><input type="radio"
														name="qualifications" checked="checked" value="高中以下" /></span><label
													class="ch_label">高中以下</label> <span class="check"><input
														type="radio" name="qualifications" value="大专或本科" /></span><label
													class="ch_label">大专或本科</label> <span class="check"><input
														type="radio" name="qualifications" value="硕士或硕士以上" /></span><label
													class="ch_label">硕士或硕士以上</label></td>
											</c:if>
											<c:if test="${!empty borrower.qualifications }">
												<td><span class="check"><input type="radio"
														name="qualifications"
														<c:if test="${borrower.qualifications eq '高中以下' }">checked="checked"</c:if>
														value="高中以下" /></span><label class="ch_label">高中以下</label> <span
													class="check"><input type="radio"
														name="qualifications"
														<c:if test="${borrower.qualifications eq '大专或本科' }">checked="checked"</c:if>
														value="大专或本科" /></span><label class="ch_label">大专或本科</label> <span
													class="check"><input type="radio"
														name="qualifications"
														<c:if test="${borrower.qualifications eq '硕士或硕士以上' }">checked="checked"</c:if>
														value="硕士或硕士以上" /></span><label class="ch_label">硕士或硕士以上</label></td>
											</c:if>
										</tr>
										<tr height="35">
											<td align="right">月收入：</td>
											<c:if test="${empty borrower.income }">
												<td><span class="check"><input type="radio"
														name="income" checked="checked" value="5000以下" /></span><label
													class="ch_label">5000以下</label> <span class="check"><input
														type="radio" name="income" value="5000-10000" /></span><label
													class="ch_label">5000-10000</label> <span class="check"><input
														type="radio" name="income" value="10000-50000" /></span><label
													class="ch_label">10000-50000</label> <span class="check"><input
														type="radio" name="income" value="50000以上" /></span><label
													class="ch_label">50000以上</label></td>
											</c:if>
											<c:if test="${!empty borrower.income }">
												<td><span class="check"><input type="radio"
														name="income"
														<c:if test="${borrower.income eq '5000以下' }">checked="checked"</c:if>
														value="5000以下" /></span><label class="ch_label">5000以下</label> <span
													class="check"><input type="radio" name="income"
														<c:if test="${borrower.income eq '5000-10000' }">checked="checked"</c:if>
														value="5000-10000" /></span><label class="ch_label">5000-10000</label>
													<span class="check"><input type="radio"
														name="income"
														<c:if test="${borrower.income eq '10000-50000' }">checked="checked"</c:if>
														value="10000-50000" /></span><label class="ch_label">10000-50000</label>
													<span class="check"><input type="radio"
														name="income"
														<c:if test="${borrower.income eq '50000以上' }">checked="checked"</c:if>
														value="50000以上" /></span><label class="ch_label">50000以上</label></td>
											</c:if>
										</tr>
										<tr height="100">
											<td align="right" style="border: 0px;">个人描述：</td>
											<td style="border: 0px;" ><textarea cols="70" rows="8"
													class="descri" id="remark" name="remark">${borrower.remark }</textarea></td>
										</tr>
									</tbody>
								</table>
							<div class="tableSetBntBox">
								<input type="submit" value="保存继续" /> <input type="button"
									value="跳过并继续" onclick="window.location='../borrow/forwardContact';" />
							</div>
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
			$("#form-data-grzl").validationEngine({});
			
		})
	
	</script>
</body>
</html>
