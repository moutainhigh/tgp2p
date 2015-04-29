$(document).ready(function(){
	
	var id=0;

	//数据源面板
	$('#assignment_show_list').omGrid({
		width:'fit',
		height:400,
        dataSource : '/userinfo/queryAssignmentPage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        onRowSelect:function(rowIndex,rowData,event){
        	if(rowData.flowid!=id){
				if(rowData.flowid){
					$('#make-table').omTabs('reload',0,'/userinfo/query_assignment_baseinfo?userId='+rowData.userbasicinfo_id);
					$("#make-table").omTabs("reload",1,"/userinfo/query_assignmentLoanSign?loanId="+rowData.loan_id);
				}
        	}
        	id=rowData.flowid;
    	},
        colModel : [ {header : '用户名', name : 'username', width : 100, align : 'left',editor:{editable:false}}, 
                     {header : '真实姓名', name : 'name', align : 'left', width : 80,editor:{editable:false}}, 
                     {header : '借款标标题', name : 'loanTitle', align : 'left', width : 120,editor:{editable:false}},
                     {header : '借款标号', name : 'loanNumber', align : 'left', width : 90,editor:{editable:true}},
		        	 {header : '购买金额', name : 'tenderMoney', align : 'left', width : 120,editor:{editable:false}},
                     {header : '借款标状态', name : 'loanState', align : 'left', width : 100,editor:{editable:false}, renderer : function(v, rowData , rowIndex) {   
                    	  if(v==2){
                            	return "进行中";
                            }else if(v==3){
                            	return "还款中";
                            }else{
                            	return "";
                            }
                         }}, 
                   {header : '审核状态', name : 'auditStatus', align : 'left', width : 100,editor:{editable:false}, renderer : function(v, rowData , rowIndex) {   
                       	  if(v==1){
                       		return "未审批";
                       	  }else if(v==2){
                               	return "正在审核";
                           }else if(v==3){
                               	return "已审核";
                           }else{
                               	return "";
                               }
                            }},
                   {header : '审核结果', name : 'auditResult', align : 'left', width : 100,editor:{editable:false}, renderer : function(v, rowData , rowIndex) {   
                             	  if(v==0){
                             		return "不通过";
                             	  }else if(v==1){
                                     	return "通过";
                                 }else if(v==2){
                                     	return "待定";
                                 }else{
                                     	return "";
                                     }
                                  }}
                     ]
                   
    });
	
	//搜索面板
	$("#assginment-search-panel").omPanel({
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
	 
	 
	 //搜索按钮
	 $('span#button-bsearch').omButton({
 	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
	 
	 //搜索按钮单击事件
	 $("#button-bsearch").click(function(){
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.show();
		 $('#assignment_show_list').omGrid('setData', '/userinfo/queryAssignmentPage?'+$("#searchborrowfrom").serialize());
	 });
	 
	 //tab选项卡
	 $('#make-table').omTabs({
         height : 250,
         switchMode : 'mouseover',
         lazyLoad : true
     });
	
	 
	 //债权转让待审批
	 $("#assignment-auditOne").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#assignment_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的数据进入待审批状态?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							ids +=selectedRecords[i].flowid+",";
							if(selectedRecords[i].auditStatus==3){
								alertMsg.warn("该债权转让申请已经有最终结果了,数据不可修改"); 
								return false;
							}
						}
						ajaxTodo("/userinfo/updateStatus?num=2&id="+ids);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审批的债权转让数据"); 
		 }
	 });
	 
	 
	 //债权转让审批不通过
	 $("#assignment-noauditOne").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#assignment_show_list').omGrid('getSelections',true);
		 var idn="";
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的债权转让数据不通过审核?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							idn +=selectedRecords[i].flowid+",";
							if(selectedRecords[i].auditStatus==3){
								alertMsg.warn("该债权转让申请已经有最终结果了,数据不可修改"); 
								return false;
							}
						}
						ajaxTodo("userinfo/updateStatus?num=1&id="+idn);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审批的债权转让数据"); 
		 }
	 });
	 
	 //债权转让审批通过
	 $("#assignment-noaudit").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#assignment_show_list').omGrid('getSelections',true);
		 var idn="";
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的债权转让数据通过审核?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							idn +=selectedRecords[i].flowid+",";
							if(selectedRecords[i].auditStatus==3){
								alertMsg.warn("该债权转让申请已经有最终结果了,数据不可修改"); 
								return false;
							}
						}
						ajaxTodo("userinfo/updateStatus?num=0&id="+idn);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审批的债权转让数据"); 
		 }
	 });
});
