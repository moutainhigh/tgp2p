$(document).ready(function(){
	
	/**
	 * 编辑标
	 */
	$("#editLoansignday").click(function(){
		//取到选中记录
		var selections=$('#mygridLDAY1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("updateloanSignDay", "/loanSignOfDay/queryDetails?operNumber=2&id="+selections[0].id, { title:"编辑", fresh:true});
		}
	});
	 //导出天标列表
	$("#dayEXPloansign").click(function(){
        top.window.location='/loanSignOfDay/outPutExcel';
	});
	/**
	 * 查看标详情
	 */
	$("#dayqueryLoansign").click(function(){
		//取到选中记录
		var selections=$('#mygridLDAY1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("queryloanSignday", "/loanSignOfDay/queryDetails?operNumber=3&id="+selections[0].id, { title:"查看详情", fresh:true});
		}
	});

	/**
	 * 上传借款方资料
	 */
	$("#addAttachmentDay").click(function(){
		//取到选中记录
		var selections=$('#mygridLDAY1').omGrid('getSelections',true);
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
	$("#addAttachmentIconDay").click(function(){
		//取到选中记录
		var selections=$('#mygridLDAY1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//得到选中的第一条记录的id
			var id=selections[0].id;
			$.pdialog.open("/attachment/openAddPage?id="+id+"&type="+1,"dialog", "添加标图", { max:false,width: 420, height: 200,mask:true,close:relaodFileTable});
		}
	});
	
	$("#dayDeleteAttachment").click(function(){
		//取到选中记录
		var selections=$('#mygridLDAY4').omGrid('getSelections',true);
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
						 $('#mygridLDAY4').omGrid('删除成功！');//刷新当前页
							alertMsg.info("删除成功！");
					}else{
							alertMsg.info("删除失败！");
					}
				}
			});
		}
	});
	
	
	var relaodFileTable=function (){
		$('#mygridLDAY4').omGrid('reload');
		return true;
	}
	
	$("#repayTime2").omCalendar({
		 readOnly : true,
		 onSelect : function(date,event) {
		 	var selections=$('#mygridLDAY3').omGrid('getSelections',true);
		 	var month=date.getMonth() + 1;
		 	if(month<10){
		 	   var dates =date.getFullYear() + "-0" +month  + "-" +date.getDate();
		 	}else{
		 	   var dates =date.getFullYear() + "-" + month + "-" +date.getDate();
		 	}
        
           $.ajax({
   			data:'repaymentrecordId='+selections[0].id+"&repayTime="+dates,
   			url:'/loanSignOfDay/daytime_repay_compute',
   			type:'post',
   			success:function(msg){
           	   if(msg[0]==0){
           		   alertMsg.correct(msg[1]);
           		   $("input[name='repaymentMoney2']",DayTimeRepaydialog).val("");
           	   }else{
           		   $("input[name='repaymentMoney2']",DayTimeRepaydialog).val(msg[1]);
           	   }
   			}
   		});
		 }
     });
	
	var DayTimeRepaydialog = $("#DayTimeRepay-form").omDialog({
        width: 300,
        autoOpen : false,
        modal : true,
        resizable : false,
        buttons : {
            "提交" : function(){
				var repaymentMoney=$("input[name='repaymentMoney2']",DayTimeRepaydialog).val();
				var repayTime=$("input[name='repayTime2']",DayTimeRepaydialog).val();
				if(repayTime==""){
					alertMsg.info("请选择还款时间！");
					 return false;
				}
				if(repaymentMoney==""){
					alertMsg.info("请选择正确的还款时间！");
					 return false;
				}
				var selections=$('#mygridLDAY3').omGrid('getSelections',true);
				$.ajax({
        			data:'repaymentRecordId='+selections[0].id+"&repayTime="+repayTime,
        			url:'/loanSignOfDay/daytime_repay',
        			type:'post',
        			success:function(msg){
        				if(msg==1){
        					 $("#DayTimeRepay-form").omDialog("close");//关闭dialog
        					 $('#mygridLDAY3').omGrid('reload');//刷新当前页数据
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
                $("#DayTimeRepay-form").omDialog("close");//关闭dialog
            }
        }
    });
	$("#DayTimeRepay").click(function(){
		var selections=$('#mygridLDAY3').omGrid('getSelections',true);
		var selections1=$('#mygridLDAY1').omGrid('getSelections',true);
        if (selections.length == 0) {
        	 alertMsg.info("请选择要还款的记录！");
            return false;
        }
        if(selections[0].repayState!=""){
            alertMsg.info("还款失败,只有未还款的记录可以还款！");
            return false;
       	}
        $("input[name='rid2']", DayTimeRepaydialog).val(selections[0].id);
        $("input[name='periods2']", DayTimeRepaydialog).val(selections[0].periods);
        DayTimeRepaydialog.omDialog("option", "title","天标还款");
        DayTimeRepaydialog.omDialog("open");//显示dialog
	});
		/****************数据源**************/
		//加载出借记录列表
		var showmygridday2 = function(id){
			$("#mygridLDAY2").omGrid({
				dataSource: "/baseLoanSign/loanrecordList?id="+id,
				title : '出借记录',
		        height : 320,
		        limit : 10,
		        colModel : [ {header : '出借人', name : 'bname', width : 100, align : 'center'},
		                     {header : '天利率', name : 'rate', width : 55, align : 'center'},
		                     {header : '投标金额', name : 'tenderMoney', align : 'center', width :100},
		                     {header : '支付状态', name : 'isSucceed',width:120, align : 'center'},
		                     {header : '投标时间', name : 'tenderTime',width:120, align : 'center'} ]
		   });
		};
	
		//还款记录
		var showmygridday3= function(id){
			$("#mygridLDAY3").omGrid({
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
		                     {header : '实际还款金额', name : 'realmoney',width:120, align : 'center'}]
		   });
		};
		//附件
		var showmygridday4= function(id){
			$("#mygridLDAY4").omGrid({
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
		var showmygridday5= function(id){
			$("#mygridLDAY5").omGrid({
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
		
		
		showmygridday2(0);
		showmygridday3(0);
		showmygridday4(0);
		showmygridday5(0);
		
		//编辑评论
		$('#dayEditComment').bind('click', function() {
	        var selections=$('#mygridLDAY5').omGrid('getSelections',true);
	        if (selections.length == 0) {
	        	alertMsg.info("请选择要编辑的评论！");
	            return false;
	        }
	        showDialog('编辑',selections[0]);//显示dialog
	    });
		var dialog = $("#dialogDay-form").omDialog({
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
	                $("#dialogDay-form").omDialog("close");//关闭dialog
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
	        		$("#dialogDay-form").omDialog("close"); //关闭dialog
		              $('#mygridLDAY5').omGrid('reload');//如果是修改则刷新当前页
		              alertMsg.correct("修改数据成功");
	        	}else{
	        		$("#dialogDay-form").omDialog("close"); //关闭dialog
	        		 alertMsg.correct("修改数据失败");
	        	}
	        	
	        });
	    };
		
	 //查询面板初始化
	 $("#searchLDAY-panel").omPanel({
     	title : "高级搜索",collapsible:true,
     	width:'fit'
     });
	 $("#dayloanstate").omCombo({
    	emptyText : '请选择',
     	forceSelection:true,
         dataSource : [ {text:'未发布',value:'1'},
    	                {text:'进行中',value:'2'},
    	                {text:'回款中',value:'3'},
    	                {text:'已完成',value:'4'} ]
     });
	 $("#dayiscredit").omCombo({
	     	emptyText : '请选择',
	     	forceSelection:true,
	     	dataSource : 'baseLoanSign/loanType.htm'
	     });
	 $("#dayloanCategory").omCombo({
	     	emptyText : '请选择类型',
	     	forceSelection:true,
	         dataSource : [ {text:'信用标',value:'1'},
	    	                {text:'抵押标',value:'2'} ]
	     });
	  $("#daybeginTime").omCalendar({
          showTime : true
      });
      $("#dayendTime").omCalendar({
          showTime : true
      });
      $('span#buttonLDY-search').omButton({
    	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
 	 	});
      $('span#buttonLDY-search').click(function(){
    	  $('#mygridLDAY1').omGrid('setData', '/loanSignOfDay/list?'+$("#searchLDAYfrom").serialize());
      });
      /*******按钮及事件********/
   
		
    //删除天标
		$("#daydeleteAll").click(function(){
			var selections=$('#mygridLDAY1').omGrid('getSelections',true);
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
						 $('#mygridLDAY1').omGrid('reload');//刷新当前页数据
		                 alertMsg.correct("删除数据成功");
					}else if(msg==2){
						$('#mygridLDAY1').omGrid('reload');//刷新当前页数据
						alertMsg.info("只能删除未发布的天标");
					}else{
						alertMsg.info("删除数据失败");
					}
				}
			});
		});
		
		//导出出借记录
		$("#EXPDAYLoanRecord").click(function(){
			var selections=$('#mygridLDAY1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择信息！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            top.window.location='/baseLoanSign/outPutLoanrecordExcel?id='+toDeleteRecordID;
		});
	
		//发布
		$("#dayFBloansign").click(function(){
			var selections=$('#mygridLDAY1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要发布的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'loanSignId='+toDeleteRecordID,
    			url:'/baseLoanSign/publish',
    			type:'post',
    			success:function(msg){
    				if(msg==3){
    					window.open("/baseLoanSign/gotoIPS.htm");
    					 $('#mygrid1').omGrid('reload');//刷新当前页数据
    	                 alertMsg.correct("已经提交，请稍候！");
    				}else if(msg==2){
    					alertMsg.info("发布失败,只能发布未发布的标,请尝试刷新页面！");
    				}else{
    					alertMsg.info("发布失败！");
    					$('#mygrid1').omGrid('reload');

    				}
    			}
    		});
		});

		//结束
		$("#loanEnd").click(function(){
			var selections=$('#mygridLDAY1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要结束的标！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'loanSignId='+toDeleteRecordID,
    			url:'/baseLoanSign/loanEnd',
    			type:'post',
    			success:function(msg){
    				if(msg==0){
    					window.open("/baseLoanSign/gotoIPS.htm");
    					 $('#mygridLDAY1').omGrid('reload');//刷新当前页数据
//    					 alertMsg.correct("标的结束！");
    				}else if(msg==2){
    					alertMsg.info("操作失败,数据加密出错！");
    				}else if(msg==3){
    					alertMsg.info("操作失败,该标不能结束！");
    				}else if(msg==6){
    					alertMsg.info("操作失败,该标还未发布！");
    				}
    			}
    		});
		});			
		
		//放款
		$("#dayFKloansign").click(function(){
			var selections=$('#mygridLDAY1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要进行放款的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'loanSignId='+toDeleteRecordID,
    			url:'/baseLoanSign/credit',
    			type:'post',
    			success:function(msg){
    				if(msg==1){
    					 $('#mygridLDAY1').omGrid('reload');//刷新当前页数据
    					 alertMsg.correct("天标放款成功！");
    				}else if(msg==2){
    					alertMsg.info("放款失败,只有进行中的标可以放款,请尝试刷新页面！");
    				}else if(msg==3){
    					alertMsg.info("放款失败,该标未满标,请尝试刷新页面！");
    				}else{
    					alertMsg.info("放款失败,请尝试刷新页面！");
    				}
    			}
    		});
		});
	//数据源面板
	$('#mygridLDAY1').omGrid({
        dataSource : '/loanSignOfDay/list',
        title : '天标列表',
        height : 336,
        limit : 10,
        colModel : [ 
                     {header : '序号', name : 'id', width : 25, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '标题', name : 'loanTitle', align : 'center', width : 100}, 
                     {header : '借款人', name : 'name', align : 'center', width : 70},
                     {header : '最小出借单位', name : 'loanUnit', align : 'center', width : 80},
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 55},
                     {header : '天利率', name : 'rate', align : 'center', width : 60},
                     {header : '成功借出份数', name : 'successfulLending', align : 'center', width : 80},
                     {header : '剩余份数', name : 'remainingCopies', align : 'center', width : 60},
                     {header : '借款标状态', name : 'loanstate', align : 'center', width : 70},
                     {header : '发布时间', name : 'publishTime', align : 'center', width : 110},
                     {header : '是否放款', name : 'iscredit', align : 'center', width : 60},
                     {header : '放款时间', name : 'creditTime', align : 'center', width : 110},
                     {header : '借款标类型', name : 'loanCategory', align : 'center', width : 60},
                     {header : '是否显示', name : 'isShow', align : 'center', width : 50},
                     {header : '推荐到首页', name : 'isRecommand', align : 'center', width : 50}
                     ],
                     //选中事件
					onRowSelect : function(index,rowData,event){
					//取到该行id值
					var id=rowData["id"];
					showmygridday2(id);
					showmygridday3(id);
					showmygridday4(id);
					showmygridday5(id);
}
                     
    });
});
