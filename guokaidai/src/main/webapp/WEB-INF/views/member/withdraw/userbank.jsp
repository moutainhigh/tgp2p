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
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script type="text/javascript" src="/resources/js/recharge.js"></script>
<link rel="stylesheet" href="../resources/css/validationEngine.jquery.css" type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script src="/resources/js/jquery.validationEngine.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.validationEngine-zh_CN.js" type="text/javascript"></script>
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				<!--vipRight-->
				<div class="vipRightBox" style="position:relative;">
					<div class="vipHeadMenuBox">
						<div class="vipHeadMenuBox">
							<ul>
								<!-- <li><a href="/withdraw/withdraw">账户提现</a></li> -->
								<li><a href="javascript:void(0);" class="vipHeadLink">提现申请</a></li>
								<li><a href="/withdraw/query.htm">提现记录</a></li>
							</ul>
						</div>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的提现申请记录。你需要先绑定银行卡才能提现。申请提现后，需要太平洋理财审核通过方可提现。
								<%-- 尊敬的太平洋理财用户，以下是您在太平洋理财的提现申请记录。你可以点击<a onclick="applyWithdraw()" style="padding:0 2px">申请提现</a>提交提现申请，通过审核后可以提现。 --%>
							</h1>
						</div>
						<div class="applyDiv" style="padding:10px 10px 0 40px;height:20px;">
							<c:if test="${not empty userbank.bankAccount}">
								<span style="display:block;font-size:14px;line-height:20px;float:left">您当前账户可用余额：<span id="balance" style="color:red;font-size:14px">${session_user.userfundinfo.cashBalance }</span>元，</span>
								<span style="display:block;font-size:14px;line-height:20px;float:left;margin-left:5px">申请提现金额：￥</span>
								<input type="text" name="money" style="width:70px;height:20px;line-height:20px;border:1px solid #ccc;padding-left:2px;float:left;font-size:14px;"/><a onclick="submitApply()" style="width:80px;height:20px;background-color:#33b9ff;line-height:20px;display:block;float:left;margin-left:5px;color:#fff;text-align:center;border-radius:3px;cursor: pointer;">申请提现</a>
							</c:if>
							<c:if test="${empty userbank.bankAccount}">
								<span style="display:block;font-size:14px;line-height:20px;float:left">您目前没有绑定银行卡<span id="balance" style="color:red;font-size:14px"></span>，</span>
								<span style="display:block;font-size:14px;line-height:20px;float:left;margin-left:5px">请先绑定银行卡再做提现操作</span>
								<a onclick="javascript:href='/mybankCard/mybankCard.htm'" style="width:80px;height:20px;background-color:#33b9ff;line-height:20px;display:block;float:left;margin-left:5px;color:#fff;text-align:center;border-radius:3px;cursor: pointer;">绑定银行卡</a>
							</c:if>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
								<thead>
									<tr>
										<th>编号</th>
										<th>提现申请金额</th>
										<th>可提现总额</th>
										<th>审核状态</th>
										<th>审核结果</th>
										<th>申请时间</th>
										<th>审核时间</th>
										<th>操作</th>
									</tr>
								</thead>

								<c:forEach items="${applylist}" var="WithdrawApply"
									varStatus="on">
									<tr>
										<td>${on.index+1}</td>
										<td>${WithdrawApply.applyNum}</td>
										<td>${WithdrawApply.cash}</td>
										<td>
											<c:if test="${WithdrawApply.status eq 0}">未审核</c:if>
											<c:if test="${WithdrawApply.status eq 1}"><span style="color:red">已审核</span></c:if> 
										</td>
										<td>
											<c:if test="${WithdrawApply.status eq 0}"></c:if>
											<c:if test="${WithdrawApply.status eq 1}">
												<c:if test="${WithdrawApply.result eq 0}">不通过</c:if>
												<c:if test="${WithdrawApply.result eq 1}"><span style="color:red">通过</span></c:if>
												<c:if test="${WithdrawApply.result eq 2}"><span style="color:red">通过</span></c:if>
											</c:if>
										</td>
										<td>${WithdrawApply.applyTime}</td>
										<td>${WithdrawApply.answerTime}</td>
										<td>
											<c:if test="${WithdrawApply.status eq 0}">待审核</c:if> 
											<c:if test="${WithdrawApply.status eq 1}">
												<c:if test="${WithdrawApply.result eq 1}">
													<!--
													<a href="/withdraw/ipsWithdraw?id=${WithdrawApply.id}" target="_blank" style="color:#33b9ff">去提现</a>
													-->
													等待打款
												</c:if> 
												<c:if test="${WithdrawApply.result eq 0}">
													审核未通过
												</c:if>
												<c:if test="${WithdrawApply.result eq 3}">
													<!--提现中-->
													打款中
												</c:if>
												<c:if test="${WithdrawApply.result eq 2}">
													已提现
												</c:if>
											</c:if>
										</td>
									</tr>
								</c:forEach>
								<tbody>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="10">
											<div class="tablePage">
												<span>共${pager.totalCount}条${pager.totalPage}页</span><span>当前第${pager.pageNum}页</span>
												<a href="javascript:jumpPage(1);">首页</a>
												<a href="javascript:jumpPage(${pager.pageNum-1 });">上一页</a><a
													href="javascript:jumpPage(${pager.pageNum+1 });">下一页</a><a
													href="javascript:jumpPage(${pager.totalPage});">尾页</a>跳转<input id="page_no" type="text" class="tabPageJumpTx" /><input
													type="button" value="确定" class="tabPageJumpBnt" onclick="jumpPage02();"/>
											</div>
										</td>
									</tr>
								</tfoot>
							</table>
						</form>
						<%-- <style>
    	                .applyBg{position: absolute;top:0;left:0;width:800px;min-height: 400px;z-index: 99; background: #000;opacity: 0.5;filter: alpha(opacity=50);display: none;}
    	                .applyDiv {width:100%;line-height: 30px;}
    	                .applyWithdraw{position: absolute;width:auto;padding:5px 15px 15px 15px;z-index: 99;left: 190px;background-color: #fff;border: 1px solid #d0d0d0;display: none;}
    	                .applyWithdraw input[type="text"] {height:20px;line-height:20px;border:1px solid #aaa;}
    	                </style>
    	                <div class="applyBg"></div>
    	                <div class="applyWithdraw">
    	                  <div class="applyDiv" style="font-weight: bold;">申请提现</div>
    	                  <div class="applyDiv">
    	                  	<span style="display:inline-block;width:90px;text-align:right">太平洋理财账号：</span>${session_user.userName }
    	                  </div>
    	                  <div class="applyDiv">
    	                  	<span style="display:inline-block;width:90px;text-align:right">账户可用余额：</span>${session_user.userfundinfo.cashBalance }元
    	                  </div>
    	                  <div class="applyDiv">
    	                  	<span style="display:inline-block;width:90px;text-align:right">申请提现金额：</span><input type="text" name="money" style="width:60px;padding-left:2px" />元
    	                  </div>
    	                  <div style="margin-top:10px"> 
    	                    <a class="authenticateBnt" onclick="submitApply()" style="height:25px;line-height:25px;margin-left:0px">确认</a><a class="authenticateBnt" onclick="removeApply()" style="height:25px;line-height:25px;margin-left:40px">取消</a>
    	                  </div>
    	                </div> --%>
					</div>
					<script src="/resources/js/funds/userbank.js"></script>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->
		</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script>
		function jumpPage(pageno){
			if(pageno<=0 || pageno>${pager.totalPage}){
				return;
			}
			fn_ajax("<%=basePath%>withdraw/openWithdraw?pageNum="+pageno);
		}
		function jumpPage02(){
			var pageno = $.trim($("#page_no").val());
			if(pageno == "" || pageno == null){
				ymPrompt.alert("请输入页码！", 400, 200, '提示', null);
				return;
			}
			if(pageno < 0 || pageno > ${pager.totalPage}){
				ymPrompt.alert("请输入大于0小于${pager.totalPage}的页面！", 400, 200, '提示', null);
				return;
			}
			fn_ajax("<%=basePath%>withdraw/openWithdraw?pageNum="+pageno);
		}		
		function fn_ajax(url){
			window.location.href=url;
		}
		
	</script>
</body>
</html>
