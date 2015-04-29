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
<title>太平洋理财会员中心-我的银行卡</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/My97DatePicker/WdatePicker.js"></script>
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
  <li><a href="javascript:void(0);" class="vipHeadLink">我的银行卡</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的资金统计，敬请仔细审阅：</h1>
<p>资金历史纪录了您各种交易产生的支出和收入的明细，请选择事件类型和时间，然后点击“查看”按钮浏览。</p>
</div>
<form action="<%=basePath%>expenses/myexpenses.htm" method="post" id="forminfo">
<table cellpadding="0" cellspacing="0" class="vipQueries">
<tbody>
 <tr><th valign="top">事件类型：</th>
 <td>
 <select name="typeId">
 <option value="">---- 不限 ----</option>
  <c:forEach items="${types}" var="type">
  	<option value="${type[0]}" <c:if test="${typeId eq type[0]}">selected</c:if>>${type[1]}</option>
  </c:forEach>
 </select>
  时间从<input type="text" name="beginTime" value="${beginTime}" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})" class="QueriesDate" readonly="readonly" id="in11"  />
  至<input type="text" name="endTime" value="${endTime}" class="QueriesDate" onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})" readonly="readonly" id="in12"/>
  <input type="submit" value="查询" class="QueriesBnt" />
 </td></tr>
</tbody>
</table>

<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
 <thead>
  <tr><th>日期</th><th>类型</th><th>支出</th><th>收入</th><th>余额</th><th>说明</th></tr>
 </thead>
 <tbody>
 <c:forEach items="${expenses}" var="expense">
  <tr>
  <td>${expense[1]}</td>
  <td>${expense[2]}</td>
  <td>￥<fmt:formatNumber value="${expense[3]}" pattern="0.00" /></td>
  <td>￥<fmt:formatNumber value="${expense[4]}" pattern="0.00" /></td>
  <td>￥<fmt:formatNumber value="${expense[5]}" pattern="0.00" /></td>
  <td>${expense[6]}</td>
  </tr>
 </c:forEach>
 <c:if test="${empty expenses}">
 	<tr><td colspan="6">暂时没有任何收支信息！</td></tr>
 </c:if>
 <tr><td colspan="6"><jsp:include page="/WEB-INF/views/member/communal/wr_page.jsp" /></td></tr>
 </tbody>
</table>
</form>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

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
	<script type="text/javascript">
		function jumpPage(pageNum){
			$("#pageNum").val(pageNum);
			$("#forminfo").submit();
		}
		function jumpPage2(){
			var pageNum=$("#pageNum").val();
			var re=/^[0-9]*[1-9][0-9]*$/;
			if(!re.test(pageNum)){
				ymPrompt.errorInfo('请输入大于0的整数!', 220, 160, '警告', null);
				return;
			}
			$("#forminfo").submit();
		}
	</script>
</body>
</html>
