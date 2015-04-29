$(document).ready(function(){
	
	 //搜索面板
		$("#search-member-panel").omPanel({
	    	title : "高级搜索",
	    	collapsible:true,
	    	collapsed:true,
	    	onBeforeCollapse:function(event){
				$('.om-panel-title').omTooltip({
			        html : '可以通过单击，展开高级搜索面板哦'
			    });
			},
			onBeforeExpand:function(event){
				$('.om-panel-title').omTooltip({
			        html : '可以通过单击，收缩高级搜索面板哦'
			    });
			}
	    });
		 $("#isuse").omCombo({
		     	width : 70,
		         dataSource : [ {text : '不限', value : ''},
		                        {text : '已使用', value : '1'}, 
		                        {text : '未使用', value : '0'} ]
		     });
		 $("#adminuserId").omCombo({
		     	width : 70,
		         dataSource :'/adminuser/getadminsuer_by_meneber'
		     });
		 //搜索按钮
		 $('span#button-search').omButton({
	   	    icons : {left : 'resources/images/search.png'},width : 70
		 	});
		 $('span#button-search').click(function(){
	    	  $('#membermygrid').omGrid('setData', '/memberNumber/querypage?'+$("#searchfrom").serialize());

	      });
		//导出借款标列表
			$("#EXPmember").click(function(){
				var selections=$('#membermygrid').omGrid('getSelections',true);
		         if (selections.length ==0) {
		         	alertMsg.info("请选择要导出的数据！");
		             return false;
		         }
		         var ids='';
		         for (var i in selections) 
					{
						ids +=selections[i].id+",";
					}
		        top.window.location='/memberNumber/outPutExcel?ids='+ids;
			});
	//数据源面板
	$('#membermygrid').omGrid({
		width:'300',
		height:410,
        dataSource : '/memberNumber/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '序号', name : 'id', width : 40, align : 'center'}, 
                     {header : '会员编号', name : 'number', width : 80, align : 'center'}, 
                     {header : '所属服务人员', name : 'username', align : 'center', width : 100}, 
                     {header : '状态', name : 'isuse', align : 'center', width : 80}
                     ]
    });
	  $("#deletemember").click(function(){
	    	 var selections=$('#membermygrid').omGrid('getSelections',true);
	         if (selections.length ==0) {
	         	alertMsg.info("请选择一条记录！");
	             return false;
	         }
	         var ids='';
	         for (var i in selections) 
				{
					ids +=selections[i].id+",";
				}
	         $.ajax({
	 			data:'ids='+ids,
	 			url:'/memberNumber/delete',
	 			type:'post',
	 			success:function(msg){
	 				if(msg){
	 					 $('#membermygrid').omGrid('reload');//刷新当前页数据
	 	                 alertMsg.correct("删除数据成功");
	 				}else{
	 					alertMsg.info("删除数据失败");
	 				}
	 			}
	 		});
	    });
});
