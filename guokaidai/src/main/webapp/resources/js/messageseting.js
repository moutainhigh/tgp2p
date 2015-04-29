$(function(){
	
	$(".checkAll").click(function(){ 
		var flag=$(this).html();
		flag = (flag=="全选")?true:false;
		$(this).parent().parent().find(".message_check").each(function(){
			if(flag){
				$(this).attr("checked",true);
			}else{
				$(this).attr("checked",false);
			}
		});
		if(flag){
			$(this).html("取消");
		}else{
			$(this).html("全选");
		}
		$(".subBox1").attr("checked",false);
	});
	$('INPUT[type="checkbox"]').click(function(){
		var flag = false;
		$(this).parent().parent().find(".message_check").each(function(){
			if(this.checked){
				flag = true;
			}else{
				flag = false;
				return false;
			}
		});
		if(flag){
			$(this).parent().parent().find(".checkAll").html('取消');
		}else{
			$(this).parent().parent().find(".checkAll").html('全选');
		}
		$(".subBox1").attr("checked",false);
	});
});
