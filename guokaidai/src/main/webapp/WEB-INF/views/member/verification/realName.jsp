<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script type="text/javascript">
$(function() {
	$("#myform").Validform({
		btnSubmit:'#real_name_safe',
		tiptype : 3,
		beforeSubmit : function(curform) {
			$('#myform').ajaxSubmit({
				dataType : 'text',
				success : function(msg) {
					if (msg == "true") {
						window.location.href='/verification/check_fund_safe';
					}else if(msg=="unique"){
						ymPrompt.errorInfo('该身份证已被其他用户使用！', 260, 160, '失败',null);
					}else {
						ymPrompt.errorInfo('修改失败！', 260, 160, '失败', reset);
					}
				}
			});
			return false;
		}
	});
});
</script>

<div id="fade2" class="black_overlay"></div>
<!-- 实名认证 -->
<div id="MyDiv2" class="white_content" style="width: 642px;">
<div class="white_d pad_b" style="width: 632px;">
	<div class="notice_t">
		<span class="fl">太平洋理财安全验证</span> <span class="fr"
			style="margin-top: 15px; cursor: pointer;"
			onclick="myDivColse();"><img src="/resources/images/close.jpg" /></span>
	</div>
	<div class="layer_nav">
		<ul>
			<li><a href="javascript:void(0);">欢迎页</a></li>
			<li><a href="javascript:void(0);">邮箱验证</a></li>
			<li><a href="/verification/check_fund_safe" class="now">实名认证</a></li>
			<li><a href="javascript:void(0);">安全问题</a></li>
			<li><a href="javascript:void(0);">手机验证</a></li>
		</ul>
	</div>
	<form action="/verification/real_name_safe" method="post" id="myform">
	<table border="0" align="center" style="width: 590px; margin-top: 20px; font-family: '宋体'; border-bottom: 1px solid #e6e6e6;" cellspacing="0" cellpadding="0">
		<tr valign="top">
			<td width="120"><img src="/resources/images/s_3.jpg" /></td>
			<td style="font-size: 12px;">您必须填写您的真实姓名和身份证号码，虚假的身份信息，是不能通过验证的。
				<table border="0" align="center" width="100%" cellspacing="0" cellpadding="0">
					<tr height="35">
						<td style="font-size: 12px;">真实姓名：<input type="text" datatype="/^[\u4e00-\u9fa5]{2,6}$/" sucmsg=" " nullmsg="不能为空" errormsg="2-6位的汉字" value="" class="va_ipt" style="width: 120px;" name="name" />	</td>
					</tr>
					<tr height="35">
						<td style="font-size: 12px;">身份证号：<input type="text" datatype="/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/" sucmsg=" " nullmsg="不能为空" errormsg="格式错误" value="" class="va_ipt" style="width: 200px;" name="cardId"/></td>
					</tr>
					<tr height="35">
						<td style="font-size: 12px;">昵&nbsp; &nbsp; 称：<input type="text" showmsg="长度1-16位 " datatype="*2-12" sucmsg=" " nullmsg="请输入昵称" errormsg="长度为2-12位" name="nickName" value="" class="va_ipt" style="width: 120px;" name="nickName"/></td>
					</tr>
				</table>
				<p style="overflow: hidden;">
					<a href="javascript:void(0);" id="real_name_safe" class="btn_va" style="display: block; color: #FFF; float: left;">完成实名认证，下一步</a>
				</p>
			</td>
		</tr>
	</table>
	</form>
	<p style="padding: 0px 30px;">
		请注意以下事项：<br /> 1、实名认证是您绑定银行卡和使用太平洋理财核心功能的必要条件。<br />
		2、昵称可以是2-12位的中文或字母、数字、下划线的组合。<br /> 3、如果您在验证过程中，出现任何问题，请致电<font
			color="#dd0000">400-0888-913</font> 。
	</p>
</div>
</div>
