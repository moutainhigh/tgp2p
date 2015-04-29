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
function updatePhoto(obj){
	var window = art.dialog({
		title:'上传头像',
		lock:true,
		fixed:true,
		width:200,
		height:100,
		content:'正在上传…………',
		background:'transparent',
		ok:function(){}
	});
	var uid = $("#uid").val();
	var imgurl = "";
	if(obj == "file"){
		$("#form_upload").submit();
	}else {
		imgurl = $("#"+obj).attr("src");
	}
	fn_ajax("/member/updatePhoto",{imgurl:imgurl,uid:uid},function(data){
		if(data == "1")
		{
			window.content('修改头像成功！');
			$("#header_img").attr("src",imgurl);
		}
		else{
			window.content('修改头像失败！');
		}
	});
}