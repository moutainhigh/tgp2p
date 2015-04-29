
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

//当一级栏目改变时查询对应改一级栏目下面的栏目类型为‘列表’所有二级栏目
function topicSelectChange(){
	//当一级栏目select值改变时启用二级栏目的select控件
	document.getElementById("deputysection").disabled = false;
	var htmlData = "<option value=''>请选择</option>";
	var tid = document.getElementById("topic").value;
	fn_ajax("/admincolum/topicSelectChange",{id:tid},function(data){
		 for (var i = 0; i < data.length; i++) {
               htmlData = htmlData + "<option value='"+data[i][0]+"'>"+data[i][1]+"</option>"
	     }
        $("#deputysection").html(htmlData);
	});
}