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
</head>
<body>
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/lhgcalendar.min.js"></script>
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
							<li><a href="loanManage/repaymentLoanOpen.htm">还款中借款</a></li>
							<li><a href="loanManage/overdueLoan.htm" class="vipHeadLink">逾期借款</a></li>
							<li><a href="loanManage/hasTheRepaymentLoan.htm">已还款借款</a></li>
							<li><a href="loanManage/underwayLoan.htm">完成中借款</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的逾期借款记录，敬请仔细审阅。
							</h1>
							<p>
								您目前逾期借款总额是：<font>￥0.00</font>，共 <font>0</font> 笔逾期借款。
							</p>
						</div>
						<form action="loanManage/overdueLoan.htm" method="post">
							<table cellpadding="0" cellspacing="0" class="vipQueries">
								<tbody>
									<tr>
										<th valign="top">自定义查询：</th>
										<td>时间从<input type="text" value="${beginTime}"
											name="beginTime" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
											class="QueriesDate" readonly="readonly" id="in11" />至<input
											type="text" value="${endTime}" name="endTime" class="QueriesDate" onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
											readonly="readonly" id="in12"/><input
											type="submit" value="查询" class="QueriesBnt" />
										</td>
									</tr>
								</tbody>
							</table>

							<table cellpadding="0" cellspacing="0" border="0"
								class="vipSeversTable">
								<thead>
									<tr>
										<th>编号</th>
										<th>借款标题</th>
										<th>借款金额</th>
										<th>年化利率</th>
										<th>借款时间</th>
										<th>应还时间</th>
										<th>应还金额</th>
										<th>逾期天数</th>
										<th>违约金</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="overdue">
										<tr>
											<td>${overdue[0]}</td>
											<td>${overdue[1]}</td>
											<td>${overdue[3]}</td>
											<td><fmt:formatNumber value="${overdue[4]*100}"
													pattern="0.00" /> %</td>
											<td>${overdue[8]}</td>
											<td>${overdue[9]}</td>
											<td><fmt:formatNumber value="${overdue[10]}"
													pattern="0.00" /></td>
											<td>${overdue[11]}</td>
											<td><fmt:formatNumber value="${overdue[12]}"
													pattern="0.00" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<jsp:include page="/WEB-INF/views/member/communal/page.jsp" />
						</form>
						<br /> <br /> <br /> <br /> <br /> <br /> <br />
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
	<script type="text/javascript">
		function jumpPage(pageno, totalPage) {
			if (pageno<=0 || pageno>totalPage) {
				return;
			}
			var $begTime = $("#inp11").val();
			var $endTime = $("#inp12").val();
			$.ajax({
				type : 'post',
				url : 'loanManage/overdueLoan.htm',
				data : {
					begTime : $begTime,
					endTime : $endTime,
					no : pageno
				},
				success : function(msg) {
					$.html(msg);
					// 			window.location.href='/member_index/system_message?pageNum='+pageno;
				}
			});
		}
	</script>
	<!--End footer-->
</body>
</html>
