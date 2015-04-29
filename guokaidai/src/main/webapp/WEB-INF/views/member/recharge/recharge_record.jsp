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
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript"
	src="resources/My97DatePicker/WdatePicker.js"></script>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--vipRight-->
				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="/recharge/openRecharge">在线充值</a></li>
							<li><a href="javascript:void(0);" class="vipHeadLink">充值记录</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>温馨提示：
							</h1>
							<p>尊敬的太平洋理财用户，以下是您产品认购信息，请您仔细审阅</p>
							<p>
								截止<font>2014-01-15 9:40</font> 您的充值金额是<font>￥${total}</font>
							</p>
						</div>
						<form action="/recharge/openRechargeRecord" method="post" id="forminfo">
							<table cellpadding="0" cellspacing="0" class="vipQueries">
								<tbody>
									<tr>
										<th valign="top">充值时间：</th>
										<td><input type="text" class="Wdate"
											value="${beginTime }" name="beginTime"
											onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
											readonly="readonly" id="in11" />至<input type="text"
											class="Wdate" value="${endTime }" name="endTime"
											onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
											readonly="readonly" id="in12" /><input type="submit"
											value="查询" class="QueriesBnt" /></td>
									</tr>
								</tbody>
							</table>

							<table cellpadding="0" cellspacing="0" border="0"
								class="vipSeversTable">
								<thead>
									<tr>
										<th>序号</th>
										<th>充值金额</th>
										<th>实际到账金额</th>
										<th>订单号</th>
										<th>ips订单号</th>
										<th>充值时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="recharge" varStatus="no">
										<tr>
											<td>${no.index+1}</td>
											<td>￥${recharge.rechargeAmount}</td>
											<td>￥${recharge.reAccount}</td>
											<td>${recharge.orderNum}</td>
											<td>${recharge.pIpsBillNo}</td>
											<td>${recharge.time}</td>
										</tr>
									</c:forEach>
									<c:if test="${empty list}">
										<tr><td colspan="7">暂时没有任何充值记录！</td></tr>
									</c:if>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="7"><jsp:include page="/WEB-INF/views/member/communal/wr_page.jsp" /></td>
									</tr>
								</tfoot>
							</table>
						</form>
						<br /> <br /> <br /> <br /> <br /> <br /> <br />
					</div>
					<!--End vipContBox-->

				</div>
				<!--End vipRight-->
			</div>

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
			re=/^[0-9]*[1-9][0-9]*$/;
			if(!re.test(pageNum)){
				ymPrompt.errorInfo('请输入大于0的整数!', 220, 160, '警告', null);
				return;
			}
			$("#forminfo").submit();
		}
	</script>
</body>
</html>
