$(document).ready(function(){
	//数据源面板
	$('#subscription_list_table').omGrid({
		width:'fit',
		height:400,
        dataSource : '/subscription/querySubscription',
        limit : 10,
        autoFit:true,
        method:'POST',
        singleSelect : false,
        emptyMsg:'暂时还没有您想要的数据',
        colModel : [ 
//                     {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '产品名称', name : 'name', width : 100, align : 'left'}, 
                     {header : '投资人', name : 'userName', align : 'left', width : 90}, 
                     {header : '服务人员提成金额', name : 'award', align : 'left', width : 175},
                     {header : '购买金额', name : 'money', align : 'left', width : 100},
                     {header : '购买方式', name : 'pay_type', align : 'left', width : 100},
                     {header : '购买期限', name : 'during', align : 'left', width : 100},
                     {header : '购买时间', name : 'lastaddress', align : 'left', width : 90},
                     {header : '利息收益', name : 'time_start', align : 'left', width : 90},
                     {header : '收益总额', name : 'endtime', align : 'left', width : 90},
                     {header : '利息支付方式', name : 'vipendtime', align : 'left', width : 100},
                     {header : '利息支付时间', name : 'time_rate_pay_first', align : 'left', width : 110},
                     {header : '本金支付方式', name : 'isLock', align : 'left', width : 110},
                     {header : '本金支付时间', name : 'time_principal_pay', align : 'left', width : 110},
                     {header : '状态', name : 'bonuses', align : 'left', width : 60},
                     {header : '债权分配情况', name : 'genname', align : 'left', width : 110}
                     ]
    });
	//搜索按钮
	 $('span#subscription-search').omButton({
  	    icons : {left : 'resources/images/search.png'},width : 70
	 	});
	//搜索按钮单击事件
	 $("#subscription-search").click(function(){
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.show();
		 var url=encodeURI("/subscription/querySubscription?"+$("#subscriptionfrom").serialize());
		 $('#subscription_list_table').omGrid('setData', url);
	 });
	//购买时间
	 $("#buy_time").omCalendar({
	 });
	 //购买结束时间
	 $("#begin_time").omCalendar({
	 });
	 $("#end_time").omCalendar({
	 });
	 //放款
	 $("#loans_cred").click(function(){
		 var dels = $('#subscription_list_table').omGrid('getSelections',true);
		 alert(dels[0].id);
		 if(dels.length <= 0 ){
     		$.omMessageBox.alert({content:'您还没有选择需要还款的产品'});
     		return;
     	 }else if("已放款" == dels[0].bonuses){
     		$.omMessageBox.alert({content:'该产品已放款'});
     	 }else{
     		ajaxTodo("/subscription/submitRecord?subscriotionId="+dels[0].id);
     		//防止打开链接
	 		event.preventDefault();
     	 }
	 });
	 //还款
	 $('#repayment_cred').click(function(){
     	var dels = $('#subscription_list_table').omGrid('getSelections',true);
     	if(dels.length <= 0 ){
     		$.omMessageBox.alert({content:'您还没有选择需要还款的债权'});
     		return;
     	}else if("未放款"==dels[0].status){
     		$.omMessageBox.alert({content:'该该产品还未还款'});
     	}else if("已还款"==dels[0].status){
     		$.omMessageBox.alert({content:'该该产品还已还款'});
     	}else{
     		$.pdialog.open('/subscription/repayment?subscriotionId='+dels[0].id, 'repayment', '还款' , { width:500,height:300,mask:true,maxable:false });
     	}
     });

	 //债权继续分配
	 $("#allocation").click(function(){
		 
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#subscription_list_table').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否继续分配选择债权?", {
					okCall: function(){
//						for (var i in selectedRecords) 
//						{
//							ids +=+",";
//						}
						ajaxTodo("/subscription/creditor-continue-allot?id="+selectedRecords[0].id);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("请选择要分配的债权！"); 
		 }
	 });
});