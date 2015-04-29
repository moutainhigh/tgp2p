<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<base href="<%=basePath %>" />
		<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
		<title>${title }</title>
	</head>
	<body>
		<!--top-->
		<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
		<!--End top-->
		<!--Content-->
		<div class="Content">
			<div class="w960px" style="margin-top:15px">
				<div style="width:999px;height:30px;line-height:30px;padding-left:1px;margin-bottom:10px;font-size:18px;color:#555">
					<a href="/index" style="font-size:16px;color:#333">首页</a>&nbsp;>
					<a href="${deputy.topic.url}" style="font-size:16px;color:#333">${deputy.topic.name }</a>&nbsp;>
					<a href="javascript:void(0);" style="font-size:16px;color:#333">${deputy.name }</a>
				</div>
				<jsp:include page="/WEB-INF/views/visitor/communal/left.jsp" />
				<div class="projectRightBox" style="border:1px solid #ddd;background-color:#fff;width:775px;padding:0 0 10px 15px">
					<div style="width:765px;height:50px;border-bottom:2px solid #b3b8bb">
						<div style="height:50px;padding:0 10px 0 5px;border-bottom:2px solid #244973;line-height:50px;font-size:22px;color:#333;font-weight: bold;float:left">
							${deputy.name}
						</div>
					</div>
					<div style="width:765px;padding-top:10px;">
						<c:if test="${type eq 'single' }">
							<c:if test="${type1 eq 'pdf' }">
								<table id="reportTable">
								<tr>
									<th>编号</th>
									<th>标题</th>
									<th>上传时间</th>
									<th>操作</th>
								</tr> 
								<c:forEach items="${pdfList}" var="pdf" varStatus="pdfStatus">
								<tr>
									<td style="width:50px">${pdfStatus.index+1}</td>
									<td style="width:280px"><a href="${pdf.savePath}" target="_blank">${pdf.saveName}</a></td>
									<td style="width:160px">${pdf.addTime}</td>
									<td style="width:200px"><a href="${pdf.savePath}" target="_blank">查看</a><a href="/feedback/downFile?id=${pdf.id }" style="margin-left:20px">下载</a></td>
								</tr>
								</c:forEach>
								</table>
								<style>
								#reportTable {border-collapse: collapse; border-spacing: 0;margin:10px 0 10px 0;border:1px solid #ddd;}
								#reportTable th,#reportTable td{padding:0 10px;text-align:center;font-size:14px;line-height: 30px;border: 1px solid #ddd;color:#333;}
								#reportTable a {color:#333}
								</style>
							</c:if>
							<c:if test="${type1 ne 'pdf' }">
								${deputy.pageHtml }
							</c:if>
						</c:if>
						<c:if test="${type eq 'article' }">${article.context }</c:if>
						
					</div>
					<!--TxList Cont-->
					<%--<div class="pjRightCont">
						<div class="ContentTextBox">
							<div class=" mapString">
								<span>您当前位置：</span><a href="/">太平洋理财</a>>${deputy.topic.name
								}>${deputy.name }
							</div>
							<c:if test="${type eq 'single' }">${deputy.pageHtml }</c:if>
							<c:if test="${type eq 'article' }">${article.context }</c:if>
						</div>
					</div>
					--%><!--End porjectBox-->
				</div>
				<!--End TxList Cont-->
			</div>
		</div>
		<!--End Content-->
		<div class="clear"></div>
		<div style="width:1000px;height:50px;"></div>
		<%--<div
			style="width: 1000px; height: 50px; margin: 0 auto; padding: 10px 0">
			<a href="javascript:void(0)"><img
			src="resources/images/img/bottom1.jpg" /></a><a href=""><img
		src="resources/images/img/bottom2.jpg" /></a><a href=""><img
	src="resources/images/img/bottom3.jpg" /></a><a href=""><img
src="resources/images/img/bottom4.jpg" /></a><a href=""><img
src="resources/images/img/bottom5.jpg" /></a>
</div>
--%><!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<script type="text/javascript"
src="<%=basePath %>resources/js/autolist.js"></script>
<!--End footer-->
</body>
</html>
