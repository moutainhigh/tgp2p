$(function(){
	 function allSelect() {
         if ($(":checkbox").attr("checked") != "checked") {
             $(":checkbox").attr("checked", "checked");
         }
         else {
             $(":checkbox").removeAttr("checked");
         }
     }
	 //导出
	 $("#table-excel").click(function(){
		 var str="";
		 $("input[name='ids']:checkbox").each(function(){ 
	         if($(this).attr("checked")){
	             str += $(this).val()+",";
	         }
	     })
	     if(str == ""){
	    	 alertMsg.error("请选择您要导出的债权人！");
	     }else {
	    	//判断用户是否选中数据
			 alertMsg.confirm("是否导出数据到excel", {
					okCall: function(){
						top.window.location="creditor_people/table-to-excel?ids="+str;
					}
			});
	     }
	 });
});