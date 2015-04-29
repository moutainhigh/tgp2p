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
<title>太平洋理财贷款平台-借款合同</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="resources/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="resources/js/global.js"></script>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<style>
.pag_div {
	height: 40px;
}
</style>
</head>
<body>
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/lhgcalendar.min.js"></script>
	<script type="text/javascript" src="resources/js/condition.js"></script>
	<!-- 	<script type="text/javascript" src="resources/js/loanSign/repayment.js"></script>
 -->
	<script type="text/javascript"
		src="resources/My97DatePicker/WdatePicker.js"></script>
	<!--End head-->

	<!--Content-->
	<div class="Content">
		<div class="w960px">

			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />

				<!--vipRight-->
				<div class="vipRightBox" style="position:relative;z-index:99">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="member_index/borrowContract.htm?no=1">借款合同</a></li>

						</ul>
					</div>



					<!--vipContBox-->
					<div class="vipContBox">

						<table cellpadding="0" cellspacing="0" border="0"
							class="vipSeversTable" style="width: 765px;">
							<thead>
								<tr>

									<th>借款标题</th>
									<th>借款金额</th>
									<th>年化利率</th>
									<th>还款方式</th>
									<th>借款期限</th>
									<th>借款时间</th>
									<th>还款时间</th>
									<th>还款金额</th>
									<th>状态</th>
									<th>合同</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.list}" var="loan" varStatus="loanStatus">
									<tr>

										<td>${loan[2]}</td>
										<td><fmt:formatNumber value="${loan[3]}" pattern="0.00" /></td>
										<td><fmt:formatNumber value="${loan[4]*100}"
												pattern="0.00" />%</td>
										<td>${loan[5]}</td>
										<c:if test="${loan[7]>0}">
											<td>${loan[7]}天</td>
										</c:if>
										<c:if test="${loan[6]>0}">
											<td>${loan[6]}个月</td>
										</c:if>
										<td>${loan[8]}</td>
										<td>${loan[9]}</td>
										<td><fmt:formatNumber value="${loan[10]}" pattern="0.00" /></td>
										<c:if test="${loan[11]==1}">
											<td>未还款</td>
										</c:if>
										<c:if test="${loan[11]==2}">
											<td>按时还款</td>
										</c:if>
										<c:if test="${loan[11]==3}">
											<td>逾期未还款</td>
										</c:if>
										<c:if test="${loan[11]==4}">
											<td>逾期已还款</td>
										</c:if>
										<c:if test="${loan[11]==5}">
											<td>提前还款</td>
										</c:if>
										<td><a onclick="showContract(${loan[0]})">查看</a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<td colspan="10" style="border: 0px;"><div class="quotes"><jsp:include
											page="/WEB-INF/views/member/communal/page.jsp" /></div></td>
							</tr>
						</table>
						
						<style>
						.tableBg{position: absolute;top:0;left:0;width:800px;height:560px;z-index: 99;  background: #000;opacity: 0.5;filter: alpha(opacity=50);display: none;}
						.tableDiv{position:absolute;top:50px;left:100px;width:610px;height:460px;z-index:999;background-color:#fff;display:none;overflow:auto;}
						</style>
						<div class="tableBg"></div>

						<div class="tableDiv">
							<div style="width:100%;height:40px;background-color:#efefef">
							  <span style="float:left;line-height:40px;font-size:20px;padding-left:10px">借款详情</span>
							  <a class="closeTable" style="display:block;width:22px;height:22px;float:right;background:url(/resources/images/close.gif) no-repeat;margin: 8px 8px 0 0 "></a>
							</div>
							<style>#borrowTable .pag_ul li{margin-top:7px}</style>
							<div id="borrowTable" style="width:600px;height:400px"></div>
						</div>
						<script type="text/javascript" src="resources/js/contract.js"></script>
						<script type="text/javascript">
							function jumpPage(pageno, totalPage) {
								if (pageno<=0 || pageno>totalPage) {
									return;
								}
								top.window.location = "/member_index/borrowContract.htm?no="
										+ pageno;
							}
						</script>
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

	<!--End footer-->
</body>
</html>
