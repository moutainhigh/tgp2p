<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String plankState = (String)request.getAttribute("plankState");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<title>${title }-散标投资</title>
<base href="<%=basePath%>" />
<style>
.jkxqSpan {
	display: block;
	height: 30px;
	line-height: 30px;
	font-size: 14px;
	color: #444;
	float: left
}

.dataContBox ul li {
	margin: 15px 0 0 0
}
</style>
</head>
<body onload="showtime()">
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="resources/js/layer.min.js"></script>
	<script type="text/javascript" src="resources/js/layer.min.js"></script>
	<script type="text/javascript" src="resources/js/extend/layer.ext.js"></script>
	<script type="text/javascript" src="resources/js/head.js"></script>
	<script type="text/javascript" src="resources/js/plank.js"></script>
	<script type="text/javascript" src="resources/js/condition.js"></script>
	<script type="text/javascript" src="resources/js/loanSign/loaninfo.js"></script>
	<script type="text/javascript" src="resources/js/agree.js"></script>
	<!--End head-->
	<%if(plankState!=null && plankState.length()>0){%>
		<%if(plankState.equals("1")){%>
		<script language="javascript">
			layer.msg('投标成功!', 2,1);
		</script>
		<%}else{%>
		<script language="javascript">
			layer.msg('投标失败!', 2, 8);
		</script>
		<%}%>
	<%}%>
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--mapLinkBox-->
			<div class="mapLinkBox">
				<span><a href="/manageFinances.htm">我要投资</a>><a
					href="/loaninfo/openLoan.htm">散标投资</a>><a style="color: #2b8fdb">借款详情</a>
			</div>
			<!--End mapLinkBox-->
			<div style="border: 1px solid #ddd; width: 1000px; height: 310px; background-color: #fff">
				<div style="width: 600px; height: 280px; float: left">
					<div style="width: 570px; height: 35px; padding-left: 30px; border-bottom: 1px solid #ddd;">
						<span style="height: 55px; line-height: 35px; font-size: 18px; color: #222; margin-left: 35px;">
							标题:<font style="color: #777; margin-left: 10px;font-size:18px">${loan.loansignbasics.loanTitle}</font>
						</span>
					</div>
					<div style="width: 570px; height: 35px; padding-left: 30px; border-bottom: 1px solid #ddd;">
						<span style="height: 55px; line-height: 35px; font-size: 18px; color: #222; margin-left: 35px;">
							编号：
							<font style="color: #777; margin-left: 10px;font-size:18px">
								${loan.loansignbasics.loanNumber}
							</font>
						</span>
					</div>
					<div style="width: 570px; height: 35px; padding-left: 30px; border-bottom: 1px solid #ddd;">
						<span style="height: 55px; line-height: 35px; font-size: 18px; color: #222; margin-left: 35px;">
							担保方:<font style="color: #777; margin-left: 10px;font-size:18px">${loan.loansignbasics.assure}</font>
						</span>
					</div>
					<div style="width: 535px; height: 220px; padding-left: 65px;">
						<div
							style="width: 230px; height: 70px; border-right: 1px dotted #777; margin-top: 15px; float: left">
							<span
								style="display:block;width:230px;height:30px;line-height:30px;font-size: 14px; color: #444; line-height: 25px;">
								债权总额： </span><span
								style="display:block;width:230px;height:40px;line-height:40px;font-size: 28px; color: #333;">
								<fmt:formatNumber value="${loan.issueLoan}" pattern="##.##"
									minFractionDigits="2" /> <font
								style="font-size: 14px; color: #444; margin-left: 5px">元</font>
							</span>
						</div>
						<div
							style="width: 120px; height: 70px; border-right: 1px dotted #777; margin: 15px 0 0 30px; float: left">
							<span
								style="display:block;width:75px;height:30px;line-height:30px;font-size: 14px; color: #444;float:left">
								借款年利率 </span> <a title="借款年利率" href="javascript:void(0)"
								style="background-image: url(/resources/images/img/question.png); display: block; width: 16px; height: 17px; float: left; margin: 5px 0 0 0"></a>
							<span
								style="display:block;width:120px;height:40px;line-height:40px;font-size: 28px; color: #ff6501;">
								<fmt:formatNumber value="${loan.rate*100}" pattern="##.#"
									minFractionDigits="1" /> <font
								style="font-size: 15px; margin-left: 5px">%</font> </span>
						</div>
						<div
							style="width: 120px; height: 70px; margin: 15px 0 0 30px; float: left">
							<span
								style="display:block;width:120px;height:30px;line-height:30px;font-size: 14px; color: #444; line-height: 25px;">
								还款期限： </span><span
								style="display:block;width:120px;height:40px;line-height:40px;font-size: 28px; color: #333;">
								<c:if test="${!empty loan.month}">
						${loan.month}<font style="font-size: 14px; margin-left: 5px">个月</font>
								</c:if> <c:if test="${empty loan.month}">
						${loan.useDay}<font style="font-size: 14px; margin-left: 5px">天</font>
								</c:if> </span>
						</div>
						<span class="jkxqSpan" style="width: 285px; margin-top: 30px">
							<font style="float: left; font-size: 14px">债权总额：</font> <a
							title="本金" href="javascript:void(0)"
							style="background-image: url(/resources/images/img/benxi.png); display: block; width: 25px; height: 30px; float: left; margin-right: 3px;"></a>
							<a title="利息" href="javascript:void(0)"
							style="background: url(/resources/images/img/benxi.png) no-repeat -28px 0; display: block; width: 25px; height: 30px; float: left"></a>
						</span> <span class="jkxqSpan" style="width: 245px; margin-top: 30px">
							还款方式： <c:if test="${loan.loanType==1}">
								<c:if test="${loan.refundWay==1}">等额本息</c:if>
								<c:if test="${loan.refundWay==2}">每月付息到期还本</c:if>
								<c:if test="${loan.refundWay==3}">到期一次性还本息</c:if>
							</c:if> <c:if test="${loan.loanType==2||loan.loanType==3}">
  					 到期一次性还本息
  				</c:if> </span> <span class="jkxqSpan" style="width: 285px"> <span
							style="float: left; font-size: 14px; color: #444;">投标进度：</span> <span
							style="background-color: #b6b6b6; width: 70px; height: 8px; margin-top: 12px; border-radius: 3px; float: left">
								<span
								style="background-color:#468fc4;display:block;width:${scale*100}%;height:8px;border-radius:3px;"></span>
						</span>
						<span style="float: left; font-size: 14px; color: #444; margin-left: 5px;">
							<fmt:formatNumber value="${scale*100}" pattern="##.#" minFractionDigits="1" />%</span>
						</span>
						<span class="jkxqSpan" style="width: 245px"> 剩余金额：${reMoney } 元</span>
						<span class="jkxqSpan" style="width: 285px"> 投标人数：${buyCount }人 </span>
						<span id="showtime" class="jkxqSpan" style="width: 245px"> 剩余时间：
							<input type="hidden" id="loantype" value="${loan.loanType }" />
							<input type="hidden" id="loanrate" value="${loan.rate }" />
							<input type="hidden" id="loanstate" value="${loan.loanstate }" />
							<input type="hidden" id="bidEndTime" value="${bidEndTime}" />
							<input type="hidden" id="time" value="${loan.endTime }" />
							<label id="showday" class="showtime"></label>天
							<label id="showhour" class="showtime"></label>时
							<label id="showminute" class="showtime"></label>分
							<label id="showsecond" class="showtime"></label>秒
						</span>
					</div>
				</div>
				<div
					style="width: 320px; height: 280px; float: right; margin-right: 20px;">
					<%-- <c:if test="${loan.loanstate==3||loan.loanstate==4}">
						<div
							style="width: 320px; height: 55px; border-bottom: 1px solid #ddd;">
							<span
								style="height: 55px; line-height: 65px; font-size: 18px; color: #222;">
								${loan.loansignbasics.loanTitle} </span>&nbsp;&nbsp; <a
								href="/loaninfo/contact?loansignId=${loan.id }"
								style="height: 55px; line-height: 65px; font-size: 14px; color: #ff6501;">借款合同下载</a>
						</div>
					</c:if> --%>
					<div style="width: 275px; height: 220px; margin-left: 45px;">
						<input type="hidden" id="yuding" name="" value="" />
						<c:if test="${empty session_user }">
							<span
								style="height: 45px; line-height: 45px; margin-left: 45px; font-size: 14px; color: #444">
								账户余额<a href="/visitor/to-login"
								style="font-size: 14px; color: #428ec2">登录</a>后可见 </span>
							<div
								style="width: 250px; height: 40px; border: 1px solid #ddd; line-height: 40px;">
								<span
									style="width: 190px; height: 40px; font-size: 18px; color: #555; margin-left: 10px;"></span>
								<span
									style="width: 20px; height: 40px; font-size: 14px; color: #aaa; float: right">元</span>
							</div>
							<div style="width: 250px; height: 30px; margin-top: 15px">
								<input type="checkbox" id="checkAgree" checked="true"
									style="float: left; margin: 9px 5px 0 60px;" /> <span
									style="display: block; height: 30px; line-height: 30px; float: left;">我已经阅读并同意<a
									href="javascript:showAgree();" style="color: #2a90da">《使用条款》</a>
								</span>
							</div>
							<a href="/visitor/to-regist">
								<span style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #2a90da; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 20px 0 0 5px;">立即注册</span>
							</a>
						</c:if>
						<c:if test="${!empty session_user }">
							<form id="form1" action="/plank/getLoaninfo.htm" method="post">
								<input type="hidden" id="loanid" name="id" value="${loan.id}" />
								<input type="hidden" id="loanuserId" name="loanuserId"
									value="${loan.userbasicsinfo.id }" /> <input type="hidden"
									id="userId" name="userId" value="${session_user.id}" /> <input
									type="hidden" id="effective" name="effective"
									value="${maxMoney}" /> <input type="hidden" id="logo"
									value="${logo}" /> <input type="hidden" id="minmoney"
									name="minmoney" value="${loan.loanUnit }" />
								<p>
									<span
										style="height: 35px; line-height: 35px; margin-left: 45px; font-size: 14px; color: #444">
										可投金额：<font style="color:#ff6501;font-size:14px;">
										<fmt:formatNumber value="${maxMoney}" pattern="#,#00.00" /> </font>元 </span>
								</p>
								<p>
									<span
										style="height: 45px; line-height: 35px; margin-left: 35px; font-size: 14px; color: #444">
										账户余额：<span id="accountBalance" style="line-height: 35px;font-size: 14px; color: #444" money="${money}"><fmt:formatNumber value="${money}" pattern="#,#00.00" /> </span>元<a
										href="/recharge/openRecharge"
										style="color:#2a90da;margin-left:10px;line-height:35px;font-size:12px">充值</a>
									</span>
								</p>
								<div
									style="width: 250px; height: 40px; border: 1px solid #ddd; line-height: 40px; font-size: 20px;">
									<input type="text" id="investMoney" name="money"
										style="border: 0px; width: 215px; height: 38px; line-height: 38px; margin: 1px 5px 0 10px; color: #555; float: left;" />
									<span
										style="width: 20px; height: 40px; font-size: 14px; color: #aaa; float: left">元</span>
								</div>
								<script>
									$("#investMoney").bind("input propertychange",
										function() {
											if (isNaN($(this).val())) {
												$(this).val($(this).val().replace(/[^\d]/g,''));
											}
										});
								</script>
								<div style="width: 250px; height: 30px; margin-top: 15px">
									<input type="checkbox" id="checkAgree" checked="true"
										style="float: left; margin: 9px 5px 0 60px;" /> <span
										style="display: block; height: 30px; line-height: 30px; float: left;">我已经阅读并同意<a
										href="javascript:showAgree();" style="color: #2a90da">《使用条款》</a>
									</span>
								</div>
								<c:if test="${loan.loanstate == 2 && scale < 1 }">
									<a id="suBnt_a" href="javascript:void(0);">
										<span style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #2a90da; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 20px 0 0 5px;" id="plank">立即投标</span>
									</a>
								</c:if>
								<c:if test="${loan.loanstate == 3 }">
									<a href="javascript:void(0);"> <span
										style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #a7a7a7; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 20px 0 0 5px;">还款中</span>
									</a>
								</c:if>
								<c:if test="${loan.loanstate == 4}">
									<a href="javascript:void(0);"> <span
										style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #a7a7a7; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 20px 0 0 5px;">已完成</span>
									</a>
								</c:if>
								<c:if test="${loan.loanstate == 2 && scale >=1 }">
									<a href="javascript:void(0);"> <span
										style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #a7a7a7; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 20px 0 0 5px;">已满标</span>
									</a>
								</c:if>
								<span style="display:
									<c:if test="${empty user.userrelationinfo.recommend}">none</c:if>
									<c:if test="${not empty user.userrelationinfo.recommend}">block</c:if>; height: 30px; line-height: 30px; float: left;" id="invite_info">
									<font color="red">*</font>
									您是通过${user.userrelationinfo.recommend}邀请注册,投标会产生一笔(除利息收入外)额外收益,会在每月结算后计入帐户.
								</span>
							</form>
						</c:if>
					</div>
				</div>
			</div>
			<!--借款信息资料-->
			<div
				style="width: 1000px; border: 1px solid #ddd; background-color: #fff; margin: 15px 0;">
				<div style="width: 600px; float: left">
					<div class="dataInfoTabBox">
						<ul class="dataInfoTab">
							<li><span class="dataTabLink" style="border-left: 0px">借款方相关资料</span>
							</li>
							<li><span>借出记录</span></li>
							<c:if test="${!empty session_user }">
								<li><span>借款历史记录</span></li>
							</c:if>
							<li><span>项目详情</span></li>
						</ul>
					</div>
					<script>
						function jumpPage(pageno, totalPage) {
							if (pageno<=0 || pageno>totalPage) {
								return;
							}
							if ($(".dataContBox:eq(1)").css("display", "none")) {
								$.ajax({
									type : 'post',
									url : 'loaninfo/loanSignRecord.htm',
									data : {
										id : $("#loanid").val(),
										pageNo : pageno
									},
									success : function(msg) {
										$(".dataContBox:eq(2)").html(msg);
									}
								});
							} else if ($(".dataContBox:eq(2)").css("display",
									"none")) {
								$.ajax({
									type : 'post',
									url : 'loaninfo/loanRecord.htm',
									data : {
										id : $("#loanid").val(),
										pageno : pageno
									},
									success : function(msg) {
										$(".dataContBox:eq(1)").html(msg);
									}
								});
							}
						}
					</script>
					<div class="dataInfoCont">
						<div class="listContLeft">
							<!-- 借款方相关资料 -->
							<div class="dataContBox">
								<div class="dataConttx">
									<span style="display: block; width: 250px; height: 30px">
										<h5 style="float: left; width: 170px">借款方资金用途</h5> <a
										href="javascript:void(0)"
										style="display: block; background: url(/resources/images/img/sprites.png) no-repeat -48px -140px; width: 8px; height: 16px; float: left; margin: 6px 0 0 3px"></a>
									</span>
									<p style="display: none">&nbsp;${loan.loansignbasics.behoof}</p>
								</div>
								<div class="dataConttx">
									<span style="display: block; width: 250px; height: 30px">
										<h5 style="float: left; width: 170px">借款方项目概述</h5> <a
										href="javascript:void(0)"
										style="display: block; background: url(/resources/images/img/sprites.png) no-repeat -48px -140px; width: 8px; height: 16px; float: left; margin: 6px 0 0 3px"></a>
									</span>
									<p style="display: none">&nbsp;${loan.loansignbasics.loanExplain}</p>
								</div>
								<div class="dataConttx">
									<span style="display: block; width: 250px; height: 30px">
										<h5 style="float: left; width: 170px">借款方资产情况</h5> <a
										href="javascript:void(0)"
										style="display: block; background: url(/resources/images/img/sprites.png) no-repeat -48px -140px; width: 8px; height: 16px; float: left; margin: 6px 0 0 3px"></a>
									</span>
									<p style="display: none">&nbsp;${loan.loansignbasics.overview
										}</p>
								</div>
								<div class="dataConttx">
									<span style="display: block; width: 250px; height: 30px">
										<h5 style="float: left; width: 170px">借款方还款来源</h5> <a
										href="javascript:void(0)"
										style="display: block; background: url(/resources/images/img/sprites.png) no-repeat -48px -140px; width: 8px; height: 16px; float: left; margin: 6px 0 0 3px"></a>
									</span>
									<p style="display: none">&nbsp;${loan.loansignbasics.loanOrigin
										}</p>
								</div>
								<div class="dataConttx">
									<span style="display: block; width: 250px; height: 30px">
										<h5 style="float: left; width: 170px">借款方抵押情况</h5> <a
										href="javascript:void(0)"
										style="display: block; background: url(/resources/images/img/sprites.png) no-repeat -48px -140px; width: 8px; height: 16px; float: left; margin: 6px 0 0 3px"></a>
									</span>
									<p style="display: none">&nbsp;${loan.loansignbasics.riskCtrlWay
										}</p>
								</div>
							</div>
							<!-- End借款方相关资料 -->
							<!-- 借出记录 -->
							<div class="dataContBox" style="display: none;"></div>
							<!-- End借出记录 -->
							<!-- 借款历史记录 -->
							<div class="dataContBox" style="display: none;"></div>
							<!-- 附件列表 -->
							<div class="dataContBox" style="display: none;">
								<ul>
									<c:forEach items="${attachment}" var="attach">
										<li><a href="${attach.attachmentName}" target="_blank">
												<span><img src="${attach.attachmentName}" alt=""
													title="${attach.originalName}" height="200" width="200" /> </span><br />
												${attach.originalName} </a></li>
										<%-- <li><img src="${attach.attachmentName}" alt=""
											title="${attach.originalName}" height="361" width="491"></img>
										</li> --%>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- End借款历史记录 -->
						<div class="clear"></div>
					</div>
				</div>
				<div class="listContRight">
					<h1
						style="border-bottom: 1px solid #ddd; color: #444; font-size: 18px">资料审核状态</h1>
					<table cellpadding="0" cellspacing="0" class="dataContTable">
						<thead>
							<tr>
								<th style="width: 150px">审核名称</th>
								<th>状态</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>实名</td>
								<td><img src="resources/images/ok.png" /></td>
								<td></td>
							</tr>
							<tr>
								<td>手机认证</td>
								<td><img src="resources/images/ok.png" /></td>
								<td></td>
							</tr>
							<tr>
								<td>邮箱</td>
								<td><img src="resources/images/ok.png" /></td>
								<td></td>
							</tr>
							<tr>
								<td>营业执照</td>
								<td><img src="resources/images/ok.png" /></td>
								<td></td>
							</tr>
							<tr>
								<td>头像</td>
								<td><img src="resources/images/ok.png" /></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
			</div>
			<script>
				$(".dataConttx")
						.click(
								function() {
									if ($(this).find("p").css("display") == "none") {
										$(this).find("p").css("display",
												"block");
										$(this)
												.find("a")
												.attr(
														"style",
														"display: block;background: url(/resources/images/img/sprites.png) no-repeat -55px -149px;width: 15px;height: 8px;float: left;margin: 10px 0 0 0 ;");
									} else {
										$(this).find("p")
												.css("display", "none");
										$(this)
												.find("a")
												.attr(
														"style",
														"display:block;background:url(/resources/images/img/sprites.png) no-repeat -48px -140px ;width:8px;height:16px;float:left;margin:6px 0 0 3px;");
									}
								});
			</script>
			<div id="agree"></div>
			<!--End 借款信息资料-->
		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->
</body>
</html>