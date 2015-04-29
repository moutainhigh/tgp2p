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
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link rel="stylesheet" href="../resources/css/validationEngine.jquery.css"
	type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script src="/resources/js/jquery.validationEngine.js"
	type="text/javascript"></script>
	<script src="/resources/js/jquery.validationEngine-zh_CN.js"
	type="text/javascript"></script>
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
							<li><a href="javascript:void(0);" class="vipHeadLink">账户提现</a></li>
							<li><a href="/withdraw/openWithdraw">申请提现记录</a></li>
							<li><a href="/<%=basePath%>withdraw/query.htm">提现记录</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>温馨提示：
							</h1>
							<p>1、太平洋理财规定客户设置的提现账户名，必须与其在太平洋理财进行实名认证时身份证的名字相同。即提现的银行账户必须是客户本人账户。</p>
							<p>2、请确保您输入的提现金额，以及银行帐号信息准确无误。如果您填写的提现信息不正确可能会导致提现失败，由此产生的提现费用将不予返还。</p>
							<p>3、太平洋理财处理提现时间：周一至周五，上午11：00
								处理一次，下午15：00处理一次。双休日和法定节假日期间，用户可以申请提现，太平洋理财会在下一个工作日进行处理。</p>
							<p>4、遵守国家反洗钱和套现行为相关法律规定：信用卡充值，不投标过30天后才能提现；存储卡充值，不投标7天后才能提现。信用卡无法提现，请不要误填。</p>
							<p>5、平台禁止洗钱、信用卡套现、虚假交易等行为，一经发现并确认，将终止该账户使用。</p>
							<p>6、在提现过程中，如遇任何问题，请联系太平洋理财客服 400-1234567。</p>
						</div>
						<br /> <br /> <br />

						<form action="/withdraw/ipsWithdraw" method="post" id="withdraw">
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<th>您的太平洋理财帐号:</th>
										<td>${session_user.userName }</td>
									</tr>
									<tr>
										<th>您账户可用余额:</th>
										<td>${session_user.userfundinfo.cashBalance }元</td>
									</tr>
									<tr>
										<th>提现金额:</th>
										<td><input type="text" name="money" class="vipTextBox"
											style="width: 120px;" /> 元</td>
									</tr>
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input type="submit" value="提交" onsubmit="return check();"/> <input type="reset"
									value="取消" />
							</div>
						</form>
						<br /> <br /> <br /> <br />
						<div class="vipContPrompt">
							<h2 class="vipContTitle">
								<span><img src="resources/images/vipsevers_03.jpg" /></span>注意:
							</h2>
							<p>1、提现前请先到IPS绑定你本人现有的且可用的银行卡卡号,否则将不能提现。</p>
							<p>2、单笔提现金额不得低于最低限额0.001元。</p>
							<p>3、提现金额低于2000元提现手续费单笔0.001元,提现金额大于等于2000元免手续费(平台代付),手续费由第三方收取的，与太平洋理财无关。</p>
							<p>4、为确保款项能及时转入您的银行帐号，请正确填写您的联系方式。</p>
							<p>5、由于所有充值行为都是在第三方平台的账户之间划拨，烦请注意第三方平台的服务时间可能造成的时间延误。</p>
						</div>
						<br /> <br /> <br /> <br />
					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>

		</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script>
	$(function() {
		$("#withdraw").validationEngine({});
	});
	function check(){
		if($(".vipTextBox input[name='money']").val()==""){
			return false;
		}
		return true;
	}
	</script>
</body>
</html>
