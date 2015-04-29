function submit_click(t) {
	var FileName = $("#mes_file").val();
	var extension = FileName.substring(FileName.lastIndexOf(".") + 1,
			FileName.length);// 文件扩展名
	extension = extension.toLowerCase();
	if ($("#mes_id").val() == "") {
		ymPrompt.alert('请填写您的姓名！', 300, 200, "温馨提示！");
		return false;
	}
	if ($("#mes_id").val().length > 10) {
		ymPrompt.alert('请输入姓名长度小于等于10的姓名！', 300, 200, "温馨提示！");
		return false;
	}
	if ($("#mes_email").val() == "") {
		ymPrompt.alert('请输入您的email！', 300, 200, "温馨提示！");
		return;
	}
	if (!/^[0-9a-zA-Z]+?@[0-9a-zA-Z]{1,20}\.([cC][oO][mM]|[nN][eE][tT]|[Cc][nN])$/
			.test($("#mes_email").val())) {
		ymPrompt.alert('您输入的email不合法，请重新输入！', 300, 200, "温馨提示！");
		return;
	}
	if ($("#mes_phone").val() == "") {
		ymPrompt.alert('请填写您的联系电话！', 300, 200, "温馨提示！");
		return;
	}
	if (!/^([0-9]{4}-[0-9]{7}|[0-9]{11}|[0-9]{7})$/.test($("#mes_phone").val())) {
		ymPrompt.alert('您输入的电话号码格式不正确！', 300, 200, "温馨提示！");
		return;
	}
	if ($("#mes_context").val() == "") {
		ymPrompt.alert('请填写留言信息！', 300, 200, "温馨提示！");
		return;
	}
	if ($("#mes_code").val() == "") {
		ymPrompt.alert('请输入验证码！', 300, 200, "温馨提示！");
		return;
	}
	if (FileName != "") {
		if (extension != "doc" && extension != "docx" && extension != "pdf"
				&& extension != "txt" && extension != "xlsx"
				&& extension != "xls" && extension != "png"
				&& extension != "jpg" && extension != "bmp"
				&& extension != "rar" && extension != "zip"
				&& extension != "zipx" && extension != "7z"
				&& extension != "gif") {// 不安全的扩张名
			ymPrompt
					.alert(
							"您所选择的文件，可能存在安全隐患，请转换为【png,jpg,bmp,gif,doc,docx,pdf,txt,xlsx,xls,rar,zip,zipx,7z】格式上传！",
							470, 220, '提示', null);
			return;
		}
	}

	fn_ajax("/visitor/checkValideCode", {
		mes_code : $("#mes_code").val()
	}, function(data) {
		if (data == true) {
			if (checkfile()) {
				$("#message").submit();
			}
		} else {
			ymPrompt.errorInfo('验证码输入有误！', 400, 200, '失败', null);
			return;
		}
	});
}

// 判断上传文件的大小
function checkfile() {
	var maxsize = 2 * 1024 * 1024;// 2M
	var errMsg = "上传的附件文件不能超过2M！";
	var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过2M，建议使用IE、FireFox、Chrome浏览器。";
	var browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE") >= 1) {
		browserCfg.ie = true;
	} else if (ua.indexOf("Firefox") >= 1) {
		browserCfg.firefox = true;
	} else if (ua.indexOf("Chrome") >= 1) {
		browserCfg.chrome = true;
	}
	try {
		var obj_file = document.getElementById('mes_file');
		var filesize = 0;
		if (browserCfg.firefox || browserCfg.chrome) {
			filesize = obj_file.files[0].size;
		} else if (browserCfg.ie) {
			var obj_img = document.getElementById('tempimg');
			obj_img.dynsrc = obj_file.value;
			filesize = obj_img.fileSize;
		} else {
			ymPrompt.alert(tipMsg, 400, 200, '提示', null);
			return;
		}
		if (filesize == -1) {
			ymPrompt.alert(tipMsg, 400, 200, '提示', null);
			return;
		} else if (filesize > maxsize) {
			ymPrompt.alert(errMsg, 400, 200, '提示', null);
			return;
		}
	} catch (e) {

	}
	return true;
}

function fn_ajax(_url, _param, _callback) {
	$.ajax({
		url : _url,
		type : "post",
		data : _param,
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success : function(_msg) {
			if (_callback) {
				_callback(_msg);
			}
		}
	});
}