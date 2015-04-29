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
<h1 class="vipContTitle"><span><img src="../resources/images/vipseversicon.png" /></span>通过提交您的单位资料，太平洋理财将进行初步审核。</h1>
</div>
<form action="../borrow/updateCompany" method="post" id="form-data-dwzl">
<div class="upDataStep curvyCorners_5">
<a href="../borrow/forwardPersoninfo">个人资料</a>
<a href="../borrow/forwardContact">联系方式</a>
<a class="stepLink">单位资料</a>
<a href="../borrow/forwardFinanes">财务状况</a>
<a href="../borrow/forwardOthercontact">联保情况</a>
<a href="../borrow/forwardBusinessImg">商业图片</a>
<a href="../borrow/forwardDataUpload">资料上传</a>
<a href="../borrow/forwardAuditRecord">审核记录</a>
</div>

<table cellpadding="0" cellspacing="0" border="0" class="creditData">
 <tbody>
							<input type="hidden" name="id" value="${company.id }" />
                      <tr height="35">
                        <td width="80" align="right">单位名称：</td>
                        <td style=" padding-left:5px;"><input id="companyName" name="companyName" type="text" value="${company.companyName }" class="credit" /></td>
                      </tr>
                      <tr height="35">
                        <td align="right">电话：</td>
                        <td style=" padding-left:5px;"><input id="companyPhone" name="companyPhone" type="text" value="${company.companyPhone }" class="credit validate[custom[phone]" style="width:165px;" /></td>
                      </tr>
                      <tr height="35">
                        <td width="80" align="right">地址：</td>
                        <td style=" padding-left:5px;"><input id="address" name="address" type="text" value="${company.address }" class="credit" style="width:430px;" /></td>
                      </tr>
                      <tr height="35">
                        <td align="right">工作年限：</td>
                        <c:if test="${empty company.workYear }">
                        <td>
                            <span class="check"><input type="radio" name="workYear" checked="checked" value="1年以下"/></span><label class="ch_label">1年以下</label>
                            <span class="check"><input type="radio" name="workYear" value="1-3年"/></span><label class="ch_label">1-3年</label>
                            <span class="check"><input type="radio" name="workYear" value="3-5年"/></span><label class="ch_label">3-5年</label>
                            <span class="check"><input type="radio" name="workYear" value="5-10年"/></span><label class="ch_label">5-10年</label>
                            <span class="check"><input type="radio" name="workYear" value="10年以上"/></span><label class="ch_label">10年以上</label>
                        </td>
                        </c:if>
                        <c:if test="${!empty company.workYear }">
                        <td>
                            <span class="check"><input type="radio" name="workYear" <c:if test="${company.workYear eq '1年以下' }">checked="checked" </c:if> value="1年以下"/></span><label class="ch_label">1年以下</label>
                            <span class="check"><input type="radio" name="workYear" <c:if test="${company.workYear eq '1-3年' }">checked="checked" </c:if> value="1-3年"/></span><label class="ch_label">1-3年</label>
                            <span class="check"><input type="radio" name="workYear" <c:if test="${company.workYear eq '3-5年' }">checked="checked" </c:if> value="3-5年"/></span><label class="ch_label">3-5年</label>
                            <span class="check"><input type="radio" name="workYear" <c:if test="${company.workYear eq '5-10年' }">checked="checked" </c:if> value="5-10年"/></span><label class="ch_label">5-10年</label>
                            <span class="check"><input type="radio" name="workYear" <c:if test="${company.workYear eq '10年以上' }">checked="checked" </c:if> value="10年以上"/></span><label class="ch_label">10年以上</label>
                        </td>
                        </c:if>
                      </tr>
                      <tr height="35">
                        <td align="right">证明人：</td>
                        <td style=" padding-left:5px;"><input id="referenceMan" name="referenceMan" type="text" value="${company.referenceMan }" class="credit" style="width:110px;" /></td>
                      </tr>
                      <tr height="35">
                        <td align="right">证明人手机：</td>
                        <td style=" padding-left:5px;"><input id="referencePhone" name="referencePhone" type="text" value="${company.referencePhone }" class="credit validate[custom[phone]" style="width:210px;" /></td>
                      </tr>
                      <c:if test="${borrower.auditResult != 1 ||  borrower.auditStatus != 4}">
                      </c:if>
 </tbody>
</table>
<div class="tableSetBntBox"><input type="submit" value="保存继续" /> <input type="button" value="跳过并继续" onclick="window.location='../borrow/forwardFinanes';" /></div>
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
			$("#form-data-dwzl").validationEngine({});
			
		})
	
	</script>
</body>
</html>
