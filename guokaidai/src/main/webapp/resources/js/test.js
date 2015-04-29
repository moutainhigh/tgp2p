$(document).ready(function(){
	//操作按钮面板
	$('#buttonbar').omButtonbar({
    	width : 1200,
    	btns : [{label:"新增",
    		     id:"button1" ,
    		     icons : {left : '/resources/operamasks-ui/themes/default/images/edit_add.png'},
    	 		 onClick:function(){
    	 			 alert('你点击了新增按钮！');
    	 		 }
    			},
    	        {label:"修改",
    			 id:"button3",
    			 icons : {left : '/resources/operamasks-ui/themes/default/images/down.png'},
    	 		 onClick:function(){
    	 			var selections=$('#grid').omGrid('getSelections',true);
                    if (selections.length == 0) {
                    	alertMsg.error('请至少选择一行记录');
                        return false;
                    }
                    var rowData=selections[0];//得到选中行的对象
    	 		 }
    	        },
    	        {separtor:true},
    	        {label:"发布",id:"button4" ,
    	        	onClick:function(){alert('你点击了发布按钮！');}
    	        },
    	        {label:"帮助",id:"button2" ,
       		     icons : {left : '/resources/operamasks-ui/themes/default/images/help.png'},
       		     onClick:function(){alert('你点击了帮助按钮！');}
       		    }
    	]
    });


	
	$("#grid").omGrid({
		dataSource: "/test/testpage",
		width : 1200,
        height : 336,
        autoFit:false,
        limit : 10,
        singleSelect : false,
        colModel : [ {header : 'ID', name : 'id', width : 50, align : 'center'},
                     {header : '登录时间', name : 'logTime', width : 150, align : 'left'},
                     {header : '登陆IP', name : 'ip', align : 'left', width : 'autoExpand'},
                     {header : '登录名', name : 'loginId',width:120},
                     {header : '姓名', name : 'userName',width:120},
                     {header : '备注', name : 'remark',width:120}],
		//单击事件
		onRowClick : function(index,rowData,event){
			//取到该行id值
			var id=rowData["id"];
			//单击后加载数据源面板（如果同时加载多个面板，有多少个就依次加载$("#id").omGrid面板）
			$("#grid2").omGrid({
				dataSource: "/test/testpage2?id="+id,
				width : 1200,
		        height : 336,
		        limit : 10,
		        singleSelect : false,
		        colModel : [ {header : 'ID', name : 'id', width : 50, align : 'center'},
		                     {header : '登录时间', name : 'logTime', width : 150, align : 'left'},
		                     {header : '登陆IP', name : 'ip', align : 'left', width : 'autoExpand'},
		                     {header : '登录名', name : 'loginId',width:120},
		                     {header : '姓名', name : 'userName',width:120},
		                     {header : '备注', name : 'remark',width:120} ]
		   });
			
			$("#grid3").omGrid({
				dataSource: "/test/testpage2?id="+id,
				width : 1200,
		        height : 336,
		        limit : 10,
		        singleSelect : false,
		        colModel : [ {header : 'ID', name : 'id', width : 50, align : 'center'},
		                     {header : '登录时间', name : 'logTime', width : 150, align : 'left'},
		                     {header : '登陆IP', name : 'ip', align : 'left', width : 'autoExpand'},
		                     {header : '登录名', name : 'loginId',width:120},
		                     {header : '姓名', name : 'userName',width:120},
		                     {header : '备注', name : 'remark',width:120} ]
		   });
			
			$("#grid4").omGrid({
				dataSource: "/test/testpage2?id="+id,
				width : 1200,
		        height : 336,
		        limit : 10,
		        singleSelect : false,
		        colModel : [ {header : 'ID', name : 'id', width : 50, align : 'center'},
		                     {header : '登录时间', name : 'logTime', width : 150, align : 'left'},
		                     {header : '登陆IP', name : 'ip', align : 'left', width : 'autoExpand'},
		                     {header : '登录名', name : 'loginId',width:120},
		                     {header : '姓名', name : 'userName',width:120},
		                     {header : '备注', name : 'remark',width:120} ]
		   });
		}
   });
});
