<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="${application_keyword.keywords}" http-equiv="keywords"/>
<meta content="${application_keyword.description}" http-equiv="description"/>
<title>太平洋理财会员中心-消息设置</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/vipcenter.css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<!--End head-->

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
  <li><a href="javascript:void(0);" class="vipHeadLink">消息设置</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="<%=basePath %>resources/images/vipseversicon.png" /></span>请勾选您所需要设置的消息提醒，短信提醒为特权用户专属通知，如您为一般用户，请<a href="<%=basePath%>userinfovip/upgrade.htm">[点击这里]</a>立即升级为特权用
户后，享用该项服务。</h1>
</div>
<form action="/update_info/update_messge" method="post" id="myform">
<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
 <thead>
  <tr><th>服务条款</th><th>系统消息</th><th>邮件提醒</th><th>短息提醒</th><th>操作</th></tr>
 </thead>
 <tbody>
  <c:forEach var="item" items="${list}" varStatus="s">
		<c:if test="${!empty vip}">
			<c:set var="all" value="${item[3] and item[4] and item[5]}" />
		</c:if>
		<c:if test="${empty vip}">
			<c:set var="all" value="${item[3] and item[4]}" />
		</c:if>
		<tr>
			<td width="154" class="all_l">${item[6]}</td>
			<td width="154" align="center"><input type="checkbox" class="message_check"
				 name="cbo_sys_${s.index}" value="1"
				<c:if test='${!empty item[3] and item[3]}'>checked</c:if> /></td>
			<td width="154" align="center"><input type="checkbox" class="message_check"
				 name="cbo_email_${s.index}" value="1"
				<c:if test='${!empty item[4] and item[4]}'>checked</c:if> /></td>
			<td width="154" align="center"><c:if
					test="${!empty vip and !empty user.userrelationinfo.phone}">
					<input type="checkbox"  name="cbo_msg_${s.index}" class="message_check"
						value="1"
						<c:if test='${!empty item[5] and item[5]}'>checked</c:if> />
				</c:if> <c:if test="${empty vip or empty user.userrelationinfo.phone}">
					<input type="checkbox" disabled="disabled" class="subBox1" />
				</c:if></td>
			<td width="154" align="center"><input type="hidden"	name="id_${s.index}" value="${item[1]}" />
				<span class="checkAll" style="cursor: pointer;"><c:if test="${all}">取消</c:if><c:if test="${!all}">全选</c:if></span>
			</td>
		</tr>
	</c:forEach>
 </tbody>
</table>
<div class="tableSetBntBox">
<input name="row" value="<%=((List)request.getAttribute("list")).size() %>" type="hidden"/>
 <input type="submit" value="提交更新" /><input type="reset" value="取消" />
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
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
<script src="/resources/js/messageseting.js" type="text/javascript"></script>
<!--End footer-->
</body>
</html>
