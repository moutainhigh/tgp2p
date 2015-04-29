/**
 * 角色管理
 */
$(function($){
	var role_id=0;
	$(".role").click(function(){
		role_id=$(this).attr("code");
		
	});
	
	$("#delrole_a").click(function(){
		if(role_id>0){
			alertMsg.confirm("是否确认删除该角色?", {
				okCall:function(){
					ajaxTodo("/role/delete?ids="+role_id);
			 		//防止打开链接
			 		event.preventDefault();
				}
			});
		}else{
			alertMsg.error("请先点击您要删除的角色");
		}
	});
	
	$("#updaterole_a").click(function(){
		if(role_id>0){
			 $.pdialog.open('/role/querybyid?ids='+role_id, 'editrole', '修改角色信息' ,{ width:480,height:300,mask:true,maxable:false });
		}else{
			alertMsg.error("请先点击您要修改的角色");
		}
		
	});
});