function reset() {
	window.location.reload();
}
$(function() {
	$("#oldPwd").blur(function(){
		if($(this).val().length<1){
			$("#oldPwdInfo").html("<font color='red'> *原密码不能为空</font> ");
		}else{
			$("#oldPwdInfo").html("<font color='green'> 输入正确</font> ");
		}
	});

	$("#newPwd").blur(function(){
		if($(this).val().length<1){
			$("#newPwdInfo").html("<font color='red'> *新密码不能为空</font> ");
		}else{
			$("#newPwdInfo").html("<font color='green'> 输入正确</font> ");
		}
	});

	$("#newPwdConfirm").blur(function(){
		if($(this).val().length<1){
			$("#newPwdConfirmInfo").html("<font color='red'> *新密码不能为空</font> ");
		}else{
			$("#newPwdConfirmInfo").html("<font color='green'> 输入正确</font> ");
		}
	});

	$("#commit").click(function() {
		if( $("#oldPwd").val().length<1
			|| $("#newPwd").val().length<1
			|| $("#newPwdConfirm").val().length<1
			|| $("#newPwdConfirm").val()!=$("#newPwd").val()
		){
			$("#rst").html("<font color='red'>信息输入有误,请修改!</font>")
		}else{
			$.ajax({
				type: 'post',
				url: '/update_info/update_pwd',
				data: {
					oldPwd:$.md5($("#oldPwd").val()),
					pwd:   $.md5($("#newPwd").val())
				},
				success: function (msg) {
					if (msg == "true") {
						//ymPrompt.succeedInfo('修改成功', 260, 160, '成功', reset);
						$("#rst").html("<font color='green'>修改成功</font>");
					} else if (msg == "different") {
						//ymPrompt.errorInfo('原密码错误!', 260, 160, '失败', null);
						$("#rst").html("<font color='red'>原密码错误!</font>");
					} else {
						//ymPrompt.errorInfo('修改失败！', 260, 160, '失败', reset);
						$("#rst").html("<font color='red'>修改失败!</font>");
					}
				}
			})
		}
	})
});