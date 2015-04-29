<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/basic_new_v2.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/187.css" />
<script>
	$(function() {
		$("#trTool li").hover(
				function() {
					$("#trTool li").removeClass("current");
					$("#trTool li:eq(" + $("#trTool li").index(this) + ")")
							.addClass("current");
					$(".tools").css("display", "none");
					$("#tool" + ($("#trTool li").index(this) + 1)).css(
							"display", "block");
				});
	});
</script>
<style>
.side-c td,.side-c td a {
	color: #333;
	font-size: 14px;
}

.side-c .shuzi {
	width: 125px;
	height: 35px;
	line-height: 35px;
	padding-right: 5px;
	text-align: right;
	color: #ff6600;
	font-size: 28px;
}

.side-c td {
	text-align: left;
}
</style>
<div class="side-c" style="margin-top: 35px;">
	<div
		style="width: 270px; height: 260px; border: 1px solid #ddd; background-color: #fff;">
		<img src="resources/images/img/shuju.jpg"
			style="width: 250px; height: 85px; margin: 5px 0 0 10px" />
		<table
			style="margin: 5px 0 0 10px; width: 250px; height: 35px; background-color: #f2f7fb">
			<tr>
				<td colspan="2" style="height: 35px;"><span
					style="display: block; width: 240px; height: 20px; margin-right: 10px; line-height: 20px; background: url('resources/images/img/month.jpg') no-repeat; color: #fff; font-size: 16px;">
						&nbsp;<fmt:formatDate value="${now }" type="both" dateStyle="long"
							pattern="MM" />月<font
						style="margin-left: 30px; line-height: 20px; font-size: 15px; color: #333">数据</font>
				</span></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; line-height: 35px;">
					<span style="color: #ff6600; font-size: 24px;">${lrcount }</span> <span
					style="font-size: 16px; color: #333">人实现借款</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; line-height: 35px;">
					<span style="color: #ff6600; font-size: 24px;">${bcount }</span> <span
					style="font-size: 16px; color: #333">人成功投资</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; line-height: 35px;">
					<span style="color: #ff6600; font-size: 24px;">${money }</span> <span
					style="font-size: 16px; color: #333">元成交金额</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			<tr>
		</table>
	</div>
<%-- 
	<div
		style="width: 270px; height: 308px; border: 1px solid #ddd; margin-top: 25px; background-color: #fff;">
		<div class="box240" style="margin-left: 15px;">
			<div class="tit05"
				style="padding-top: 13px; font-size: 16px; color: #333; font-weight: 500">理财工具</div>
			<div class="money_tools">
				<script language="javascript">
					function WinOpen(url) {
						window.open(url, "",
								"toolbar=no,location=no,scrollbars=no,resizable=0,top="
										+ (screen.Height - 100) / 2 + ",left="
										+ (screen.Width - 100) / 2 + "");
					}
				</script>
				<div class="nav_name">
					<ul id="trTool">
						<li class="current"><a>贷款</a></li>
						<li class=""><a>储蓄</a></li>
						<li class=""><a>股票</a></li>
						<li class=""><a>基金</a></li>
						<li class=""><a>债券</a></li>
						<li class=""><a>其它</a></li>
					</ul>
				</div>

				<!--理财工具 begin-->
				<div class="tools" id="tool1" style="display: block;">
					<ul>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcLoan.htm');">贷款计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/LoanAccumFund.htm');">公积金贷款计算器</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcLoanAdv.htm');">提前还款计算器</a>
						</li>
						<%-- <li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcLoanOrRental.htm');">购房与租房比较器</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcLoanChg.htm');">利率变动后还款计算</a>
						</li> --%><%-- 
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcImpLoan.htm');">提前支取与存单质押</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcBuyHouse.htm');">按揭购房相关税费</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcBuyCar.htm');">按揭购车相关税费</a>
						</li>
						<%-- <li><a
							href="javascript:WinOpen('/resources/html/CalcEqualRateRet.htm');">等比累进还款计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcEqualSumRet.htm');">等额累进还款计算器</a>
						</li> --%><%-- 
					</ul>
				</div>


				<div class="tools" id="tool2" style="display: none;">
					<ul>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcDeposit.htm');">存款计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcEdu.htm');">教育储蓄计算器</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcForeSaving.htm');">外币储蓄计算器</a>
						</li>
						<%-- <li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcExRate.htm');">外币兑换计算器</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcSavingComb.htm');">最佳存款组合计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcInformSave.htm');">通知存款计算器</a>
						</li> --%><%-- 
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcZCLQ.htm');">整存零取计算器</a>
						</li>
						<%-- <li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcDingHuo.htm');">定活两便计算器</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcSaveCapGetAcc.htm');">存本取息计算器</a>
						</li> --%><%-- 
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcActiveSave.htm');">活期储蓄计算器</a>
						</li>
					</ul>
				</div>

				<div class="tools" id="tool3" style="display: none;">
					<ul>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcStockProfit.htm');">股票市盈率计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcStockTradeFee.htm');">股票交易手续费计算</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcStockInvestLost.htm');">股票投资损益计算器</a>
						</li>
					</ul>
				</div>

				<div class="tools" id="tool4" style="display: none;">
					<ul>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcOpenFundRet.htm');">开放基金赎回计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcFundDeclare.htm');">开放式基金申购计算</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcFundInvestLost.htm');">封闭基金损益计算</a>
						</li>
					</ul>
				</div>

				<div class="tools" id="tool5" style="display: none;">
					<ul>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcBondERate.htm');">债券到期收益率计算</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcBondBuy.htm');">债券认购收益率计算</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcBondDealCompare.htm');">债券买卖比较器</a>
						</li>
					</ul>
				</div>

				<div class="tools" id="tool6" style="display: none;">
					<ul>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcTax.htm');">个人所得税计算器</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcInflatOrInVest.htm');">通货膨胀影响投资</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcInflatOrInCom.htm');">通货膨胀影响消费</a>
						</li>
						<li style="margin-right: 0px"><a
							href="javascript:WinOpen('/resources/html/CalcSaveRate.htm');">人民币存款利率表</a>
						</li>
						<li><a
							href="javascript:WinOpen('/resources/html/CalcForeSaveRate.htm');">外币存款利率表</a>
						</li>
					</ul>
				</div>
				<!--理财工具 end-->
			</div>
		</div>
	</div>
