//显示提现申请框
function applyWithdraw(){
  $(".applyBg").css({
    display: 'block',
    height: $(".vipRightBox").outerHeight()+'px'
  });
  $(".applyWithdraw").css({
    display: 'block',
    top: ($(".applyBg").outerHeight()-$(".applyWithdraw").outerHeight())/2-10+'px'
  });
}
//取消提现申请,隐藏申请框
function removeApply(){
	$(".applyBg").css('display', 'none');
	$(".applyWithdraw").css('display', 'none');
}
//提交提现申请
function submitApply(){
	var money = $(".applyDiv input[name='money']").val();
	if(money==""){
		ymPrompt.alert("请输入申请提现金额！");
		return;
	}
	$.ajax({
		url: '/withdraw/withdrawApply',
		type: 'POST',
		dataType: 'json',
		data: {money: money},
		success:function(msg){
			if(msg=="success"){
				//removeApply();
				ymPrompt.succeedInfo("提现申请已提交，等待审核！",400,200,null,function(result){window.location.reload();});
			}
		}
	});
}
//输入框验证
$(".applyDiv input[name='money']").bind("input propertychange",checkMoney);
function checkMoney(){
	var balance = parseFloat($("#balance").text());
	if(isNaN($(this).val())){
	  $(this).val($(this).val().replace(/[^\d]$/g,''));
	}else if(/[.][\d]{3}$/.test($(this).val())){
	  ymPrompt.alert("只能保留到两位有效小数！",null,null,"提示",null);
	  $(this).val($(this).val().replace(/[\d]$/g,''));
	}else if(parseInt($(this).val())>balance){
	  ymPrompt.alert("提现金额不得超过账户余额！",null,null,"提示",null);
	  $(this).val(balance);
	}else if(/^0/.test($(this).val())){
	  ymPrompt.alert("最小值为1，请重新输入！",null,null,"提示",null);
	  $(this).val(1);
	}
}

function sms_ajax(_url,_param,_callback){
	$.ajax({
		url:_url,
		type:"post",
		data:_param,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		success:function(_msg){
			ymPrompt.succeedInfo(_msg, 400, 200, null, null);
		}
	});
}

function submits(){
	var type = $("#bankCode").text();
	alert(type);
	$('#userbankfrom').ajaxSubmit({
		dataType : 'text',
		success : function(msg) {
			if(msg==1){
				ymPrompt.succeedInfo("验证码已过期", 400, 200, '提示', null);
			}else if(msg==2){
				ymPrompt.succeedInfo("验证码输入错误", 400, 200, '提示', null);
			}else{
				ymPrompt.succeedInfo("添加成功", 400, 200, '提示', null);
			}	
		}
	});
}