$(document).ready(function(){
	/**
	 * 编辑标
	 */
	$("#editLoansign1").click(function(){
		//取到选中记录
		var selections=$('#mygrid11').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("editLoansign1", "/loanSign/showDetails?operNumber=2&id="+selections[0].id, { title:"编辑", fresh:true});
		}
	});

	/**
	 * 
	 * 查看标详情
	 */
	$("#queryLoansign1").click(function(){
		//取到选中记录
		var selections=$('#mygrid11').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("queryloanSign1", "/loanSign/showDetails?operNumber=3&id="+selections[0].id, { title:"查看详情", fresh:true});
		}
	});

	/**
	 * 上传借款方资料
	 */
	$("#addAttachment").click(function(){
		//取到选中记录
		var selections=$('#mygrid11').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//得到选中的第一条记录
			var dataRow=selections[0];
			//得到id
			var id=dataRow.id;
			$.pdialog.open("/attachment/openAddPage?id="+id+"&type="+2,"dialog", "添加借款方资料", { max:false,width: 420, height: 200,mask:true,close:relaodFileTable});
		}
	});
	
	/**
	 * 上传标图
	 */
	$("#addAttachmentIcon").click(function(){
		//取到选中记录
		var selections=$('#mygrid11').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择信息！");
		}else{
			//得到选中的第一条记录
			var dataRow=selections[0];
			//得到id
			var id=dataRow.id;
			$.pdialog.open("/attachment/openAddPage?id="+id+"&type="+34,"dialog", "添加标图", { max:false,width: 420, height: 200,mask:true,close:relaodFileTable});
		}
	});
	
	$("#deleteAttachment").click(function(){
		//取到选中记录
		var selections=$('#mygrid44').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择信息！");
		}else{
			//得到选中的第一条记录
			var dataRow=selections[0];
			//得到id
			var id=dataRow.id;
			$.ajax({
				url:'/attachment/delAttachment',
				data:'id='+id,
				type:'post',
				success:function(msg){
					if(msg){
						 $('#mygrid44').omGrid('reload');//刷新当前页
						 alertMsg.correct("删除成功");
					}else{
						 alertMsg.info("删除失败！");
					}
				}
			});
		}
	});
	
	
	var relaodFileTable=function (){
		$('#mygrid44').omGrid('reload');
		return true;
	}
	/****************数据源**************/
	//加载出借记录列表
	var showmygrid2 = function(id){
		$("#mygrid22").omGrid({
			dataSource: "/baseLoanSign/loanrecordList?id="+id,
			title : '出借记录',
	        height : 320,
	        limit : 10,
	        colModel : [ {header : '出借人', name : 'bname', width : 100, align : 'center'},
	                     {header : '年化利率', name : 'rate', width : 55, align : 'center'},
	                     {header : '投标金额', name : 'tenderMoney', align : 'center', width :100},
	                     {header : '支付状态', name : 'isSucceed',width:120, align : 'center'},
	                     {header : '投标时间', name : 'tenderTime',width:120, align : 'center'} ]
	   });
	};
	//还款记录
	var showmygrid3= function(id){
		$("#mygrid33").omGrid({
			dataSource: "/baseLoanSign/repaymentRecordList?id="+id,
			title : '还款记录',
	        height : 320,
	        limit : 10,
	        colModel : [ 
	                     {header : '期数', name : 'periods', width : 55, align : 'center'},
	                     {header : '预计还款时间', name : 'preRepayDate', align : 'center', width :120},
	                     {header : '预计还款金额', name : 'money',width:120, align : 'center'},
	                     {header : '还款状态', name : 'repayState',width:120, align : 'center'},
	                     {header : '实际还款时间', name : 'repayTime',width:120, align : 'center'},
	                     {header : '实际还款金额', name : 'realmoney',width:120, align : 'center'} ]
	   });
	};
	//附件
	var showmygrid4= function(id){
		$("#mygrid44").omGrid({
			dataSource: "/baseLoanSign/attachmentList?id="+id,
			title : '附件信息',
	        height : 320,
	        limit : 10,
	        colModel : [ 
	                     {header : '编号', name : 'id', width : 35, align : 'center'},
	                     {header : '附件名称', name : 'attachmentName', width : 100, align : 'center'},
	                     {header : '附件类型', name : 'attachmentType', align : 'center', width :100},
	                     {header : '上传时间', name : 'uploadTime',width:120, align : 'center'},
	                     {header : '上传人', name : 'realname',width:120,align : 'center'}]
	   });
	};
	
	
	//评论
	var showmygrid5= function(id){
		$("#mygrid55").omGrid({
				dataSource: "/baseLoanSign/commentList?id="+id,
				title : '评论信息',
		        height : 320,
		        limit : 10,
		        colModel : [ 
		                     {header : '编号', name : 'id', width : 35, align : 'center'},
		                     {header : '评论内容', name : 'cmtcontent', width : 200, align : 'center'},
		                     {header : '评论人', name : 'name', align : 'center', width :100},
		                     {header : '回复内容', name : 'cmtReply',width:220, align : 'center'},
		                     {header : '是否显示', name : 'cmtIsShow',width:90, align : 'center'} ]
		   });
	};
	
	$('#editComment').bind('click', function() {
        var selections=$('#mygrid55').omGrid('getSelections',true);
        if (selections.length == 0) {
        	alertMsg.info("请选择一条评论记录！");
            return false;
        }
        showDialog('编辑',selections[0]);//显示dialog
    });
	var dialog = $("#dialog-form").omDialog({
        width: 450,
        height:350,
        autoOpen : false,
        modal : true,
        resizable : false,
        buttons : {
            "提交" : function(){
                submitDialog();
                return false; //阻止form的默认提交动作
            },
            "取消" : function() {
                $("#dialog-form").omDialog("close");//关闭dialog
            }
        }
    });

	 //显示dialog并初始化里面的输入框的数据
    var showDialog = function(title,rowData){
        rowData = rowData || {};
        
        $("input[name='id']",dialog).val(rowData.id);
        $("textarea[name='cmtcontent']",dialog).val(rowData.cmtcontent);
        $("input[name='name']",dialog).val(rowData.name);
        $("textarea[name='cmtReply']",dialog).val(rowData.cmtReply);
        if(rowData.cmtIsShow=='显示'){
       	 $("select[name='cmtIsShow']",dialog).attr("selected","selected");
        }else{
    	   $("select[name='cmtIsShow']",dialog).attr("selected","selected");
        }
        dialog.omDialog("option", "title", title);
        dialog.omDialog("open");//显示dialog
    };
    var submitDialog = function(){
    	var cmtReply=$("textarea[name='cmtReply']",dialog).val();
    	cmtReply=$.trim(cmtReply);
    	if(cmtReply.length==0){
    		alertMsg.info("请选择输入回复内容！");
    		return false;
    	}
        var submitData={
    		id:$("input[name='id']",dialog).val(),
    		cmtcontent:$("textarea[name='cmtcontent']",dialog).val(),
    		name:$("input[name='name']",dialog).val(),
    		cmtReply:$("textarea[name='cmtReply']",dialog).val(),
    		cmtIsShow:$("select[name='cmtIsShow']",dialog).val()
        };
        $.post('/comment/updateComment',submitData,function(msg){
        	if(msg){
        		$("#dialog-form").omDialog("close"); //关闭dialog
	              $('#mygrid55').omGrid('reload');//如果是修改则刷新当前页
	              alertMsg.correct("修改数据成功");
        	}else{
        		$("#dialog-form").omDialog("close"); //关闭dialog
        		 alertMsg.info("修改数据失败");
        	}
        	
        });
    };
    
	/***************按钮及点击事件************/
		//导出借款标列表
		$("#EXPloansign").click(function(){
	        top.window.location='/loanSign/outPutExcel';
		});
	
		//删除借款标
		$("#deleteAll1").click(function(){
			var selections=$('#mygrid11').omGrid('getSelections',true);
			
            if (selections.length == 0) {
            	alertMsg.info("请选择删除的记录！");
            	return;
            }
            //将选择的记录的id传递到后台去并执行delete操作
            var toDeleteRecordID=selections[0].id;
            alertMsg.confirm("您确定要删除所选的记录！", {
				 okCall: function(){
					 $.ajax({
							data:'id='+toDeleteRecordID,
							url:'/baseLoanSign/deleteAll',
							type:'post',
							success:function(msg){
								if(msg==1){
									 $('#mygrid11').omGrid('reload');//刷新当前页数据
					                 alertMsg.correct("删除数据成功");
								}else if(msg==2){
									$('#mygrid11').omGrid('reload');//刷新当前页数据
									alertMsg.info("只能删除未发布的借款标");
								}else{
									alertMsg.info("删除数据失败");
								}
							}
						});
				 },
				 cancelCall : function() {}
				});
       
		});
		
		//导出出借记录
		$("#EXPLoanRecord").click(function(){
			var selections=$('#mygrid11').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择一条借款标信息！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            top.window.location='/baseLoanSign/outPutLoanrecordExcel?id='+toDeleteRecordID;
		});
	
		//发布
		$("#FBloansign1").click(function(){
			var selections=$('#mygrid11').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要发布的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'loanSignId='+toDeleteRecordID,
    			url:'/loanSign/publish',
    			type:'post',
    			success:function(msg){
    				if(msg==1){
    					 $('#mygrid11').omGrid('reload');//刷新当前页数据
    	                 alertMsg.correct("借款标发布成功！");
    				}else if(msg==2){
    					alertMsg.info("发布失败,只能发布未发布的标,请尝试刷新页面！");
    				}else if(msg==4){
    					alertMsg.info("发布失败,上一期未完成放款！");
    				}else{
    				
    					window.open("/loanSign/gotoIPS.htm");
    				}
    			}
    		});
		});
		
		
		//放款
		$("#FKloansign1").click(function(){
			var selections=$('#mygrid11').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要进行放款的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'id='+toDeleteRecordID,
    			url:'/baseLoanSign/credit',
    			type:'post',
    			success:function(msg){
    				if(msg==0){
    					window.open("/baseLoanSign/gotoIPS.htm");
    					 $('#mygrid11').omGrid('reload');//刷新当前页数据
    					 alertMsg.correct("借款标放款成功！");
    				}else if(msg==2){
    					alertMsg.info("放款失败,只有进行中并且满标的标可以放款,请尝试刷新页面！");
    				}else if(msg==3){
    					alertMsg.info("放款失败,该标未满标,请尝试刷新页面！");
    				}else if(msg==5){
    					alertMsg.info("环讯已经受理放款请求,请稍后尝试刷新页面！");
    				}else{
    					alertMsg.info("放款失败,请尝试刷新页面！");
    				}
    			}
    		});
		});
		//按时还款
		 $("#repayTime").omCalendar({
			 readOnly : true
	      });
		 $("#repayTime1").omCalendar({
			 readOnly : true
	      });
		 $("#repayTime2").omCalendar({
			 readOnly : true
	      });
		
		 //窗体
		var onTimeRepaydialog = $("#onTimeRepay-form").omDialog({
            width: 280,
            autoOpen : false,
            modal : true,
            resizable : false,
            buttons : {
                "提交" : function(){
					var repaymentRecordId=$("input[name='rid']",onTimeRepaydialog).val();
					var repayTime=$("input[name='repayTime']",onTimeRepaydialog).val();
					if(repayTime==""){
						alertMsg.info("请选择还款时间！");
						 return false;
					}
	                $.ajax({
	        			data:'repaymentRecordId='+repaymentRecordId+"&repayTime="+repayTime,
	        			url:'/loanSign/onTimeRepay',
	        			type:'post',
	        			success:function(msg){
	        				if(msg==1){
	        					  $("#onTimeRepay-form").omDialog("close");//关闭dialog
	        					 $('#mygrid33').omGrid('reload');//刷新当前页数据
	        					 alertMsg.correct("按时还款成功！");
	        				}else if(msg==2){
	        					 $("#onTimeRepay-form").omDialog("close");//关闭dialog
	        	                 alertMsg.info("还款失败,该记录已经还款,请尝试刷新页面！");
	        				}else if(msg==3){
	        					 alertMsg.info("还款时间应该在预计还款时间之前！");
	        				}else if(msg==4){
	        	                 alertMsg.info("还款失败,只能按期数顺序依次还款！");
	        				}else{
	        					alertMsg.info("按时还款失败,请尝试刷新页面！");
	        				}
	        			}
	        		});
	            },
                "取消" : function() {
                    $("#onTimeRepay-form").omDialog("close");//关闭dialog
                }
            }
        });
		
		$("#onTimeRepay").click(function(){
			var selections=$('#mygrid33').omGrid('getSelections',true);
            if (selections.length == 0) {
            	 alertMsg.info("请选择要还款的记录！");
                return false;
            }
           	if(selections[0].repayState!=""){
                alertMsg.info("还款失败,该记录已经还款,请尝试刷新页面！");
                return false;
           	}
            $("input[name='rid']",onTimeRepaydialog).val(selections[0].id);
            $("input[name='periods']",onTimeRepaydialog).val(selections[0].periods);
            onTimeRepaydialog.omDialog("option", "title","按时还款");
            onTimeRepaydialog.omDialog("open");//显示dialog
            
		});
		//逾期还款
		$("#exceedTimeRepay").click(function(){
			var selections=$('#mygrid33').omGrid('getSelections',true);
            if (selections.length == 0) {
            	 alertMsg.info("请选择要还款的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'repaymentRecordId='+toDeleteRecordID,
    			url:'/loanSign/exceedTimeRepay',
    			type:'post',
    			success:function(msg){
    				if(msg==1){
    					 $('#mygrid33').omGrid('reload');//刷新当前页数据
    					 alertMsg.correct("逾期还款成功！");
    				}else if(msg==2){
    					alertMsg.info("逾期还款失败,这期还款已还,请尝试刷新页面！");
    				}else if(msg==3){
    					alertMsg.info("逾期还款失败,只能按期数顺序依次还款！");
    				}else{
    					alertMsg.info("逾期还款失败,请尝试刷新页面！");
    				}
    			}
    		});
		});
		
		//逾期已还款
		//窗体
		var exceedTimedialog = $("#exceedTimeRepayed-form").omDialog({
            width: 280,
            autoOpen : false,
            modal : true,
            resizable : false,
            buttons : {
                "提交" : function(){
					var repaymentRecordId=$("input[name='rid1']",exceedTimedialog).val();
					var repayTime=$("input[name='repayTime1']",exceedTimedialog).val();
					if(repayTime==""){
						alertMsg.info("请选择还款时间！");
						 return false;
					}
	                $.ajax({
	        			data:'repaymentRecordId='+repaymentRecordId+"&repayTime="+repayTime,
	        			url:'/loanSign/exceedTimeRepayed',
	        			type:'post',
	        			success:function(msg){
	        				if(msg==1){
	        					  $("#exceedTimeRepayed-form").omDialog("close");//关闭dialog
	        					 $('#mygrid33').omGrid('reload');//刷新当前页数据
	        					 alertMsg.correct("还款成功！");
	        				}else if(msg==2){
	        	                 alertMsg.info("还款失败,请尝试刷新页面！");
	        				}else if(msg==3){
	        					 alertMsg.info("还款失败,只有平台垫付的标可以还款！");
	        				}else if(msg==4){
	        	                 alertMsg.info("还款失败,实际还款时间必须大于预计还款时间！");
	        				}
	        			}
	        		});
	            },
                "取消" : function() {
                    $("#exceedTimeRepayed-form").omDialog("close");//关闭dialog
                }
            }
        });
		$("#exceedTimeRepayed").click(function(){
			var selections=$('#mygrid33').omGrid('getSelections',true);
            if (selections.length == 0) {
            	 alertMsg.info("请选择要还款的记录！");
                return false;
            }
            if(selections[0].repayState!="逾期未还款"){
                alertMsg.info("还款失败,只有平台垫付的标可以还款！");
                return false;
           	}
            $("input[name='rid1']",exceedTimedialog).val(selections[0].id);
            $("input[name='periods1']",exceedTimedialog).val(selections[0].periods);
            exceedTimedialog.omDialog("option", "title","逾期已还款");
            exceedTimedialog.omDialog("open");//显示dialog
		});
		 
		//提前还款
		
		var advanceRepaydialog = $("#advanceRepay-form").omDialog({
            width: 300,
            autoOpen : false,
            modal : true,
            resizable : false,
            buttons : {
                "提交" : function(){
					var useRealDay=$("input[name='useRealDay']",advanceRepaydialog).val();
					var repayTime=$("input[name='repayTime2']",advanceRepaydialog).val();
					if(repayTime==""){
						alertMsg.info("请选择还款时间！");
						 return false;
					}
					if(useRealDay==""){
						alertMsg.info("请选择正确的还款时间！");
						 return false;
					}
					var selections=$('#mygrid33').omGrid('getSelections',true);
					$.ajax({
	        			data:'repaymentRecordId='+selections[0].id+"&repayTime="+repayTime,
	        			url:'/loanSign/advanceRepay',
	        			type:'post',
	        			success:function(msg){
	        				if(msg==1){
	        					 $("#advanceRepay-form").omDialog("close");//关闭dialog
	        					 $('#mygrid33').omGrid('reload');//刷新当前页数据
	        					 alertMsg.correct("还款成功！");
	        				}else if(msg==2){
	        	                 alertMsg.info("还款失败,只能针对未还款记录还款,请尝试刷新页面！");
	        				}else{
	        					 alertMsg.info("还款失败,请刷新页面！");
	        				}
	        			}
	        		});
	            },
                "取消" : function() {
                    $("#advanceRepay-form").omDialog("close");//关闭dialog
                }
            }
        });
		$("#advanceRepay").click(function(){
			var selections=$('#mygrid33').omGrid('getSelections',true);
			var selections1=$('#mygrid11').omGrid('getSelections',true);
            if (selections.length == 0) {
            	 alertMsg.info("请选择要还款的记录！");
                return false;
            }
            if(selections1[0].refundWay!="到期一次性还本息"){
                alertMsg.info("还款失败,只有一次性到期还款的记录可以提前还款！");
                return false;
           	}
            if(selections[0].repayState!=""){
                alertMsg.info("还款失败,只有未还款的记录可以还款！");
                return false;
           	}
            $("input[name='rid2']", advanceRepaydialog).val(selections[0].id);
            $("input[name='periods2']", advanceRepaydialog).val(selections[0].periods);
            advanceRepaydialog.omDialog("option", "title","提前还款");
            advanceRepaydialog.omDialog("open");//显示dialog
		});
		
		
	showmygrid2(0);
	showmygrid3(0);
	showmygrid4(0);
	showmygrid5(0);
	
	
	
	
	 //查询面板初始化
	 $("#search-panel").omPanel({
     	title : "高级搜索",collapsible:true,
     	width:'fit'
     });
	 $("#loanstate1").omCombo({
    	emptyText : '请选择',
     	forceSelection:true,
         dataSource : [ {text:'未发布',value:'1'},
    	                {text:'进行中',value:'2'},
    	                {text:'回款中',value:'3'},
    	                {text:'已完成',value:'4'} ]
     });
	 $("#iscredit1").omCombo({
	     	emptyText : '请选择',
	     	forceSelection:true,
	         dataSource : [ {text:'已放款',value:'1'},
	    	                {text:'未放款',value:'2'} ]
	     });
	  $("#beginTime").omCalendar({
          showTime : true
      });
      $("#endTime").omCalendar({
          showTime : true
      });
      $('span#button-search').omButton({
    	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
 	 	});
      $('span#button-search').click(function(){
    	  $('#mygrid11').omGrid('setData', '/loanSign/youXuanList?'+$("#searchfrom").serialize());

      });

	//数据源面板
	$('#mygrid11').omGrid({
        dataSource : '/loanSign/youXuanList',
        title : '太平洋理财理财列表',
        height : 336,
        limit : 10,
        colModel : [ 
                     {header : '序号', name : 'id', width : 25, align : 'center'}, 
                     {header : '标题', name : 'loanTitle', align : 'center', width : 120}, 
                     {header : '借款人', name : 'name', align : 'center', width : 70},
                     {header : '最小投入金额', name : 'loanUnit', align : 'center', width : 80},
                     {header : '计划金额', name : 'issueLoan', align : 'center', width : 80},
                     {header : '锁定期限', name : 'month', align : 'center', width : 50},
                     {header : '理财类型', name : 'loancategory', align : 'center', width : 60},
                     {header : '年化利率', name : 'rate', align : 'center', width : 60},
                     {header : '成功投入份数', name : 'successfulLending', align : 'center', width : 80},
                     {header : '剩余份数', name : 'remainingCopies', align : 'center', width : 60},
                     {header : '还款方式', name : 'refundWay', align : 'center', width : 90},
                     {header : '计划状态', name : 'loanstate', align : 'center', width : 70},
                     {header : '是否放款', name : 'iscredit', align : 'center', width : 60},
                     {header : '发布时间', name : 'publishTime', align : 'center', width : 110},
                     {header : '放款时间', name : 'creditTime', align : 'center', width : 110},
                     {header : '是否显示', name : 'isShow', align : 'center', width : 50}],
                     
                     	//选中事件
						onRowSelect : function(index,rowData,event){
                    	//取到该行id值
             			var id=rowData["id"];
             			showmygrid2(id);
             			showmygrid3(id);
             			showmygrid4(id);
             			showmygrid5(id);
               }
    });
});
