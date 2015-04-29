/**
 * 会员借出记录
 */

$(document).ready(function(){
	
	var uid=$("#uid").val();
	$('#userloancordjx_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryuserlist?state=2&uid='+uid,
        limit : 10,
        title:'竞标中的投资记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款人', name : 'name', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '借款金额(元)', name : 'issueLoan', align : 'center', width : 80},
                     {header : '投资时间', name : 'tenderTime', align : 'center', width : 100},
                     {header : '投资金额(元)', name : 'tenderMoney', align : 'center', width : 80},
                     {header : '利率', name : 'rate', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                     }},
                     {header : '借款期限', name : 'month', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                         	if(v>0){
                         		return v+"个月";
                         	}else{
                         		 return rowData.useDay+"天";
                         	}
                      }} ]
    });
	
	$('#userloancordhk_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryuserlist?state=3&uid='+uid,
        limit : 10,
        title:'回款中的投资记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款人', name : 'name', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '借款金额(元)', name : 'issueLoan', align : 'center', width : 80},
                     {header : '投资时间', name : 'tenderTime', align : 'center', width : 100},
                     {header : '投资金额(元)', name : 'tenderMoney', align : 'center', width : 80},
                     {header : '利率', name : 'rate', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                     }},
                     {header : '借款期限', name : 'month', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                         	if(v>0){
                         		return v+"个月";
                         	}else{
                         		 return rowData.useDay+"天";
                         	}
                      }} ]
    });
	
	$('#userloancordwc_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryuserlist?state=4&uid='+uid,
        limit : 10,
        title:'已完成的投资记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款人', name : 'name', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '借款金额(元)', name : 'issueLoan', align : 'center', width : 80},
                     {header : '投资时间', name : 'tenderTime', align : 'center', width : 100},
                     {header : '投资金额(元)', name : 'tenderMoney', align : 'center', width : 80},
                     {header : '利率', name : 'rate', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                     }},
                     {header : '借款期限', name : 'month', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                         	if(v>0){
                         		return v+"个月";
                         	}else{
                         		 return rowData.useDay+"天";
                         	}
                      }} ]
    });
	
	$('#userloancordzb_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryuserlist?state=5&uid='+uid,
        limit : 10,
        title:'全部投资记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款人', name : 'name', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '借款金额(元)', name : 'issueLoan', align : 'center', width : 80},
                     {header : '投资时间', name : 'tenderTime', align : 'center', width : 100},
                     {header : '投资金额(元)', name : 'tenderMoney', align : 'center', width : 80},
                     {header : '利率', name : 'rate', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                     }},
                     {header : '借款期限', name : 'month', align : 'center', width : 80, renderer : function(v, rowData , rowIndex) {   
                         	if(v>0){
                         		return v+"个月";
                         	}else{
                         		 return rowData.useDay+"天";
                         	}
                      }} ]
    });
	
});