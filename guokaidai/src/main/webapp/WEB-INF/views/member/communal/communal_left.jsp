<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">

	body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td { margin: 0; padding: 0; font-family:"微软雅黑"}
	table { border-collapse: collapse; border-spacing: 0; }
	fieldset, img { border: 0; }
	address, caption, cite, code, dfn, em, strong, th, var { font-style: normal; font-weight: normal; }
	ol, ul { list-style: none; }
	caption, th { text-align: left; }
	h1, h2, h3, h4, h5, h6 { font-size: 100%; font-weight: normal; }
	q:before, q:after { content: ''; }
	abbr, acronym { border: 0; font-variant: normal; }
	sup { vertical-align: text-top; }
	sub { vertical-align: text-bottom; }
	input:focus, textarea:focus, select:focus { outline: none; }
	select, input { vertical-align: middle; }
	legend { color: #000; }
	.clean:before, .clean:after, .clearfix:before, .clearfix:after { content: ""; display: table; }
	.clean:after, .clearfix:after { clear: both; }
	.clean, .clearfix { zoom: 1; }
	.clear { clear: both; }
	.fl { float: left; }
	.fr { float: right; }
	.break { word-wrap: break-word; width: inherit; }
	.linkhidden { text-indent: -9999em; overflow: hidden; }
	.hidden { display: none; }
	a{ text-decoration:none;}

	.subNavBox{width:200px;border:solid 1px #e5e3da;margin:100px auto;}
	.subNav{border-bottom:solid 1px #e5e3da;cursor:pointer;font-weight:bold;font-size:14px;color:#999;line-height:28px;padding-left:10px;background:url(/resources/images/jiantou1.jpg) no-repeat;background-position:95% 50%}
	.subNav:hover{color:#277fc2;}
	.currentDd{color:#277fc2}
	.currentDt{background-image:url(/resources/images/jiantou.jpg);}
	.navContent{display: none;border-bottom:solid 1px #e5e3da;}
	.navContent li a{display:block;width:200px;heighr:28px;text-align:center;font-size:14px;line-height:28px;color:#333}
	.navContent li a:hover{color:#fff;background-color:#277fc2}

</style>
<%--vipLeft --%>
<div class="vipLeftBox">
	<dl>
		<dt class="subNav currentDd currentDt">账户管理</dt>
		<ul class="navContent" style="display:block">
			<dd>
				<a href="<%=basePath%>member_index/member_center">我的首页</a>
			</dd>
			<dd>
				<a href="<%=basePath%>update_info/forword_url?url=head">个人基本信息</a>
			</dd>
			<%-- <dd>
				<a href="<%=basePath%>userinfovip/upgrade.htm">升级VIP</a>
			</dd> --%>
			<dd>
				<a href="<%=basePath%>update_info/message_setting">消息设置</a>
			</dd>
			<dd>
				<a href="<%=basePath%>update_info/forword_url?url=updatePwd">修改密码</a>
			</dd>
			<dd>
				<a href="<%=basePath%>member_index/system_message">系统消息</a>
			</dd>
			<dd>
				<a href="<%=basePath%>member/mail">安全中心</a>
			</dd>
		</ul>
	</dl>
	<dl>
		<dt  class="subNav">资金管理</dt>
		<ul class="navContent">
			<dd>
				<a href="<%=basePath%>my_money/my_money_sum">资金统计</a>
			</dd>
			<dd>
				<a href="<%=basePath%>recharge/openRecharge">我要充值</a>
			</dd>
			<dd>
				<%-- <a href="<%=basePath%>withdraw/withdraw">我要提现</a> --%>
				<a href="<%=basePath%>withdraw/openWithdraw">我要提现</a>
			</dd>
			<dd>
				<a href="<%=basePath%>expenses/myexpenses.htm">我的收支单</a>
			</dd>
			<dd>
				<a href="<%=basePath%>mybankCard/mybankCard.htm">我的银行卡</a>
			</dd>
		</ul>
	</dl>
	<dl>
		<dt class="subNav">理财管理</dt>
		<ul class="navContent">
		<dd>
			<a href="<%=basePath%>member_index/myYouxuan.htm">理财计划</a>
		</dd>
		<dd>
			<a href="<%=basePath%>member_debt/init_assignment">债权转让</a>
		</dd>
		<dd>
			<a href="<%=basePath%>loaninfo/openLoan.htm">我要投资</a>
		</dd>
		<%--
		<dd>
			<a href="<%=basePath%>automatic/init_automatic">自动投标</a>
		</dd>
		--%>
		<dd>
			<a href="<%=basePath%>depositshistory/init_two">投资记录</a>
		</dd>
		<dd>
			<a href="<%=basePath%>contract/query_page">回款计划</a>
		</dd>
		<c:if test="${!empty is_elite_open}"></c:if>
		<dd id="myelite" style="display:block">
			<a href="<%=basePath%>elite/myelite">理财体验金</a>
		</dd>
		<!-- <dd><a href="<%=basePath%>collectlist/collect">我的收藏</a></dd> -->
		</ul>
	</dl>
	<dl>
		<dt class="subNav">借款管理</dt>
		<ul class="navContent">
		<dd>
			<a href="borrow/forwardPersoninfo">审核资料</a>
		</dd>
		<dd>
			<a href="loanManage/achieveLoan.htm">借款记录</a>
		</dd>
		<dd>
			<a href="<%=basePath%>borrower_record/toRecord">借入记录</a>
		</dd>
		<dd>
			<a href="<%=basePath%>repay_plan/showBackMoney">还款安排</a>
		</dd>
		<dd>
			<a href="<%=basePath%>to/single-7-27.htm">我要借款</a>
		</dd>
		<dd>
			<a href="<%=basePath%>repayments/repayment.htm">还款</a>
		</dd>
			</ul>
	</dl>
	<dl>
		<dt class="subNav">合同管理</dt>
		<ul class="navContent">
		<%-- <dd>
			<a href="<%=basePath%>member_index/borrowContract.htm?no=1">借款合同</a>
		</dd> --%>
		<dd>
			<a href="<%=basePath%>member_index/investContract.htm">投资合同</a>
		</dd>
		</ul>
	</dl>
	<!-- <dl>
		<dt>优惠劵管理</dt>
		<dd>
			<a href="/member_index/ucode.htm">U-code兑换</a>
		</dd>
	</dl> -->
	<dl>
		<dt class="subNav">推广中心</dt>
		<ul class="navContent">
		<dd>
			<a href="<%=basePath%>generalize/get_promote_links">推广方式</a>
		</dd>
		<dd>
			<a href="<%=basePath%>generalize/generalize_list">我的推广</a>
		</dd>
		<dd>
			<a href="<%=basePath%>earnings/myearnings">我的收益</a>
		</dd>
		</ul>
	</dl>
</div>
<script>
//	var href = window.location.href;
//	var allhref = "";
//	$(".vipLeftBox dl dd a").each(function() {
//		allhref = $(this).attr("href");
//		if (href.indexOf(allhref) != -1) {
//			$(this).attr("class", "vipNavLink");
//			return false;
//		}
//	});

	$(function(){
		$(".subNav").click(function(){
			$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
			$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")

			// 修改数字控制速度， slideUp(500)控制卷起速度
			$(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
			//$(this).prev(".navContent").slideToggle(500).siblings(".navContent").slideDown(500);

			//alert($(this).text());
			//var sn = $(this).prevAll();
			//sn.slideToggle(500).siblings(".navContent").slideUp(500);
			//alert("sn:<%=Math.random()%>##"+sn.text());
		})
	})

	/*
	$(function(){
		$.ajax({
			type: "POST",
			url:"/sysconfig/openkey",
			data:{
				para:"is_elite_open"
			},
			success:function(msg){
				if(msg=='1'){
					$("myelite").css("display","block")
				}
			}
		});
	});
	*/
</script>
<%--End vipLeft--%>