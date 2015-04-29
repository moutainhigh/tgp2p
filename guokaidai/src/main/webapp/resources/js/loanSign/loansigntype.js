$(document).ready(function(){
	
	//数据源面板
	$('#loantypemygrid').omGrid({
		width:'300',
		height:400,
        dataSource : '/loansigntype/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '序号', name : 'id', width : 40, align : 'center'}, 
                     {header : '类型名称', name : 'typename', width : 80, align : 'center'}, 
                     {header : '最小借款额度', name : 'mincredit', width : 80, align : 'center', renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'元';  
                     }}, 
                     {header : '最大借款额度', name : 'maxcredit', width : 80, align : 'center', renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'元';  
                     }}, 
                     {header : '最小借款期限', name : 'minmoney', width : 80, align : 'center', renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'月';  
                     }},
                     {header : '最大借款期限', name : 'maxmoney', width : 80, align : 'center', renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'月';  
                     }},
                     {header : '最低借款利率', name : 'minrate', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'%';  
                     }},
                     {header : '最高借款利率', name : 'maxrate', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'%';  
                     }},
                     {header : '借款标期', name : 'money', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'月';  
                     }}
                     ]
    });
	
	 //查询面板初始化
	 $("#search-lstype-panel").omPanel({
    	title : "高级搜索",collapsible:true,
    	width:'fit'
    });
	 
	 $('span#button-lstype-search').omButton({
 	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
   $('span#button-lstype-search').click(function(){
 	  $('#loantypemygrid').omGrid('setData', '/loansigntype/querypage?'+$("#searchlotypefrom").serialize());

   });
   /**
	 * 编辑标
	 */
	$("#editloansigntype").click(function(){
		//取到选中记录
		var selections=$('#loantypemygrid').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length!=1){
			alertMsg.info("请选择一条信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("updateloansigntype", "/loansigntype/seeDetails?id="+selections[0].id, { title:"编辑", fresh:true});
		}
	});
   

    
    $("#deleteone").click(function(){
    	 var selections=$('#loantypemygrid').omGrid('getSelections',true);
         if (selections.length ==0) {
         	alertMsg.info("请选择一条或多条信息！");
             return false;
         }
         var ids='';
         for (var i in selections) 
			{
				ids +=selections[i].id+",";
			}
         $.ajax({
 			data:'ids='+ids,
 			url:'/loansigntype/delete',
 			type:'post',
 			success:function(msg){
 				if(msg){
 					 $('#loantypemygrid').omGrid('reload');//刷新当前页数据
 	                 alertMsg.correct("删除信息成功！");
 				}else{
 					alertMsg.info("删除信息失败！");
 				}
 			}
 		});
    });
});
