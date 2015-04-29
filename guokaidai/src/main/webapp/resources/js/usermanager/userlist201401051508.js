$(document).ready(function(){
	
	//用户选择要导出的会员
	var selectIds = [];

	//数据源面板
	$('#user_show_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        showIndex : false,
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : true,
        onRowClick:function(rowIndex,rowData,event){
			if(rowData.id){
				$('#user_money_list').omGrid('setData', '/admin_account/query_by_user?ids='+rowData.id);
			}
    	},
    	onRowSelect : function(index, data){
			if($.inArray(data.id, selectIds)== -1)
       			selectIds.push(data.id);
		},
		onRowDeselect : function(index, data){
			var i = $.inArray(data.id, selectIds);
			selectIds.splice(i,1);
		},
		//还原过去选中的记录
	    onRefresh : function(nowpage, records){
			var len = selectIds.length;
			var indexs = [];
			for(var i=0; i<len; i++){
			   $.each(records, function(n,item){
				   if(item.id === selectIds[i]){
				      	   indexs.push(n);
				   }
			   });
			}
			$("#user_show_list").omGrid("setSelections", indexs);
		},
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '用户名', name : 'username', width : 150, align : 'center'}, 
                     {header : '真实姓名', name : 'realname', align : 'center', width : 120}, 
                     {header : '联系方式', name : 'phone', align : 'center', width : 180},
                     {header : '邮件地址', name : 'email', align : 'center', width : 280},
                     {header : '会员等级', name : 'vipendtime', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                    	 if(null!=v&&v!=""){
                          	return "特权会员";
                          }else{
                          	return "普通会员";
                          }
                       }},  
                     {header : '会员期限', name : 'vipendtime', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                         if(null!=v&&v!=""){
                          	return v; 
                          }else{
                          	return "永久";
                          }
                       }},  
                     {header : '是否为借款人', name : 'isborr', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                         if(v>0){
                           	return "是";
                           }else{
                           	return "否";
                           }
                        }}, 
                      {header:'自动还款签约',name:'signAutoRepay',align:'center',width:100},
                      {header : '积分', name : 'suminte', align : 'center', width : 100},
                      {header : '授信额度', name : 'credit', align : 'center', width : 100},
                     {header : '状态', name : 'isLock', align : 'center', width : 100},
                     {header : '客服', name : 'adminname', align : 'center', width : 100},
                     {header : '注册时间', name : 'createTime', align : 'center', width : 205},
                     {header : '上次登录时间', name : 'lasttime', align : 'center', width : 205},
                     {header : '上次登录地址', name : 'lastaddress', align : 'center', width : 100},
                     {header : '登录次数', name : 'logincount', align : 'center', width : 100}
                     ]
    });
	
	$('#user_money_list').omGrid({
		width:'fit',
		height:400,
        dataSource : '/admin_account/query_by_user',
        limit : 10,
        title:'资金明细账',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '日期', name : 'time', width : 100, align : 'center'}, 
                     {header : '类型', name : 'type', width : 100, align : 'center'}, 
                     {header : '支出', name : 'expenditure', align : 'center', width : 80}, 
                     {header : '收入', name : 'income', align : 'center', width : 80},
                     {header : '余额', name : 'money', align : 'center', width : 80},
                     {header : '备注', name : 'explan', align : 'center', width : 100}
                     ]
    });
	
	//搜索面板
	$("#user-search-panel").omPanel({
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
	
	//鼠标悬浮在面板头显示的信息
	$('.om-panel-title').omTooltip({
        html : '可以通过单击，展开高级搜索面板哦'
    });
	
	//特权会员下拉框
	 $("#search-type").omCombo({
     	width : 70,
     	forceSelection:true,
         dataSource : [ {text : '不限', value : ''},
                        {text : '特权会员', value : '1'},
                        {text : '普通会员', value : '0'} ]
     });
	 
	 //是否是借款人
	 $("#search-brow").omCombo({
	     	width : 70,
	     	forceSelection:true,
	         dataSource : [ {text : '不限', value : ''},
	                        {text : '是', value : '1'}, 
	                        {text : '否', value : '0'} ]
	     });
	 
	 var disFn=	function disFn(date) {
         var nowMiddle = new Date();
         if (date > nowMiddle) {
             return false;
         }
     };
	 //注册时间
	 $("#start-time").omCalendar({
		 disabledFn : disFn
	 });
	 $("#end-time").omCalendar({
		 disabledFn : disFn
	 });
	 
	 $("#search-admin").omCombo({
	     	width : 70,
	        dataSource : '/adminuser/getadminsuer_by_meneber'
	     });
	 
	 //搜索按钮
	 $('span#user-button-search').omButton({
		 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
	 //搜索按钮单击事件
	 $("#user-button-search").click(function(){
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.show();
		 var url=encodeURI("/userinfo/querypage?"+$("#searchfrom").serialize());
		 $('#user_show_list').omGrid('setData', url);
	 });
	 
	 //禁用
	 $("#dis_user").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否禁止选中的会员登录?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							ids +=selectedRecords[i].id+",";
						}
						ajaxTodo("/userinfo/disuser?ids="+ids);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择要禁止登录的会员"); 
		 }
	 });
	 
	//启用
	 $("#en_user").click(function(){
		 
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否允许选中的会员登录?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							ids +=selectedRecords[i].id+",";
						}
						ajaxTodo("/userinfo/enuser?ids="+ids);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择允许登录的会员"); 
		 }
	 });
	 
	 //修改会员期限
	 $("#update_user_time").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			$.pdialog.open('/userinfo/update_user_date?ids='+selectedRecords[0].id, 'update_user_date_page', '修改会员时间' , { width:380,height:300,mask:true,maxable:false });
		 }else{
			alertMsg.warn("您没有选择要修改期限的会员"); 
		 }
	 });
	 //修改会员信息
	 $("#update_user_info").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length==1){
			 $.pdialog.open('/userinfo/query_relation?ids='+selectedRecords[0].id, 'update_user_relation', '修改会员信息' , { width:500,height:340,mask:true,maxable:false });
		 }else{
			alertMsg.warn("请选择你要修改的一个会员"); 
		 }
	 });
	 //资金统计
	 $("#statistics").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length==1){
			 $.pdialog.open('/userinfo/get_user_money?ids='+selectedRecords[0].id, 'user_money', '资金统计' , { width:440,height:430,mask:true,maxable:false });
		 }else{
			alertMsg.warn("请选择你要查看的一个会员"); 
		 }
	 });
	 //分配客服
	 $("#recordborr").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 $.pdialog.open('/userinfo/open_customer?ids='+selectedRecords[0].id+'&username='+selectedRecords[0].username, 'purchase_list', '分配客服' , { width:420,height:200,mask:true,maxable:false,resizable:false });
		 }else{
			alertMsg.warn("您没有选择要分配客服的会员"); 
		 }
	 });
	 //修改会员等级
	 $("#updateisvip").click(function(){
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 $.pdialog.open('/userinfo/openisvip?id='+selectedRecords[0].id+'&username='+selectedRecords[0].username, 'purchase_list', '修改会员等级' , { width:420,height:280,mask:true,maxable:false,resizable:false });
		 }else{
			alertMsg.warn("您没有选择要修改会员等级的会员"); 
		 }
	 });
	 //借出记录
	 $("#browinfo").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			$.pdialog.open('/userinfo/openuserrecord?id='+selectedRecords[0].id, 'usertorecord_list', '借出记录' , { width:800,height:460,mask:true,maxable:false,resizable:false });
		 }else{
			alertMsg.warn("您没有选择要查看借出记录的会员"); 
		 }
	 });
	 //借入记录
	 $("#browtoRecordinfo").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length==1){
			 if(selectedRecords[0].isborr==1){
				 $.pdialog.open('/userinfo/openbborrowrecord?bid='+selectedRecords[0].id, 'browtoRecord_list', '借入记录' , { width:800,height:460,mask:true,maxable:false,resizable:false });
			 }else{
				 alertMsg.warn("只有借款人才有借出记录"); 
				 }
		 }else{
			alertMsg.warn("请选择你要查看借入记录的一个会员"); 
		 }
	 });
	 //导出
	 $("#user-table-excel").click(function(){
		 
		 var messgae="是否导出所有会员信息到excel？";
		 
		 var url="/userinfo/table-to-excel";
		 
		 if(selectIds.length > 0){
			 messgae="是否导出选中数据到excel？";
			 url+="?ids="+selectIds.toString();
		 }
		 
		 //判断用户是否选中数据
		 alertMsg.confirm(messgae, {
				okCall: function(){
					top.window.location=url;
					selectIds=[];
					$("#user_show_list").omGrid("setSelections", selectIds);
				}
		});
	 });
	 
	 //推广信息
	 $("#generinfo").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#user_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 $.pdialog.open('/generalizemoney/jume?url=generalizelist&ids='+selectedRecords[0].id, 'user_generalize_page', '会员推广信息' , { width:600,height:460,mask:true,maxable:false,resizable:false });
		 }else{
			alertMsg.warn("您没有选择要查看推广信息的会员");
		 }
	 });
});
