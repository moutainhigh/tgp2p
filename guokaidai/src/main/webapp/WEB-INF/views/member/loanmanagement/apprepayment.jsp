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
<title>九牛贷款平台-还款</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />

<link rel="stylesheet" type="text/css"
	href="resources/css/skin/simple_gray/ymPrompt.css" />
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />

<script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>

<script type="text/javascript" src="resources/js/ymPrompt.js"></script>

<script type="text/javascript"
	src="<%=basePath%>resources/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/head.js"></script>
<body>
	<!--head-->
	<script type="text/javascript"
		src="resources/js/loanSign/repayments.js"></script>
	<!--End head-->

	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<div class="vipHeadMenuBox">
				<ul>
					<li><a href="javascript:void(0);" class="vipHeadLink">提前还款</a></li>
					<li><a href="javascript:void(0);">按时还款</a></li>
					<li><a href="javascript:void(0);">逾期还款</a></li>
					<li><a href="javascript:void(0);">自动还款签约</a></li>
				</ul>
			</div>

			<!--vipContBox提前还款-->
			<div class="vipContBox">
				<div class="vipContTitleBox">
					<h1 class="vipContTitle">
						<span><img src="resources/images/vipseversicon.png" /></span>借款人所有的借款项目都可以申请提前还款，但是要承担相应的违约金。
					</h1>
					<p>
						您目前还款中的借入总额是：<font>￥${money }</font>，共 <font>${num }</font>
						笔还款中借入。
					</p>
				</div>
				<form>
					<table cellpadding="0" cellspacing="0" border="0"
						class="vipSeversTable">
						<thead>
							<tr>
								<th>编号</th>
								<th>借款标题</th>
								<th>借款金额</th>
								<th>年化利率</th>
								<th>借款期限</th>
								<th>借款时间</th>
								<th>下期还款时间</th>
								<th>下期还款金额</th>
								<th>提前还款</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty advance}">
								<tr>
									<td colspan="9">你还没有借款可以提前还款哦!</td>
								</tr>
							</c:if>
							<c:if test="${!empty advance}">
								<c:forEach items="${advance}" var="adv">
									<tr>
										<td>${adv.id}</td>
										<td>${adv.loansign.loansignbasics.loanNumber}</td>
										<td>${adv.loansign.loansignbasics.loanTitle}</td>
										<td><fmt:formatNumber value="${adv.loansign.rate*100}"
												pattern="0" />%</td>
										<c:if test="${!empty adv.loansign.month}">
											<td>${adv.loansign.month}月</td>
										</c:if>
										<c:if test="${!empty adv.loansign.useDay}">
											<td>${adv.loansign.useDay}天</td>
										</c:if>
										<td>${adv.loansign.publishTime}</td>
										<td>${adv.preRepayDate}</td>
										<td>￥<fmt:formatNumber
												value="${adv.money+adv.preRepayMoney}" pattern="0.00" /></td>
										<td><span onclick="judge(${adv.id})"
											style="color: black;">还款</span></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</form>
				<div class="vipContPrompt">
					<h2 class="vipContTitle">提前还款说明：</h2>
					<p>1、提前还款违约金金额为剩余未支付利息的50%；</p>
					<p>2、提前还款违约金由投资者所得；</p>
					<p>3、15点整之前申请提前还款将会在当日16点进行还款，15点整之后申请提前还款将会于次日16点进行还款 ；</p>
					<p>4、借款标如有逾期，提前还款包含逾期金额及余下未到期的还款总额；</p>
					<p>5、如果您并不是想要把未到期的还款提前，而是想要把有逾期借款还上，则您不需要进行提前还款操作；</p>
				</div>
			</div>
			<!--End vipContBox-->

			<!--vipContBox 按时还款-->
			<div class="vipContBox" style="display: none;">
				<div class="vipContTitleBox">
					<h1 class="vipContTitle">
						<span><img src="resources/images/vipseversicon.png" /></span>借款人所有的借款项目都可以申请提前还款，但是要承担相应的违约金。
					</h1>
					<p>
						您目前还款中的借入总额是：<font>￥${money }</font>，共 <font>${num }</font>
						笔还款中借入。
					</p>
				</div>
				<form>
					<table cellpadding="0" cellspacing="0" border="0"
						class="vipSeversTable">
						<thead>
							<tr>
								<th>编号</th>
								<th>借款标题</th>
								<th>借款金额</th>
								<th>年化利率</th>
								<th>借款期限</th>
								<th>借款时间</th>
								<th>本期还款时间</th>
								<th>本期还款金额</th>
								<th>按时还款</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty schedule}">
								<tr>
									<td colspan="9">你还没有借款可以按时还款哦!</td>
								</tr>
							</c:if>
							<c:if test="${!empty schedule}">
								<c:forEach items="${schedule}" var="sc">
									<tr>
										<td>${sc.id}</td>
										<td>${sc.loansign.loansignbasics.loanNumber}</td>
										<td>${sc.loansign.loansignbasics.loanTitle}</td>
										<td><fmt:formatNumber value="${sc.loansign.rate*100}"
												pattern="0" />%</td>
										<c:if test="${!empty sc.loansign.month}">
											<td>${sc.loansign.month}月</td>
										</c:if>
										<c:if test="${!empty sc.loansign.useDay}">
											<td>${sc.loansign.useDay}天</td>
										</c:if>
										<td>${sc.loansign.publishTime}</td>
										<td>${sc.preRepayDate}</td>
										<td>￥<fmt:formatNumber
												value="${sc.money+sc.preRepayMoney}" pattern="0.00" />
										</td>
										<td><span onclick="judge(${sc.id})" style="color: black;">还款</span></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</form>
				<div class="vipContPrompt">
					<h2 class="vipContTitle">按时还款说明：</h2>
					<p>1、按时还款</p>
					<p>2、按时还款；</p>
					<p>3、按时还款 ；</p>
					<p>4、按时还款；</p>
					<p>5、按时还款；</p>
				</div>
			</div>
			<!--End vipContBox-->

			<!--vipContBox逾期还款-->
			<div class="vipContBox" style="display: none;">
				<div class="vipContTitleBox">
					<h1 class="vipContTitle">
						<span><img src="resources/images/vipseversicon.png" /></span>借款人所有的借款项目都可以申请提前还款，但是要承担相应的违约金。
					</h1>
					<p>
						您目前还款中的借入总额是：<font>￥${money }</font>，共 <font>${num }</font>
						笔还款中借入。
					</p>
				</div>
				<form>
					<table cellpadding="0" cellspacing="0" border="0"
						class="vipSeversTable">
						<thead>
							<tr>
								<th>编号</th>
								<th>借款标题</th>
								<th>借款金额</th>
								<th>年化利率</th>
								<th>借款期限</th>
								<th>借款时间</th>
								<th>本期还款时间</th>
								<th>本期还款金额</th>
								<th>按时还款</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty overdue}">
								<tr>
									<td colspan="9">你还没有借款可以逾期还款哦!</td>
								</tr>
							</c:if>
							<c:if test="${!empty overdue}">
								<c:forEach items="${overdue }" var="over">
									<tr>
										<td>${over.id}</td>
										<td>${over.loansign.loansignbasics.loanNumber}</td>
										<td>${over.loansign.loansignbasics.loanTitle}</td>
										<td><fmt:formatNumber value="${over.loansign.rate}"
												pattern="0" />%</td>
										<c:if test="${!empty over.loansign.month}">
											<td>${over.loansign.month}月</td>
										</c:if>
										<c:if test="${!empty over.loansign.useDay}">
											<td>${over.loansign.useDay}天</td>
										</c:if>
										<td>${over.loansign.publishTime}</td>
										<td>${over.preRepayDate}</td>
										<td>￥<fmt:formatNumber
												value="${over.money+over.preRepayMoney}" pattern="0.00" />
										</td>
										<td><span onclick="judge(${over.id})"
											style="color: black;">还款</span></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</form>
				<div class="vipContPrompt">
					<h2 class="vipContTitle">逾期还款说明：</h2>
					<p>1、逾期还款违约金金额为剩余未支付利息的50%乘以逾期天数；</p>
					<p>2、逾期还款违约金由投资者所得；</p>
					<p>3、15点整之前申请提前还款将会在当日16点进行还款，15点整之后申请提前还款将会于次日16点进行还款 ；</p>
					<p>4、借款标如有逾期，提前还款包含逾期金额及余下未到期的还款总额；</p>
					<p>5、如果您并不是想要把未到期的还款提前，而是想要把有逾期借款还上，则您不需要进行提前还款操作；</p>
				</div>
			</div>
			<!--End vipContBox-->

			<!--vipContBox逾期还款-->
			<div class="vipContBox" style="display: none;">
				<div class="vipContTitleBox">
					<h1 class="vipContTitle">
						<span><img src="resources/images/vipseversicon.png" /></span>借款人可以申请自动还款签约，签约成功后到期的借款平台会自动还款。
					</h1>
				</div>
				<c:if test="${isRepaySign==0}">
					<p style="padding-left: 50px">
						<a href="/repayments/repaymentSign.htm" class="authenticateBnt"
							target="_blank">自动还款签约</a>
					</p>
				</c:if>
				<h1>
					<c:if test="${isRepaySign==1}">
						<p style="padding-left: 50px; color: green;">已经签约自动还款，无需再次签约。</p>
					</c:if>
					<c:if test="${isRepaySign==-1 }">
						<p style="padding-left: 50px">需注册IPS账户后才能签约自动还款。</p>
					</c:if>
				</h1>
				<div class="vipContPrompt">
					<h2 class="vipContTitle">自动还款签约说明：</h2>
					<p>1、自动还款签约后，到期的还款将会由平台自动进行还款；</p>
					<p>2、平台会在每天的0点到12点整之前进行自动还款；</p>
					<p>3、自动还款失败后，请尝试手动还款，如金额不足失败，请充值后再尝试 ；</p>
				</div>
			</div>
			<!--End vipContBox-->
		</div>
		<!--End vipRight-->
	</div>
	<!--End vipcontent-->



</body>
</html>
