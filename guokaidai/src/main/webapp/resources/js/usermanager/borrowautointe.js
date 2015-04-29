$(document).ready(function(){
	
	var bid=$("#bid").val();
	$('#borrow_integrat_list').omGrid({
		width:'fit',
		height:350,
        dataSource : '/userinfo/queryautointe?bid='+bid,
        limit : 10,
        title:'会员积分查询',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ 
                     {header : '预计积分', name : 'predictintegral', width : 100, align : 'center'},
                     {header : '所得积分', name : 'realityintegral', width : 100, align : 'center'}, 
                     {header : '是否逾期', name : 'Isover', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                         if(v>0){
                            	return "是";
                            }else{
                            	return "否";
                            }
                         }},
                     {header : '详情(标数+期数+还款金额)', name : 'periods', align : 'center', width : 200, renderer : function(v, rowData , rowIndex) {   
                         	return "标数： "+rowData.loansignid+" 期数："+rowData.periods+" 金额："+rowData.preRepayMoney+"元";
                      }}
                     ]
    });
});