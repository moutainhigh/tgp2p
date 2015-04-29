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
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="<%=basePath%>depositshistory/init_two">投标中项目</a></li>
							<li><a href="<%=basePath%>depositshistory/init_three">收款中项目</a></li>
							<li><a href="<%=basePath%>depositshistory/init_Four">未收款明细</a></li>
							<li><a href="<%=basePath%>depositshistory/init_five">已收款明细</a></li>
							<li><a href="<%=basePath%>depositshistory/init_six">借出明细</a></li>
							<li><a href="<%=basePath%>depositshistory/init_seven"
								class="vipHeadLink">已还清项目</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的已还清项目。
							</h1>
							<p>
								您目前的已还清总额是：<font>￥${count_money}</font>，共 <font>${count}</font>笔已还清。
							</p>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipSeversTable">
								<thead>
									<tr>
										<th>借款编号</th>
										<th>借款标题</th>
										<th>借款人</th>
										<th>年利率</th>
										<th>借款期限</th>
										<th>投标时间</th>
										<th>投标总额</th>
										<th>应收本息</th>
										<th>实收本息</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${loanrecordlist}" var="loann">
									<tr>
										<td>${loann.loanNumber}</td>
										<td>${loann.loanTitle}</td>
										<td>${loann.borrowername}</td>
										<td><fmt:formatNumber value="${loann.interestRate*100}" pattern="0.00"/>%</td>
										<td>${loann.deadline}</td>
										<td><fmt:parseDate value="${loann.tenderTime}"  var="cur_date" pattern="yyyy-MM-dd" />
	                		<fmt:formatDate pattern="yyyy-MM-dd" value="${cur_date}" /></td>
										<td>￥${loann.tenderMoney}</td>
										<td>￥<fmt:formatNumber value="${loann.principalandInterest}" pattern="0.00"/></td>
										<td><fmt:formatNumber value="${loann.principalandInterest - loann.tzyj}" pattern="0.00"/></td>
									</tr>
									</c:forEach>
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
	<script type="text/javascript">
		function jumpPage(pageno){
			if(pageno<=0 || pageno>${pager.totalPage}){
				return;
			}
			fn_ajax("<%=basePath%>depositshistory/init_seven?no="+pageno);
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
			fn_ajax("<%=basePath%>depositshistory/init_seven?no="+pageno);
		}		
		function fn_ajax(url){
			window.location.href=url;
		}
		</script>
</body>
</html>
