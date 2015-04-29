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
<link rel="stylesheet"
	href="../resources/css/validationEngine.jquery.css" type="text/css" />
	
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
								<span><img src="../resources/images/vipseversicon.png" /></span>通过提交您的联系方式，太平洋理财将进行初步审核。
							</h1>
						</div>
						<form action="../borrow/borrowercontant" method="post"
							id="form-data-lxfs">
							<div class="upDataStep curvyCorners_5">
								<a href="../borrow/forwardPersoninfo">个人资料</a>
								<a class="stepLink">联系方式</a> 
								<a href="../borrow/forwardCompany.htm">单位资料</a>
								<a href="../borrow/forwardFinanes.htm">财务状况</a>
								<a href="../borrow/forwardOthercontact.htm">联保情况</a> 
								<a href="../borrow/forwardBusinessImg.htm">商业图片</a> 
								<a href="../borrow/forwardDataUpload.htm">资料上传</a> 
								<a href="../borrow/forwardAuditRecord.htm">审核记录</a>
							</div>
							<%-- 							<input type="hidden" id="borrowerId" name="borrowersbase.id" value="${borrower.id}" /> --%>
							<%-- 							<input type="hidden" id="borrowerId" name="borrowersbase.qualifications" value="${borrower.qualifications}" /> --%>
							<input type="hidden" id="contactId" name="id"
								value="${contact.id}" />
							<table cellpadding="0" cellspacing="0" border="0"
								class="creditData">
								<tbody>
									<tr>
										<th>现居住地址：</th>
										<td><input id="newaddress" name="newaddress" type="text"
											value="${contact.newaddress }" class="credit"
											style="width: 250px" /></td>
									</tr>
									<tr>
										<th>住宅电话：</th>
										<td><input id="addressPhone" name="addressPhone"
											type="text" value="${contact.addressPhone }"
											class="credit validate[custom[phone]]" /></td>
									</tr>
									<tr>
										<th>第一联系人：</th>
										<td><input id="linkman1" name="linkman1" type="text"
											value="${contact.linkman1 }" class="credit" /></td>
									</tr>
									<tr>
										<th>关系：</th>
										<c:if test="${empty contact.relation1 }">
											<td><input type="radio" name="relation1"
												checked="checked" value="家庭成员" />家庭成员 <input type="radio"
												name="relation1" value="朋友" />朋友<input type="radio"
												name="relation1" value="商业伙伴" />商业伙伴</td>
										</c:if>
										<c:if test="${!empty contact.relation1 }">
											<td><input type="radio" name="relation1"
												<c:if test="${contact.relation1 eq '家庭成员' }">checked="checked"</c:if>
												checked="checked" value="家庭成员" />家庭成员 <input type="radio"
												name="relation1"
												<c:if test="${contact.relation1 eq '朋友' }">checked="checked"</c:if>
												value="朋友" />朋友<input type="radio" name="relation1"
												<c:if test="${contact.relation1 eq '商业伙伴' }">checked="checked"</c:if>
												value="商业伙伴" />商业伙伴</td>
										</c:if>
									</tr>
									<tr>
										<th>手机号码：</th>
										<td><input type="text" value="${contact.phone1 }"
											id="phone1" name="phone1"
											class="credit validate[custom[phone]]" /></td>
									</tr>
									<tr>
										<th>其他：</th>
										<td><input type="text" value="${contact.other1 }"
											id="other1" name="other1" class="credit" /></td>
									</tr>
									<tr>
										<th>第二联系人：</th>
										<td><input type="text" value="${contact.linkman2}"
											id="linkman2" name="linkman2" class="credit" /></td>
									</tr>
									<tr>
										<th>关系：</th>
										<c:if test="${empty contact.relation2 }">
											<td><input type="radio" name="relation2"
												checked="checked" value="家庭成员" /><label class="ch_label">家庭成员</label>
												<input type="radio" name="relation2" value="朋友" /><label
												class="ch_label">朋友</label> <input type="radio"
												name="relation2" value="商业伙伴" /><label class="ch_label">商业伙伴</label></td>
										</c:if>
										<c:if test="${!empty contact.relation2 }">
											<td><input type="radio" name="relation2"
												<c:if test="${contact.relation2 eq '家庭成员' }">checked="checked"</c:if>
												checked="checked" value="家庭成员" />家庭成员</label> <input type="radio"
												name="relation2"
												<c:if test="${contact.relation2 eq '朋友' }">checked="checked"</c:if>
												value="朋友" />朋友</label> <span class="check"><input
													type="radio" name="relation2"
													<c:if test="${contact.relation2 eq '商业伙伴' }">checked="checked"</c:if>
													value="商业伙伴" />商业伙伴</label></td>
										</c:if>
									</tr>
									<tr>
										<th>手机号码：</th>
										<td><input type="text" value="${contact.phone2 }"
											id="phone2" name="phone2"
											class="credit validate[custom[phone]" /></td>
									</tr>
									<tr>
										<th>其他：</th>
										<td><input type="text" value="${contact.other2 }"
											id="other2" name="other2" class="credit" /></td>
									</tr>
								</tbody>
							</table>
							<c:if
								test="${borrower.auditResult != 1 ||  borrower.auditStatus != 4}">
								<div class="tableSetBntBox">
									<input type="submit" value="保存继续" /> <input type="button"
										value="跳过并继续"
										onclick="window.location='../borrow/forwardCompany';" />
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
		$(function() {
			$("#form-data-lxfs").validationEngine({});

		})
	</script>
</body>
</html>
