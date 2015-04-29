$(document).ready(function(){
	
	/**
	 * 编辑标
	 */
	$("#editLoansignSec").click(function(){
		//取到选中记录
		var selections=$('#mygridLSEC1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("updateloanSignSec", "/loanSignOfSec/queryDetails?operNumber=2&id="+selections[0].id, { title:"编辑", fresh:true});
		}
	});
	 //导出借款标列表
	$("#secEXPloansign").click(function(){
        top.window.location='/loanSignOfSec/outPutExcel';
	});
	/**
	 * 查看标详情
	 */
	$("#secqueryLoansign").click(function(){
		//取到选中记录
		var selections=$('#mygridLSEC1').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择标信息！");
		}else{
			//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
			navTab.openTab("queryloanSignSec", "/loanSignOfSec/queryDetails?operNumber=3&id="+selections[0].id, { title:"查看详情", fresh:true});
		}
	});

	
		/****************数据源**************/
		//加载出借记录列表
		var showmygridSec2 = function(id){
			$("#mygridLSEC2").omGrid({
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
	
		//评论
		var showmygridSec5= function(id){
			$("#mygridLSEC5").omGrid({
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
		
		
		showmygridSec2(0);
		showmygridSec5(0);
		
		
	 //查询面板初始化
	 $("#searchLSEC-panel").omPanel({
     	title : "高级搜索",collapsible:true,
     	width:'fit'
     });
	 $("#secloanstate").omCombo({
    	emptyText : '请选择',
     	forceSelection:true,
         dataSource : [ {text:'未发布',value:'1'},
    	                {text:'进行中',value:'2'},
    	                {text:'回款中',value:'3'},
    	                {text:'已完成',value:'4'} ]
     });
	 $("#seciscredit").omCombo({
	     	emptyText : '请选择',
	     	forceSelection:true,
	         dataSource : [ {text:'已放款',value:'1'},
	    	                {text:'未放款',value:'2'} ]
	     });
	 $("#secloanCategory").omCombo({
	     	emptyText : '请选择类型',
	     	forceSelection:true,
	         dataSource : 'baseLoanSign/loanType.htm'
	     });
	  $("#secbeginTime").omCalendar({
          showTime : true
      });
      $("#secendTime").omCalendar({
          showTime : true
      });
      $('span#buttonLSY-search').omButton({
    	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
 	 	});
      $('span#buttonLSY-search').click(function(){
    	  $('#mygridLSEC1').omGrid('setData', '/loanSignOfSec/list?'+$("#searchLSECfrom").serialize());
      });
      /*******按钮及事件********/
   
		
    //删除借款标
		$("#secdeleteAll").click(function(){
			var selections=$('#mygridLSEC1').omGrid('getSelections',true);
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
						 $('#mygridLSEC1').omGrid('reload');//刷新当前页数据
		                 alertMsg.correct("删除数据成功");
					}else if(msg==2){
						$('#mygridLSEC1').omGrid('reload');//刷新当前页数据
						alertMsg.info("只能删除未发布的借款标");
					}else{
						alertMsg.info("删除数据失败");
					}
				}
			});
		});
		
		//导出出借记录
		$("#EXPSECLoanRecord").click(function(){
			var selections=$('#mygridLSEC1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择一条借款标信息！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            top.window.location='/baseLoanSign/outPutLoanrecordExcel?id='+toDeleteRecordID;
		});
	
		//发布
		$("#secFBloansign").click(function(){
			var selections=$('#mygridLSEC1').omGrid('getSelections',true);
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
		

		/**
		 * 上传标图
		 */
		$("#SECAddAttachment").click(function(){
			//取到选中记录
			var selections=$('#mygridLSEC1').omGrid('getSelections',true);
			//判断是否选中
			if(selections==null || selections=="" || selections==undefined || selections.length<1){
				alertMsg.info("请选择标信息！");
			}else{
				//得到选中的第一条记录的id
				var id=selections[0].id;
				$.pdialog.open("/attachment/openAddPage?id="+id+"&type="+1,"dialog", "添加标图", { max:false,width: 420, height: 200,mask:true,close:relaodFileTable});
			}
		});
		var relaodFileTable=function (){
			$('#mygridLSEC1').omGrid('reload');
			return true;
		}
		
		//还款
		$("#secHKloansign").click(function(){
			var selections=$('#mygridLSEC1').omGrid('getSelections',true);
            if (selections.length == 0) {
            	alertMsg.info("请选择要进行还款的记录！");
                return false;
            }
            var toDeleteRecordID=selections[0].id;
            $.ajax({
    			data:'loanSignId='+toDeleteRecordID,
    			url:'/loanSignOfSec/onTimeRepay',
    			type:'post',
    			success:function(msg){
    				if(msg==1){
    					 $('#mygridLSEC1').omGrid('reload');//刷新当前页数据
    					 alertMsg.correct("秒标还款成功！");
    				}else if(msg==3){
    					alertMsg.info("只能针对回款中的秒标进行还款！");
    				}else{
    					alertMsg.info("还款失败,请尝试刷新页面！");
    				}
    			}
    		});
		});
		
		//编辑
		$('#SECEditComment').bind('click', function() {
	        var selections=$('#mygridLSEC5').omGrid('getSelections',true);
	        if (selections.length == 0) {
	        	alertMsg.info("请选择要编辑的评论！");
	            return false;
	        }
	        showDialog('编辑',selections[0]);//显示dialog
	    });
		var dialog = $("#dialogSEC-form").omDialog({
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
	                $("#dialogSEC-form").omDialog("close");//关闭dialog
	            }
	        }
	    });

		//结束
		$("#loanEnd").click(function(){
			var selections=$('#mygridLSEC1').omGrid('getSelections',true);
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
    					 $('#mygridLSEC1').omGrid('reload');//刷新当前页数据
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
	        		$("#dialogSEC-form").omDialog("close"); //关闭dialog
		              $('#mygridLSEC5').omGrid('reload');//如果是修改则刷新当前页
		              alertMsg.correct("修改数据成功");
	        	}else{
	        		$("#dialogSEC-form").omDialog("close"); //关闭dialog
	        		 alertMsg.correct("修改数据失败");
	        	}
	        	
	        });
	    };
	    
	    
	    
	//数据源面板
	$('#mygridLSEC1').omGrid({
        dataSource : '/loanSignOfSec/list',
        title : '秒标列表',
        height : 336,
        limit : 10,
        colModel : [ 
                     {header : '序号', name : 'id', width : 25, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '标题', name : 'loanTitle', align : 'center', width : 100}, 
                     {header : '最小出借单位', name : 'loanUnit', align : 'center', width : 80},
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 55},
                     {header : '发布时间', name : 'publishTime', align : 'center', width : 110},
                     {header : '利率', name : 'rate', align : 'center', width : 60},
                     {header : '成功借出份数', name : 'successfulLending', align : 'center', width : 80},
                     {header : '剩余份数', name : 'remainingCopies', align : 'center', width : 60},
                     {header : '状态', name : 'loanstate', align : 'center', width : 70},
                     {header : '是否放款', name : 'iscredit', align : 'center', width : 60},
                     {header : '借款标类型', name : 'loanCategory', align : 'center', width : 60},
                     {header : '是否显示', name : 'isShow', align : 'center', width : 50},
                     {header : '推荐到首页', name : 'isRecommand', align : 'center', width : 50}
                     ],
                     //选中事件
					onRowSelect : function(index,rowData,event){
					//取到该行id值
					var id=rowData["id"];
					showmygridSec2(id);
					showmygridSec5(id);
}
                     
    });
});
