<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<base href="<%=basePath%>" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<!--top-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="/resources/js/leave_message.js"></script>
		<script type="text/javascript">
	$(function(){
		$("#mes_file").change(function(){
			var imgUrl = $('input[type="file"]').val();
			$("#img_realname").val(imgUrl.substring(imgUrl.lastIndexOf("\\")+1));
		});
		var msg = "${msg}";
		if(msg != "" && msg != null ){
			ymPrompt.alert(msg, null, null, "温馨提示！");
		}
	});
	

	</script>
	<!--End top-->
	<!--Content-->
	<div class="Content">
		<div class="w960px mapString">
			<span>您当前位置：</span><a href="/">太平洋理财</a>>${deputy.topic.name }>${deputy.name }
		</div>
		<div class="w960px">
			<jsp:include page="/WEB-INF/views/visitor/communal/left.jsp" />
			<div class="projectRightBox">
				<!--TxList Cont-->
				<div class="pjRightCont">
					<!--porjectHead-->
					<span data-position="titlebox" class="Blue">邮件反馈</span>
					<!--End porjectHead-->

					<!--porjectBox-->
					<div class="porjectBox">
						<form action="feedback/addMessage" method="post"
							enctype="multipart/form-data" id='message'>
							<table cellpadding="0" cellspacing="0" class="applicationTable">
								<tbody>
									<tr>
										<th>问题分类：</th>
										<td><select style="width:166px; height:24px; line-height:24px; border:1px solid #abadb3;"
										name="feedbacktype.id">
											<c:forEach items="${feedbacktypes}" var="feedvalue">
												<option value="${feedvalue.id}">${feedvalue.typeName}</option>
											</c:forEach>
									</select> <font
											class="colorRed"> *</font></td>
									</tr>
									<tr>
										<th>姓名：</th>
										<td><input name="name" id="mes_id" type="text" class="applicationtx"
											style="width: 70px;" /><font class="colorRed"> *</font></td>
									</tr>
									<tr>
										<th>您的邮箱：</th>
										<td><input id="mes_email" type="text" name="email" class="applicationtx"
											style="width: 160px;" /><font class="colorRed"> *</font></td>
									</tr>
									<tr>
										<th>联系电话：</th>
										<td><input name="phone" id="mes_phone" type="text" class="applicationtx"
											style="width: 160px;" /><font class="colorRed"> *</font></td>
									</tr>
									<tr>
										<th>上传附件：</th>
										<td><img
										id="tempimg" dynsrc="" src="" style="display: none" /> <input
										id="img_realname" name="imgupname" type="hidden" value="" /> <input
										type="file" name="file" id="mes_file" /><span>上传附件格式为.jpg .bmp
												.gif .png .rar</span></td>
									</tr>
									<tr>
										<th valign="top">留言内容：</th>
										<td><textarea name="context" id="mes_context"
												style="width: 460px; min-width: 460px; max-width: 460px; min-height: 80px; padding: 2px; line-height: 1.6; color: #666666; border: 1px solid #abadb3;"></textarea><font
											class="colorRed"> *</font></td>
									</tr>
									<tr>
										<th>验证码：</th>
										<td style="font-size: 12px;"><input id="mes_code"
										type="text" value="" name="validate" class="applicationtx"
											style="width: 60px;"  />&nbsp;
										<img src="cic/code?name=user_login"
										onclick="this.src='cic/code?name=user_login&id='+new Date();"
										title="看不清，点击换一张"
										style="vertical-align: middle; display: inline-block; margin-left: 5px; width: 65px; height: 25px;" />
									</td>
									</tr>
									<tr>
										<th></th>
										<td><input type="button" onclick="submit_click(this)" value="提交"
											class="curvyCorners_5 appSubmitBnt" /></td>
									</tr>
								</tbody>
							</table>
						</form>
						<br /> <br /> <br /> <br /> <br />

					</div>
					<!--End porjectBox-->
				</div>
				<!--End TxList Cont-->
			</div>
		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script type="text/javascript" src="<%=basePath %>resources/js/autolist.js"></script>
	<!--End footer-->
</body>
</html>
