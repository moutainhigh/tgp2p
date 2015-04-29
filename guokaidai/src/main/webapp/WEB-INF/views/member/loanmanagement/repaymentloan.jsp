<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-借款记录</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="resources/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="resources/js/global.js"></script>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<style>
.pag_div{height:40px;}
</style>
</head>
<body>
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/lhgcalendar.min.js"></script>
	<script type="text/javascript" src="resources/js/condition.js"></script>
	<script type="text/javascript" src="resources/js/loanSign/repayment.js"></script>
	<script type="text/javascript" src="resources/My97DatePicker/WdatePicker.js"></script>
	<!--End head-->

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
							<li><a href="loanManage/achieveLoan.htm">发标中借款</a></li>
							<li><a href="loanManage/repaymentLoanOpen.htm"
								class="vipHeadLink">还款中借款</a></li>
<!-- 							<li><a href="loanManage/overdueLoan.htm">逾期借款</a></li> -->
<!-- 							<li><a href="loanManage/hasTheRepaymentLoan.htm">已还款借款</a></li> -->
							<li><a href="loanManage/underwayLoan.htm">完成中借款</a></li>
						</ul>
					</div>



					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的还款中借款记录，敬请仔细审阅。
							</h1>
							<p>
								您目前尚未还款的借款总额是：<font>￥0.00</font>，共 <font>0</font> 笔还款中借款。
							</p>
						</div>
							<table cellpadding="0" cellspacing="0" class="vipQueries">
								<tbody>
									<tr>
										<th valign="top">快捷查询：</th>
										<td>
										<a class="QueriesLink"  value="0">全部</a>
										<a value="1">未来一月</a>
										<a value="3">未来三月</a>
										<a value="6">未来半年</a>
										
										</td>
									</tr>
									<tr>
										<th valign="top">自定义查询：</th>
										<td>时间从<input type="text" value="${beginTime}"
											name="beginTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
											class="QueriesDate" readonly="readonly" id="in11" />至<input
											type="text" value="${endTime}" name="endTime" class="QueriesDate" onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
											readonly="readonly" id="in12"/><input
											type="button" id="time" value="查询" class="QueriesBnt" />
										</td>
									</tr>
								</tbody>
							</table>
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
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</script>
	<!--End footer-->
</body>
</html>