--%>
	<div
		style="width: 270px; height: 260px; border: 1px solid #ddd; margin-top: 25px; background-color: #fff;">
		<table style="margin: 10px 0 0 15px; width: 240px; height: 115px;">

			<c:forEach items="${appDeputys}" var="d">
				<c:if test="${d.name eq '最新公告' }">
					<tr>
						<td style="height: 40px;"><span
							style="float: left; font-size: 18px; color: #333; font-weight: 500; line-height: 30px;">${d.name }</span>
							<span style="float: right; line-height: 30px;"><a
								href="${d.url }" style="color: #3377cc">更多&gt;</a></span></td>
					</tr>
					<c:set var="n" value="0" />
					<c:forEach items="${appArticles}" var="itemTmp">
						<c:if test="${itemTmp.deputysection.id  == d.id }">
							<c:if test="${n < 5}">
								<tr>
									<td style="height: 30px"><a href="${itemTmp.url}"><img
											src="resources/images/img/dian.jpg"
											style="width: 15px; height: 13px" align="absmiddle" />${itemTmp.title}</a>
									</td>
								</tr>
							</c:if>
							<c:set var="n" value="${n+1 }" />
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>

			<tr>
				<td style="height: 15px; border-bottom: 1px solid #ddd"></td>
			</tr>
		</table>
		<table style="margin: 10px 0 0 15px; width: 240px; height: 115px;">
			<c:forEach items="${appDeputys}" var="d">
				<c:if test="${d.name eq '媒体报道' }">
					<tr>
						<td style="height: 40px;"><span
							style="float: left; font-size: 18px; color: #333; font-weight: 500; line-height: 30px;">${d.name }</span>
							<span style="float: right; line-height: 30px;"><a
								href="${d.url }" style="color: #3377cc">更多&gt;</a></span></td>
					</tr>
					<c:set var="n" value="0" />
					<c:forEach items="${appArticles}" var="itemTmp">
						<c:if test="${itemTmp.deputysection.id  == d.id }">
							<c:if test="${n < 1}">
								<tr>
									<td style="height: 60px"><a href="javascript:void(0)"><img
											src="resources/images/img/jrj.jpg"
											style="width: 90px; height: 45px; float: left;"
											align="absmiddle" /></a> <span
										style="display: block; height: 50px; width: 140px; float: right"><a
											href="${itemTmp.url}">${itemTmp.title}</a></span></td>
								</tr>
							</c:if>
							<c:set var="n" value="${n+1 }" />
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
			<tr>
				<td style="height: 15px"></td>
			</tr>
		</table>
	</div>
	<%--
	<div class="mod-a mod-stat"></div>
	<c:if test="${empty session_user.userName}">
		<div class="mod login-mod mod-shadow unlogined"
			style="position: relative; margin-bottom: 10px;">
			<div class="hd">
				<h3>
					用户登录<span class="en-word">login</span>
				</h3>
			</div>
			<div class="bd">
				<div class="error-mod-1" style="display: none"></div>
				<form method="post" action="/registration/user_login"
					id="login_form">
					<div class="fieldset">
						<ul>
							<li class="fline"><label class="flabel">用户名</label> <span
								class="field"> <span class="input-text"> <input
										id="username" type="text" class="log_user"
										placeholder="请输入用户名/邮箱" name="userName" width="30px"
										title="请输入用户名" />
								</span>
							</span></li>

							<li class="fline"><label class="flabel">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
								<span class="field"> <span class="input-text"><input
										id="pwd" name="pwd" type="password" class="log_pwd"
										placeholder="请输入密码" title="请输入密码" /> </span>
							</span></li>
							<li class="fline"><label class="flabel">验证码</label> <span
								class="field"> <span style="width: 42px;"
									class="input-text input-vcode"> <input type="text"
										id="captcha" name="captcha" class="log_ipt" placeholder="验证码"
										title="验证码" />
								</span> <img align="AbsMiddle" src="/cic/code?name=user_login" id="verify_img"
									onclick="this.src='/cic/code?name=user_login&id='+new Date();"
									title="看不清，点击换一张"
									style="cursor: pointer; width: 70px; height: 26px;" />
							</span></li>
						</ul>
					</div>
					<div class="btn-line">
						<span class="ubtn ubtn_am"><input type="button" id="enter"
							style="width: 92px;" class="df_loginBnt" /> </span>
						<!-- <div class="links">
							<a href="/find_password/init.do" style="color: red;"><font
								color="red">忘记密码</font></a> <a href="redirection/index?url=regist"
								target="_blank">注册太平洋理财账号</a>
						</div> -->
						<span class="ubtn ubtn_am" style="margin-left: 5px;"><input
							type="button"
							style="width: 92px; background-image: url('/resources/images/img/register.png');"
							class="df_RegisterBnt"
							onclick="javascript:window.location.href='/visitor/to-regist'" />
						</span>
					</div>
				</form>

			</div>
		</div>
	</c:if>

	<c:forEach items="${appDeputys}" var="d">
		<c:if test="${d.isRecommend == 1 && d.isShow == 1}">
			<div class="mod-b mod-shadow mgb">
				<div class="hd">
					<h3>${d.name}</h3>
					<div class="act">
						<a class="more" href="${d.url}">更多&#187;</a>
					</div>
				</div>
				<div class="bd">
					<ul class="list-simple-p2 content-list">
						<c:set var="n" value="0" />
						<c:forEach items="${appArticles}" var="itemTmp">
							<c:if test="${itemTmp.deputysection.id  == d.id }">
								<c:if test="${n < 5}">
									<li class="lsp2-item"><span class="lsp2-content"> <a
											href="${itemTmp.url}" title="" target="_blank">${itemTmp.title}
										</a>
									</span></li>
								</c:if>
								<c:set var="n" value="${n+1 }" />
							</c:if>
						</c:forEach>

					</ul>

				</div>
			</div>
		</c:if>
	</c:forEach>




	<div class="mod-b mod-shadow mgb">

		<div class="hd">
			<h3>太平洋理财微信</h3>
			<div class="act">
				<a class="more" href="javascript:void(0)">更多&#187;</a>
			</div>
		</div>
		<div class="bd" style="height: 150px;">
			<div style="margin: 20px 0 0 8px;">
				<img src="resources/images/img/2weima.png"
					style="width: 100px; height: 100px;" /> <img
					src="resources/images/img/shao.png"
					style="width: 107px; height: 57px;" />
			</div>
		</div>
	</div>


	<div class="mod-b mod-shadow mgb">

		<div class="hd">
			<h3>投资记录</h3>
			<div class="act">
				<a class="more" href="javascript:void(0)">更多&#187;</a>
			</div>
		</div>
		<div class="bd" style="height: auto;padding-bottom:10px;">
			<div>
				<ul class="list-simple-p2 content-list">
					<li class="lsp2-item" style="border-bottom: 2px solid #d55300"><span
						style="color: #444; font-weight: bold">用户名 </span><span
						style="color: #444; font-weight: bold; margin-left: 20px;">投资金额
					</span><span style="color: #444; font-weight: bold; margin-left: 20px;">投资时间
					</span></li>
				</ul>
			</div>
			<div id="demo" style="overflow:hidden;">
			<div id="demo1">
				<ul class="list-simple-p2 content-list" style="margin-top: 0;padding:0px 15px;">
					<c:forEach items="${loanRecord}" var="record">
						<li class="lsp2-item"><span
							style="color: #444; display: block; float: left; width: 60px;">${fn:substring(record[0],0,4)}...
						</span><span
							style="color: #e05886; display: block; float: left; width: 70px;">${record[1]}元</span><span
							style="color: #444; display: block; float: left;">${fn:substring(record[2],0,11)}
						</span></li>
					</c:forEach>
				</ul>
			</div>
			<div id="demo2"></div>
			</div>
	</div>

</div>

	<script>
		var speed = 60;
		var demo2 = document.getElementById("demo2");
		var demo1 = document.getElementById("demo1");
		var demo = document.getElementById("demo");
		demo2.innerHTML = demo1.innerHTML;
		demo.style.height = demo1.offsetHeight + "px";
		function Marquee() {
			if (demo2.offsetTop - demo.scrollTop - demo.offsetTop <= 0) {
				demo.scrollTop -= demo1.offsetHeight;
			} else {
				demo.scrollTop++;
			}
		}
		var MyMar = setInterval(Marquee, speed);
		demo.onmouseover = function() {
			clearInterval(MyMar);
		}
		demo.onmouseout = function() {
			MyMar = setInterval(Marquee, speed);
		}
	</script>
	
--%>
</div>
<script>
	var toolCtr = new TabControl();
	toolCtr.addRange($('trTool').getElementsByTagName('li'), [ 'tool1',
			'tool2', 'tool3', 'tool4', 'tool5', 'tool6' ]);
	toolCtr.triggerType = "mouseover";
	toolCtr.init();
</script>
