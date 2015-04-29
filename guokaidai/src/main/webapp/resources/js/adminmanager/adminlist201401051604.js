$(document).ready(function(){
	//数据源面板
	$('#admin_show_list').omGrid({
		width:'fit',
		height:434,
        dataSource : '/adminuser/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        showIndex : false,
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '用户名', name : 'username', width : 120, align : 'left'}, 
                     {header : '真实姓名', name : 'realname', align : 'left', width : 100}, 
                     {header : '电话', name : 'phone', align : 'left', width : 100},
                     {header : '性别', name : 'sex', align : 'left', width : 100},
                     {header : '年龄', name : 'age', align : 'left', width : 100},
                     {header : '电子邮箱', name : 'email', align : 'left', width : 100},
                     {header : '是否启用', name : 'status', align : 'left', width : 100}
                     ]
    });
	
	/**
	 * 删除用户
	 */
	$("#deladmin_a").click(function(event){
		 //获取选中行数据
		 var selections = $('#admin_show_list').omGrid('getSelections',true);
		 if(selections.length>0){
			 var ids="";
			 for(var i=0;i<selections.length;i++){
				 ids +=selections[i].id+",";
			 }
			 alertMsg.confirm('是否确认删除选中用户?', {
		            okCall: function(){
				 		ajaxTodo("/adminuser/deltes?ids="+ids);
				 		//防止打开链接
				 		event.preventDefault();
					}
			});
		 }else{
			alertMsg.warn("您没有选择要删除的用户");
		 }
	});

	/**
	 * 修改用户信息
	 */
	$("#updateadmin_a").click(function(){
		//获取选中行数据
		 var selections = $('#admin_show_list').omGrid('getSelections',true);
		 if(selections.length>0){
			 $.pdialog.open('/adminuser/querybyid?ids='+selections[0].id, 'loginpage', '修改用户信息' , { width:480,height:460,mask:true,maxable:false });
		 }else{
			alertMsg.warn("您还没有选择要修改的用户"); 
		 }
		
	});
	
	$("#admin_query").click(function(){
		$('#admin_show_list').omGrid('setData','/adminuser/querypage?username='+$("#query_str").val());
		
	});
	
});
