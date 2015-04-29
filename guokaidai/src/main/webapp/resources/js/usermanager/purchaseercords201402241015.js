/**
 * 会员认购记录
 */

$(document).ready(function(){
	
	var ids=$("#ids").val();
	$('#purchase_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/product/query_by_user?id='+ids,
        limit : 10,
        title:'认购记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        onRowSelect : function(index, data){
        	if(data.id){
				$('#creditor_pay_list').omGrid('setData', '/creditor_pay_record/query_by_record?ids='+data.id);
			}
		},
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '理财计划', name : 'productname', width : 120, align : 'left'}, 
                     {header : '认购金额', name : 'money', align : 'left', width : 100},
                     {header : '购买方式', name : 'payType', align : 'left', width : 100},
                     {header : '购买期限', name : 'timeduring', align : 'left', width : 100},
                     {header : '利息收益', name : 'ratesum', align : 'left', width : 100},
                     {header : '收益总额', name : 'allSum', align : 'left', width : 100},
                     {header : '利息支付方式', name : 'ratePayType', align : 'left', width : 100},
                     {header : '利息支付时间', name : 'ratePayFirst', align : 'left', width : 100},
                     {header : '本金支付方式', name : 'prinPayType', align : 'left', width : 100},
                     {header : '本金支付时间', name : 'timePrinPay', align : 'left', width : 100},
                     {header : '状态', name : 'status', align : 'left', width : 100},
                     {header : '债权分配情况', name : 'statusproduct', align : 'left', width : 100}
                     ]
    });
	
	$('#creditor_pay_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/creditor_pay_record/query_by_record?ids='+ids,
        limit : 10,
        title:'匹配债券',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '债权编号', name : 'serial', width : 120, align : 'left'}, 
                     {header : '债权人姓名', name : 'realname', align : 'left', width : 100},
                     {header : '债权金额', name : 'money', align : 'left', width : 100},
                     {header : '债权期限', name : 'timeDuring', align : 'left', width : 100},
                     {header : '债权结束日期', name : 'timeEnd', align : 'left', width : 100},
                     {header : '债权状态', name : 'status', align : 'left', width : 100},
                     {header : '认购开始日期', name : 'timeStart', align : 'left', width : 100},
                     {header : '认购结束日期', name : 'timeEnd', align : 'left', width : 100},
                     {header : '认购金额', name : 'payMoney', align : 'left', width : 100}
                     ]
    });
});