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
	$('#borrow_show_list').omGrid({
		width:'fit',
		height:400,
        dataSource : '/userinfo/queryborrowpage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        onRowSelect:function(rowIndex,rowData,event){
        	if(rowData.id!=id){
				if(rowData.id){
					$('#make-tab').omTabs('reload',0,'/userinfo/query_borrow_baseinfo?ids='+rowData.id);
					$("#make-tab").omTabs("reload",1,"/userinfo/query_personal?ids="+rowData.id);
					$('#make-tab').omTabs('reload',2,'/userinfo/query_contact?ids='+rowData.id);
					$('#make-tab').omTabs('reload',3,'/userinfo/query_company?ids='+rowData.id);
					$('#make-tab').omTabs('reload',4,'/userinfo/query_finanes?ids='+rowData.id);
					$('#make-tab').omTabs('reload',5,'/userinfo/query_other_contact?ids='+rowData.id);
					$('#make-tab').omTabs('reload',6,'/userinfo/query_stock_photo?ids='+rowData.id);
					$('#make-tab').omTabs('reload',7,'/userinfo/query_data_upload?ids='+rowData.id);
				}
        	}
        	id=rowData.id;
    	}, 
    	onBeforeEdit:function(rowIndex , rowData){
    	   if(rowData.ispass==2){
    		   editids=rowData.id;
               credit=rowData.credit;
    	   }else{
    		   alertMsg.warn("申请未通过审核，不能修改该授信额度");
    		   return false;
    	   }
           
        },
    	onAfterEdit:function(rowIndex , rowData){
    		if(rowData.id==editids&&credit!=rowData.credit){
				$.ajax({
	    			url:'/userinfo/update_credit',
	    			type:'POST',
	    			data:{"ids":rowData.id,"credit":rowData.credit},
	    			contentType:"application/x-www-form-urlencoded;charset=utf-8",
	    			success:function(msg){
	    				if(msg.indexOf("y")!=-1){
	    					alertMsg.correct("借款人"+rowData.username+"的授信额度修改成功");
	        				$("#borrow_show_list").omGrid("saveChanges");
	    				}else{
	    					alertMsg.error("借款人"+rowData.username+"的授信额度修改失败");
	    				}
	    			},
	    			error: function(){
	    				alertMsg.error("借款人"+rowData.username+"的授信额度修改失败");
	    			}
	    		});
    		}else{
    			$("#borrow_show_list").omGrid("saveChanges");
    		}
        },
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center',editor:{editable:false}}, 
                     {header : '用户名', name : 'username', width : 100, align : 'left',editor:{editable:false}}, 
                     {header : '积分', name : 'suminte', align : 'left', width : 80,editor:{editable:false}}, 
                     {header : '申请时间', name : 'addtime', align : 'left', width : 120,editor:{editable:false}},
                     {header : '授信额度', name : 'credit', align : 'left', width : 90,editor:{
		        	    rules:[["min",0,"授信额度不能小于0"],["max",10000000,"授信额度不能大于10000000"]],
		        	    type:"omNumberField",
		        	    options:ageOptions,
		        	    editable:true,
		        	    name:"credit"}},
		        	 {header : '注册时间', name : 'createtime', align : 'left', width : 120,editor:{editable:false}},
                     {header : '上次登录时间', name : 'lasttime', align : 'left', width : 120,editor:{editable:false}},
                     {header : '登录次数', name : 'logincount', align : 'left', width : 80,editor:{editable:false}},
                     {header : '会员类型', name : 'endtime', align : 'left', width : 80,editor:{editable:false}},
                     {header : '会员期限', name : 'vipendtime', align : 'left', width : 120,editor:{editable:false}},
                     {header : '是否审核通过', name : 'ispass', align : 'left', width : 100,editor:{editable:false}, renderer : function(v, rowData , rowIndex) {   
                    	 if(v==1){
                            	return "未审核";
                            }else if(v==2){
                            	return "通过";
                            }else if(v==3){
                            	return "不通过";
                            }else{
                            	return "";
                            }
                         }},  
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
	 
	 //注册开始时间
	 $("#bstart-time").omCalendar({
		 editable : false,
		 disabledFn : disFn
	 });
	 //注册结束时间
	 $("#bend-time").omCalendar({
		 editable : false,
		 disabledFn : disFn 
	 });
	 
	 //申请开始时间
	 $("#bstart2-time").omCalendar({
		 editable : false,
		 disabledFn : disFn
	 });
	 
	 //申请结束时间
	 $("#bend2-time").omCalendar({
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
		 $('#borrow_show_list').omGrid('setData', '/userinfo/queryborrowpage?'+$("#searchborrowfrom").serialize());
	 });
	 
	 //tab选项卡
	 $('#make-tab').omTabs({
         height : 250,
         switchMode : 'mouseover',
         lazyLoad : true
     });
	 
//	 //添加借款人
//	 $("#adduser").click(function(){
//		 //获取选中行数据
//		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections',true);
//		 //判断用户是否选中数据
//		 if(selectedRecords.length>0){
//			alertMsg.info("禁止会员登录");
//		 }else{
//			alertMsg.warn("没有选择要禁止登录的会员"); 
//		 }
//	 });
	 
	//修改授信额度
	 $("#updatecredit").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections');
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 $.each(selectedRecords,function(n,value) {
				 $("#borrow_show_list").omGrid("editRow" , value);
			 });  
		 }else{
			alertMsg.warn("您没有选择要修改那个借款人的授信额度"); 
		 }
	 });
	 
	 //借款人审核
	 $("#borrow-audit").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的借款人通过审核?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							ids +=selectedRecords[i].id+",";
							if(selectedRecords[i].ispass!=1){
								alertMsg.warn("只有未审核的借款人才能进行审核"); 
								return false;
							}
						}
						ajaxTodo("/userinfo/pass?state=1&ids="+ids);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审核的借款人"); 
		 }
	 });
	 $("#borrow-noaudit").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections',true);
		 var idn="";
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否让选中的借款人不通过审核?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							idn +=selectedRecords[i].id+",";
							if(selectedRecords[i].ispass!=1){
								alertMsg.warn("只有未审核的借款人才能进行审核"); 
								return false;
							}
						}
						ajaxTodo("/userinfo/pass?state=0&ids="+idn);
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("您没有选择要审核的借款人"); 
		 }
	 });
	 //积分查询
	 $("#query-suminte").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length==1){
			 if(selectedRecords[0].ispass==2){
				 $.pdialog.open('/userinfo/openautoinit?bid='+selectedRecords[0].id, 'borr_suminte_page', '自动积分信息' , { width:520,height:440,mask:true,maxable:false,resizable:false });
			 }else{
				 alertMsg.warn("只有审核通过的借款人才有自动积分！"); 
			 }
			
		 }else{
			alertMsg.warn("您没有选择要查询的一个借款人信息"); 
		 }
	 });
	 //设置积分
	 $("#set-suminte").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length==1){
			 if(selectedRecords[0].ispass==2){
				 $.pdialog.open('/userinfo/getusermanualintegr?id='+selectedRecords[0].id, 'purchase_list', '积分设置' , { width:725,height:444,mask:true,maxable:false,resizable:false });
			 }else{
				 alertMsg.warn("该借款人还未审核通过,不能设置积分！");
			 }
		 }else{
			alertMsg.warn("请选择您要设置的一个借款人"); 
		 }
	 });
	 
	 $("#browbtoRecordinfo").click(function(){
		 //获取选中行数据
		 var selectedRecords = $('#borrow_show_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length==1){
			 if(selectedRecords[0].ispass==2){
			$.pdialog.open('/userinfo/openbborrowrecord?bid='+selectedRecords[0].id, 'browbtoRecord_list', '历史交易记录' , { width:800,height:460,mask:true,maxable:false,resizable:false });
			 }else{
				 alertMsg.warn("只有审核通过的借款人才有历史交易记录！");
			 }
		 }else{
			alertMsg.warn("请选择您要查看的一个借款人"); 
		 }
	 });
});
