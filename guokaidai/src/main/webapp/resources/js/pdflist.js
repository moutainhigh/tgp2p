$(document).ready(function() {
    //上传pdf
	$("#addAttachmentIcon").click(function() {
		$.pdialog.open("/pdfManage/openDiaLog", "dialog", "添加pdf文件", {
			max : false,
			width : 420,
			height : 200,
			mask : true,
			close : relaodFileTable
		});
	});

	var relaodFileTable = function() {
		$('#mygridpdf').omGrid('reload');
		return true;
	}
	

	 //查询面板初始化
	 $("#search-panel").omPanel({
    	title : "高级搜索",collapsible:true,
    	width:'fit'
    });
	
     $('span#button-search').omButton({
   	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
     $('span#button-search').click(function(){
      $('#mygridpdf').omGrid({method:"post",extraData:$("#searchfrom").serializeObject()});	
   	  $('#mygridpdf').omGrid('setData', '/pdfManage/getPdfList');

     });
	
	
	
	// 附件

	$("#mygridpdf").omGrid({
		dataSource : '/pdfManage/getPdfList',
		title : '文件列表',
		height : 320,
		limit : 10,
		colModel : [ {
			header : '编号',
			name : 'id',
			width : 35,
			align : 'center'
		}, {
			header : '上传人',
			name : 'name',
			width : 120,
			align : 'center'
		}, {
			header : '上传',
			name : 'savePath',
			width : 120,
			align : 'center'
		}, {
			header : 'pdf名称',
			name : 'saveName',
			width : 100,
			align : 'center'
		}, {
			header : '上传时间',
			name : 'addTime',
			width : 120,
			align : 'center'
		}]
	});

});

function delConfirmMsg(){
	
	var selections=$('#mygridpdf').omGrid('getSelections',true);
	//判断是否选中
	if(selections==null || selections=="" || selections==undefined || selections.length<1){
		alertMsg.info("请选择信息！");
	}else{
		//得到选中的第一条记录
		var dataRow=selections[0];
		//得到id
		var id=dataRow.id;
		alertMsg.confirm("您确定要删除当前记录？", {
			okCall: function(){
				$.ajax({
					url:'/pdfManage/delPdf',
					data:'id='+id,
					type:'post',
					success:function(msg){
						if(msg){
							 $('#mygridpdf').omGrid('reload');//刷新当前页
							 alertMsg.correct("删除成功");
						}else{
							 alertMsg.info("删除失败！");
						}
					}
				});
			}
		});
		
	}
	
}
