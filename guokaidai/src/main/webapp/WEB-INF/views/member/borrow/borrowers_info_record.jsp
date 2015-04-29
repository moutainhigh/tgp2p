<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
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
<link type="text/css" rel="stylesheet"
	href="../resources/css/lhgcalendar.css" />
<script src="../resources/js/borrow/repay_plan.js"
	type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/artDialog.js"></script>
<script type="text/javascript" src="/resources/js/loadMask.js"></script>
<link rel="stylesheet" href="/resources/css/skin/default.css"
	type="text/css"></link>
	
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<input type="hidden" id="id" value="${session_user.id }" />
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
							<li><a href="javascript:void(0);" class="vipHeadLink">借款总表</a></li>
							<li><a href="javascript:fn_detail();">总概况表</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的借款总表，敬请仔细审阅
							</h1>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="borrowingTab">
								<thead>
									<tr>
										<th>项目</th>
										<th>金额</th>
										<th>说明</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>审核中借款：</th>
										<td>￥${unpublish[0]}/${unpublish[1]}标 <a
											href="javascript:;" style="color: #007cc2;"
											onclick="fn_showList(3);">[列表]</a></td>
										<td>（目前正在审核中，尚未确定借入的金额）</td>
									</tr>
									<tr>
										<th>发标中借款：</th>
										<td><font>￥${row_1[0]} / ${row_1[1]}标 </font>&nbsp;<a
											href="javascript:;" style="color: #007cc2;"
											onclick="fn_showList(1);">[列表]</a></td>
										<td>（目前正在投标中，尚未确定借入的金额）</td>
									</tr>
									<tr>
										<th>偿还中借款：</th>
										<td><font>￥${row_2[0]} / ${row_2[1]}标 </font>&nbsp;<a
											href="javascript:;" style="color: #007cc2;"
											onclick="fn_showList(2);">[列表]</a></td>
										<td>（目前已经借入，正在偿还的借款总额）</td>
									</tr>
									<tr>
										<th>还清的借款：</th>
										<td>￥${row_3[0]} / ${row_3[1]}标</td>
										<td>（已经全部偿还的借入本金的总额）</td>
									</tr>
									<tr>
										<th>逾期的借款：</th>
										<td><font>￥${row_7[0] } / ${row_7[1] }标 </font>&nbsp;<a
											href="javascript:;" style="color: #007cc2;"
											onclick="fn_showList(4);">[列表]</a></td>
										<td>（已借入并逾期未偿还的）</td>
									</tr>
									<tr>
										<th>累计借出奖励：</th>
										<td>￥${row_8 }</td>
										<td>（申购人投标发送奖励）</td>
									</tr>
									<tr>
										<th>累计借款金额：</th>
										<td>￥${row_10}</td>
										<td>（注册至今，您累计借入的总额）</td>
									</tr>
									<tr>
										<th>累计利息成本：</th>
										<td>￥${row_11}</td>
										<td>（注册至今，您累计借入金额已支出的和将要支出的利息总额）</td>
									</tr>
									<tr>
										<th>借入利息成本：</th>
										<td>${row_12}%</td>
										<td>（借入利息成本=累计利息成本/累计借入金额）</td>
									</tr>
									<tr>
										<th>支付太平洋理财：</th>
										<td>￥${row_9}</td>
										<td>（注册至今，您累计已支出借入服务费总额）</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<!--End vipContBox-->

					<!--vipContBox-->
					<div class="vipContBox" style="display: none;">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的总概况表记录，敬请仔细审阅
							</h1>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipCollectTable">
								<thead>
									<tr>
										<th>借款总金额</th>
										<th>逾期金额</th>
										<th>待还金额</th>
										<th>近30天应还金额</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="2"><font
											style="font-size: 16px; color: #fe4e00;">${row_10}元</font></td>
										<td>${row_7[0] }元</td>
										<td><fmt:formatNumber value="${unrepay }" pattern="0.00" />元</td>
										<td><fmt:formatNumber value="${future_threety }"
												pattern="0.00" />元</td>
									</tr>
									<tr>
										<td colspan="3">您最近10天内有 <font>${future_ten_count }</font>
											笔借款金额需归还，总额 <font> <fmt:formatNumber
													value="${future_ten }" pattern="0.00" />元
										</font></td>
									</tr>
								</tbody>
							</table>
							<br />
							<div class="vipPromptBox">
								<p>显示近10天需归还借款标的详细信息。</p>
							</div>

							<div id="plan_detail_content">
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
			<th>借款时间</th>
			<th>还款时间</th>
			<th>还款金额</th>
			<th>状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list}" var="loan">
			<tr>
				<td>${loan[0]}</td>
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
					<td>已还款</td>
				</c:if>
				<c:if test="${loan[11]==2}">
					<td>逾期未还款</td>
				</c:if>
				<c:if test="${loan[11]==3}">
					<td>提前已还款</td>
				</c:if>
				<c:if test="${loan[11]==4}">
					<td>未还款</td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
	<tr >
		<td colspan="10" style="border: 0px;"><div class="quotes"><jsp:include page="/WEB-INF/views/member/communal/page.jsp" /></div></td>
	</tr>
</table>
							
							</div>

						</form>

					</div>
					<!--End vipContBox-->

				</div>
				<!--End vipRight-->

			</div>
			<!--End vipRight-->
		</div>
		<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script type="text/javascript">
		function fn_detail() {
			var d = new Date();
			var vYear = d.getFullYear();
			var vMon = d.getMonth() + 1;
			var vDay = d.getDate();
			s = vYear + "-" + (vMon < 10 ? "0" + vMon : vMon) + "-"
					+ (vDay < 10 ? "0" + vDay : vDay);
			e = change_date(10);
			fn_queryDetail(s, e);
		}

		function fn_showList(_v) {
			var _url = "";
			if (_v == 1) {
				_url = "borrower_record/showList1";
			} else if (_v == 2) {
				_url = "borrower_record/showList2";
			} else if (_v == 3) {
				_url = "borrower_record/showList3";
			} else if (_v == 4) {
				_url = "borrower_record/showList4";
			}
			$
					.ajax({
						url : _url,
						type : "GET",
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						success : function(_msg) {
							art.dialog({
								width : 550,
								content : _msg,
								ok : function() {
								},
								lock : true
							});
						}
					});
		}

		//查询
		function fn_queryDetail(startTime, endTime, no) {
			var _repaymentPlanParam = {};
			_repaymentPlanParam.beginDate = startTime;
			_repaymentPlanParam.endDate = endTime;

			if (no != null)
				_repaymentPlanParam.no = no;
			else
				_repaymentPlanParam.no = 0;

			loadMask.load("plan_detail_content", "正在加载");

			//根据条件获取数据并显示
			fn_ajax("borrower_record/repaymentPlanDetail.htm", _repaymentPlanParam,
					function(_msg) {
						$("#plan_detail_content").html(_msg);
						loadMask.unload("plan_detail_content");
					});
		}

		//根据开始时间和天数自动计算出结束日期
		var change_date = function(days) {
			// 参数表示在当前日期下要增加的天数  
			var now = new Date();
			// + 1 代表日期加，- 1代表日期减  
			now.setDate(now.getDate() + (1 * days));
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var day = now.getDate();
			if (month < 10) {
				month = '0' + month;
			}
			if (day < 10) {
				day = '0' + day;
			}
			$("#endDate").val(year + '-' + month + '-' + day);
			return year + '-' + month + '-' + day;
		};
	</script>
</body>
</html>
