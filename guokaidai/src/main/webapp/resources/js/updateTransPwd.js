function reset() {
	window.location.reload();
}
$(function() {
	$("#myform").Validform({
		tiptype : 3,
		beforeSubmit : function(curform) {
			$('#myform').ajaxSubmit({
				dataType : 'text',
				success : function(msg) {
					if (msg == "true") {
						ymPrompt.succeedInfo('修改成功', 260, 160, '成功', reset);
					} else if (msg == "different") {
						ymPrompt.errorInfo('原密码错误!', 260, 160, '失败', null);
					} else if (msg == "same") {
						ymPrompt.errorInfo('不能与登录密码相同！', 260, 160, '失败', null);
					} else {
						ymPrompt.errorInfo('修改失败！', 260, 160, '失败', reset);
					}
				}
			});
			return false;
		}
	});

});