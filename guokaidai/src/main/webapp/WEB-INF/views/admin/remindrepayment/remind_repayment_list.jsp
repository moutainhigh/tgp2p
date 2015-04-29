
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript" >
$(document).ready(function(){
	/**
	 * 进入催收通知
	 */
	$("#sendRepayRemind").click(function(){
		//取到选中记录
		var selections=$('#remindrepaygrid').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length<1){
			alertMsg.info("请选择要发送催收通知的记录！");
			return false;
		}else if(selections[0].repayState>3||selections[0].repayState==2){
			alertMsg.info("已经还款，无需催收！");
			return false;
		}
        var repayId=selections[0].repayId;
        //window.parent.dialog.title="发送催收通知"
        //window.parent.dialog.location="/remindRepaymentList/openSendRemind?repayId="+repayId;
       // window.open(, "dialog","rel='dlg_page1',title='发送催收通知'")
    	//打开编辑页面属性依次为：窗体id，路径、标题，重复打开是否刷新
		navTab.openTab("updateloanSign", "/remindRepaymentList/openSendRemind?repayId="+repayId, { title:"发送催收通知", fresh:true});
		
	});
	 //查询面板初始化
	 $("#search-panel-remind").omPanel({
     	title : "高级搜索",collapsible:true,
     	width:'fit'
     });
	 $('#day').omNumberField({
         allowDecimals : false,
         allowNegative : false
     });
	 $("#loanType").omCombo({
	     	emptyText : '请选择',
	     	forceSelection:true,
	         dataSource : [ {text:'普通标',value:'1'},
	    	                {text:'天标',value:'2'},
	    	                {text:'秒标',value:'3'},
	    	                {text:'流转标',value:'4'}]
	     });
	 $("#repayState").omCombo({
		 forceSelection:true,
		 dataSource:[{text:'未还款',value:'1'},
		             {text:'按时还款',value:'2'},
		             {text:'逾期未还款',value:'3'},
		             {text:'逾期已还款',value:'4'},
		             {text:'提前还款',value:'5'}],
		 value:'1'
	 })
	 $("#loanProductType").omCombo({
	     	emptyText : '请选择产品类型',
	     	forceSelection:true,
	     	dataSource : 'baseLoanSign/loanType.htm'
	   });
	  $("#publishTimeStart").omCalendar({
          showTime : true
      });
      $("#publishTimeEnd").omCalendar({
          showTime : true
      });
      $("#preRepayDateStart").omCalendar({
          showTime : false
      });
      $("#preRepayDateEnd").omCalendar({
          showTime : false
      });
      $("#factRepayDateStart").omCalendar({
          showTime : true
      });
      $("#factRepayDateEnd").omCalendar({
          showTime : true
      });
      
      $('#remindSMSCount').omNumberField({
          allowDecimals : false,
          allowNegative : false
      });	
      
      $('#remindEmailCount').omNumberField({
          allowDecimals : false,
          allowNegative : false
      });	
      $('span#button-search').omButton({
    	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
 	 	});
     
      $('span#button-search').click(function(){
    	  $('#remindrepaygrid').omGrid({extraData: $("#remindRepayForm").serializeObject()});
    	  $('#remindrepaygrid').omGrid('setData', '/remindRepaymentList/queryRemindRepayment');

      });
	//数据源面板
	$('#remindrepaygrid').omGrid({
        dataSource : '/remindRepaymentList/queryRemindRepayment',
        title : '催收列表',
        height : 336,
        limit : 10,
        method:'post',
        extraData: $("#remindRepayForm").serializeObject(),
        colModel : [ 
                    // {header : '序号', name : 'id', width : 25, align : 'center'}, 
                     {header : '借款标号', name : 'loanNumber', width : 100, align : 'center'}, 
                     {header : '标题', name : 'loanTitle', align : 'center', width : 100}, 
                     {header : '借款标类型', name : 'loancategory', align : 'center', width : 60},
                     {header : '借款标产品类型', name : 'loanproducttype', align : 'center', width : 100},
                     {header : '借款人', name : 'name', align : 'center', width : 60},
                    // {header : '最小出借单位', name : 'loanUnit', align : 'center', width : 80},
                     {header : '借款金额', name : 'issueLoan', align : 'center', width : 55},
                     {header : '还款期限', name : 'month', align : 'center', width : 50},
                     {header : '利率', name : 'rate', align : 'center', width : 60},
                    // {header : '借款管理费', name : 'mgtMoney', align : 'center', width : 60},
                   //  {header : '平台奖励', name : 'reward', align : 'center', width : 60},
                  //   {header : '成功借出份数', name : 'successfulLending', align : 'center', width : 80},
                  //   {header : '剩余份数', name : 'remainingCopies', align : 'center', width : 60},
                     {header : '还款方式', name : 'refundWay', align : 'center', width : 90},
                     {header : '发布时间', name : 'publishTime', align : 'center', width : 110},
                  //   {header : '借款标状态', name : 'loanstate', align : 'center', width : 70},
                     {header : '是否放款', name : 'iscredit', align : 'center', width : 60},
                     {header : '放款时间', name : 'creditTime', align : 'center', width : 110},
                    // {header : '是否显示', name : 'isShow', align : 'center', width : 50},
                    // {header : '推荐到首页', name : 'isRecommand', align : 'center', width : 50} 
                      {header : '期数', name : 'periods', align : 'center', width : 50},
                      {header : '预还款日期', name : 'preRepayDate', align : 'center', width : 70},
                      {header : '预还款金额', name : 'preRepayMoney', align : 'center', width : 110},
                      {header : '是否还款', name : 'isRepay', align : 'center', width : 50},
                      {header : '实际还款时间', name : 'repayTime', align : 'center', width : 110},
                      {header : '实际还款金额', name : 'realRepayMoney', align : 'center', width : 110},
                      {header : '邮件催收次数', name : 'remindEmailCount', align : 'center', width : 70},
                      {header : '短信催收次数', name : 'remindSMSCount', align : 'center', width : 70}
                      ],       
                     	//选中事件
						onRowSelect : function(index,rowData,event){
                    	//取到该行id值
             			//var id=rowData["id"];
             			//showmygrid2(id);
             			//showmygrid3(id);
             			//showmygrid4(id);
             			//showmygrid5(id);
               }
    });
	
	$("#excelDownload").click(function(){
		$("#remindRepayForm").prop("action","/remindRepaymentList/exportRepayList");	
		$("#remindRepayForm").submit();
	});
		
	
});
</script>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#search-panel-remind span.om-combo,#search-panel-remind span.om-calendar {
	vertical-align: middle;
}
.unit {
	clear: both;
	text-align: left;
}
.unit label {
	text-align: right;
	float: left;
	width: 100px;
}
.unit textarea{
	width: 280px;
	height: 5em;
}
</style>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon" id="sendRepayRemind" rel="dlg_page1" ><span>发送催收通知</span></a><br /><br /></li>
			<li><a class="icon" id="excelDownload"  ><span>导出催收列表</span></a><br /><br /></li>
		</ul>
	</div>
	<div id="search-panel-remind">
		<div>
			<form method="post" id="remindRepayForm">
				<span class="label">标题：</span>
				<input type="text" class="input-text" id="qloanTitle"
					name="loanTitle" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="label">借款标号：</span>
				<input type="text" class="input-text" id="loanNumber"
					name="loanNumber" />&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="label"> 借款人：</span>
				<input type="text" class="input-text" id="name" name="name" />&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="label">借款标类型：</span>
				<input id="loanType" style="width: 90px" name="loanType" />
				<br />
				<br />
				<span class="label">借款标产品类型：</span>
				<input id="loanProductType" style="width: 90px" name="loanProductType" />&nbsp;&nbsp;
				<span class="label">是否还款：</span>
				<input id="repayState" style="width: 90px" name="repayState" value="1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="label">催收邮件发送次数：</span>
				<input id="remindEmailCount" style="width: 90px" name="remindEmailCount" value="0"/>&nbsp;&nbsp;&nbsp;
				<span class="label">催收短信发送次数：</span>
				<input id="remindSMSCount" style="width: 90px" name="remindSMSCount" value="0"/>
				<br/>
				<br/>
				<span class="label">发布时间：</span>
				<input id="publishTimeStart" style="width: 150px" name="publishTimeStart" />
				<span class="label"> 至 </span>
				<input id="publishTimeEnd" style="width: 150px" name="publishTimeEnd" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="label">预还款日期：</span>
				<input id="preRepayDateStart" style="width: 88px" name="preRepayDateStart" />
				<span class="label"> 至 </span>
				<input id="preRepayDateEnd" style="width: 88px" name="preRepayDateEnd" value="${preRepayDateEnd}"/>
				<br/>
				<br/>
				<span class="label">实际还款时间：</span>
				<input id="factRepayDateStart" style="width: 150px" name="factRepayDateStart" />
				<span class="label"> 至 </span>
				<input id="factRepayDateEnd" style="width: 150px" name="factRepayDateEnd" />
				<span type="submit" id="button-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="remindrepaygrid"></table>
</div>