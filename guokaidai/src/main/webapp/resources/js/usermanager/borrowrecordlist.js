/**
 * 会员借入记录
 */

$(document).ready(function(){
	
	var ids=$("#id").val();
	$('#borrowjx_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryborrowlist?state=2&uid='+ids,
        limit : 10,
        title:'竞标中的借入记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款标编号', name : 'id', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loantitle', width : 120, align : 'center'}, 
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 100},
                     {header : '发布时间', name : 'publishTime', align : 'center', width : 100},
                     {header : '利率', name : 'rate', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                         }},  
                     ]
    });
	
	$('#borrowhk_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryborrowlist?state=3&uid='+ids,
        limit : 10,
        title:'回款中的借入记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款标编号', name : 'id', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loantitle', width : 120, align : 'center'}, 
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 100},
                     {header : '借入时间', name : 'creditTime', align : 'center', width : 100},
                     {header : '利率', name : 'rate', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                         }},  
                     ]
    });
	$('#borrowwc_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/queryborrowlist?state=4&uid='+ids,
        limit : 10,
        title:'已经完成的借入记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '借款标编号', name : 'id', width : 50, align : 'center'}, 
                     {header : '借款标号', name : 'loantitle', width : 120, align : 'center'}, 
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 100},
                     {header : '借入时间', name : 'creditTime', align : 'center', width : 100},
                     {header : '利率', name : 'rate', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                            	return v+"%";
                         }},  
                     ]
    });
});