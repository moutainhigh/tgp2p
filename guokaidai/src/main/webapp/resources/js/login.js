$(function() {
	$("#df_rigster").validationEngine({
		promptPosition : "topRight",
		autoHidePrompt:true,
		autoHideDelay:500,
		onSuccess : function(form, valid) {
			if (valid) {
				$("input").attr("readonly", "readonly");
				$("#user_rigster").val("正在注册");
			} else {
				
			}
		}
	});

	var user_name = $.cookie('DHD_USER_NAME');
	if(user_name!=undefined){
		$("#username").val(user_name);
		$("#remember_user_name").attr("checked","true");
	}
	
	$("#df_login").validationEngine({
		promptPosition : "topRight",
		autoHidePrompt:true,
		autoHideDelay:500,
		onValidationComplete : function(form, valid){
			if(valid){
				if($("#remember_user_name").attr("checked")=="checked"){
					$.cookie("DHD_USER_NAME",$("#username").val());
				}
				waiting("正在登录，请稍后...","login_form");
			}
		}
	});
});