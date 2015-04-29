<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<base href="<%=basePath%>" />
<title>太平洋理财贷款平台</title>
</head>
<body>
	<!--top-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--End top-->
	<!--Content-->
	<div class="Content">
		<div class="w960px mapString">
			<span>您当前位置：</span><a href="#">太平洋理财</a>><a href="#">客户问答</a>
		</div>
		<div class="w960px">
			<div class="newsContentBox">
				<div class="newsContentTitle" id="questions">
					<span>热门问题：</span>
					<p>
						<a id="a_all" href="javascript:fun_show('all');" class="ttolink">不限</a><label>|</label>
						<a id="a_type0" href="javascript:fun_show('type0');">借款问题</a><label>|</label><a
						id="a_type1"	href="javascript:fun_show('type1');">投资问题</a><label>|</label>
						<a id="a_type2" href="javascript:fun_show('type2');">关于平台问题</a>
					</p>
				</div>
				<!-- 				显示所有问题中最新10条问题 				 -->
				<dl class="wendaList" id="all">
					<c:forEach items="${problems }" var="p" end="10">
						<dt>
							<b></b><a href="javascript:;">[${enum_problem_type[p.type]}]</a>${p.title }</dt>
						<dd>
							<b></b>
							<c:choose>
								<c:when test="${fn:length(p.replyContent)>title}">
											 ${fn:substring(p.replyContent,0,41)}...
								</c:when>
								<c:otherwise>
												${p.replyContent}
								</c:otherwise>
							</c:choose>
							<a id="detail" href="commonproblem/showDetails?id=${p.id }">详细回答&gt;&gt;</a>
						</dd>
					</c:forEach>
				</dl>
				<!-- 				显示问题类型为“借款问题”的最新10条问题 				 -->
				<dl class="wendaList" id="type0" style="display: none;">
					<c:set var="problem_count0" value="0" />
					<c:forEach items="${problems }" var="p">
						<c:if test="${p.type eq 0 && problem_count0 < 10}">
							<dt>
								<b></b><a href="#">[借款问题]</a>${p.title }</dt>
							<dd>
								<b></b>
								<c:choose>
									<c:when test="${fn:length(p.replyContent)>42}">
											 ${fn:substring(p.replyContent,0,41)}...
								</c:when>
									<c:otherwise>
												${p.replyContent}
								</c:otherwise>
								</c:choose>
								<a id="detail"  href="commonproblem/showDetails?id=${p.id }">详细回答&gt;&gt;</a>
							</dd>
							<c:set var="problem_count0" value="${problem_count0+1 }" />
						</c:if>
					</c:forEach>
				</dl>
				<!-- 				显示问题类型为“投资问题”的最新10条问题 				 -->
				<dl class="wendaList" id="type1" style="display: none;">
					<c:set var="problem_count1" value="0" />
					<c:forEach items="${problems }" var="p">
						<c:if test="${p.type eq 1 && problem_count1 < 10}">
							<dt>
								<b></b><a href="#">[借款问题]</a>${p.title }</dt>
							<dd>
								<b></b>
								<c:choose>
									<c:when test="${fn:length(p.replyContent)>42}">
											 ${fn:substring(p.replyContent,0,41)}...
								</c:when>
									<c:otherwise>
												${p.replyContent}
								</c:otherwise>
								</c:choose>
								<a id="detail"  href="commonproblem/showDetails?id=${p.id }">详细回答&gt;&gt;</a>
							</dd>
							<c:set var="problem_count1" value="${problem_count1+1 }" />
						</c:if>
					</c:forEach>
				</dl>
				<!-- 				显示问题类型为“关于平台问题”的最新10条问题 				 -->
				<dl class="wendaList" id="type2" style="display: none;">
					<c:set var="problem_count2" value="0" />
					<c:forEach items="${problems }" var="p">
						<c:if test="${p.type eq 2 && problem_count2 < 10}">
							<dt>
								<b></b><a href="#">[借款问题]</a>${p.title }</dt>
							<dd>
								<b></b>
								<c:choose>
									<c:when test="${fn:length(p.replyContent)>42}">
											 ${fn:substring(p.replyContent,0,41)}...
								</c:when>
									<c:otherwise>
												${p.replyContent}
								</c:otherwise>
								</c:choose>
								<a id="detail"  href="commonproblem/showDetails?id=${p.id }">详细回答&gt;&gt;</a>
							</dd>
							<c:set var="problem_count2" value="${problem_count2+1 }" />
						</c:if>
					</c:forEach>
				</dl>
			</div>
		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<!--End footer-->
	<script>
	function fun_show(showid){
		$("p>a").attr("class","");
		$("#a_"+showid).attr("class","ttolink");
		$(".wendaList").css("display","none");
		$("#"+showid).show();
	}
	</script>
</body>
</html>
