$(document).ready(function(){
	
	var credit=0;
	var editids=0;
	var id=0;
	
	//设置不能输入小数点
	var ageOptions = {
        	allowDecimals:false,
        	allowNegative:false
        };

	//数据源面板
	$('#withdrawApplyList').omGrid({
		width:'fit',
		height:400,
        dataSource : '/withdraw_apply/queryWithdrawApply',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '编号', name : 'id', width : 20, align : 'center'}, 
                     {header : '提现申请人', name : 'user_name', width : 50, align : 'left'}, 
                     {header : '真实姓名', name : 'real_name', width : 50, align : 'left'}, 
                     {header : '申请提现数目', name : 'apply_num', align : 'left'},
                     {header : '可提现总额', name : 'cash', align : 'left'}, 
                     {header : '审核状态', name : 'status', align : 'left', renderer : function(v, rowData , rowIndex) {   
                    	 if(v==0){
                            	return "未审核";
                            }else if(v==1){
                            	return "已审核";
                            }else{
                            	return "";
                            }
                         }},
		        	 {header : '审核结果', name : 'result', width:50, align : 'left', renderer : function(v, rowData , rowIndex) {   
                    	 if(v==0){
                            	return "不通过";
                            }else if(v==1){
                            	return "通过";
                            }else if(v==2){
                            	return "用户已提现";
                            }else{
                            	return "";
                            }
                         }},
                     {header : '申请时间', name : 'apply_time', align : 'left'},
                     {header : '审核时间', name : 'answer_time', align : 'left'},
                     ]
                   
    });
	
	//搜索面板
	$("#borrow-search-panel").omPanel({
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
	
	//是否通过
	 $("#bsearch-type").omCombo({
		 editable : false,
         dataSource : [ {text : '不限', value : ''},
                        {text : '未审核', value : '1'},
                        {text : '通过', value : '2'},
                        {text : '不通过', value : '3'} ]
     });
	 
	 //控制时间控件可选择的范围
	 var disFn=	function disFn(date) {
         var nowMiddle = new Date();
         if (date > nowMiddle) {
             return false;
         }
     }
	 
	 //申请开始时间
	 $("#beginDate").omCalendar({
		 editable : false,
		 disabledFn : disFn
	 });
	 //申请结束时间
	 $("#endDate").omCalendar({
		 editable : false,
		 disabledFn : disFn 
	 });
	 
	 //搜索按钮
	 $('span#button-bsearch').omButton({
 	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
	 //限制登录次数只能输入正整数
	 $("#countlogin").omNumberField({
         allowDecimals : false,
         allowNegative : false
     });

	 
	 //搜索按钮单击事件
	 $("#button-bsearch").click(function(){
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.show();
		 $('#withdrawApplyList').omGrid('setData', '/withdraw_apply/queryWithdrawApply?'+$("#searchborrowfrom").serialize());
	 });
	 
	 //tab选项卡
	 $('#make-tab').omTabs({
         height : 250,
         switchMode : 'mouseover',
         lazyLoad : true
     });
	 
	 //借款人审核
	 $("#audit").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#withdrawApplyList').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的提现申请通过审核?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							ids +=selectedRecords[i].id+",";
							if(selectedRecords[i].status!=0){
								alertMsg.warn("只有未审核的提现申请才能进行审核"); 
								return false;
							}
						}
						ajaxTodo("/withdraw_apply/pass?state=1&ids="+ids);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审核的提现申请"); 
		 }
	 });
	 $("#noaudit").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#withdrawApplyList').omGrid('getSelections',true);
		 var idn="";
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的提现申请不通过审核?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							idn +=selectedRecords[i].id+",";
							if(selectedRecords[i].status!=0){
								alertMsg.warn("只有未审核的提现申请才能进行审核"); 
								return false;
							}
						}
						ajaxTodo("/withdraw_apply/pass?state=0&ids="+idn);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审核的提现申请"); 
		 }
	 });

	$("#loan").click(function(){
		//获取选中行数据
		var selectedRecords = $('#withdrawApplyList').omGrid('getSelections',true);
		var idn="";

		if(selectedRecords.length>0){
			if(selectedRecords.length>0){
				alertMsg.confirm("是否让选中的提现申请放款?", {
					okCall: function(){
						for (var i in selectedRecords)
						{
							idn +=selectedRecords[i].id+",";
							if(selectedRecords[i].status!=1){
								alertMsg.warn("只有通过审核的提现申请才能进行放款操作");
								return false;
							}
						}
						ajaxTodo("/withdraw_apply/applyLoan?state=0&ids="+idn);
						//防止打开链接
						event.preventDefault();
					}
				});
			}else{
				alertMsg.warn("您没有选择要放款的提现申请");
			}
		}
	});
});
