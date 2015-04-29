<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
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
<link rel="stylesheet" type="text/css"
	href="../resources/css/vipcenter.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/payAndloan.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="../resources/js/recharge.js"></script>
	<!--Content-->
	<div class="Content">
		<div class="w960px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />


				<!--vipRight-->
				<div class="vipRightBox" style="position: relative">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="/member_index/myYouxuan.htm" class="vipHeadLink">预定中</a></li>
							<li><a href="/member_index/yxcontract.htm">理财合同</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财中预定成功的理财计划。
							</h1>
							<%-- <p>
								您目前竞标中的投资总额是：<font>￥${count_money}</font>，共 <font>${count}</font>
								笔投标。
							</p> --%>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipSeversTable">
								<thead>
									<tr>
										<th>编号</th>
										<th>计划名称</th>
										<th>加入金额</th>
										<th>已付定金</th>
										<th>待付金额</th>
										<th>支付截止时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>

									<c:if test="${!empty preset }">
									<c:forEach items="${preset }" var="preset">
										<tr>
											<td>${preset.id}</td>
											 <td><a style="color: #3cadf9"
												href="/loaninfo/getYouxuanInfo.htm">${preset.ucode}</a></td>
											<td>${preset.loanMoney}</td>
											<td>${preset.bargainMoney}</td>
											<td>${preset.loanMoney}</td>
											<td style="color: red">${preset.payTime}</td>

											<td><c:if test="${preset.state==1}">
													<c:if test="${preset.success ge 0 }">
													<c:if test="${preset.state!=2}">
														<a href="/plank/getLoaninfo.htm?id=${preset.loanSignId}&&money=${preset.loanMoney}" style="color: #3cadf9">去支付</a>
													</c:if>
													</c:if>
													<c:if test="${preset.success lt 0 }">
														<a style="color: #3cadf9">已过期</a>
													</c:if>
												</c:if> <c:if test="${preset.state==2}">
													<a style="color: #3cadf9">已支付</a>
												</c:if></td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${empty preset}">
										<tr>
											<td colspan="8">您没有预定任何太平洋理财理财计划！<a
												href="/loaninfo/getYouxuanInfo.htm" style="color: #3cadf9">去预定</a></td>
										</tr>
									</c:if> 
								</tbody>
								<%-- <tfoot>
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
								</tfoot> --%>
							</table>
						</form>

					</div>
					<!--End vipContBox-->
					<jsp:include page="/WEB-INF/views/member/loan/payDiv.jsp" />
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<!--End vipRight-->
	</div>
	<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
	<script type="text/javascript">
		function jumpPage(pageno){
			if(pageno<=0 || pageno>${pager.totalPage}){
				return;
			}
			fn_ajax("<%=basePath%>depositshistory/init_two?no="+pageno);
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
			fn_ajax("<%=basePath%>depositshistory/init_two?no="+pageno);
		}		
		function fn_ajax(url){
			window.location.href=url;
		}
		</script>
</body>
</html>
