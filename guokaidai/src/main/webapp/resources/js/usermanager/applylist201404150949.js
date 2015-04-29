$(document).ready(function(){
	 var genderOptions = {
 		    dataSource : [{text:"待审核",value:"0"},{text:"已通过" , value:"1"},{text:"未通过",value:"2"}],
 		    editable: false
 		};
	$('#apply_list').omGrid({
		width:'fit',
		height:400,
        dataSource : '/userinfo/apply_page',
        limit : 10,
        title:'申请记录',
        autoFit:true,
        method:'POST',
        singleSelect : false,
        emptyMsg:'暂时还没有数据',
        colModel : [ 
                     {header : '真实姓名', name : 'realname', width : 120, align : 'left'}, 
                     {header : '手机号码', name : 'phone', align : 'left', width : 100}, 
                     {header : '申请金额', name : 'money', align : 'left', width : 100},
                     {header : '申请时间', name : 'time', align : 'left', width : 100},
                     {header : '申请类型', name : 'type', align : 'left', width : 100},
                     {header : '状态', name : 'status', align : 'left', width : 100,editor:{type:"omCombo", name:"status" ,options:genderOptions},renderer:genderRenderer},
                     {header : '备注', name : 'remark', align : 'left', width : 100,editor:{}}
                     ],
         rowDetailsProvider:function(rowData,rowIndex){
        	 var phone="无";
        	 if(!isNaN(rowData.phone)){
        		 phone=rowData.phone;
        	 }
             return '借款人<font color="red"><b>'+rowData.realname+'</b></font>在<font color="red">'
                         +rowData.time.substring(0,10)
                         +'</font>申请<font color="red">'+rowData.type+'</font>！申请金额是<font color="red"><b>'+rowData.money+'</b></font>，联系电话<font color="red">'+phone+'</font>';
         },
         onBeforeEdit:function(rowIndex , rowData){
             
             if(rowData.status>0){
            	 if(rowData.status==1){
            		 alertMsg.info("已同意"+rowData.realname+"申请"+rowData.type+rowData.money+"元");
            	 }else{
            		 alertMsg.info("已拒绝"+rowData.realname+"申请"+rowData.type+rowData.money+"元");
            	 }
            	 return false;
             }
             
         },
         onAfterEdit:function(rowIndex , rowData){
             
        	 if(rowData.status==0){
        		 $("#apply_list").omGrid("saveChanges");
        		 return false;
        	 }
        	 
             var msg="同意"+rowData.realname+"申请"+rowData.type+rowData.money+"元";
             if(rowData.status==2){
            	 msg="不"+msg;
             }
             alertMsg.confirm(msg,{okCall:function(){
            	 ajaxTodo("/userinfo/apply_update?ids="+rowData.id+"&status="+rowData.status+"&remark="+rowData.remark);
			 	 //防止打开链接
			 	 event.preventDefault();
			 	$("#apply_list").omGrid("saveChanges");
            	}
             });
         }

    });
	
	function genderRenderer(value){
        if(0 == value){
            return "<span style='color:blue'>待审核</span>";
        }else if(1 == value){
            return "<span style='color:#45832B'><b>已通过</b></span>";
        }else if(2 == value){
            return "<span style='color:red'>未通过</span>";
        }else{
            return "异常";
        }
    }
	
	$("#en_apply").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#apply_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否同意选中的借款申请?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							if(selectedRecords[i].status==0){
								ids +=selectedRecords[i].id+",";
							}
						}
						ajaxTodo("/userinfo/update_applys?ids="+ids+"&status=1");
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择要同意的借款申请"); 
		 }
	});
	
	$("#dis_apply").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#apply_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否拒绝选中的借款申请?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							if(selectedRecords[i].status==0){
								ids +=selectedRecords[i].id+",";
							}
						}
						ajaxTodo("/userinfo/update_applys?ids="+ids+"&status=2");
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择要拒绝的借款申请"); 
		 }
	});
});