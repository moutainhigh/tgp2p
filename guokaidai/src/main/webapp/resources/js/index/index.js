$(function(){
	//注册
	jQuery("#df_rigster").validationEngine({
		"custom_error_messages": {
			"#regist_xie_yi": {
				"required": {
					'message': "您必须同意这个 注册协议"
				}
			}
		},
		onValidationComplete : function(form, valid) {
			if(valid)	waiting("正在提交，请稍后...","regist_form");
		}
	});

	//登陆
	jQuery("#df_login").validationEngine({
		"custom_error_messages": {
			"#regist_xie_yi": {
				"required": {
					'message': "您必须同意这个 注册协议"
				}
			}
		},
		onValidationComplete : function(form, valid) {
			if(valid)	waiting("正在提交，请稍后...","regist_form");
		}
	});
	
});

//ajax请求：请求地址,参数,回调方法
function fn_ajax(_url,_param,_callback){
	$.ajax({
		url:_url,
		type:"post",
		data:_param,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		success:function(_msg){
			if(_callback){
				_callback(_msg);
			}
		}
	});
}