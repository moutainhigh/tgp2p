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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
.moneyhint {
	position: absolute;
	z-index: 99;
	top: 5px;
	left: 15px;
	font-size: 14px;
	line-height: 40px
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<title>${title }-太平洋理财理财</title>
<base href="<%=basePath%>" />
</head>
<body onload="showtime()">
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/plank.js"></script>
	<script type="text/javascript" src="resources/js/condition.js"></script>
	<script type="text/javascript"
		src="resources/js/loanSign/youxuaninfo.js"></script>
	<!--End head-->

	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--mapLinkBox-->
			<div class="mapLinkBox">
				<a href="/">首页</a>><a>我要理财</a>><a>太平洋理财理财计划</a>
			</div>
			<!--End mapLinkBox-->

			<!--借款信息-->
			<div class="contwrapBox" style="width: 998px">
				<div class="contwrap">
					<div class="listContLeft">
						<div>
							<span style="line-height: 40px; font-size: 16px; color: #436187;">${loan.loansignbasics.loanTitle}</span>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="listInfoTab" style="height: 180px; margin: 0">
							<tbody>
								<tr>
									<td style="width: 300px; height: 45px; line-height: 45px">计划金额：<span
										style="color: #f6791f; font-size: 16px;"><fmt:formatNumber
												value="${loan.issueLoan}" pattern="##.#"
												minFractionDigits="1" /> </span>元
									</td>
									<td style="width: 300px; height: 45px; line-height: 45px">预期收益：<font
										style="color: #f6791f; font-size: 16px;"><fmt:formatNumber
												value="${loan.rate*100}" pattern="##.#"
												minFractionDigits="1" /></font>%
									</td>
								</tr>
								<tr>
									<td style="width: 300px; height: 45px; line-height: 45px"
										id="showtime"><input type="hidden" id="loantype"
										value="${loan.loanType }" /> <input type="hidden"
										id="endtime_year" value="${fn:substring(comtime,0,4) }" /> <input
										type="hidden" id="endtime_month"
										value="${fn:substring(comtime,5,7) }" /> <input type="hidden"
										id="endtime_day" value="${fn:substring(comtime,8,10) }" /> <input
										type="hidden" id="endtime_time"
										value="${fn:substring(comtime,11,19) }" /><input
										type="hidden" id="time" value="2014-07-19" /> 离预定时间：<label
										id="showday" class="showtime"></label>天<label id="showhour"
										class="showtime"></label>时 <label id="showminute"
										class="showtime"></label>分<label id="showsecond"
										class="showtime"></label>秒</td>
									<td style="width: 300px; height: 45px; line-height: 45px">锁定期限：<font
										style="color: #f6791f; font-size: 16px;">${loan.month}</font>个月
									</td>
								</tr>
								<tr>
									<td style="width: 300px; height: 45px; line-height: 45px">还款方式：<c:if
											test="${loan.loanType==7}">到期一次性还本息</c:if></td>
									<td style="width: 300px; height: 45px; line-height: 45px">最小投入金额：<span
										style="color: #f6791f; font-size: 16px;">${loan.loanUnit}</span>元
									</td>
								</tr>
								<tr>
									<td colspan="2"
										style="width: auto; height: 45px; line-height: 45px">第三方担保：${loan.loansignbasics.assure}</td>
								</tr>
							</tbody>
						</table>
						<!--  <a href="arith/investor_tools.htm" class="calculators curvyCorners_2">收益计算器</a> -->
					</div>
					<div class="listContRight">
						<div class="listInfoTitle">
							<!-- <a href="#" class="templates">太平洋理财理财协议（范本）</a> -->
						</div>
						<form id="form1" action="/plank/getLoaninfo.htm" method="post">
							<input type="hidden" id="loanid" name="id" value="${loan.id}" />
							<div class="investment">
								<h3>
									剩余金额：<font><fmt:formatNumber value="${lastMoney}"
											pattern="#,#00.0" /></font>元
								</h3>
							</div>
							<div class="investment">
								<h3 style="margin-bottom: 10px">
									账户余额：<font><fmt:formatNumber value="${money}"
											pattern="#,#00.0" /></font>元
									<c:if test="${empty session_user }">(<a
											href="visitor/to-login" style="color: #d25004;">登录</a>
										<span>&nbsp;后可见)</span>
									</c:if>
								</h3>
								<div
									style="width: 270px; height: 40px; border: 1px solid #ddd; line-height: 40px; font-size: 14px; position: relative">
									<input type="text" id="investMoney" name="money"
										placeholder="输入加入金额,为10000的整数倍"
										<c:if test="${empty session_user}">disabled="disabled"</c:if>
										style="position: absolute; top: 0; left: 0; border: 0px; width: 230px; height: 38px; line-height: 38px; margin: 1px 5px 0 10px; color: #555;" />
									<span
										style="position: absolute; top: 0; right: 0; width: 20px; height: 40px; font-size: 14px; color: #aaa; margin: 0; line-height: 40px">元</span>
								</div>
								<div style="width: 250px; height: 30px">
									<input type="checkbox" id="checkAgree" checked="true"
										style="float: left; margin: 9px 5px 0 60px;" /> <span
										style="display: block; height: 30px; line-height: 30px; float: left;">我已经阅读并同意<a
										href="javascript:showAgree();" style="color: #2a90da">《使用条款》</a></span>
								</div>
							</div>
							<c:if test="${isTime ge 0}">
								<div class="investment">
									<input type="hidden" id="logo" value="${logo}" />
									<%-- <c:if test="${stime ge 0}">
										<a href="javascript:void(0);"> <span
											style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #a7a7a7; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 0px 0 0 5px;">等待预定</span>
										</a>
									</c:if> --%>
									<%-- <c:if test="${stime lt 0}"> --%>
									<c:if test="${!empty session_user }">
										<c:if test="${loan.loanstate==2 }">
											<input type="hidden" id="usuccess" name="usuccess"
												value="${usuccess }" />
											<input type="button" id="suBnt_y" class="suBnt_a2"
												style="height: 40px; line-height: 40px; border-radius: 5px; border: 0;"
												style="border: 0px;" value="立即预定" />
										</c:if>
										<c:if test="${loan.loanstate==3 }">
										<a href="javascript:void(0);"> <span
									style="display: block; width: 240px; height: 55px; line-height: 55px; background-color: #a7a7a7; color: #fff; text-align: center; font-size: 20px; border-radius: 5px; margin: 20px 0 0 5px;">融资已满</span>
								</a>
										</c:if>
									</c:if>
									<c:if test="${empty session_user }">
										<input type="button"
											onclick="window.location.href='/visitor/to-regist';"
											class="suBnt_a2"
											style="height: 40px; line-height: 40px; border-radius: 5px; border: 0;"
											style="border: 0px;" value="立即注册" />
									</c:if>
							</c:if>
					</div>
					<jsp:include page="yudingDiv.jsp" />
					<%-- </c:if> --%>
					<div class="investment" style="text-align: center;">
						<input type="hidden" id="loanuserId" name="loanuserId"
							value="${loan.userbasicsinfo.id }" /> <input type="hidden"
							id="userId" name="userId" value="${session_user.id}" /> <input
							type="hidden" id="effective" name="effective" value="${maxMoney}" />
						<input type="hidden" id="logo" value="${logo}" /> <input
							type="hidden" id="minmoney" name="minmoney"
							value="${loan.loanUnit }" /> <input type="hidden" id="lastMoney"
							name="lastMoney" value="${lastMoney }" /> <input type="hidden"
							id="state" name="state" value="${state }" />

						<c:if test="${isTime lt 0}">
							<input type="hidden" id="usuccess" name="usuccess"
								value="${usuccess }" />
							<input type="button" id="suBnt_a" class="suBnt_a"
								style="border: 0px;" value="立即加入" />
							<a href="javascript:collect();" class="collect">加入收藏</a>
						</c:if>
					</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--End 借款信息-->
		<div class="container_12 color-white-bg mt10"
			style="margin-bottom: 20px; margin: 0 auto; width: 1000px;">
			<div class="p20bs color-white-bg" style="padding-bottom: 0px">
				<h4 style="color: #436187; font-size: 15px;">常见问题</h4>
				<ul class="mt10 question_ul">
					<li class="pd10">1.
						我加入太平洋理财理财计划10000元，预期收益率12%-14%，12个月后我大概能赚到多少钱？
						<p>太平洋理财理财计划的收益最终由您加入太平洋理财理财计划资金所投借款的利息决定。理想情况下，假设投资借款的年利率均为12%，且每月等额本息回款可立即投出无资金闲置，那么选择利息再投资的情况下一年后10000元初始投资变为：10000*（1+12%/12）^12=11268.3元。</p>
					</li>
					<li class="pd10">2. 太平洋理财理财计划安全吗？
						<p>太平洋理财理财计划所投借款100%适用人人贷本金保障计划。</p>
					</li>
					<li class="pd10">3. 我有10000元，该如何加入太平洋理财理财计划？
						<p>
							（1）预定加入<br />
							在预定加入期间，首先预定10000元太平洋理财理财计划，并支付定金10000*1%=100元（当前定金比例为1%），之后在规定的时间内完成剩余金额10000-100=9900元的支付，您即成功加入太平洋理财理财计划10000元。






						</p>
						<p>
							（2）开放加入<br /> 若预定加入期间该期太平洋理财理财计划未满额，则进入开放加入阶段，您可直接加入10000元。 <br />注：您可以通过关注人人贷官方微信、微博获取理财计划发布信息。
						</p>
					</li>
					<li class="pd10">4. 12个月的锁定期结束后，我该如何拿回本息？
						<p>12个月后，您可根据需要，随时进行债权转让收回本金和利息。</p>
					</li>
					<li class="pd10">5. 预定成功后如何完成剩余金额的支付?
						<p>在预定成功后的限定时间内,
							您可以通过“我的人人贷&mdash;理财管理&mdash;太平洋理财理财计划&mdash;预定中”选择该期太平洋理财理财计划进行支付。若您预定追加该计划，则若干次预定时产生的未支付剩余金额将合并为一笔，支付时须一次性足额完成。</p>
					</li>
					<li class="pd10">6. 定金将如何处理？
						<p>若您在预定成功后的限定时间内完成剩余金额的支付, 定金将视同加入该期太平洋理财理财计划;
							若您未能在限定时间内完成剩余金额的支付, 则视为您主动放弃加入该期太平洋理财理财计划, 定金将不予返还。</p>
					</li>

				</ul>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->
	<script>
		function initPlaceHolders() {
			if ('placeholder' in document.createElement('input')) { //如果浏览器原生支持placeholder
				return;
			}
			function target(e) {
				var e = e || window.event;
				return e.target || e.srcElement;
			}
			;
			function _getEmptyHintEl(el) {
				var hintEl = el.hintEl;
				return hintEl && g(hintEl);
			}
			;
			function blurFn(e) {
				var el = target(e);
				if (!el || el.tagName != 'INPUT' && el.tagName != 'TEXTAREA')
					return;//IE下，onfocusin会在div等元素触发 
				var emptyHintEl = el.__emptyHintEl;
				if (emptyHintEl) {
					//clearTimeout(el.__placeholderTimer||0);
					//el.__placeholderTimer=setTimeout(function(){//在360浏览器下，autocomplete会先blur再change
					if (el.value)
						emptyHintEl.style.display = 'none';
					else
						emptyHintEl.style.display = '';
					//},600);
				}
			}
			;
			function focusFn(e) {
				var el = target(e);
				if (!el || el.tagName != 'INPUT' && el.tagName != 'TEXTAREA')
					return;//IE下，onfocusin会在div等元素触发 
				var emptyHintEl = el.__emptyHintEl;
				if (emptyHintEl) {
					//clearTimeout(el.__placeholderTimer||0);
					emptyHintEl.style.display = 'none';
				}
			}
			;
			if (document.addEventListener) {//ie
				document.addEventListener('focus', focusFn, true);
				document.addEventListener('blur', blurFn, true);
			} else {
				document.attachEvent('onfocusin', focusFn);
				document.attachEvent('onfocusout', blurFn);
			}

			var elss = [ document.getElementsByTagName('input'),
					document.getElementsByTagName('textarea') ];
			for (var n = 0; n < 2; n++) {
				var els = elss[n];
				for (var i = 0; i < els.length; i++) {
					var el = els[i];
					var placeholder = el.getAttribute('placeholder'), emptyHintEl = el.__emptyHintEl;
					if (placeholder && !emptyHintEl) {
						emptyHintEl = document.createElement('span');
						emptyHintEl.innerHTML = placeholder;
						emptyHintEl.className = 'moneyhint';
						emptyHintEl.onclick = function(el) {
							return function() {
								try {
									el.focus();
								} catch (ex) {
								}
							}
						}(el);
						if (el.value)
							emptyHintEl.style.display = 'none';
						el.parentNode.insertBefore(emptyHintEl, el);
						el.__emptyHintEl = emptyHintEl;
					}
				}
			}
		}

		initPlaceHolders();
	</script>
</body>
</html>
