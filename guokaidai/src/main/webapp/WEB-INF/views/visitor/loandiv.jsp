<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){
	
	showtime2(${fn:length(page.list)});
	
});

</script>


<div class="invest-product-item clearfix" style="width: 710px;">
	<!-- <div class="invest-product-name clearfix">
						<h2 class="dspn"></h2>
						<span class="fl large strong"><em class="strong"></em> <span
							class="slarge">产品</span> </span>
					</div> -->

	<!-- <div class="mod-d">
						<div style="position: relative;" class="project-tab mod-shadow">
							<ul class="cf project-tab-list">
								<li class="current"><a data-item="invest-item-list"
									href="index.htm">企业直投</a></li>
								<li><a data-item="debt-item-list" href="index.htm">债权转让</a>
									<span class="icon-sprite icon-new-1">new</span></li>
							</ul>
							<span style="position: absolute; top: 15px; right: 94px;"
								class="icon-red icon-xingxing-red"></span> <a
								style="position: absolute; top: 1px; right: 10px; color: #c10a0e; margin-right: 10px; display: inline;"
								class="fr" target="_blank" href="javascript:;">企业直投说明</a>
						</div>
					</div> -->



	<c:set var="i" value="0" />
	<c:forEach items="${page.list}" var="loanList">
		<div class="invest-product-case invest-product-case-full-clearfix">
			<div class="i-p-c-window">
				<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}"> <img
					src="resources/images/bt.jpg" width="202" height="230" />
				</a>
				<%-- <c:if test="${empty loanList[17] }">
											<img src="resources/images/bt.jpg" width="202" height="230" /> </a>
										</c:if>
										<c:if test="${!empty loanList[17] }">
											<img src="${loanList[17] }" width="202" height="230" /> </a>
										</c:if> --%>
				<%-- <c:if test="${null!=loan.lsIcon&&''!=loan.lsIcon}">
										<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}"><img width="202"
											height="230" class="i-p-c-img"
											src="upload/${fn:substringAfter(loan.lsIcon,'upload/')}"></a>
									</c:if> --%>
			</div>
			<div class="i-p-c-content">

				<table style="margin-top: 5px; line-height: 31px">
					<tr>
						<td colspan="4" width="465"><a
							href="loaninfo/getLoanInfo.htm?id=${loanList[0]}"
							title="${loanList[1]}"> <span
								style="font-family: 'Microsoft Yahei'; font-size: 19px; font-weight: 700;">${loanList[1]}</span>
						</a></td>
					</tr>
					<tr>
						<td width="180">借入金额：${fn:substring(loanList[2],0,fn:indexOf(loanList[2],".")+3)}
							元</td>
						<td width="55">投标进度</td>
						<td>
							<div class="process-bar">
								<span class="full"> <span
									style="width: ${loanList[15]*100}%;" class="complete-part"></span>
									<span class="complete-percent"> <!--0.34%-->
								</span></span>
							</div>
						</td>
						<td><span style="color: #e05886;">
								${loanList[15]*100}% </span></td>

					</tr>
					<tr>
						<td>年利率：${fn:substring(loanList[3]*100,0,fn:indexOf(loanList[3]*100,".")+3)}
							%</td>
						<td colspan="3">已投金额：<c:if test="${!empty loanList[12] }">${fn:substring(loanList[12],0,fn:indexOf(loanList[12],".")+3)}</c:if>
						<c:if test="${empty loanList[12] }">0.00</c:if>元
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							还需金额：${fn:substring(loanList[2]-loanList[12],0,fn:indexOf(loanList[2]-loanList[12],".")+3)}元</td>
					</tr>
					<tr>
						<td>招标期限：${loanList[4]}天<%-- <c:if test="${!empty loanList[5]}">${loanList[5]}月</c:if>
												<c:if test="${!empty loanList[6]}">${loanList[6]} 天</c:if> <c:if
													test="${empty loanList[6]&&empty loanList[5]}">无</c:if> --%></td>
						<td colspan="3">还款方式： <c:if test="${loanList[10]==1}">
								<c:if test="${loanList[6]== 1}">按月等额本息</c:if>
								<c:if test="${loanList[6]==2}">按月付息到期还本</c:if>
								<c:if test="${loanList[6]== 3}">到期一次性还本息</c:if>
							</c:if> <c:if test="${loanList[10]==2}">
												  到期一次性还本息
												</c:if> <c:if test="${loanList[10]==3}">
												  到期一次性还本息
												</c:if> <c:if test="${loanList[10]==4}">
												  到期一次性还本息
												</c:if>
						</td>
					</tr>
					<tr>
						<td>最低投标金额：￥${loanList[7]}</td>
						<td colspan="3">最高投标金额：￥${loanList[14]}</td>
					</tr>
					<tr>
						<td>总投标数：${fn:substring(loanList[11],0,fn:indexOf(loanList[16],"."))}</td>
						<td colspan="3">浏览数：${loanList[11]}</td>
					</tr>
					<tr>
						<td id="showtime${i }" colspan="2"><input type="hidden"
							id="loanstate${i }" value="${loanList[9]}" /> <input
							type="hidden" id="loanrate${i }" value="${loanList[3]}" /> <input
							type="hidden" id="endtime${i }" value="${loanList[17]}" /> <input
							type="hidden" id="loanyype${i }" value="${loanList[10]}" /> <input
							type="hidden" id="endtime_year${i }"
							value="${fn:substring(loanList[17],0,4) }" /> <input
							type="hidden" id="endtime_month${i }"
							value="${fn:substring(loanList[17],5,7) }" /> <input
							type="hidden" id="endtime_day${i }"
							value="${fn:substring(loanList[17],8,10) }" /> <input
							type="hidden" id="endtime_time${i }"
							value="${fn:substring(loanList[17],11,19) }" /> 还剩：<label
							id="showday${i }" class="showtime"></label>天<label
							id="showhour${i }" class="showtime"></label>时<label
							id="showminute${i }" class="showtime"></label>分<label
							id="showsecond${i }" class="showtime"></label>秒</td>
						<td colspan="2" align="right"><c:if
								test="${loanList[9]==2 && loanList[15]!=1}">
								<a href="/loaninfo/getLoanInfo.htm?id=${loanList[0]}"
									style="cursor: pointer;"> <img
									src="resources/images/img/ljtz.png" width=155px height=38px />
								</a>
							</c:if> <c:if test="${loanList[9]==3}">.
													<a> <img src="resources/images/img/hkz.png" width=155px
									height=38px /></a>
							</c:if> <c:if test="${loanList[9]== 4 }">
								<a> <img src="resources/images/img/ywc.png" width=155px
									height=38px /></a>
							</c:if> <c:if test="${loanList[9]==2 && loanList[15]==1}">
								<a> <img src="resources/images/img/mb.png" width=155px
									height=38px /></a>
							</c:if></td>
					</tr>

				</table>

			</div>
		</div>
		<c:set var="i" value="${i+1 }" />
	</c:forEach>
	<p>&nbsp;</p>

	<div class="quotes">
		<jsp:include page="/WEB-INF/views/member/communal/page.jsp" /></div>
</div>