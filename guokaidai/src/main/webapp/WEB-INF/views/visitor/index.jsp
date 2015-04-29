<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.tpy.base.util.SysUtil" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财-普惠金融 诚信共赢</title>
<style>
.wylc0, .zqzr0 {
	background-color: #f0f4f7;
}
</style>
<link type="text/css" rel="stylesheet" href="resources/css/new.css" />
<link type="text/css" rel="stylesheet" href="resources/css/style.css" />
<link type="text/css" rel="stylesheet" href="resources/css/other.css" />
<link type="text/css" rel="stylesheet" href="resources/css/user.css" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" href="resources/css/base_index.css" />
<link rel="stylesheet" href="resources/css/index_1.css" />
<script type="text/javascript" src="resources/js/loanSign/loaninfo.js"></script>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<base href="<%=basePath%>" />
<script>
	function userGain() {
		var gain = $('#userGain0');
		setTimeout(function() {
			gain.animate({
				height : 270,
				"margin-top" : 40
			}, 800).animate({
				"margin-top" : 30
			}, 800);
		}, 500);
	};
	$(function() {
		userGain();
	});
</script>
</head>
<body>
	<div class="doc doc-711-234" style="background-color: #f3f3f3;">
		<!-- top -->
		<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
		<div class="slider" style="height: 330px;">
			<ul id="indexSlide" class="slider-img indexSlide indexSlide1">
				<c:forEach items="${application_banner}" var="v" varStatus="vs">
					<li
						style="background-image: url(${v.imgurl}); background-position:center "
						id="indexSlide1_s${vs.index }">

						<div style="position: relative; width: 1000px; margin: 0 auto">
							<c:if test="${empty session_user }">
								<div class="gain" id="userGain${vs.index }">
									<div class="gain-cont">
										<h2 style="padding-top: 40px;"><c:out value="太平洋理财" />,欢迎您！</h2>
										<div style="height: 30px"></div>
										<p class="reg">
											<a href="/visitor/to-regist">免费注册</a>
										</p>
										<p class="tar">
											已有账号? <a href="/visitor/to-login">立即登录</a>
										</p>
									</div>
									<div class="opacity"></div>
								</div>
							</c:if>
							<c:if test="${!empty session_user }">
								<div class="gain" id="userGain${vs.index }">
									<div class="gain-cont usered">
										<h2>欢迎来太平洋理财投资理财！</h2>
										<p class="name">
											您当前的登录账户是：<span class="light-org">${session_user.userName }</span>
										</p>
										<p class="reg">
											<a href="/member_index/member_center">进入我的账户</a>
										</p>
									</div>
									<div class="opacity"></div>
								</div>
							</c:if>
						</div> 
						<c:if test="${empty v.url}">
							<a href="javascript:void(0)"></a>
						</c:if> 
						<c:if test="${!empty v.url}">
							<a href="${v.url }"></a>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
		<script src="/resources/js/common.js"></script>
		<script src="/resources/js/index.js"></script>
		<script>
			$(function() {
				itz.index.init();
			});
		</script>
		<div class="w960px" style="margin-top: 30px;">
			<!--tuwen-->
			<ul class="tuwenList">
				<c:forEach items="${outlineList }" var="outline" varStatus="s">
					<li style="margin: 0px; padding-left: 10px;">
						<div style="float: left;">
							<a style="height: 116px; width: 120px; float: left;"
								class="desc-icon${s.count}"></a>
							<!-- <img src="${outline.imgUrl }" style="margin-left: 30px; height: 110px;width: 110px;"/> -->
							${outline.content }
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div style="width: 100%; background-color: #fff; height: 240px; margin: 20px auto 40px auto;">
			<div style="width: 1000px; height: 240px; margin: 0 auto; border-bottom: 1px solid #ddd">
				<div
					style="width: 1000px; height: 51px; border-bottom: 1px solid #E70012; margin-bottom: 10px;">
					<div style="width: 205px; height: 50px; float: left;">
						<span style="color: #F17833; font-size: 24px; padding-top: 10px; display: block; font-weight: bold">太平洋理财</span>
					</div>
					<span style="padding-top: 25px; float: right; color: #e75f25;">
						<img align="absmiddle" src="resources/images/img/time.png" />&nbsp;&nbsp;每周一至周五上午10点发售</span>
				</div>
				<div style="width: 800px; height: 170px; padding-left: 260px; background: url(/resources/images/img/yjlc.jpg) no-repeat">
					<div style="width: 450px; float: left; margin-top: 20px;">
						<span style="color: #333; font-size: 18px; font-weight: 600">预期年化收益率<em
							style="color: #e75f25; font-size: 24px; font-weight: 600; padding-left: 10px">12%-18%</em></span>
						<p>&nbsp;</p>
						<p>
							<span style="font-size: 14px; color: #333"><img
								src="resources/images/img/tt.png" />&nbsp;&nbsp;最低<span
								style="font-size: 14px; color: #ea5207">50元</span>即可加入</span> <span
								style="margin-left: 25px; font-size: 14px; color: #333"><img
								src="resources/images/img/tt.png" />&nbsp;&nbsp;<span
								style="font-size: 14px; color: #ea5207">太平洋理财标的</span> 循环出借</span>
						</p>
						<p>&nbsp;</p>
						<p>
							<span style="font-size: 14px; color: #333"><img
								src="resources/images/img/tt.png" />&nbsp;&nbsp;合约期限<span
								style="font-size: 14px; color: #ea5207">1-12</span>个月</span>
							<!-- <span style="margin-left: 55px;font-size:14px;color:#333"><img
							src="resources/images/img/tt.png" />&nbsp;&nbsp;<span style="font-size:14px;color:#ea5207">90</span>天后可提前退出</span>
						</p> -->
					</div>
					<div
						style="width: 350px; float: right; text-align: center; margin-top: 25px">
						<p style="font-size: 14px; color: #444">${youxuan.loansignbasics.loanTitle}</p>
						<p>
							<span style="color: #333; font-size: 28px; font-weight: bold;">即将开始</span>
						</p>
						<a href="loaninfo/openLoan.htm"><span
							style="display: block; width: 220px; height: 45px; line-height: 45px; text-align: center; color: #fff; font-size: 24px; background-color: #E70012; margin: 10px 0 0 65px">即将预约</span></a>
					</div>
				</div>
			</div>
		</div>

		<div class="ctn-960 mg clx mt-n" style="padding-bottom: 20px;">
			<%--<!--定存宝-->--%>
			<%--<div class="main-c" style="margin-top: 35px;">--%>
				<%--<table--%>
					<%--style="width: 700px; border: 1px solid #ddd; background-color: #fff">--%>
					<%--<tr>--%>
						<%--<td style="height: 45px; border-bottom: 1px solid #ddd"><span--%>
							<%--style="display: block; height: 45px; float: left; font-size: 18px; line-height: 45px; color: #003384; font-weight: 500; margin-left: 10px;"><img--%>
								<%--src="resources/images/img/sbtz.png" align="absmiddle" />&nbsp;定存宝</span>--%>
							<%--<span style="display: block; height: 45px; float: right; margin-right: 10px;">--%>
						<%--</span></td>--%>
					<%--</tr>--%>
					<%--<c:forEach items="${pools}" var="pool" end="5" varStatus="stat">--%>
						<%--<tr class="wylc${stat.index%2 }">--%>
							<%--<td style="height: 80px;">--%>
								<%--<table width="100%">--%>
									<%--<tr>--%>
										<%--<td style="width: 130px; height: 60px">--%>
                                            <%--<span style="margin-left: 10px; line-height: 60px; display: block; height: 60px">--%>
												<%--<img src="/resources/images/img/benxi.png"--%>
												<%--style="width: 36px; height: 26px; display: inline-block; float: left; margin-top: 15px" alt="本息保障" title="本息保障" />--%>
												<%--<a href="/loaninfo/getPoolInfo.htm?pool=${pool.id}"--%>
                                                   <%--style="font-size: 16px; color: #003368; float: left; margin-left: 5px;">定存宝-${pool.poolNum}</a>--%>
										    <%--</span>--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<span style="margin-left: 5px; float: left">利率：--%>
                                                <%--<font style="font-size: 16px; color: #ff6503"><fmt:formatNumber value="${pool.yearInterest}" type="number" pattern="#,#00.0#" /></font>--%>
                                                <%--<font style="font-size: 12px; color: #ff6503">&nbsp;%</font>--%>
                                            <%--</span>--%>
                                            <%--<span style="margin-left: 20px; float: left">期限：--%>
                                                <%--<font style="font-size: 16px; color: #ff6503">${pool.poolNum}个月</font>--%>
                                            <%--</span>--%>
                                            <%--<span style="margin-left: 20px; float: left">可购份额：--%>
                                                <%--<font style="font-size: 12px; color: #333">￥<fmt:formatNumber value="${pool.openAmount}" type="number" pattern="#,#00.0#" />元</font>--%>
                                            <%--</span>--%>
                                        <%--</td>--%>
										<%--<td style="width: 130px; text-align: right; padding-right: 10px;float:right">--%>
                                            <%--<a <c:choose>--%>
                                                <%--<c:when test="${pool.soldOut == 0}">--%>
                                                    <%--href="/loaninfo/buyTranferLoan.htm?pool=${pool.poolNum}" style="cursor: pointer;">--%>
                                                    <%--<img src="resources/images/img/ktz.png" width=100px height=35px/>--%>
                                                <%--</c:when>--%>
                                                <%--<c:otherwise>--%>
                                                    <%--href="javascript:void(0)" style="cursor:none;">--%>
                                                    <%--<img src="resources/images/img/ymb.png" width=100px height=35px/>--%>
                                                <%--</c:otherwise>--%>
                                            <%--</c:choose>--%>
                                            <%--</a>--%>
										<%--</td>--%>
									<%--</tr>--%>
								<%--</table>--%>
							<%--</td>--%>
						<%--</tr>--%>
					<%--</c:forEach>--%>
				<%--</table>--%>
			<%--</div>--%>

			<div class="main-c" style="margin-top: 35px;">
				<table
						style="width: 700px; border: 1px solid #ddd; background-color: #fff">
					<tr>
						<td style="height: 45px; border-bottom: 1px solid #ddd"><span
								style="display: block; height: 45px; float: left; font-size: 18px; line-height: 45px; color: #003384; font-weight: 500; margin-left: 10px;"><img
								src="resources/images/img/sbtz.png" align="absmiddle" />&nbsp;散标投资</span>
							<span
									style="display: block; height: 45px; float: right; margin-right: 10px;">
								<%--<a href="loaninfo/openLoan.htm"--%>
								   <%--style="font-size: 14px; line-height: 45px; color: #003384;">更多</a>--%>
						</span></td>
					</tr>
					<c:forEach items="${loanlist5 }" var="loanList" end="5"
							   varStatus="stat">
						<tr class="wylc${stat.index%2 }">
							<td style="height: 100px;">
								<table>
									<tr>
										<td style="width: 290px; height: 60px"><span
												style="margin-left: 10px; line-height: 60px; display: block; height: 60px">
												<img src="/resources/images/img/subtype-${loanList[18]}.png"
													 style="width: 16px; height: 16px; display: inline-block; float: left; margin-top: 22px"
														<c:choose>
															<c:when test="${loanList[18] eq 1 }">alt="小担当认证标" title="小担当认证标"</c:when>
															<c:when test="${loanList[18] eq 2 }">alt="担保认证标" title="担保认证标"</c:when>
															<c:when test="${loanList[18] eq 3 }">alt="抵押认证标" title="抵押认证标"</c:when>
															<c:when test="${loanList[18] eq 4 }">alt="信用认证标" title="信用认证标"</c:when>
															<c:when test="${loanList[18] eq 5 }">alt="实地认证标" title="实地认证标"</c:when>
															<c:otherwise>alt="认证标" title="认证标"</c:otherwise>
														</c:choose> />
												<a href="/loaninfo/getLoanInfo.htm?id=${loanList[0]}"
												   style="font-size: 16px; color: #003368; float: left; margin-left: 5px;">${loanList[1] }</a>
										</span></td>
										<td style="width: 270px">
											<div class="DataLoadding">
												<span
														data-value="${fn:substring(loanList[13]*100,0,fn:indexOf(loanList[13]*100,'.')+2)}"
														class=""><b>完成进度${fn:substring(loanList[13]*100,0,fn:indexOf(loanList[13]*100,".")+2)}%</b></span>
											</div>
										</td>
										<td rowspan="2"
											style="width: 130px; text-align: right; padding-right: 10px;">
											<c:if test="${loanList[12]==2 && loanList[13]!=1}">
												<a href="/loaninfo/getLoanInfo.htm?id=${loanList[0]}"
												   style="cursor: pointer;"> <img
														src="resources/images/img/ktz.png" width=100px height=35px />
												</a>
											</c:if> <c:if test="${loanList[12]==3}">
											<a> <img src="resources/images/img/hkz.png" width=100px
													 height=35px /></a>
										</c:if> <c:if test="${loanList[12]== 4 }">
											<a> <img src="resources/images/img/ywc.png" width=100px
													 height=35px /></a>
										</c:if> <c:if test="${loanList[12]==2 && loanList[13]==1}">
											<a> <img src="resources/images/img/ymb.png" width=100px
													 height=35px /></a>
										</c:if>
										</td>
									</tr>
									<tr>
										<td><span style="margin-left: 10px; float: left">利率：<font
												style="font-size: 16px; color: #ff6503">${fn:substring(loanList[3]*100,0,fn:indexOf(loanList[3]*100,".")+3)}</font><font
												style="font-size: 12px; color: #ff6503">&nbsp;%</font></span> <span
												style="margin-right: 50px; float: right">期限：<font
												style="font-size: 16px; color: #ff6503">${loanList[4] }个月</font></span></td>
										<td style="text-align: right"><span style="">金额：<font
												style="font-size: 12px; color: #333">￥${fn:substring(loanList[2],0,fn:indexOf(loanList[2],".")+3)}元</font></span></td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
                <%@ include file="/WEB-INF/views/visitor/tender_right.jsp"%>
		</div>
	</div>

	<!-- 新手专区 -->
	<!-- <div class="xszq" style="margin-bottom:30px">
		<div
			style="width: 1000px; height: 50px; border-bottom: 1px solid #ddd">
			<span
				style="display: block; height: 50px; float: left; font-size: 20px; color: #003366; line-height: 50px; margin-left: 10px;padding-left:25px;background:url(/resources/images/img/xszq.png) no-repeat">新手专区</span>
			<span
				style="display: block; height: 50px; float: right; line-height: 50px; margin-right: 10px;font-size: 14px;color:#a3adb7;padding-left:20px;">
				<img src="/resources/images/img/xsz.png" align="absmiddle">&nbsp;距下场更新：
				<input type="hidden"id="loantype" value="1" />
				<input type="hidden" id="endtime_year" value="2014" />
				<input type="hidden" id="endtime_month" value="8" />
				<input type="hidden" id="endtime_day" value="18" />
				<input type="hidden" id="time" value="2014-08-18" />
				<label id="showhour" class="showtime" style="color:#6b747b;font-size:15px;font-weight:600"
				>00</label> 时 <label id="showminute" class="showtime" style="color:#6b747b;font-size:15px;font-weight:600"
				>17</label> 分<label id="showsecond" class="showtime" style="color:#6b747b;font-size:15px;font-weight:600">27</label> 秒
			</span>
		</div>
		<div style="width:1000px;height:35px;border-bottom:1px solid #ddd;text-align:center">
			<span style="line-height:35px;font-size:14px;color:#a3adb7;">
				新客专享，优先投资；50元起投；工作日<span style="font-size:16px;color:#fd8932;font-weight:600"
				>10:30</span>、<span style="font-size:16px;color:#fd8932;font-weight:600"
				>14:30</span>、<span style="font-size:16px;color:#fd8932;font-weight:600"
				>17:30</span>、<span style="font-size:16px;color:#fd8932;font-weight:600"
				>20:00</span>&nbsp;更新，周末与其余时间随机
			</span>
		</div>
		<div style="width:1000px;height:80px;">
			<div style="width:730px;height:55px;padding-top:25px">
				<span style="font-size:14px;color:#969a99;display:block;margin:0 0 0 240px">
					当前暂无可投资的新手专享项目，请关注下一时段的项目发布
				</span>
				<a href="javascript:void(0)"><span style="font-size:14px;color:#969a99;display:block;float:right">
					更多&gt;
				</span></a>
			</div>
		</div>
	</div> -->

	<!-- 合作伙伴 -->
	<div class="hezuo" style="margin-bottom: 30px">
		<div
			style="width: 1000px; height: 50px; border-bottom: 1px solid #ddd">
			<span
				style="display: block; height: 35px; float: left; font-size: 18px; font-weight: normal; color: #FFFFFF; line-height: 35px; margin-left: 10px; margin-top: 7px; padding-left: 5px; background-color: #E74A3B; width: 79px;">合作伙伴</span>
			<%-- <span
				style="display: block; height: 50px; float: right; line-height: 50px; margin-right: 10px;">
				<a style="font-size: 14px; color: #164674;">更多&gt;</a>
			</span> --%>
		</div>
		<%-- 		<div class="move" style="margin: 10px 0;">
			<ul style="margin: 15px;">
			<c:forEach items="${application_link}" var="link">
				<c:if test="${link.type eq 1 && link.isShow eq 1 }">
					<li><a href="${link.url }" target="_blank"><img src="${link.verifyImg }" alt="${link.name }"></img> </a></li>
				</c:if>
			</c:forEach>
			</ul>
		</div> --%>
		<div class="move" id="demo">
			<table>
				<tr>
					<td id="item1">
						<table>
							<tr>
								<c:forEach items="${application_link}" var="link">
									<c:if test="${link.type eq 1 && link.isShow eq 1 }">
										<td><a href="${link.url }" target="_blank"><img
												style="height: 40px;" src="${link.verifyImg }"
												alt="${link.name }"></img> </a></td>
									</c:if>
								</c:forEach>
							</tr>
						</table>
					</td>
					<td id="item2"></td>
					<td id="item3"></td>
				</tr>
			</table>
		</div>
		<script language="javascript" type="text/javascript">
			var demo = document.getElementById("demo");
			var demo1 = document.getElementById("item1");
			var demo2 = document.getElementById("item2");
			var demo3 = document.getElementById("item3");
			var speed = 20; //数值越大滚动速度越慢
			demo2.innerHTML = demo1.innerHTML;
			demo3.innerHTML = demo1.innerHTML;
			function Marquee() {
				if (demo3.offsetWidth - demo.scrollLeft <= 0)
					demo.scrollLeft -= demo1.offsetWidth;
				else {
					demo.scrollLeft++;
				}
			}
			var MyMar = setInterval(Marquee, speed);
			demo.onmouseover = function() {
				clearInterval(MyMar);
			};
			demo.onmouseout = function() {
				MyMar = setInterval(Marquee, speed);
			};
		</script>
	</div>
	<%@ include file="/WEB-INF/views/visitor/footer.jsp"%>
</body>
</html>
