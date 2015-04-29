<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" id="security_verifiy" value="${security_verifiy }">
<div class="header">
	<div class="header-operate">
		<div class="header-o-con cf">
			<ul class="header-o-c-l cf">
				<c:if test="${empty session_user.userName}">
					<li><a href="/visitor/to-regist"> <span
							style="color: #cfcfcf;">免费注册 </span>
					</a>丨</li>
					<li style="margin-right: 0px;"><a href="/visitor/to-login"><span
							style="color: #cfcfcf;">登录</span></a><span class="fl"
						style="color: #FFFFFF;"></span></li>
				</c:if>
				<li style="margin-right: 14px;"><span style="color:#cfcfcf">&nbsp;&nbsp;欢迎您来到太平洋理财！</span><span
					class="fl" style="color: #FFFFFF;"></span></li>
				<li><span style="color: #ff9900">客服热线:400-7887-600</span></li>
			</ul>
			<div class="header-o-c-r cf">
				<p class="header-o-c-login">
					<c:if test="${empty session_user.userName}">
						<a href="/">首页&nbsp;&nbsp;</a>
						<!-- <a href="redirection/index?url=login">登录&nbsp;&nbsp;</a>
						<a href="redirection/index?url=regist">注册&nbsp;&nbsp;</a> -->
						<a href="redirection/index?url=regist">帮助&nbsp;&nbsp;</a>
						<a>游客</a>
					</c:if>
					<c:if test="${!empty session_user.userName}">
						<a>您好!</a>
						<a href="/member_index/member_center" > <b style="color: #ff9900;">&nbsp;&nbsp;${session_user.userName}&nbsp;&nbsp;</b>
						</a>
						<a href="/member_index/system_message">系统消息(${messagecount})&nbsp;&nbsp;
						</a>
						<a href="javascript:void(0);" class="login_out">安全退出</a>

					</c:if>
			</div>
		</div>
	</div>

	<div class="head">
		<div id="main" style="width: 1000px;; margin: 0 auto;">
			<div style="float: left;">
				<a href="/"><img src="resources/images/logo.png" title="太平洋理财平台" /></a>
			</div>
			<div style="float: right; padding-right: 20px;">
				<div class="clear"></div>
				<div class="navBox">
					<c:forEach items="${topics }" var="t">
						<c:if test="${t.isShow == 1 }">
							<span> <a <c:choose>
										<c:when test="${t.name eq '首页'}">
											href="/index"
										</c:when>
										<c:when test="${t.name eq '我的账户'}">
											href="/member_index/member_center"
										</c:when>
										<c:when test="${t.name eq '我要借款'}">
											href="/to/single-7-27.htm"
										</c:when>
										<c:otherwise>
											href="${t.url }"
										</c:otherwise>
									  </c:choose>
								<c:if test="${t.id eq topicId }">class="navLink"</c:if> id="dh1">${t.name }</a>
								<c:set var="o" value="0" /> <c:forEach items="${appDeputys }"
									var="appDeputy">
									<c:if test="${appDeputy.topic.id eq t.id && o eq 0 && t.name ne '首页' }">
										<div>
											<ul>
												<c:forEach items="${appDeputys }" var="d">
													<c:if test="${d.topic.id == t.id }">
														<li><a href="${d.url }">${d.name }</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
										<c:set var="o" value="${o+1 }" />
									</c:if>
								</c:forEach>
							</span>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/visitor/communal/safeverify.jsp" />
