$(document).ready(function(){

	$('#message_list').omGrid({
		width:'fit',
		height:400,
        dataSource : '/userinfo/list_messages',
        limit : 10,
        title:'信息列表',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        singleSelect : false,
        colModel : [ 
        			 {header : 'ID', name : 'id', width : 20, align : 'left'},
                     {header : '标题', name : 'title', width : 50, align : 'left'}, 
                     {header : '内容', name : 'context', align : 'left', width : 100}, 
                     {header : '时间', name : 'time', align : 'left', width : 100},
                     {header : '状态', name : 'isread', align : 'left', width : 20,renderer : function(v, rowData , rowIndex) {   
                         if(v==0){
                                return "未读";
                            }else if(v==1){
                                return "已读";
                            }else{
                                return "";
                            }
                         }}
                     ],
        rowDetailsProvider:function(rowData,rowIndex){
        	// ajaxTodo("/userinfo/readmessage?ids="+rowData.id+",");
        	if($("#message_list .om-grid-row:eq("+rowIndex+") .col4 div").text()=="未读"){
        		var msgCount = parseInt($(".headerNav .nav .msgs").text());
        		$.ajax({
    				url: '/userinfo/readmessage',
    				type: 'POST',
    				dataType: 'json',
    				data: {ids: rowData.id+","},
    				success:function(msg){
    					if(msg=="success"){
    						$("#message_list .om-grid-row:eq("+rowIndex+") .col4 div").text("已读");
    						$(".dialog .dialogHeader .dialogHeader_r .dialogHeader_c h1").text("未读信息总数:"+(msgCount-1));
    						$(".headerNav .nav .msgs").text(msgCount-1);
    					}
    				}
    			});
        	}
            return '<font color="red">'+rowData.title+'</font>：'+rowData.context+' '+rowData.time;
         }
    });
	
	$("#en_read").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#message_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否标记选中的信息为已读？", {
					okCall: function(){
						for (var i=0;i<selectedRecords.length;i++) 
						{
							ids +=selectedRecords[i].id+",";
							if(selectedRecords[i].isread!=0){
								alertMsg.error("只有未读的信息才能标记为已读"); 
								return false;
							}
						}
						var msgCount = parseInt($(".headerNav .nav .msgs").text());
						$.ajax({
							url: '/userinfo/readmessage',
							type: 'POST',
							dataType: 'json',
							data: {ids: ids},
							success:function(msg){
								if(msg=="success"){
									$(".dialog .dialogHeader .dialogHeader_r .dialogHeader_c h1").text("未读信息总数:"+(msgCount-selectedRecords.length));
    								$(".headerNav .nav .msgs").text(msgCount-selectedRecords.length);
									$('#message_list').omGrid('reload');
									alertMsg.correct("成功将选中信息标记为已读"); 
								}
								else alertMsg.error("只有未读的信息才能标记为已读"); 
							}
						});
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择要标记为已读的信息"); 
		 }
	});
	
	$("#all_read").click(function(){
		 var ids="";
		 alertMsg.confirm("是否将所有未读信息标记为已读?", {
				okCall: function(){
					$.ajax({
						url: '/userinfo/readmessage',
						type: 'POST',
						dataType: 'json',
						data: {ids: 'all'},
						success:function(msg){
							if(msg=="success"){
								$(".dialog .dialogHeader .dialogHeader_r .dialogHeader_c h1").text("未读信息总数:"+0);
    							$(".headerNav .nav .msgs").text(0);
								alertMsg.correct("成功将所有信息标记为已读"); 
								$('#message_list').omGrid('reload');
							}
							else alertMsg.error("只有未读的信息才能标记为已读"); 
						}
					});
					
			 		//防止打开链接
			 		event.preventDefault();
				}
			});
	});
});