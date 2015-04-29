<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财会员中心-Ucode兑换</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="resources/css/ucode.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />

	<!--Content-->
	<div class="Content">
		<div class="w960px">

			<!--vipContent-->
			<div class="vipContentBox">
				<!--vipLeft-->
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--End vipLeft-->

				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">开始兑换</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">

						<div class="grid_10">
							<div class="color-white-bg fn-clear  ucode-use-div">
								<h3 class="text-xl">U-code抢太平洋理财理财计划的得力助手</h3>
								<p class="info mar-top">
									0定金，抢先预定太平洋理财理财计划加入金额！<a href="javascript:void(0)">了解更多</a>
								</p>
								<p class="info">关注太平洋理财官方微信、微博，抢先了解太平洋理财发布动态！</p>
								<div class="img-div">
									<h4>如何使用U-code</h4>
									<img src="/resources/images/img/use-ucode-pro.png" />
								</div>
								<div id="applications-pagination" class="fn-right mt10"></div>
							</div>


							<div class="ucode-use-div">
								<div class="color-white-bg fn-clear">
									<h3 class="text-xl">U-code兑换</h3>
									<form action="/member/uCode.htm" id="ucodeForm" method="post"
										class="ui-form" enctype="multipart/form-data"
										data-name="ucode" novalidate="novalidate" />
									<div class="inputs mt20">
										<div class="ui-form-item">
											<label class="ui-label">昵称</label> ${user.userName }
										</div>
										<div class="ui-form-item">
											<label style="line-height: 35px;" class="ui-label">U-code</label>
											<input type="text" value="" placeholder="请输入您要兑换的U-code"
												id="ucode" name="ucode"
												class="ui-input w250 s_select_bg wid280 het45 clearfix " />
											<label style="line-height: 35px; color: red;" id="msg"></label>
										</div>
										<div class="ui-form-item">
											<input type="button" value="兑 换"
												class="ui-button ui-button-blue ui-button-mid" id="subbt" />
										</div>
									</div>
									</form>
								</div>
							</div>

							<div class="ucode-use-div">
								<div class="color-white-bg fn-clear">
									<h3 class="text-xl">U-code温馨提示</h3>
									<br />
									<p class="warm-p">1.
										使用U-code预定成功后，必须在规定的时间内完成支付操作。到期未完成支付，视为您主动放弃加入该计划，加入资格将作废；</p>
									<p class="warm-p">2.
										U-code仅限在太平洋理财理财计划倒计时期间使用，每期太平洋理财理财计划中可供U-code预定的总金额有限；</p>
									<p class="warm-p">3. 每个U-code只能预定一次太平洋理财理财计划；</p>
									<p class="warm-p">4.
										使用U-code预定成功后，只对预定时指定的某一期太平洋理财理财计划有效，不能延期使用；</p>
									<p class="warm-p">5. 使用U-code预定成功后，只对当前账户生效，不能跨账户使用；</p>
									<p class="warm-p">6. 每人每期只能使用一个U-code；</p>
									<p class="warm-p">7. 预定的太平洋理财理财计划加入金额中使用U-code预定的部分，无需支付定金。</p>
									<br />
								</div>
							</div>


						</div>

					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>

	<script type="text/javascript">
		$("#subbt").click(function() {
			var $ucode = $("#ucode").val();
			/* $.ajax({
				type : 'post',
				url : '/member/uCode.htm',
				data : $('#ucodeForm').serialize(),
				success : function(msg) {
					if(msg!=""){			
						$("#msg").text("抱歉,您输入的兑换码错误！");
					}
					 
				}
				
			}); */
			fn_ajax("/member/uCode.htm", {
				ucode : $ucode
			}, function(data) {
				if (data == 2) {
					ymPrompt.succeedInfo('您已兑换过了！', 400, 200, '成功', null)
				} else if (data == 1) {
					window.location.href = "/member/ucodeSuccess.htm";
				} else if (data == 0) {
					$("#msg").text("抱歉,您输入的兑换码错误！");
				}
			});

		});
	</script>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
