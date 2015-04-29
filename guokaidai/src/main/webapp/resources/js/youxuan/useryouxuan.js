$(document).ready(function(){
	
	//用户选择要导出的会员
	var selectIds = [];

	//数据源面板
	$('#user_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/loanSign/queryUserList',
        limit : 10,
        autoFit:true,
        method:'POST',
        showIndex : false,
        emptyMsg:'暂时还没有您想要的数据',
        onRowClick:function(rowIndex,rowData,event){
			if(rowData.id){
				$('#panelbar_2').css('display', 'block');
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
                     {header : '用户名', name : 'username', width : 120, align : 'center'}, 
                     {header : '真实姓名', name : 'realname', align : 'center', width : 100}, 
                     {header : '是否环迅会员', name : 'pIdentNo', align : 'center', width : 100,renderer:function(v, rowData , rowIndex) {
                    	 if(null!=v&&v!=""){
                           	return "<span style='color:#45832B'>是</span>";
                           }else{
                           	return "<span style='color:red'>否</span>";
                           }
                    	 
                     }},
                     {header : '信用等级', name : 'creditGrade', align : 'center', width : 100},
                     {header : '会员等级', name : 'vipendtime', align : 'center', width : 100, renderer : function(v, rowData , rowIndex) {   
                    	 if(null!=v&&v!=""){
                          	return "特权会员";
                          }else{
                          	return "普通会员";
                          }
                       }},  
                     {header : '会员期限', name : 'vipendtime', align : 'center', width : 190, renderer : function(v, rowData , rowIndex) {   
                         if(null!=v&&v!=""){
                          	return v; 
                          }else{
                          	return "永久";
                          }
                       }},  
                     {header : '注册时间', name : 'createTime', align : 'center', width : 205},
                     {header : '登录次数', name : 'logincount', align : 'center', width : 100},
                     {header:'自动还款签约',name:'signAutoRepay',align:'center',width:100}
                     ],
                   //选中事件
						onRowSelect : function(index,rowData,event){
                 	//取到该行id值
          			var id=rowData["id"];
          			showmygrid2(id);
          			
            }
    });
	
	
	//加载自动投标列表
	var showmygrid2 = function(id){
		$("#user_auto_list").omGrid({
			dataSource: "/loanSign/AutoList?userId="+id,
			title : '自动投标列表',
	        height : 320,
	        limit : 10,
	        colModel : [ {header : '序号', name : 'id', width : 100, align : 'center'},
	                     {header : '姓名', name : 'pRealName', width : 100, align : 'center'},
	                     {header : '周期类型', name : 'pTrdCycleType', width : 100, align : 'center'},
	                     {header : '周期最小值', name : 'pSTrdCycleValue', width : 100, align : 'center'},
	                     {header : '周期最大值', name : 'pETrdCycleValue', width : 100, align : 'center'},
	                     {header : '额度最小值', name : 'pSAmtQuota', width : 100, align : 'center'},
	                     {header : '额度最大值', name : 'pEAmtQuota', width : 100, align : 'center'},
	                     {header : '利率最小值', name : 'pSIRQuota', width : 100, align : 'center'},
	                     {header : '利率最大值', name : 'pEIRQuota', width : 100, align : 'center'},
	                     {header : '状态', name : 'state', width : 100, align : 'center',renderer : function(v, rowData , rowIndex) {   
	                         if(v==1){
	                            	return "启用中";
	                            }else{
	                            	return "未启用";
	                            }
	                         }}]
	   });
	};
	
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
	 
	 //搜索按钮
	 $('span#user-button-search').omButton({
		 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
	 //搜索按钮单击事件
	 $("#user-button-search").click(function(){
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.show();
		 var url=encodeURI("/loanSign/queryUserList?"+$("#searchfrom").serialize());
		 $('#user_list').omGrid('setData', url);
	 });
	 
	//添加新用户
	$("#addUser").click(function(){
		  $.pdialog.open('/loanSign/addUser','user_yx_page', '新增优选用户' , { width:500,height:400,mask:true,maxable:false,resizable:false });
		
	});
	
	//添加自动投标
	$("#addAuto").click(function(){
		var selectedRecords = $('#user_list').omGrid('getSelections',true);
		if(selectedRecords.length>0){
		  $.pdialog.open('/loanSign/addAuto?userId='+selectedRecords[0].id,'auto_yx_page', '新增自动投标' , { width:500,height:300,mask:true,maxable:false,resizable:false });
		}else{
			alertMsg.warn("您没有选择要设置的会员");
		}
	});
	
	$("#registerips").click(function(){
	   var selectedRecords = $('#user_list').omGrid('getSelections',true);
	   if(selectedRecords.length>0){
		   window.open('/member/ipsRegistrationone?userId='+selectedRecords[0].id);
	   }else{
				alertMsg.warn("您没有选择要注册的会员");
			}
	});

	//启用、禁用自动投标
	$('#en_auto').click(function() {
		var selectedRecords = $('#user_auto_list').omGrid('getSelections',true);
		var ids = "";
		if(selectedRecords.length>0){
			alertMsg.confirm("是否启用选中的自动投标规则?", {
				okCall: function(){
					for (var i in selectedRecords) 
					{
						ids +=selectedRecords[i].id+",";
					}
					var result=$.ajax({
						url:"/loanSign/updateAutoState?state=1&ids="+ids,async:false
					}).responseText;
					if(result=='"success"'){
						alertMsg.correct('启用成功');
						$('#user_auto_list').omGrid('reload');
					}else{
						alertMsg.warn(result.replaceAll('"',''));
					}
				}
			});
	    }else{
			alertMsg.warn("您没有选择要启用的投标规则");
		}
	});
	$('#dis_auto').click(function() {
		var selectedRecords = $('#user_auto_list').omGrid('getSelections',true);
		var ids = "";
		if(selectedRecords.length>0){
			alertMsg.confirm("是否停用选中的自动投标规则?", {
				okCall: function(){
					for (var i in selectedRecords) 
					{
						ids +=selectedRecords[i].id+",";
					}
					var result=$.ajax({
						url:"/loanSign/updateAutoState?state=2&ids="+ids,async:false
					}).responseText;
					if(result=='"success"'){
						alertMsg.correct('停用成功');
						$('#user_auto_list').omGrid('reload');
					}else{
						alertMsg.warn(result.replaceAll('"',''));
					}
				}
			});
	    }else{
			alertMsg.warn("您没有选择要停用的投标规则");
		}
	});
});
