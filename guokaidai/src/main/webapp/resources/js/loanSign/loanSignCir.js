$(document).ready(function(){
	
	/**
	 * 编辑标
	 */
	$("#editLoansignCIR").click(function(){
		//取到选中记录
		var selections=$('#mygridCIR1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("updateloanSignCIR", "/loanSignOfCir/queryDetails?operNumber=2&id="+selections[0].id+"&userName="+selections[0].userName, { title:"编辑", fresh:true});
		}
	});

	/**
	 * 
	 * 查看标详情
	 */
	$("#queryLoansignCIR").click(function(){
		//取到选中记录
		var selections=$('#mygridCIR1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("queryloanSignCIR", "/loanSignOfCir/queryDetails?operNumber=3&id="+selections[0].id+"&userName="+selections[0].userName, { title:"查看详情", fresh:true});
		}
	});

	/**
	 * 上传借款方资料
	 */
	$("#addAttachmentCIR").click(function(){
		//取到选中记录
		var selections=$('#mygridCIR1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
			
		}else{
			//得到选中的第一条记录的id
			var id=selections[0].id;
			$.pdialog.open("/attachment/openAddPage?id="+id+"&type="+2,"dialog", "添加借款方资料", { max:false,width: 420, height: 200,mask:true,close:relaodFileTable});
		}
	});
	
	/**
	 * 上传标图
	 */
	$("#addAttachmentIconCIR").click(function(){
		//取到选中记录
		var selections=$('#mygridCIR1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//得到选中的第一条记录的id
			var id=selections[0].id;
			$.pdialog.open("/attachment/openAddPage?id="+id+"&type="+1,"dialog", "添加标图", { max:false,width: 420, height: 200,mask:true,close:relaodFileTable});
		}
	});
	
	$("#deleteAttachmentCIR").click(function(){
		//取到选中记录
		var selections=$('#mygridCIR4').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//得到选中的第一条记录的id
			var id=selections[0].id;
			$.ajax({
				url:'/attachment/delAttachment',
				data:'id='+id,
				type:'post',
				success:function(msg){
					if(msg){
						 $('#mygridCIR4').omGrid('删除成功！');//刷新当前页
							alertMsg.info("删除成功！");
					}else{
							alertMsg.info("删除失败！");
					}
				}
			});
		}
	});
	
	
	var relaodFileTable=function (){
		$('#mygridCIR4').omGrid('reload');
		return true;
	}
	/****************数据源**************/
	//加载出借记录列表
	var showmygridCIR2 = function(id){
		$("#mygridCIR2").omGrid({
			dataSource: "/baseLoanSign/assigmentrecordList?id="+id,
			title : '出借记录',
	        height : 320,
	        limit : 10,
	        colModel : [ {header : '出借人', name : 'bname', width : 100, align : 'center'},
	                     {header : '年利率', name : 'rate', width : 55, align : 'center'},
	                     {header : '投标金额', name : 'tenderMoney', align : 'center', width :100},
	                     {header : '支付状态', name : 'isSucceed',width:120, align : 'center'},
	                     {header : '投标时间', name : 'tenderTime',width:120, align : 'center'} ]
	   });
	};
	//还款记录
	var showmygridCIR3= function(id){
		$("#mygridCIR3").omGrid({
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
	var showmygridCIR4= function(id){
		$("#mygridCIR4").omGrid({
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
	var showmygridCIR5= function(id){
		$("#mygridCIR5").omGrid({
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
	//编辑
	$('#editCommentCIR').bind('click', function() {
        var selections=$('#mygridCIR5').omGrid('getSelections',true);
        if (selections.length == 0) {
        	alertMsg.info("请选择要编辑的评论！");
            return false;
        }
        showDialog('编辑',selections[0]);//显示dialog
    });
	var dialog = $("#dialogCIR-form").omDialog({
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
                $("#dialogCIR-form").omDialog("close");//关闭dialog
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
        		$("#dialogCIR-form").omDialog("close"); //关闭dialog
	              $('#mygridCIR5').omGrid('reload');//如果是修改则刷新当前页
	              alertMsg.correct("修改数据成功");
        	}else{
        		$("#dialogCIR-form").omDialog("close"); //关闭dialog
        		 alertMsg.correct("修改数据失败");
        	}
        	
        });
    };
    
	/***************按钮及点击事件************/
		//导出借款标列表
		$("#EXPloansignCIR").click(function(){
	        top.window.location='/loanSignOfCir/outPutExcel';
		});
	
		//删除借款标
		$("#deleteAllCIR").click(function(){
			var selections=$('#mygridCIR1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择删除的记录！");
            	return;
            }
            //将选择的记录的id传递到后台去并执行delete操作
            var toDeleteRecordID=selections[0].id;
	       $.ajax({
				data:'id='+toDeleteRecordID,
				url:'/baseLoanSign/deleteAll',
				type:'post',
				success:function(msg){
					if(msg==1){
						 $('#mygridCIR1').omGrid('reload');//刷新当前页数据
		                 alertMsg.correct("删除数据成功");
					}else if(msg==2){
						$('#mygridCIR1').omGrid('reload');//刷新当前页数据
						alertMsg.info("只能删除未发布的借款标");
					}else{
						alertMsg.info("删除数据失败");
					}
				}
			});
		});
		
		//导出出借记录
		$("#EXPLoanRecordCIR").click(function(){
			var selections=$('#mygridCIR1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择一条借款标信息！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            top.window.location='/baseLoanSign/outPutLoanrecordExcel?id='+toDeleteRecordID;
		});
	
		//发布
		$("#FBloansignCIR").click(function(){
			var selections=$('#mygridCIR1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要发布的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'loanSignId='+toDeleteRecordID,
    			url:'/loanSignOfCir/cirOfPublish',
    			type:'post',
    			success:function(msg){
    				if(msg==1){
    					 $('#mygrid1').omGrid('reload');//刷新当前页数据
    	                 alertMsg.correct("借款标发布成功！");
    				}else if(msg==3){
    					alertMsg.info("发布失败,只能发布未发布的标,请尝试刷新页面！");
    				}else{
    					alertMsg.info("发布失败,请尝试刷新页面！");
    				}
    			}
    		});
		});
		
		
		//放款
		$("#FKloansignCIR").click(function(){
			var selections=$('#mygridCIR1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要进行放款的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'id='+toDeleteRecordID,
    			url:'/baseLoanSign/creditAssigment',
    			type:'post',
    			success:function(msg){
    				if(msg==0){
    					 window.open("/baseLoanSign/gotoIPS.htm");
    					 $('#mygridCIR1').omGrid('reload');//刷新当前页数据
    					 alertMsg.correct("债权转让标放款成功！");
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
		 $("#repayTimeCIR").omCalendar({
			 readOnly : true
	      });
		 $("#repayTimeCIR1").omCalendar({
			 readOnly : true
	      });
		 //窗体
		var onTimeRepayCIRdialog = $("#onTimeRepayCIR-form").omDialog({
            width: 280,
            autoOpen : false,
            modal : true,
            resizable : false,
            buttons : {
                "提交" : function(){
					var repaymentRecordId=$("input[name='rid']",onTimeRepayCIRdialog).val();
					var repayTime=$("input[name='repayTime']",onTimeRepayCIRdialog).val();
					if(repayTime==""){
						alertMsg.info("请选择还款时间！");
						 return false;
					}
	                $.ajax({
	        			data:'repaymentRecordId='+repaymentRecordId+"&repayTime="+repayTime,
	        			url:'/loanSignOfCir/onTimeRepay',
	        			type:'post',
	        			success:function(msg){
	        				if(msg==1){
	        					 $("#onTimeRepayCIR-form").omDialog("close");//关闭dialog
	        					 $('#mygridCIR3').omGrid('reload');//刷新当前页数据
	        					 $('#mygridCIR1').omGrid('reload');//刷新当前页数据
	        					 alertMsg.correct("按时还款成功！");
	        				}else if(msg==5){
	        	                 alertMsg.info("还款失败,按时还款的时间不能大于预计还款时间！");
	        				}else if(msg==3){
	        					 alertMsg.info("还款失败,只能针对未还款记录还款,请尝试刷新页面！");
	        				}else if(msg==4){
	        	                 alertMsg.info("还款失败,只能针对已放款的标进行还款,请尝试刷新页面！！");
	        				}else if(msg==4){
	        					 alertMsg.info("还款失败,只能按期数顺序依次还款！");
	        				}else{
	        					alertMsg.info("按时还款失败,请尝试刷新页面！");
	        				}
	        			}
	        		});
	            },
                "取消" : function() {
                    $("#onTimeRepayCIR-form").omDialog("close");//关闭dialog
                }
            }
        });
		
		$("#onTimeRepayCIR").click(function(){
			var selections=$('#mygridCIR3').omGrid('getSelections',true);
            if (selections.length == 0) {
            	 alertMsg.info("请选择要还款的记录！");
                return false;
            }
           	if(selections[0].repayState!=""){
                alertMsg.info("还款失败,该记录已经还款,请尝试刷新页面！");
                return false;
           	}
            $("input[name='rid']",onTimeRepayCIRdialog).val(selections[0].id);
            $("input[name='periods']",onTimeRepayCIRdialog).val(selections[0].periods);
            onTimeRepayCIRdialog.omDialog("option", "title","按时还款");
            onTimeRepayCIRdialog.omDialog("open");//显示dialog
		});
		//逾期还款
		$("#exceedTimeRepayCIR").click(function(){
			var selections=$('#mygridCIR3').omGrid('getSelections',true);
            if (selections.length == 0) {
            	 alertMsg.info("请选择要还款的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'repaymentRecordId='+toDeleteRecordID,
    			url:'/loanSignOfCir/exceedTimeRepay',
    			type:'post',
    			success:function(msg){
    				if(msg==1){
    					 $('#mygridCIR3').omGrid('reload');//刷新当前页数据
    					 $('#mygridCIR1').omGrid('reload');//刷新当前页数据
    					 alertMsg.correct("逾期还款成功！");
    				}else if(msg==3){
    					alertMsg.info("还款失败,只能针对未还款记录还款,请尝试刷新页面！");
    				}else if(msg==4){
    					alertMsg.info("还款失败,只能针对已放款的标进行还款,请尝试刷新页面！");
    				}else if(msg==5){
    					alertMsg.info("还款失败,只能按期数顺序依次还款！");
    				}else{
    					alertMsg.info("逾期还款失败,请尝试刷新页面！");
    				}
    			}
    		});
		});
		
		//逾期已还款
		//窗体
		var exceedTimedialog = $("#exceedTimeRepayedCIR-form").omDialog({
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
	        			url:'/loanSignOfCir/exceedTimeRepayed',
	        			type:'post',
	        			success:function(msg){
	        				if(msg==1){
	        					  $("#exceedTimeRepayedCIR-form").omDialog("close");//关闭dialog
	        					 $('#mygridCIR3').omGrid('reload');//刷新当前页数据
	        					 alertMsg.correct("还款成功！");
	        				}else if(msg==2){
	        					 alertMsg.info("还款失败,只有平台垫付的标可以还款！");
	        				}else if(msg==3){
	        	                 alertMsg.info("还款失败,实际还款时间必须大于预计还款时间！");
	        				}else{
	        					 alertMsg.info("还款失败,请刷新页面！");
	        				}
	        			}
	        		});
	            },
                "取消" : function() {
                    $("#exceedTimeRepayedCIR-form").omDialog("close");//关闭dialog
                }
            }
        });
		$("#exceedTimeRepayedCIR").click(function(){
			var selections=$('#mygridCIR3').omGrid('getSelections',true);
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
		 
		
		
	showmygridCIR2(0);
	showmygridCIR3(0);
	showmygridCIR4(0);
	showmygridCIR5(0);
	
	
	 //查询面板初始化
	 $("#searchCIR-panel").omPanel({
     	title : "高级搜索",collapsible:true,
     	width:'fit'
     });
	 $("#loanstate").omCombo({
    	emptyText : '请选择',
     	forceSelection:true,
         dataSource : [ {text:'未发布',value:'1'},
    	                {text:'进行中',value:'2'},
    	                {text:'回款中',value:'3'},
    	                {text:'已完成',value:'4'} ]
     });
	 $("#isCredit").omCombo({
	     	emptyText : '请选择',
	     	forceSelection:true,
	         dataSource : [ {text:'已放款',value:'1'},
	    	                {text:'未放款',value:'2'} ]
	  });
	 $("#loanCategory").omCombo({
	     	emptyText : '请选择类型',
	     	forceSelection:true,
	     	dataSource : 'baseLoanSign/loanType.htm'
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
    	  $('#mygridCIR1').omGrid('setData', '/loanSignOfCir/list?'+$("#searchCIRfrom").serialize());
      });

	//数据源面板
	$('#mygridCIR1').omGrid({
        dataSource : '/loanSignOfCir/list',
        title : '债权转让标列表',
        height : 336,
        limit : 10,
        colModel : [ 
                     {header : '序号', name : 'id', width : 25, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '标题', name : 'loanTitle', align : 'center', width : 100}, 
                     {header : '借款人', name : 'name', align : 'center', width : 70},
                     {header : '用户名', name : 'userName', align : 'center', width : 70},
                     {header : '最小出借单位', name : 'loanUnit', align : 'center', width : 80},
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 55},
                     {header : '还款期限', name : 'month', align : 'center', width : 50},
                     {header : '借款标类型', name : 'loancategory', align : 'center', width : 60},
                     {header : '借款管理费', name : 'mgtMoney', align : 'center', width : 60},
                     {header : '年利率', name : 'rate', align : 'center', width : 60},
                     {header : '平台奖励', name : 'reward', align : 'center', width : 60},
                     {header : '成功借出份数', name : 'successfulLending', align : 'center', width : 80},
                     {header : '剩余份数', name : 'remainingCopies', align : 'center', width : 60},
                     {header : '还款方式', name : 'refundWay', align : 'center', width : 90},
                     {header : '借款标状态', name : 'loanstate', align : 'center', width : 70},
                     {header : '是否放款', name : 'iscredit', align : 'center', width : 60},
                     {header : '发布时间', name : 'publishTime', align : 'center', width : 110},
                     {header : '放款时间', name : 'creditTime', align : 'center', width : 110},
                     {header : '是否显示', name : 'isShow', align : 'center', width : 50},
                     {header : '推荐到首页', name : 'isRecommand', align : 'center', width : 50} ],
                     
                     	//选中事件
						onRowSelect : function(index,rowData,event){
                    	//取到该行id值
             			var id=rowData["id"];
             			showmygridCIR2(id);
             			showmygridCIR3(id);
             			showmygridCIR4(id);
             			showmygridCIR5(id);
               }
    });
});
