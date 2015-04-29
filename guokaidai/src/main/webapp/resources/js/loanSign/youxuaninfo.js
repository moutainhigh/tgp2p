$(function(){
	$("#suBnt_y").click(function(){
		var $logo = $("#logo").val();
		var $effective = $("#effective").val();
		var $investMoney = $("#investMoney").val();
		var $minmoney=$("#minmoney").val();
		var $accountBalance=$("#accountBalance").val();
		var $usuccess = $("#usuccess").val();
		var $lastMoney = $("#lastMoney").val();
		var $state = $("#state").val();
		
		if($logo!="logo"){
			ymPrompt.errorInfo('您还未登录额!',400,200,'提示',function(){top.window.location="/visitor/to-login";});
			return;
		}
		if($usuccess!="1"){
			ymPrompt.errorInfo('您还没兑换U-code码，请先兑换！',400,200,'提示',function(){top.window.location="/member_index/ucode.htm";});
			return;
		}
		/*if($loanuserId==$userId){
			ymPrompt.errorInfo('您不能投自己的标！',400,200,'提示',function(){});
			return;
		}*/
		if($state=="1"){
			ymPrompt.errorInfo('抱歉，您已经预定过了！',400,200,'提示',function(){});
			return;
		}
		if(isNaN($investMoney)){
			ymPrompt.errorInfo('输入含非法字符！',400,200,'提示',function(){});
			return;
		}
		if($investMoney==""){
			ymPrompt.errorInfo('请输入要预定的金额！',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)%parseInt($minmoney)!=0){
			ymPrompt.errorInfo('输入金额必须为小于预定金额('+$minmoney+')的倍数！',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)>parseInt($lastMoney)){
			ymPrompt.errorInfo('您还能预定的金额为'+$lastMoney+'元！',400,200,'提示',function(){});
			return;
		}

		if(parseInt($accountBalance)<parseInt($investMoney)){
			ymPrompt.errorInfo('您的账户余额不足,请先充值！',400,200,'提示',function(){});
			return;
		};
		if(!document.getElementById("checkAgree").checked){
			alert("请先同意使用条款！");
			return;
		}
		$("#yudingBg").css({
			height:$(document).height()-560,
			display:"block"
		});
		$("#yudingDiv").css({
			display:"block"
		});
		$(".yudingMoney").text($("#investMoney").val());
	});
	
	$(".closeYuding").click(function(){
		$("#yudingBg").css({
			height:$(document).height()-550,
			display:"none"
		});
		$("#yudingDiv").css({
			display:"none"
		});
	});

	$(".closeYudingSuccess").click(function(){
		$("#yudingBg").css({
			display:"none"
		});
		$("#yudingSuccess").css({
			display:"none"
		});
		top.window.location="/loaninfo/getYouxuanInfo.htm";
	});
	
	//确定预定理财
	$("#submit").click(function(){
		var $investMoney = $("#investMoney").val();
		var $loanid=$("#loanid").val();
		$.ajax({
			url:'/loaninfo/reserve.htm',
			type:'post',
			data:{money:$investMoney,loanid:$loanid},
		    success:function(msg){

				$("#yudingDiv").css({
					display:"none"
				});
				$("#yudingSuccess").css({
					display:"block"
				});
		    }		
		});
	});
});
	
	//加入理财
	$("#suBnt_a").click(function(){
		var $logo = $("#logo").val();
		var $effective = $("#effective").val();
		var $investMoney = $("#investMoney").val();
		var $minmoney=$("#minmoney").val();
		var $accountBalance=$("#accountBalance").val();
		
		if($logo!="logo"){
			ymPrompt.errorInfo('您还未登录额!',400,200,'提示',function(){top.window.location="/visitor/to-login";});
			return;
		}
		
		if(isNaN($investMoney)){
			ymPrompt.errorInfo('输入含非法字符！',400,200,'提示',function(){});
			return;
		}
		if($investMoney==""){
			ymPrompt.errorInfo('请输入购标金额！',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)%parseInt($minmoney)!=0){
			ymPrompt.errorInfo('输入金额必须为最小购买金额('+$minmoney+')的倍数！',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)>parseInt($effective)){
			ymPrompt.errorInfo('您的输入已超过了最大购买金额,请重新输入！',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)<parseInt($minmoney)){
			ymPrompt.errorInfo('您的输入不足于最小购买金额,请重新输入！',400,200,'提示',function(){});
			return;
		}
		if(parseInt($accountBalance)<parseInt($investMoney)){
			ymPrompt.errorInfo('您的账户余额不足,请先充值！',400,200,'提示',function(){});
			return;
		};
		if(!document.getElementById("checkAgree").checked){
			alert("请先同意使用条款！");
			return;
		}
		$("#form1").submit();
	});
	
	

