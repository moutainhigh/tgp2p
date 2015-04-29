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
<title>太平洋理财贷款平台-债权转让</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/vipcenter.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>resources/js/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/loanSign/debtAssign.js"></script>
<%-- <jsp:include page="/WEB-INF/views/member/debt/assignmentDiv.jsp"></jsp:include> --%>
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
				<div class="vipRightBox" style="position:relative;z-index:99">
					<div class="vipHeadMenuBox">
						<ul>
							<!--  <li><a href="<%=basePath%>">转让中的债权</a></li>-->
							<li><a href="<%=basePath%>member_debt/init_assignment" class="vipHeadLink">可转出的债权</a></li>
							<!--<li><a href="<%=basePath%>">已转出的债权</a></li>
							<li><a href="<%=basePath%>">已转入的债权</a></li>-->
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipSeversTable">
								<thead>
									<tr>
									    <th>序号</th>
										<th>借款标号</th>
										<th>借款标题</th>
										<th>剩余标期</th>
										<th>投标金额</th>
										<th>年利率</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${loanNew}" var="loanrecord" varStatus="postStatus">
									<tr >
									    <td id="loanId_${postStatus.index}" align="center" height="30">${postStatus.index+1}</td>
										<td id="loanNumber_${postStatus.index}" align="center" height="30">${loanrecord.loanNumber}</td>
										<td align="center" height="30">${loanrecord.loanTitle}</td>
										<td align="center" height="30">${loanrecord.deadline}</td>
										<td id="tenderMoney_${postStatus.index}" align="center">￥<fmt:formatNumber value="${loanrecord.tenderMoney}" pattern="0.00" /></td>
										<td align="center"><fmt:formatNumber value="${loanrecord.interestRate}" pattern="0.0000" /></td>
										<td align="center" width="75"><b>${loanrecord.status}</b></td> 
										 <td align="center" width="75"><input type="button" onclick="showAssign('${loanrecord.loanId}','${loanrecord.loanTitle}','${loanrecord.tenderMoney}','${loanrecord.loanUnit}')" style="padding:2px 5px;margin:0" value="申请债权转让" /></td> 
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
					<style>
					.applyBg{position: absolute;top:0;left:0;width:800px;min-height: 300px;z-index: 99;background: #000;opacity: 0.5;filter: alpha(opacity=50);display: none;}
					.applyTrans{position: absolute;width:auto;padding:5px 15px 15px 15px;z-index: 99;left:160px;background-color: #fff;border: 1px solid #d0d0d0;display: none;}
					.applyTransDiv{width:100%;line-height: 30px;}
					#transPercent,#transValue{width:80px;text-align: center;height:20px;}
					.applyTrans input[type="text"]{width:60px;text-align: right;padding-right: 5px;margin-right: 5px;border: 1px solid #d0d0d0;}
					</style>
					<div class="applyBg"></div>
					<div class="applyTrans"></div>
				</div>
				<!--End vipRight-->
				<div class="clear"></div>
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
			fn_ajax("<%=basePath%>member_debt/init_assignment?no="+pageno);
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
			fn_ajax("<%=basePath%>member_debt/init_assignment?no="+pageno);
		}		
		function fn_ajax(url){
			window.location.href=url;
		}
		</script>
</body>
</html>
