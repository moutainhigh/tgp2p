$(function(){
	$("#tranAmt").keyup(function(){
		var num = $(this).val();
		if(isNaN(num)){
			$(this).val('');
		}else{
			if(num.indexOf(".")>0){
				if(num.substring(num.indexOf(".")).length>3){
					$(this).val(num.substring(0,num.indexOf(".")+3));
				}
			}
		}
	});
	$("#tranAmt").blur(function(){
		var num = $(this).val();
		if(num<=0){
			$(this).val(100);
		}
		if(num>1000000){
			$(this).val(1000000);
		}
	});

	$("#success").click(function(){
		top.window.location="/recharge/openRechargeRecord";
	});
	
	$("#error").click(function(){
		top.window.location="/recharge/openRechargeRecord";
	});
	
	$("#rech").click(function(){
		var type = $("#bankinfo").val();
		var money = $("#tranAmt").val();
		if(money==""){
			ymPrompt.succeedInfo('请选择充值金额！', 400, 200, '提醒', null);
			return false;
		}
		if(type==0){
			ymPrompt.succeedInfo('请选择需要充值银行！', 400, 200, '提醒', null);
			return false;
		}else{
			$("#recharge_creditor").submit();
			$.pdialog.closeCurrent();
		}
	});
	
	$("#close").click(function(){
		$.pdialog.closeCurrent();
	});
});

$(document).ready(function(){
	$("#sub").click(function(){
		var type = $("#bankinfo").val();
		var money = $("#tranAmt").val();
		if(money==""){
			ymPrompt.succeedInfo('请选择充值金额！', 400, 200, '提醒', null);
			return false;
		}
		if(type==0){
			ymPrompt.succeedInfo('请选择需要充值银行！', 400, 200, '提醒', null);
			return false;
		}else{
			$(".alertWaps").show();
			$("#from").submit();
		}
	});
	
});
