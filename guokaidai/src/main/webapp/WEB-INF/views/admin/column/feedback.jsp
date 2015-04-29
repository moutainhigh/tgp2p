<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
.feed{text-align: left;}
</style>
<form id="pagerForm" method="post" action="/feedback/open">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="replyType" value="${replyType}" />
	<input type="hidden" name="replyStatus" value="${replyStatus}" />
</form>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/feedback/open" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
					 	反馈类型：<select style="margin-left:10px;"
								name="replyType">
								<option value="">全部</option>
									<c:forEach items="${feedbacktypes}" var="feedvalue">
										<option value="${feedvalue.id}"<c:if test="${replyType eq  feedvalue.id}">selected="selected"</c:if>>${feedvalue.typeName}</option>
									</c:forEach>
							</select>
					</td>
					<td>
					 	回复状态：<select style="margin-left:10px;"
								name="replyStatus">
								<option value="-1"<c:if test="${replyStatus eq  -1}">selected="selected"</c:if>>全部</option>
								<option value="1"<c:if test="${replyStatus eq  1}">selected="selected"</c:if>>已回复</option>
								<option value="0"<c:if test="${replyStatus eq  0}">selected="selected"</c:if>>未回复</option>
							</select>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<div id="w_list_print">
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
<!-- 				<th></th> -->
				<th width="10%" class="feed">反馈人姓名</th>
				<th width="15%" class="feed">反馈人邮件</th>
				<th width="10%" class="feed">反馈人电话</th>
				<th width="20%" class="feed">反馈内容</th>
				<th width="10%" class="feed">反馈类型</th>
				<th width="12%" class="feed">反馈时间</th>
				<th width="8%" class="feed">回复状态</th>
				<th width="10%" class="feed">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${emails}" var="e">
			<tr target="u_id" rel="${e.uploadfile.id}" class="checkall"  style="cursor: pointer;">
				<td class="feed">${e.name}</td>
				<td class="feed">${e.email}</td>
				<td class="feed">${e.phone}</td>
				<td class="feed">${e.context}</td>
				<td class="feed">${e.feedbacktype.typeName}</td>
				<td class="feed">${e.addTime}</td>
				<td class="feed"><c:if test="${e.replyStatus eq 0 }">未回复</c:if>
				<c:if test="${e.replyStatus eq 1 }">已回复</c:if></td>
				<td class="feed"><a class="add" href="javascript:void(0);" onclick="fun_download(${e.uploadfile.id})" style="text-align: center;"><span>下载附件</span>
				&nbsp;|&nbsp;
				<a class="reply" href="/feedback/forwardReply?fid=${e.id }" target="dialog" rel="adddeputy" mask="true" maxable="false" resizable="false" width="520" height="315"><span>邮件回复</span>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>
<script src="/resources/js/feedback.js" type="text/javascript"></script>