$(document).ready(function(){
	
	//搜索面板
	$("#search-online-panel").omPanel({
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
	 $("#state").omCombo({
	     	width : 70,
	         dataSource : [ {text : '不限', value : ''},
	                        {text : '已联系', value : '1'}, 
	                        {text : '未联系', value : '0'} ]
	     });
	 
	//搜索按钮
	 $('span#button-search').omButton({
   	    icons : {left : 'resources/images/search.png'},width : 70
	 	});
	 $('span#button-search').click(function(){
    	  $('#onlinemygrid').omGrid('setData', '/onlineapply/querypage?'+$("#searchonlinefrom").serialize());
      });
	 
	 
	//数据源面板
	$('#onlinemygrid').omGrid({
		height:410,
        dataSource : '/onlineapply/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '序号', name : 'id', width : 40, align : 'center'}, 
                     {header : '真实姓名', name : 'usename', width : 80, align : 'center'}, 
                     {header : '所在省', name : 'proname', align : 'center', width : 100}, 
                     {header : '所在市', name : 'cityname', align : 'center', width : 100}, 
                     {header : '联系手机', name : 'phone', align : 'center', width : 100}, 
                     {header : '投资金额', name : 'money', align : 'center', width : 100}, 
                     {header : '服务内容', name : 'content', align : 'center', width : 100}, 
                     {header : '状态', name : 'state', align : 'center', width : 100}
                     ]
    });
	
    
    $("#deleteonline").click(function(){
    	 var selections=$('#onlinemygrid').omGrid('getSelections',true);
         if (selections.length ==0) {
         	alertMsg.info("请选择要删除的记录！");
             return false;
         }
         var ids='';
         for (var i in selections) 
			{
				ids +=selections[i].id+",";
			}
         $.ajax({
 			data:'ids='+ids,
 			url:'/onlineapply/delete',
 			type:'post',
 			success:function(msg){
 				if(msg){
 					 $('#onlinemygrid').omGrid('reload');//刷新当前页数据
 	                 alertMsg.correct("删除数据成功");
 				}else{
 					alertMsg.info("删除数据失败");
 				}
 			}
 		});
    });
    $("#editonline").click(function(){
    	 var selections=$('#onlinemygrid').omGrid('getSelections',true);
         if (selections.length ==0) {
         	alertMsg.info("请选择一条记录！");
             return false;
         }
         $.ajax({
  			data:'id='+selections[0].id,
  			url:'/onlineapply/iscontacted',
  			type:'post',
  			success:function(msg){
  				if(msg){
  					 $('#onlinemygrid').omGrid('reload');//刷新当前页数据
  	                 alertMsg.correct("数据更新成功");
  				}else{
  					alertMsg.info("数据更新失败");
  				}
  			}
  		});
    });
});
