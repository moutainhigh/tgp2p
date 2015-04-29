
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/loanSign/youxuan.js"></script>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#search-panel span.om-combo,#search-panel span.om-calendar {
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
			<li><a class="add" href="/loanSign/showDetails?operNumber=1" target="navTab" height="500" width="750" rel="addloanSign" mask="true"><span>添加</span></a></li>
			<li><a class="edit" id="editLoansign1" href="javascript:void(0);" height="350" width="520"><span>编辑</span></a></li>
			<li><a class="delete" id="deleteAll1"><span>删除</span></a></li>
			<li><a class="icon" id="FBloansign1"><span>发布</span> </a></li>
			<li><a class="icon" id="FKloansign1"><span>放款</span> </a></li>
			<li><a class="add" id="queryLoansign1" href="javascript:void(0);" height="350" width="520"  ><span>查看详情</span></a></li>
     		<!-- 	<li><a class="icon" id="EXPloansign"><span>导出理财计划</span> </a></li> -->
			<!-- <li><a class="icon" href="/baseLoanSign/toLoanSignExpiring?loanType=7" target="dialog" rel="dlg_page1"  title="即将到期 [普通标]" max="true"><span>即将到期</span></a><br /><br /></li> -->
		</ul>
	</div>

	<div id="search-panel">
		<div>
			<form method="post" id="searchfrom">
				<span class="label">标题：</span>
				<input type="text" class="input-text" id="qloanTitle"
					name="loanTitle" />
				<span class="label">状态：</span>
				<input id="loanstate1" style="width: 88px" name="riskAssess" />
				<span class="label">是否放款：</span>
				<input id="iscredit1" style="width: 88px" name="loanCategory" />
				<span class="label">发布时间：</span>
				<input id="beginTime" style="width: 150px" name="creditTime" />
				<span class="label"> 至 </span>
				<input id="endTime" style="width: 150px" name="loanSignTime" />
				<span type="submit" id="button-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="mygrid11"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecord"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygrid22"></table>
	
	<table id="mygrid33"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="addAttachmentIcon" class="icon"><span>上传标图/借款方资料</span> </a>
			</li>
			<li>
				<a id="deleteAttachment" class="delete"><span>删除附件</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygrid44"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="editComment" class="edit" ><span>编辑</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygrid55"></table>
	
		<div id="onTimeRepay-form">
	        <table>
	        	<input type="test" name="rid" style="display: none;"/>
	            <tr>
	                <td>&nbsp;&nbsp;还款期数：</td>
	                <td><input type="text"  width: 115px; readonly="readonly" id="periods" name="periods"/></td>
	            </tr>
	            <tr>
	                <td>&nbsp;&nbsp;还款时间：</td>
	                <td><input style="width: 115px" class="input-text" id="repayTime" name="repayTime" /></td>
	            </tr>
	        </table>
	 </div>
	 	<div id="exceedTimeRepayed-form">
	        <table>
	        	<input type="test" name="rid1" style="display: none;"/>
	            <tr>
	                <td>&nbsp;&nbsp;还款期数：</td>
	                <td><input type="text"  width: 115px; readonly="readonly" id="periods1" name="periods1"/></td>
	            </tr>
	            <tr>
	                <td>&nbsp;&nbsp;还款时间：</td>
	                <td><input style="width: 115px" class="input-text" id="repayTime1" name="repayTime1" /></td>
	            </tr>
	        </table>
	 </div>
	 <div id="advanceRepay-form">
	        <table>
	        	<input type="test" name="rid2" style="display: none;"/>
	            <tr>
	                <td>&nbsp;&nbsp;还款期数：</td>
	                <td><input type="text"  width: 115px; readonly="readonly" id="periods2" name="periods2"/></td>
	            </tr>
	            <tr>
	                <td>&nbsp;&nbsp;还款时间：</td>
	                <td><input style="width: 115px" class="input-text" id="repayTime2" name="repayTime2" /></td>
	            </tr>
	            <tr>
	                <td>实际借款天数：</td>
	               	 <td><input type="text" width: 115px; readonly="readonly" id="useRealDay" name="useRealDay"/></td>
	            </tr>
	            <tr>
	                <td>预计利息收益：</td>
	                <td><input type="text" width: 115px; readonly="readonly" id="expectedInterest2" name="expectedInterest2" /></td>
	            </tr>
	            <tr>
	                <td>实际利息收益:</td>
	                <td><input type="text" width: 115px; class="input-text" readonly="readonly" id="actualInterest2" name="actualInterest2" /></td>
	            </tr>
	            <tr>
	                <td>利息收益差额:</td>
	                <td><input type="text" width: 115px; class="input-text" readonly="readonly" id="gapInterest2" name="gapInterest2" /></td>
	            </tr>
	            <tr>
	                <td>提前还款本息:</td>
	                <td><input type="text" width: 115px; class="input-text" readonly="readonly" id="repaymentMoney2" name="repaymentMoney2" /></td>
	            </tr>
	        </table>
	 </div>
	<!--回复--->
	<div id="dialog-form">
			<div class="pageFormContent">
				<div class="unit">
					<label>
						评论人：
					</label>
					<input name="id" type="hidden" />
					<input name=name readonly="readonly" />
				</div>
				<div class="unit">
					<label>
						是否显示：
					</label>
					<select name="cmtIsShow" style="width: 150px">
						<option value="1" selected="selected">显示</option>
						<option value="0">不显示</option>
					</select>
				</div>
				<div class="unit">
					<label>
						评论类容：
					</label>
					<textarea name="cmtcontent" readonly="readonly"></textarea>
				</div>
				<div class="unit">
					<label>
						回复：
					</label>
					<textarea name="cmtReply"></textarea>
				</div>
			</div>
	</div>
</div>