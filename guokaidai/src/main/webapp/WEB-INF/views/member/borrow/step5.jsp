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
<h1 class="vipContTitle"><span><img src="../resources/images/vipseversicon.png" /></span>通过提交您的联保情况，太平洋理财将进行初步审核。</h1>
</div>
<form action="../borrow/updateOthercontact" method="post"
								id="form-data-lbqk">
<div class="upDataStep curvyCorners_5">
<a href="../borrow/forwardPersoninfo">个人资料</a>
<a href="../borrow/forwardContact">联系方式</a>
<a href="../borrow/forwardCompany">单位资料</a>
<a href="../borrow/forwardFinanes">财务状况</a>
<a class="stepLink">联保情况</a>
<a href="../borrow/forwardBusinessImg">商业图片</a>
<a href="../borrow/forwardDataUpload">资料上传</a>
<a href="../borrow/forwardAuditRecord">审核记录</a>
</div>

<table cellpadding="0" cellspacing="0" border="0" class="creditData">
 <tbody>
							<input type="hidden" id="othercontactId" name="id" value="${othercontact.id }" />
							<tr height="35">
								<td width="100" align="right">第一联系人：</td>
								<td><input type="text"" value="${othercontact.linkman1 }" name="linkman1" class="credit" id="linkman1"
									style="width: 155px;" /></td>
							</tr>
							<tr height="35">
								<td align="right">关系：</td>
								<c:if test="${empty othercontact.relation1 }">
								<td><span class="check"><input type="radio"
										name="relation1" value="家庭成员" checked="checked" /></span><label class="ch_label">家庭成员</label>
									<span class="check"><input type="radio" name="relation1" value="朋友" /></span><label
									class="ch_label">朋友</label> <span class="check"><input
										type="radio" name="relation1" value="商业伙伴" /></span><label class="ch_label">商业伙伴</label>
								</td>
								</c:if>
								<c:if test="${!empty othercontact.relation1 }">
								<td><span class="check"><input type="radio"
										name="relation1" value="家庭成员" <c:if test="${othercontact.relation1 eq '家庭成员' }">checked="checked"</c:if>  /></span><label class="ch_label">家庭成员</label>
									<span class="check"><input type="radio" name="relation1" value="朋友"<c:if test="${othercontact.relation1 eq '朋友' }">checked="checked"</c:if> /></span><label
									class="ch_label">朋友</label> <span class="check"><input
										type="radio" name="relation1" value="商业伙伴"<c:if test="${othercontact.relation1 eq '商业伙伴' }">checked="checked"</c:if> /></span><label class="ch_label">商业伙伴</label>
								</td>
								</c:if>
							</tr>
							<tr height="35">
								<td align="right">手机号码：</td>
								<td><input type="text" value="${othercontact.phone1 }" name="phone1" id="phone1" class="credit validate[custom[phone]"
									style="width: 240px;" /></td>
							</tr>
							<tr height="35">
								<td align="right">第二联系人：</td>
								<td><input type="text" value="${othercontact.linkman2 }" name="linkman2" id="linkman2" class="credit"
									style="width: 155px;" /></td>
							</tr>
							<tr height="35">
								<td align="right">关系：</td>
								<c:if test="${empty othercontact.relation2 }">
								<td><span class="check"><input type="radio"
										name="relation2" value="家庭成员" checked="checked" /></span><label class="ch_label">家庭成员</label>
									<span class="check"><input type="radio" name="relation2" value="朋友" /></span><label
									class="ch_label">朋友</label> <span class="check"><input
										type="radio" name="relation2" value="商业伙伴" /></span><label class="ch_label">商业伙伴</label>
								</td>
								</c:if>
								<c:if test="${!empty othercontact.relation2 }">
								<td><span class="check"><input type="radio"
										name="relation2" value="家庭成员" <c:if test="${othercontact.relation2 eq '家庭成员' }">checked="checked"</c:if>  /></span><label class="ch_label">家庭成员</label>
									<span class="check"><input type="radio" name="relation2" value="朋友"<c:if test="${othercontact.relation2 eq '朋友' }">checked="checked"</c:if> /></span><label
									class="ch_label">朋友</label> <span class="check"><input
										type="radio" name="relation2" value="商业伙伴"<c:if test="${othercontact.relation2 eq '商业伙伴' }">checked="checked"</c:if> /></span><label class="ch_label">商业伙伴</label>
								</td>
								</c:if>
							</tr>
							<tr height="35">
								<td align="right">手机号码：</td>
								<td><input type="text" value="${othercontact.phone2 }" name="phone2" id="phone2" class="credit validate[custom[phone]"
									style="width: 240px;" /></td>
							</tr>
                      
                      
 </tbody>
</table>
<c:if test="${borrower.auditResult != 1 ||  borrower.auditStatus != 4}">
	<div class="tableSetBntBox"><input type="submit" value="保存继续" /> <input type="button" value="跳过并继续" onclick="window.location='../borrow/forwardBusinessImg';" /></div>
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
			$("#form-data-lbqk").validationEngine({});
			
		})
	
	</script>
</body>
</html>
