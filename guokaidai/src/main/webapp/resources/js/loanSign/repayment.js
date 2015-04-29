
function select(no){
	var $time=$(".QueriesLink").attr("value");
	var $beginTime = $("#in11").val();
	var $endTime = $("#in12").val();
	$.ajax({
		type:'post',
		data:{month:$time,beginTime:$beginTime,endTime:$endTime,no:no},
		url:'loanManage/repaymentLoan.htm',
		success:function(msg){
			$(".vipContBox table:eq(1)").replaceWith(msg);
		}
	});
}
$(function($){
	$.ajax({
		type:'post',
		data:'no='+1,
		url:'loanManage/repaymentLoan.htm',
		success:function(msg){
			$(".vipContBox table:eq(0)").after(msg);
		}
	});
	$(".vipContBox table a").click(function(){
		select(1);
	});
	$("#time").click(function(){
		select(1);
	});
});

function jumpPage(pageno,totalPage){
	if(pageno<=0 || pageno>totalPage){
		return;
	}
	select(pageno);
}
