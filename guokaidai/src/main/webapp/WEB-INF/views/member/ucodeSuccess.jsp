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
									0定金，抢先预定太平洋理财理财计划加入金额！<a
										href="/help/invest/invest!financial.action#useUcode"
										target="_blank">了解更多</a>
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
									<form action="/member/uCode.htm" id="ucodeForm" method="get"
										class="ui-form" enctype="multipart/form-data"
										data-name="ucode" novalidate="novalidate">
										<div class="inputs mt20">
											<div class="ui-form-item"
												style="width: 400px;margin-left: 80px;background-color:#fde7c0;margin-bottom:20px;padding:0;border:1px solid #fbdaa5;border-radius:5px">
												<label class="ui-label"
													style="width: 400px; text-align: left; margin-left: 10px;line-height:35px">恭喜，您已获得太平洋理财计划资格！请选择要加入的太平洋理财计划。</label>
											</div>
											<div style="width:400px;height:35px">
												<div style="line-height: 35px;width:160px;text-align:right;float:left;font-size:14px">U-code有效期至</div>
												<div style="line-height: 35px;float:left;margin-left:10px;font-size:14px;color:#000">2014-09-10 12:30</div>
											</div>
											<!-- <div class="ui-form-item">
												<label style="line-height: 35px;" class="ui-label">可加入额度</label>
												<input type="text" value="" placeholder="请输入您加入的金额"
													name="icome"
													class="ui-input w250 s_select_bg wid280 het45 clearfix " />
											</div> -->
											<div>
												<table class="ucode_table">
													<tr>
														<th style="">&nbsp;兑换期数</th>
														<th style="text-align:right;">预期收益</th>
														<th style="text-align:right;">锁定期限</th>
														<th style="text-align:right;">加入费用</th>
														<th style="width:150px">&nbsp;</th>
													</tr>
													<tr>
														<td class="dhqs">${youxuan.loansignbasics.loanTitle}</td>
														<td style="text-align:right">${youxuan.rate*100}%每年</td>
														<td style="text-align:right">${youxuan.month}个月</td>
														<td style="text-align:right">0元</td>
														<td><a href="/loaninfo/getYouxuanInfo.htm" style="background:none;margin-left:20px;line-height:30px">去预定</a></td>
													</tr>
												</table>
											</div>
										</div>
									</form>
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
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
