<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script type="text/javascript">
	$(function(){
		$("#agin_email").click(function(){
			$.ajax({
				url:'/verification/send_email_link',
				type:'post',
				success:function(msg){
					if(msg==1){
						ymPrompt.succeedInfo('发送成功', 260, 160, '成功', null);
					}else if(msg=2){
						ymPrompt.errorInfo('发送过于频繁!', 260, 160, '失败', null);
					}else{
						ymPrompt.errorInfo('该功能正在完善!', 260, 160, '失败', null);
					}
				},
				error:function(){
					ymPrompt.errorInfo('该功能正在完善!', 260, 160, '失败', null);
				}
			});
		});
		$("#email_safe").click(function(){
			$.ajax({
				url:'/verification/email_safe?msg=100',
				type:'post',
				success:function(msg){
					if(msg){
						window.location.href='/verification/check_fund_safe?msg=100';
					}else{
						ymPrompt.errorInfo('请先发送激活邮件!', 260, 160, '失败', null);
					}
				},
				error:function(msg){
					ymPrompt.errorInfo('该功能正在维护!', 260, 160, '失败', null);
				}
			});
		});
	});
</script>

<div id="fade1" class="black_overlay"></div>
<!-- 邮箱验证 -->
<div id="MyDiv1" class="white_content" style="width: 642px;">
<div class="white_d pad_b" style="width: 632px;">
	<div class="notice_t">
		<span class="fl">太平洋理财安全验证</span> <span class="fr"
			style="margin-top: 15px; cursor: pointer;"
			onclick="myDivColse();"><img src="/resources/images/close.jpg" /></span>
	</div>
	<div class="layer_nav">
		<ul>
			<li><a href="javascript:void(0);">欢迎页</a></li>
			<li><a href="/verification/check_fund_safe" class="now">邮箱验证</a></li>
			<li><a href="javascript:void(0);">实名认证</a></li>
			<li><a href="javascript:void(0);">安全问题</a></li>
			<li><a href="javascript:void(0);">手机验证</a></li>
		</ul>
	</div>
	<table border="0" align="center"
		style="width: 590px; margin-top: 20px; font-family: '宋体'; border-bottom: 1px solid #e6e6e6;"
		cellspacing="0" cellpadding="0">
		<tr valign="top">
			<td width="120"><img src="/resources/images/s_2.jpg" /></td>
			<td style="font-size: 12px;">在您注册的时候，我们已经向您的Email<br /> 【${user.userrelationinfo.email}】发送了一封激活电子邮件。<br />
				请立刻登录您的电子邮箱，完成验证。在验证成功后，点击以下按钮：
				<p style="overflow: hidden;">
					<a href="javascript:void(0);" id="email_safe" class="btn_va" style="display: block; color: #FFF; float: left;">完成邮箱验证，下一步</a>&nbsp;
					<%-- <a href="#">请点击这里登陆您的邮箱</a> <a href="#" style="color: #2ca3eb;">重置邮箱</a>--%>
				</P>

			</td>
		</tr>
	</table>
	<p style="padding: 0px 30px;">
		请注意以下事项：<br /> 1、如果收件箱里没有收到该邮件，请查看垃圾箱，以免被误判为垃圾邮件。<br />
		2、如果您长时间没有收到我们的激活邮件，请点击这里<a href="javascript:void(0);" id="agin_email" style="color: #2ca3eb;">【重新发送激活邮件】</a>。<br />
		3、如果您在验证过程中，出现任何问题，请致电<font color="#dd0000">400-0888-913</font> 。

	</p>
</div>
</div>
