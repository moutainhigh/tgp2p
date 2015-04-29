$(function(){
	$("#suBnt_y").click(function(){
		$("#payBg").css({
			height:$(document).height()-560,
			display:"block"
		});
		$("#payDiv").css({
			display:"block"
		});
	});
	
	$(".closepay").click(function(){
		$("#payBg").css({
			height:$(document).height()-550,
			display:"none"
		});
		$("#payDiv").css({
			display:"none"
		});
	});
	
	
	$("#submit").click(function(){
		
		$("#payForm").submit();
	});

});