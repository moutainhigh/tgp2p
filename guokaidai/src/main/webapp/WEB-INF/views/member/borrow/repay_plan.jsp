<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
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
<link rel="stylesheet" type="text/css" href="../resources/css/vipcenter.css" />
<link type="text/css" rel="stylesheet" href="../resources/css/lhgcalendar.css" />
<script src="../resources/js/borrow/repay_plan.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/loadMask.js"></script>

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<input type="hidden" id="id" value="${session_user.id }" />
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
							<li><a href="javascript:void(0);" class="vipHeadLink">还款安排</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>尊敬的太平洋理财用户，以下是您在太平洋理财的借款审核，敬请仔细审阅。
							</h1>
							<p>
								借款偿还安排标注了您在将来如约还款的时间以及还款余额，您目前应还款总额是：<font>￥<fmt:formatNumber value="${res4}" pattern="0.00"/></font>，共 <font>${num}</font>
								笔借款。
							</p>
						</div>
						<form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipSeversTable">
								<thead>
									<tr>
										<th></th>
										<th>未来一月</th>
										<th>未来三月</th>
										<th>未来半年</th>
										<th>全部</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>待还本息总额</td>
										<td align="center">￥<fmt:formatNumber value="${res1}" pattern="0.00"/></td>
						                <td align="center">￥<fmt:formatNumber value="${res2}" pattern="0.00"/></td>
						                <td align="center">￥<fmt:formatNumber value="${res3}" pattern="0.00"/></td>
						                <td align="center">￥<fmt:formatNumber value="${res4}" pattern="0.00"/></td>
									</tr>
								</tbody>
							</table>
							<table cellpadding="0" cellspacing="0" class="vipQueries">
								<tbody>
									<tr>
										<th valign="top">快捷查询：</th>
<!-- 										<td><a href="#" class="QueriesLink">未来一月</a><a href="#">未来三月</a><a -->
<!-- 											href="#">未来半年</a><a href="#">全部</a></td> -->
										<td>
										<a href="javascript:fn_queryDetail(1);"  class="QueriesLink">未来一月</a>
										<a href="javascript:fn_queryDetail(3);">未来三月</a>
										<a href="javascript:fn_queryDetail(6);">未来半年</a>
										<a href="javascript:fn_queryDetail(-1);">全部</a>
										</td>
									</tr>
									<tr>
										<th valign="top">自定义查询：</th>
										<td>时间从<input id="beginDate" type="text" class="QueriesDate" />至<input
											type="text" class="QueriesDate" id="endDate" /><input type="button"
											value="查询" class="QueriesBnt" onclick="fn_queryDetail();"/>
										</td>
									</tr>
								</tbody>
							</table>

							<div id="plan_detail_content"></div>
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
	<script type="text/javascript" src="../resources/js/lhgcalendar.min.js"></script>
	<script type="text/javascript">

	var _repaymentPlanParam = {};
	var cur_date = '';
	
	function fn_show_date(d){
		
		var str = d.getFullYear()+'-';

		if(d.getMonth() + 1<10){
			str  += "0"+(d.getMonth() + 1)+'-';
		}else{
			str  += d.getMonth() + 1+'-';
		}
		
		if(d.getDate()<10){
			str  += "0"+d.getDate();
		}else{
			str  += d.getDate();
		}
		
		return str;
		
	}
	
	$(function() {
		
		$('#beginDate').calendar({
			format:'yyyy-MM-dd',
			maxDate : '#endDate'
		});
		$('#endDate').calendar({
			format:'yyyy-MM-dd',
			minDate : '#beginDate'
		});
		
		var d = new Date();
		cur_date = fn_show_date(d);
		d.setMonth(d.getMonth()+1);
		
		$("#beginDate").val(cur_date);
		$("#endDate").val(fn_show_date(d));
		
		fn_queryDetail();
		
	});
	
	
	
	function fn_quick_query(_v){
		
		if(_v==-1){
			return null;
		}else{
			
			var d = new Date();
			d.setMonth(d.getMonth()+_v);
			return fn_show_date(d);
		}
		
	}
	
	//查询
	function fn_queryDetail(_v,no){

		if(_v==0){
			
		}else if(_v==-1){
			
			_repaymentPlanParam.beginDate = "";
			_repaymentPlanParam.endDate   = "";
			
		}else if(_v){
			_repaymentPlanParam.beginDate = cur_date;
			_repaymentPlanParam.endDate   = fn_quick_query(_v);
		}else{
			_repaymentPlanParam.beginDate = $('#beginDate').val();
			_repaymentPlanParam.endDate = $('#endDate').val();
		}
		
		if(no!=null)	_repaymentPlanParam.no = no;
		else			_repaymentPlanParam.no = 0;
		
		loadMask.load("plan_detail_content","正在加载");
		
		//根据条件获取数据并显示
		fn_ajax("repay_plan/repaymentPlanDetail.htm",_repaymentPlanParam,function(_msg){
			$("#plan_detail_content").html(_msg);
			loadMask.unload("plan_detail_content");
		});
	}
	
	//ajax请求：请求地址,参数,回调方法
	function fn_ajax(_url,_param,_callback){
		$.ajax({
			url:_url,
			type:"GET",
			data:_param,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			success:function(_msg){
				if(_callback){
					_callback(_msg);
				}
			}
		})};
	
</script>
	<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
