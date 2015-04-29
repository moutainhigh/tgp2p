<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/logo.jpg" />
<meta http-equiv="keywords" content="${application_keyword.keywords}"/>
<meta http-equiv="description" content="${application_keyword.description}"/>
<title>太平洋理财-资金统计-资金历史明细</title>
<link type="text/css" rel="stylesheet" href="/resources/css/lhgcalendar.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="/resources/js/lhgcalendar.min.js"></script>
<div class="n_pos_bg">
	<div class="n_pos">
    	您的位置：太平洋理财 &gt; 我的资金 &gt; 资金历史明细
    </div>
</div>
<div class="mban">
	<img src="/resources/images/mban.jpg" width="1000" height="100" />
</div>
<div class="content">
	<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
    <div class="infoRight">
    	<div class="info_n">
        	<ul>
                <li><a href="/my_money/my_money_sum">资金统计</a></li>
                <li><a href="/my_money/my_money_sum_details" class="now">资金历史明细</a></li>
            </ul>
        </div>
        <div class="info_c">
        	<div class="words">尊敬的太平洋理财用户，以下是您在太平洋理财的资金统计，敬请仔细审阅 ！<br />资金历史纪录了您各种交易产生的支出和收入的明细，请选择事件类型和时间，然后点击“查看”按钮浏览。</div>
            <div class="record_sou">
               	 类型：<select id="typeId">
                	<option value="">--选择状态--</option>
                	<c:forEach items="${list}" var="li">
                		<option value="${li[0]}">${li[1]}</option>
                	</c:forEach>
                </select>
                                       时间从：<input type="text" value="" onclick="" class="timeInput_Day" readonly="readonly" id="inp11" name="beginDate" />到<input type="text" value="" onclick="" class="timeInput_Day" readonly="readonly" id="inp12" name="endDate"/> 
                <input type="button" value="搜索" class="btn_s" onclick="reload(1);" />
            </div>
            <div id="record_sou"></div>
            <%-- 类容--%>
        	  
        </div>
    </div>
    <div style="clear:both;"></div>
</div>


<script type="text/javascript">
function reload(pageno){
	if(pageno=="" || pageno==null){
		pageno=1;
	}
	var typeId=$("#typeId").val();
	var beginDate=$("#inp11").val();
	var endDate=$("#inp12").val();
	$.ajax({
		data:"pageNum="+pageno+"&typeId="+typeId+"&beginDate="+beginDate+"&endDate="+endDate,
		url:'/my_money/query_fund_page',
		type:'post',
		success:function(msg){
			$("#inves_jh").remove();
			$("#record_sou").append(msg);
		}
	});
};
reload(1);

$(function() {
	$('#inp11').calendar({
		maxDate : '#inp12'
	});
	$('#inp12').calendar({
		minDate : '#inp11'
	});
});
</script>
</body>
</html>
