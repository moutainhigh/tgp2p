$(document).ready(function(){
	
	//数据源面板
	$('#bankratemygrid').omGrid({
		width:'300',
		height:410,
        dataSource : '/bankrate/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '序号', name : 'id', width : 40, align : 'center'}, 
                     {header : '期限', name : 'during', width : 80, align : 'center'}, 
                     {header : '利率', name : 'rate', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   //列渲染函数，接受3个参数，v表示当前值，rowData表示当前行数据，rowIndex表示当前行号(从0开始)
                         return v+'%';  
                     }}, 
                     {header : '更新时间', name : 'timeupdate', align : 'center', width : 80}
                     ]
    });
	var dialog = $("#dialog-edit-form").omDialog({
        width: 300,
        height:190,
        autoOpen : false,
        modal : true,
        resizable : false,
        buttons : {
            "提交" : function(){
                submitDialog();
                return false; //阻止form的默认提交动作
            },
            "取消" : function() {
                $("#dialog-edit-form").omDialog("close");//关闭dialog
            }
        }
    });
	 //显示dialog并初始化里面的输入框的数据
    var showDialog = function(title,rowData){
        rowData = rowData || {};
        if(title=="编辑"){
        	$("input[name='id']",dialog).val(rowData.id);
        	$("input[name='during']",dialog).val(rowData.during);
        	$("input[name='rate']",dialog).val(rowData.rate);
        }else{
        	$("input[name='id']",dialog).val('');
        	$("input[name='during']",dialog).val('');
        	$("input[name='rate']",dialog).val('');
        }
        dialog.omDialog("option", "title", title);
        dialog.omDialog("open");//显示dialog
    };
    var submitDialog = function(){
    	var during=$("input[name='during']",dialog).val();
    	var rate=$("input[name='rate']",dialog).val();
    	var rate1=rate.replace('.','');
    	if(isNaN(rate1)){
    		alertMsg.info("利率输入错误！");
    		return false;
    	}
    	during=$.trim(during);
    	rate=$.trim(rate);
    	if(during.length==0){
    		alertMsg.info("请输入期限！");
    		return false;
    	}
    	if(during.length>12){
    		alertMsg.info("期限错误,12字以内！");
    		return false;
    	}
    	if(rate.length==0){
    		alertMsg.info("请输入利率！");
    		return false;
    	}
    	if(rate.length>8){
    		alertMsg.info("利率小数位数过长！");
    		return false;
    	}
    	if(rate>100){
    		alertMsg.info("利率错误,100%以内！");
    		return false;
    	}
        var submitData={
    		id:$("input[name='id']",dialog).val(),
    		during:$("input[name='during']",dialog).val(),
    		rate:$("input[name='rate']",dialog).val()
        };
        $.post('/bankrate/editbankrate',submitData,function(msg){
        	if(msg){
        		$("#dialog-edit-form").omDialog("close"); //关闭dialog
	              $('#bankratemygrid').omGrid('reload');//如果是修改则刷新当前页
	              alertMsg.correct("数据更新成功");
        	}else{
        		$("#dialog-edit-form").omDialog("close"); //关闭dialog
        		 alertMsg.info("数据录入错误,更新失败");
        	}
        	
        });
    };
    
    $('#editbankrate').bind('click', function() {
        var selections=$('#bankratemygrid').omGrid('getSelections',true);
        if (selections.length != 1) {
        	alertMsg.info("请选择一条记录！");
            return false;
        }
        showDialog('编辑',selections[0]);//显示dialog
    });
    $('#addbankrate').bind('click', function() {
        showDialog('添加');//显示dialog
    });
    $("#deleteAll").click(function(){
    	 var selections=$('#bankratemygrid').omGrid('getSelections',true);
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
 			url:'/bankrate/delete',
 			type:'post',
 			success:function(msg){
 				if(msg){
 					 $('#bankratemygrid').omGrid('reload');//刷新当前页数据
 	                 alertMsg.correct("删除数据成功");
 				}else{
 					alertMsg.info("删除数据失败");
 				}
 			}
 		});
    });
});