function showtime(){	
	var loantype=$("#loantype").val();
	var loanstate=$("#loanstate").val();
	var loanrate=$("#loanrate").val();
	var yuding=$("#yuding").val();
	if(loantype==3){
		$("#showtime").html("<lable class='showtime'>无时间限制</lable>");
	}else if(loanstate==2&&loanrate==1){
		$("#showtime").html("<lable class='showtime'>已结束</lable>");
	}else{
		var endyear=$("#endtime_year").val();
		var endmonth=$("#endtime_month").val();
		var endday=$("#endtime_day").val();
		var endtime=$("#endtime_time").val();
		var sTime=new Date();
		var enddate=endyear+"/"+endmonth+"/"+endday+" "+endtime;
		var eTime=new Date(enddate);
		var sumSecond=parseInt((eTime.getTime()-sTime.getTime())/1000);sumSecond=sumSecond+(24*60*60);
		var showSecond=sumSecond%60;
		var sumMinute=(sumSecond-showSecond)/60;
		var showMinute=sumMinute%60;
		var sumHour=(sumMinute-showMinute)/60;
		var showHour=sumHour%24;
		var showData=(sumHour-showHour)/24-1;
		if(showData>=0){
			$("#showday").html(showData);
			$("#showhour").html(showHour);
			$("#showminute").html(showMinute);
			$("#showsecond").html(showSecond);
			timerID=setTimeout(function(){showtime();},1000);
		}else{
			if(yuding==""){
			$("#showtime").html("<lable class='showtime'><font style=' font-size: 15px;'>已结束</font></lable>");
			}else{
			$("#showtime").html("<lable class='showtime'><font style=' font-size: 15px;'>离预定时间：已结束</font></lable>");
			}
		}
	}
}

function showtime1(i){
	var loantype=$("#loantype"+i).val();
	var loanstate=$("#loanstate"+i).val();
	var loanrate=$("#loanrate"+i).val();
	if(loantype==3){
		$("#showtime"+i).html("<lable class='showtime'>无时间限制</lable>");
	}else if(loanstate==2&&loanrate==1){
		$("#showtime"+i).html("<lable class='showtime'>已结束</lable>");
	}else{
		var endyear=$("#endtime_year"+i).val();
		var endmonth=$("#endtime_month"+i).val();
		var endday=$("#endtime_day"+i).val();
		var endtime=$("#endtime_time"+i).val();
		var sTime=new Date();
		var enddate=endyear+"/"+endmonth+"/"+endday+" "+endtime;
		var eTime=new Date(enddate);
		var sumSecond=parseInt((eTime.getTime()-sTime.getTime())/1000);sumSecond=sumSecond+(24*60*60);
		var showSecond=sumSecond%60;
		var sumMinute=(sumSecond-showSecond)/60;
		var showMinute=sumMinute%60;
		var sumHour=(sumMinute-showMinute)/60;
		var showHour=sumHour%24;
		var showData=(sumHour-showHour)/24-1;
		if(showData>=0){
			$("#showday"+i).html(showData);
			$("#showhour"+i).html(showHour);
			$("#showminute"+i).html(showMinute);
			$("#showsecond"+i).html(showSecond);
			timerID=setTimeout(function(){showtime1(i);},1000);
		}else{
			$("#showtime"+i).html("<lable class='showtime'>已结束</lable>");
		}
	}
}

function showtime2(length){
	for(var i=0;i<length;i++){
		showtime1(i);
	}
}

