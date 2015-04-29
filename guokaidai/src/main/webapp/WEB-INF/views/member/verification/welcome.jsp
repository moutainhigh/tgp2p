<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<div id="fade" class="black_overlay"></div>
<div id="MyDiv" class="white_content" style="width: 642px;">
	<!-- 欢迎页面 -->
	<div class="white_d pad_b" style="width: 632px;">
		<div class="notice_t">
			<span class="fl">太平洋理财安全验证</span> <span class="fr"
				style="margin-top: 15px; cursor: pointer;"
				onclick="myDivColse();"><img
				src="/resources/images/close.jpg" /></span>
		</div>
		<div class="layer_nav">
			<ul>
				<li><a href="javascript:void(0);" class="now">欢迎页</a></li>
				<li><a href="javascript:void(0);">邮箱验证</a></li>
				<li><a href="javascript:void(0);">实名认证</a></li>
				<li><a href="javascript:void(0);">安全问题</a></li>
				<li><a href="javascript:void(0);">手机验证</a></li>
			</ul>
		</div>
		<table border="0" align="center"
			style="width: 590px; margin-top: 20px; font-family: '宋体'; border-bottom: 1px solid #e6e6e6;"
			cellspacing="0" cellpadding="0">
			<tr valign="top">
				<td width="120"><img src="/resources/images/smile.jpg" /></td>
				<td style="font-size: 12px;">亲爱的<font color="#dd0000">【${empty session_user.userName ? '太平洋理财用户':session_user.userName}】</font>，您好，欢迎注册太平洋理财！<br />
					为了保证您的账户安全，请先完成太平洋理财的安全验证流程。
					<p style="overflow: hidden;">
						<a href="/verification/check_fund_safe?msg=1" class="btn_va" style="display: block; color: #FFF; float: left;">马上开始验证</a>
					</p>

				</td>
			</tr>
		</table>
		<p style="padding: 0px 30px;">
			注意事项：<br /> 1、太平洋理财暂不提供个人消费贷款担保。
<!-- 			<br /> 2、如果您是贷款经商者，请先阅读<a href="#" style="color: #2ca3eb;">【借入要求】</a>（必须）。<br /> -->
			<br/>
			2、如果您在验证过程中，出现任何问题，请致电 <font color="#dd0000">400-0888-913</font> 。

		</p>
	</div>
</div>
