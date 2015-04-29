<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
$(function() {
	$("#myform1").Validform({
		btnSubmit:'#real_security_safe',
		tiptype : 3,
		beforeSubmit : function(curform) {
			$('#myform1').ajaxSubmit({
				dataType : 'text',
				success : function(msg) {
					if (msg == "true") {
						window.location.href='/verification/check_fund_safe?msg=100';
					} else if (msg == "pwd") {
						ymPrompt.errorInfo('不能与登录密码相同!', 260, 160, '失败', null);
					} else if (msg == "diffent") {
						ymPrompt.errorInfo('安全问题不能重复!', 260, 160, '失败', null);
					} else {
						ymPrompt.errorInfo('修改失败！', 260, 160, '失败', null);
					}
				}
			});
			return false;
		}
	});
});
</script>

<div id="fade3" class="black_overlay"></div>
<!-- 安全问题 -->
<div id="MyDiv3" class="white_content" style="width: 642px;">
<div class="white_d pad_b" style="width: 632px;">
	<div class="notice_t">
		<span class="fl">太平洋理财安全验证</span>
		<span class="fr" style="margin-top: 15px; cursor: pointer;" onclick="myDivColse();">
		<img src="/resources/images/close.jpg" /></span>
	</div>
	<div class="layer_nav">
		<ul>
			<li><a href="javascript:void(0);">欢迎页</a></li>
			<li><a href="javascript:void(0);">邮箱验证</a></li>
			<li><a href="javascript:void(0);">实名认证</a></li>
			<li><a href="/verification/check_fund_safe" class="now">安全问题</a></li>
			<li><a href="javascript:void(0);">手机验证</a></li>
		</ul>
	</div>
	<form action="/verification/security_safe" method="post" id="myform1">
	<table border="0" align="center" style="width: 590px; margin-top: 20px; font-family: '宋体'; border-bottom: 1px solid #e6e6e6;" cellspacing="0" cellpadding="0">
		<tr valign="top">
			<td width="110"><img src="/resources/images/s_4.jpg" /></td>
			<td style="font-size: 13px;">
				安全问题对您非常重要！请认真回答问题并牢记答案！交易密码涉及到您的资金安全，请勿设置简单的交易密码，不要设置和登录密码相同的交易密码。
				<table border="0" align="center" width="100%" cellspacing="0" cellpadding="0">
					<tr height="30">
						<td style="font-size: 13px;"><span class="fl">问&nbsp; &nbsp; &nbsp; &nbsp; 题：</span><span class="fl">
							<select name="id1" style="width: 238px; background-color: #FFF;">
							<c:forEach items="${list}" var="ver"><option value="${ver.id}">${ver.problem}</option>
							</c:forEach></select></span></td>
					</tr>
					<tr height="30">
						<td style="font-size: 13px;">
							答&nbsp; &nbsp; &nbsp; &nbsp; 案：<input sucmsg=" " nullmsg="请输入答案" errormsg="长度不能超过20位" datatype="*1-20" class="va_ipt" type="text" name="answer1"></td>
					</tr>
					<tr height="30">
						<td style="font-size: 13px;"><span class="fl">问&nbsp; &nbsp; &nbsp; &nbsp; 题：</span>
							<span class="fl"><select name="id2" style="width: 238px; background-color: #FFF;">
							<c:forEach items="${list}" var="ver"><option value="${ver.id}">${ver.problem}</option>
							</c:forEach></select></span></td>
					</tr>
					<tr height="30">
						<td style="font-size: 13px;">答&nbsp; &nbsp; &nbsp; &nbsp; 案：<input sucmsg=" " nullmsg="请输入答案" errormsg="长度不能超过20位" datatype="*1-20" class="va_ipt" type="text" name="answer2"></td>
					</tr>
					<tr height="30">
					<td style="font-size: 13px;">设置交易密码：<input type="password" name="pwd" datatype="*6-20" sucmsg=" " nullmsg="请输入密码" errormsg="长度6-20位 " value="" class="va_ipt" /></td>
					</tr>
					<tr height="30">
						<td style="font-size: 13px;">确认交易密码：<input type="password" recheck="pwd" datatype="*6-20" sucmsg=" " nullmsg="请再次输入密码" errormsg="密码输入不一致" value="" class="va_ipt" /></td>
					</tr>
				</table>
				<p style="overflow: hidden;">
					<a href="javascript:void(0);"  id="real_security_safe" class="btn_va" style="display: block; color: #FFF; float: left;">完成安全问题，下一步</a>
				</p>
			</td>
		</tr>
	</table>
	</form>
	<p style="padding: 0px 30px;">
		请注意以下事项：<br /> 1、安全问题是您修改手机号码，变更邮箱，找回密码和修改银行账号的必备信息。<br />
		2、如果您在验证过程中，出现任何问题，请致电<font color="#dd0000">400-088-913</font> 。
	</p>
</div>
</div>
