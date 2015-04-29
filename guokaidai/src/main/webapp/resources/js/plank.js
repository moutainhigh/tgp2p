$(function(){
  //借款信息
	$(".dataInfoTab li span").click(function(){
				$(this).parent("li").siblings().find("span").removeClass("dataTabLink");
				$(this).addClass("dataTabLink");
				var $loanid = $("#loanid").val();
				var $thisIndex=$(this).parent("li").index();
				if($thisIndex==0){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$(".dataContBox:eq("+$thisIndex+")").show();
				}else if($thisIndex==1){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$.ajax({
						type:'post',
						url:'loaninfo/loanRecord.htm',
						data:{id:$loanid,pageno:1},
						success:function(msg){
							$(".dataContBox:eq("+$thisIndex+")").html(msg);
						}
					});
					$(".dataContBox:eq("+$thisIndex+")").show();
				}else if($thisIndex==2){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$.ajax({
						type:'post',
						url:'loaninfo/loanSignRecord.htm',
						data:{id:$loanid,pageNo:1},
						success:function(msg){
							$(".dataContBox:eq("+$thisIndex+")").html(msg);
						}
					});
					$(".dataContBox:eq("+$thisIndex+")").show();
				}else if($thisIndex==3||$thisIndex==4){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$(".dataContBox:eq("+$thisIndex+")").show();
				}
		});

	$('#suBnt_a_').click(function(){
		//密码文本
		layer.prompt({title: '请输入交易密码，并确认',type: 1}, function(pass){
			$.ajax({
				type:'post',
				url:'/member/getOldTradePwd',
				data:{
					oldpwd:$.md5(pass)
				},
				success:function(msg) {
					if (msg == "success") {
						plank();
					}else{
						layer.msg('交易密码输入错误', 2 , 8);
					}
				}
			});
		});
	});

	function plank(){
		var $logo = $("#logo").val();
		var $effective = $("#effective").val();
		var $investMoney = $("#investMoney").val();
		var $loanuserId=$("#loanuserId").val();
		var $userId=$("#userId").val();
		var $minmoney=$("#minmoney").val();
		var $accountBalance=$("#accountBalance").attr("money");
		var $pcrettype=$("#pcrettype").val();
		var $issueLoan=$("#issueLoan").val();
		//alert($effective);
		//alert($investMoney);
		/*if($logo!="logo"){
		 ymPrompt.errorInfo('您还未登录额!',400,200,'提示',function(){top.window.location="visitor/to-login";});
		 return;
		 }*/
		if($loanuserId==$userId){
			ymPrompt.errorInfo('您不能投自己的标!',400,200,'提示',function(){});
			return;
		}
		if(isNaN($investMoney)){
			ymPrompt.errorInfo('输入含非法字符!',400,200,'提示',function(){});
			return;
		}
		if($investMoney==""){
			ymPrompt.errorInfo('请输入购标金额!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)%parseInt($minmoney)!=0){
			ymPrompt.errorInfo('输入金额必须为最小购买金额('+$minmoney+')的倍数!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)>parseInt($effective)){
			ymPrompt.errorInfo('您的输入已超过了最大购买金额,请重新输入!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)<parseInt($minmoney)){
			ymPrompt.errorInfo('您的输入不足于最小购买金额,请重新输入!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($pcrettype)==2&&parseFloat($investMoney)==parseFloat($issueLoan)){
			ymPrompt.errorInfo('部分转让时，输入的金额应小于债权总额!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($accountBalance)<parseInt($investMoney)){
			ymPrompt.errorInfo('您的账户余额不足,请先充值!',400,200,'提示',function(){});
			return;
		};
		if(!document.getElementById("checkAgree").checked){
			layer.msg("请先同意使用条款！",1,3);
			return;
		}
		$("#form1").submit();
	}

	//购买借款标
	$("#suBnt_a").click(function(){
		var $logo = $("#logo").val();
		var $effective = $("#effective").val();
		var $investMoney = $("#investMoney").val();
		var $loanuserId=$("#loanuserId").val();
		var $userId=$("#userId").val();
		var $minmoney=$("#minmoney").val();
		var $accountBalance=$("#accountBalance").attr("money");
		var $pcrettype=$("#pcrettype").val();
		var $issueLoan=$("#issueLoan").val();
		//alert($effective);
		//alert($investMoney);
		/*if($logo!="logo"){
			ymPrompt.errorInfo('您还未登录额!',400,200,'提示',function(){top.window.location="visitor/to-login";});
			return;
		}*/
		if($loanuserId==$userId){
			ymPrompt.errorInfo('您不能投自己的标!',400,200,'提示',function(){});
			return;
		}
		if(isNaN($investMoney)){
			ymPrompt.errorInfo('输入含非法字符!',400,200,'提示',function(){});
			return;
		}
		if($investMoney==""){
			ymPrompt.errorInfo('请输入购标金额!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)%parseInt($minmoney)!=0){
			ymPrompt.errorInfo('输入金额必须为最小购买金额('+$minmoney+')的倍数!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)>parseInt($effective)){
			ymPrompt.errorInfo('您的输入已超过了最大购买金额,请重新输入!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($investMoney)<parseInt($minmoney)){
			ymPrompt.errorInfo('您的输入不足于最小购买金额,请重新输入!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($pcrettype)==2&&parseFloat($investMoney)==parseFloat($issueLoan)){
			ymPrompt.errorInfo('部分转让时，输入的金额应小于债权总额!',400,200,'提示',function(){});
			return;
		}
		if(parseInt($accountBalance)<parseInt($investMoney)){
			ymPrompt.errorInfo('您的账户余额不足,请先充值!',400,200,'提示',function(){});
			return;
		};
		if(!document.getElementById("checkAgree").checked){
			alert("请先同意使用条款！");
			return;
		}
		//密码文本
		layer.prompt({title: '请输入交易密码，并确认',type: 1}, function(pass){
			$.ajax({
				type:'post',
				url:'/member/getOldTradePwd',
				data:{
					oldpwd:$.md5(pass)
				},
				success:function(msg) {
					if (msg == "success") {
						$("#form1").submit();
					}else{
						layer.msg('交易密码输入错误', 2 , 8);
					}
				}
			});
		});
	});
});

function jumpPage(pageno,totalPage){
	if(pageno<=0 || pageno>totalPage){
		return;
	}
	$.ajax({
		type:'post',
		url:'/member_index/system_message',
		data:'pageNum='+pageno,
		success:function(msg){
			top.window.location='/member_index/system_message?pageNum='+pageno;
		}
	});
}

//收藏借款标
function collect(){
	var $logo = $("#logo").val();
	var id=$("#loanid").val();
	if(!document.getElementById("checkAgree").checked){
		alert("请先同意使用条款！");
		return;
	}
	/*if($logo!="logo"){
		ymPrompt.errorInfo('您还未登录额!',400,200,'提示',function(){top.window.location="visitor/to-login";});
		return;
	}*/
	$.ajax({
		type:'post',
		url:'/collectlist/addCollect',
		data:'id='+id,
		success:function(msg){
			ymPrompt.errorInfo(msg,400,200,'提示');
		}
	});
}