<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script type="text/javascript">
$(function() {
	$("#send_phone1").click(function(){
		var reg=new RegExp(/^(((1[0-9]{1}[0-9]{1}))+\d{8})$/);
		var phone = $("input[name=phone]").val();
		if(reg.test(phone)){
			$("input[name=phone]").attr("readonly","readonly");
			$.ajax({
				url:'/verification/send_phone',
				type:'post',
				data:'phone='+phone,
				success:function(msg){
					if(msg==1){
						ymPrompt.succeedInfo('发送成功', 260, 160, '成功', null);
					}else if(msg==2){
						ymPrompt.errorInfo('发送过于频繁', 260, 160, '警告', null);
					}else if(msg==3){
						ymPrompt.errorInfo('手机号码为空', 260, 160, '警告', null);
					}else if(msg==4){
						$("input[name=phone]"). removeAttr("readonly");
						ymPrompt.errorInfo('该号码已被其他用户使用', 260, 160, '警告', null);
					}else{
						ymPrompt.errorInfo('发送失败！', 260, 160, '失败', null);
					}
				},
				error:function(){
					ymPrompt.errorInfo('发送失败！', 260, 160, '失败', null);
				}
			});
		}else{
			ymPrompt.errorInfo('手机号码格式错误!', 260, 160, '错误', null);
		}
	});
	
	$("#myform2").Validform({
		btnSubmit:'#telphone_safe',
		tiptype : 3,
		beforeSubmit : function(curform) {
			$('#myform2').ajaxSubmit({
				dataType : 'text',
				success : function(msg) {
					if (msg == "true") {
						window.location.href='/verification/check_fund_safe?msg=100';
					} else if (msg == "unique") {
						ymPrompt.errorInfo('该电话号码已被使用!', 260, 160, '失败', null);
					} else if (msg == "codeError") {
						ymPrompt.errorInfo('验证码错误!', 260, 160, '失败', null);
					} else if (msg == "notSend") {
						ymPrompt.errorInfo('请先发送验证码!', 260, 160, '失败', null);
					} else {
						ymPrompt.errorInfo('该功能正在升级！', 260, 160, '失败', reset);
					}
				}
			});
			return false;
		}
	});
});
</script>

<div id="fade4" class="black_overlay"></div>
<!-- 手机验证 -->
<div id="MyDiv4" class="white_content" style="width: 642px;">
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
			<li><a href="javascript:void(0);">实名认证</a></li>
			<li><a href="javascript:void(0);">安全问题</a></li>
			<li><a href="/verification/check_fund_safe" class="now">手机验证</a></li>
		</ul>
	</div>
	<form action="/verification/telphone_safe" method="post" id="myform2">
	<table border="0" align="center"
		style="width: 590px; margin-top: 20px; font-family: '宋体'; border-bottom: 1px solid #e6e6e6;"
		cellspacing="0" cellpadding="0">
		<tr valign="top">
			<td width="110"><img src="/resources/images/s_5.jpg" /></td>
			<td style="font-size: 12px;">您在太平洋理财的充值提现等重要操作，都需要通过手机动态验证码！请填写您真实的手机号 码，完成手机验证。
				<table border="0" align="center" width="100%" cellspacing="0" cellpadding="0">
					<tr height="35">
						<td style="font-size: 12px;">手机号：
							<input type="text" name="phone" dataType="/^(((1[0-9]{1}[0-9]{1}))+\d{8})$/" sucmsg=" " nullmsg="请输入手机号码" errormsg="请输入正确的手机号码" value="" style="width: 150px;" class="va_ipt" />&nbsp;
							<a href="javascript:void(0);" id="send_phone1"><img src="/resources/images/va.gif" align="absmiddle" /></a></td>
					</tr>
					<tr height="35">
						<td style="font-size: 12px;">验证码：
							<input type="text" name="phoneCode" showmsg="长度6位 " datatype="/^\d{6}$/" sucmsg=" " nullmsg="请输入验证码" errormsg="长度为6位的整数" value="" class="va_ipt" style="width: 120px;"/></td>
					</tr>
				</table>
				<p style="overflow: hidden;">
					<a href="javascript:void(0);" id="telphone_safe" class="btn_va" style="display: block; color: #FFF; float: left;">完成手机验证，下一步</a>
				</p>
			</td>
		</tr>
	</table>
	</form>
	<p style="padding: 0px 30px;">
		请注意以下事项：<br /> 1、根据省份、城市、地区不同，一般会在5秒-5分钟内收到验证码。<br />
		2、如果您在验证过程中，出现任何问题，请致电<font color="#dd0000">400-0888-913</font>
		申请人工验证。
	</p>
</div>
</div>
