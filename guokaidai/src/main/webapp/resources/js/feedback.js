//导出
 $("#table-excel").click(function(){
    	//判断用户是否选中数据
		 alertMsg.confirm("是否导出数据到excel", {
				okCall: function(){
					top.window.location="feedback/table-to-excel";
				}
		});
 });
 
 function fun_download(fid){
	 if(fid == null){
		 alertMsg.error("该留言人没有上传任何附件！");
		 return false;
	 }else{
		 top.window.location = "/feedback/downFile?id="+fid;
	 }
 }