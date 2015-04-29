<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.pag_div ul{margin-right:25px;}
</style>
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
<!-- 							<li><a href="loanManage/overdueLoan.htm">逾期借款</a></li> -->
<!-- 							<li><a href="loanManage/hasTheRepaymentLoan.htm">已还款借款</a></li> -->
							<li><a href="loanManage/underwayLoan.htm" class="vipHeadLink">完成中借款</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的审核中借款记录，敬请仔细审阅。
							</h1>
						</div>
						<form action="loanManage/underwayLoan.htm" method="post">
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
										<th>还款方式</th>
										<th>借款期限</th>
									</tr>
								</thead>
								<c:forEach items="${page.list}" var="loan">
									<tbody>
										<tr>
											<td>${loan[0]}</td>
											<td>${loan[1]}</td>
											<td>${loan[2]}</td>
											<td>${loan[3]}</td>
											<td>${loan[4]}</td>
											<c:if test="${empty loan[5]}">
												<td>${loan[6]}天</td>
											</c:if>
											<c:if test="${empty loan[6]}">
												<td>${loan[5]}个月</td>
											</c:if>
										</tr>
									</tbody>
								</c:forEach>
							</table>
							<jsp:include page="/WEB-INF/views/member/communal/page.jsp" />
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
				url : 'loanManage/underwayLoan.htm',
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
