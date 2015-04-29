<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-系统消息</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<link href="resources/css/systemMessage.css" rel="stylesheet"
	type="text/css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">系统消息</a></li>
							<li><a href="javascript:void(0);">登录日志</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下内容是您在太平洋理财的系统消息，敬请仔细审阅。
							</h1>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="messagesTable">
							<thead>
								<tr>
									<th width="30">&nbsp;</th>
									<th width="30"><img src="/resources/images/xf1.jpg" /></th>
									<th width="115">发件人</th>
									<th width="150">主题</th>
									<th width="150"><a href="javascript:void(0);">时间↓</a></th>
								</tr>
								<tr>
									<td colspan="5">未读 <font class="red bold" id="unreadinfos">${unRead }</font>
										封，已读 <font class="red bold" id="readinfos">${read}</font> 封，共 <font
										class="red bold">${count}</font> 封
										<input type="hidden" value="${unRead}" id="unReads" />
									</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="msg">
									<tr <c:if test="${msg[2] eq 0}">class="colorChenge"</c:if>
										id="tr${msg[0]}">
										<td><input type="checkbox" name="id" class="check"
											value="${msg[0]}" /> <input type="hidden"
											id="readstatus${msg[0]}" value="${msg[2]}" /></td>
										<td><c:if test="${msg[2] eq 0 }">
												<img id="imginfo${msg[0]}" src="resources/images/unread.jpg" />
											</c:if> <c:if test="${msg[2] eq 1 }">
												<img id="imginfo${msg[0]}" src="resources/images/read.jpg" />
											</c:if></td>
										<td>${msg[4]}</td>
										<td class="user_message_centent"><span
											class="content_interception" style="cursor: pointer;">${msg[1]}</span></td>
										<td><fmt:parseDate value="${msg[3]}" var="date"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${date}" pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr style="display: none;" id="showContent${msg[0]}">
										<td colspan="5">${msg[1] }</td>
									</tr>
								</c:forEach>
								<c:if test="${empty list}">
									<tr>
										<td colspan="5">暂时没有任何消息！</td>
									</tr>
								</c:if>
							</tbody>
							<tfoot>
								<tr>
									<td><input type="checkbox" id="checkAll" /></td>
									<td><a href="javascript:void(0);">全选</a></td>
									<td><input type="button" value="删除"
										class="delBnt curvyCorners_3" id="deleteAll" /></td>
									<td colspan="2"><jsp:include
											page="/WEB-INF/views/member/communal/system_page.jsp" /></td>
								</tr>
							</tfoot>
						</table>


					</div>
					<!--End vipContBox-->

					<!--vipContBox-->
					<div class="vipContBox" style="display: none;">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="/resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，太平洋理财为您记录和保存了您的登录记录(最后登陆10次)，敬请审阅。
							</h1>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="vipSeversTable">
							<thead>
								<tr>
									<th>编号</th>
									<th>登录时间</th>
									<th>登录IP</th>
									<th>登录地点</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${logs }" var="log" varStatus="no">
									<tr>
										<td>${no.index+1}</td>
										<td>${log[1]}</td>
										<td>${log[2]}</td>
										<td>${log[3]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->

			</div>
			<!--End vipcontent-->
		</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script type="text/javascript">
	$(function() {
		/*
		 * 查看消息类容
		 */
		 var unReads=$("#unReads").val();
		 var count="${count}";
		$(".user_message_centent").click(
				function() {
					var id = $(this).parent().find("input[type=checkbox]")
							.val();
					var unRead = $(this).parent().find("input[type=hidden]")
							.val();
					if(unRead==0){
						$.ajax({
							type:'post',
							url:'/member_index/system_message',
							data:{"id":id,"unRead":unRead},
							success:function(){
								//改变显示样式
								$("#imginfo"+id).attr("src","resources/images/read.jpg");
								$("#tr"+id).attr("class","");
								//改变未读，已读的显示
								$("#readstatus"+id).val("1");
								unReads=unReads-1;
								$("#unReads").val(unReads);
								$("#readinfos").text(count-unReads);
								$("#unreadinfos").text(unReads);								
							}
						});
					}
					$("#showContent"+id).toggle();
				});
		/*
		 * 全选
		 */
		$("#checkAll").click(function() {
			var bool = $(this).attr("checked");
			$(".check").each(function() {
				if (bool == 'checked') {
					$(this).attr("checked", true);
				} else {
					$(this).attr("checked", false);
				}
			});
		});

		/*
		 * 批量删除
		 */
		$("#deleteAll").click(function() {
			var ids = "";
			$(".check").each(function() {
				if ($(this).attr('checked') == 'checked') {
					ids = ids + $(this).val() + ',';
				}
			});
			if (ids == "") {
				ymPrompt.errorInfo('请选择至少一条记录!', 220, 160, '警告', null);
			} else {
				ymPrompt.confirmInfo('确定删除？', 220, 160, '是否删除', function(tp) {
					if (tp == 'ok') {
						$.ajax({
							type : 'post',
							url : '/member_index/deletes',
							data : '&ids=' + ids,
							success : function(msg) {
								//$("#user_message").remove();
								//$('#systemmessage').append(msg);
								window.location.href="/member_index/system_message";
							}
						});
					}
				});
			}

		});
	});
</script>
</body>
</html>
