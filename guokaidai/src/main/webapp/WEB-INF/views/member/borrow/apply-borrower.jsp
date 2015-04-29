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
<title>太平洋理财贷款平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/Validform.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<link rel="stylesheet"
	href="../resources/css/validationEngine.jquery.css" type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript"
		src="<%=basePath%>resources/js/ymPrompt.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/Validform_v5.3_min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/Validform_Datatype.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/jquery.form.js"></script>
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
							<li><a href="javascript:void(0);" class="vipHeadLink">我要借款</a>
							</li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" />
								</span>您已经是借款人，可以向太平洋理财申请借款。
							</h1>
						</div>

						<div class="upDataStep curvyCorners_5">
							<a class="stepLink">申请表单</a> <a
								href="../borrow/my-apply-result?type=${curType}">申请结果</a>
						</div>

						<%-- <fieldset class="imgfieldset">
							<legend>我的相册</legend>
							<ul>
								<c:if test="${!empty files }">
									<c:forEach items="${files }" var="b_img">
										<li><img src="${b_img.filePath}" width="159" height="134" /></li>
									</c:forEach>
								</c:if>
							</ul>
						</fieldset>
						
						<form action="borrow/uploadFile" method="post"
							enctype="multipart/form-data" id="form-data-sqdk">

							<input type="hidden" name="fileType" value="申请贷款" /> <input
								type="hidden" id="baseId" name="borrowersbase.id"
								value="${borrower.id}" />

							<input type="hidden" id="type" name="type" value="${curType}" />

							<fieldset class="fileUpfieldset">
								<legend>上传图片</legend>
								<span class="vipfileBox"> <input type="text"
									class="vipfileTx" /> <input type="file" name="file"
									class="vipfile validate[required,funcCall[money_format]]"
									onchange="$(this).siblings('.vipfileTx').val($(this).val());" />
									<span>选择</span>
								</span> <input type="submit" value="提交"
									class="vipfileUpDataBnt curvyCorners_3" />
								<p class="fileGeshi">请上传【jpg,gif,bmp,png】等图片格式的文件</p>
							</fieldset>
						</form> --%>



						<table cellpadding="0" cellspacing="0" border="0"
							class="creditData">
							<tr>
								<td>您正在申请${loantype.typename}，请填写以下申请信息:</td>
							</tr>
							<%-- <tr>
								<td>1、XXXXXXXXX:</td>
							</tr> --%>
						</table>

						<form id="myform" action="borrow/submit-apply" method="post">
							<input type="hidden" id="type" name="type" value="${curType}" />
							<input type="hidden" name="borrowersbase.id"
								value="${borrower.id }" />
							<table cellpadding="0" cellspacing="0" border="0"
								class="creditData">
								<tbody>
									<tr>
										<th style="width:100px;">申请金额：</th>
										<td><input dataType="/^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/"
											sucmsg=" " nullmsg="请填写申请金额"
											errormsg="数字，最大为999999999.99，小数点后至多两位" type="text"
											name="money" style="width:100px;height:20px;padding:0 2px" />&nbsp;元</td>
									</tr>
									<tr>
										<th style="width:100px;">年利率：</th>
										<td><input
											datatype="/^([1-9]\d?(\.\d{1,2})?|0.\d{1,2}|100)$/"
											sucmsg=" " nullmsg="请填写年利率" errormsg="0-100，小数点后至多两位"
											type="text" name="rate"
											style="width:100px;height:20px;padding:0 2px"
											value="${loantype.minrate*100}" />%</td>
									</tr>
									<tr>
										<th style="width:100px;">借款期限：</th>
										<td>
											<!-- <input type="text" name="month" style="width:100px;height:20px;padding:0 2px" /> -->
											<select name="borrowmonth"
											style="width:110px;text-align:center;align:center">
												<c:forEach var="i" begin="${loantype.minmoney }"
													end="${loantype.maxmoney }" step="1">
													<option value="${i }">${i }个月</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th style="width:100px;">还款方式：</th>
										<td><select name="refunway"
											style="width:130px;text-align:center;align:center">
												<option value="1">按月等额本息</option>
												<option value="2">按月付息到期还本</option>
												<option value="3">到期一次性还本息</option>
										</select></td>
									</tr>

									<tr>
										<th style="width:100px;vertical-align:top;">借款用途：</th>
										<td><textarea datatype="/^.{10,}$/" sucmsg=" "
												nullmsg="请填写借款用途" errormsg="10个字符以上" name="behoof"
												style="width:240px;height:80px;margin-top:5px;padding:2px;"></textarea>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="tableSetBntBox" style="text-align:left">
								<input id="submit-apply" type="submit" value="提交申请"
									style="margin-left:130px" onsubmit="return check();" />
							</div>

						</form>

					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script>
		/* function money_format(o, a, c, b) {
			var FileName = o.val();
			var extension = FileName.substring(FileName.lastIndexOf(".") + 1,
					FileName.length);// 文件扩展名
			extension = extension.toLowerCase();
			if (FileName == null || FileName == "") {
				return "请选择您要上传的文件";
			}
			if (extension != "jpg" && extension != "png" && extension != "gif"
					&& extension != "bmp") {// 不安全的扩张名
				return "请选择图片上传";
			}
		} */
		
		function reset(){
			window.location.href='/borrow/my-apply-result?type=${curType}';
		}

		$("#myform").Validform({
			tiptype : 3,
			beforeSubmit:function(){
				if(true){
					var money = parseFloat($("#myform input[name='money']").val());
					var rate = parseFloat($("#myform input[name='rate']").val())/100;
					if(money<${loantype.mincredit}||money>${loantype.maxcredit}){
						ymPrompt.errorInfo("${loantype.typename}的申请金额为"+${loantype.mincredit}+"至"+${loantype.maxcredit}+"元");
					}else if(rate<${loantype.minrate}||rate>${loantype.maxrate}){
						ymPrompt.errorInfo("${loantype.typename}的年利率为"+${loantype.minrate*100}+"%至"+${loantype.maxrate*100}+"%");
					}else{
						$('#myform').ajaxSubmit({
							dataType : 'text',
							success : function(msg) {
								if (msg == "success") {
									ymPrompt.succeedInfo('申请成功', 260, 160, '成功',reset);
								}else {
									ymPrompt.errorInfo('申请失败', 260, 160, '失败',reset);
								}
							}
						});
						//$("#myform").submit();
					}
					return false;
				};
				// var money = parseFloat($("#myform input[name='money']").val());
				// var rate = parseFloat($("#myform input[name='rate']").val())/100;
				// if(money<${loantype.mincredit}||money>${loantype.maxcredit}){
				// 	ymPrompt.errorInfo(${loantype.typename}+"的申请金额为"+${loantype.mincredit}+"至"+${loantype.maxcredit}+"元");
				// 	return false;
				// }else if(rate<${loantype.minmoney}||rate>${loantype.maxmoney}){
				// 	ymPrompt.errorInfo(${loantype.typename}+"的年利率为"+${loantype.minmoney}+"至"+${loantype.maxmoney});
				// 	return false;
				// }else{
					
				// }
				// return false; 
				// var month = $("#myform select[name='month']").val();
				// var refunway = $("#myform select[name='refunway']").val();
				// var behoof = $("#myform textarea[name='behoof']").val();
			}
		});
	</script>
</body>
</html>
