
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/loanSign/loanSignCir.js"></script>
<style>
#searchCIR-panel span.om-combo,#searchCIR-panel span.om-calendar {
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
			<li><a class="add" href="/loanSignOfCir/queryDetails?operNumber=1" target="navTab" height="500" width="750" rel="addloanSignSic" mask="true"><span>添加</span></a></li>
			<li><a class="icon" id="FBloansignCIR"><span>发布</span> </a></li>
			<li><a class="icon" id="FKloansignCIR"><span>放款</span> </a></li>
			<li><a class="add" id="queryLoansignCIR" href="javascript:void(0);" height="350" width="520"  ><span>查看详情</span></a></li>
			<li><a class="icon" id="EXPloansignCIR"><span>导出债权转让标</span> </a></li>
		</ul>
	</div>

	<div id="searchCIR-panel">
		<div>
			<form method="post" id="searchCIRfrom">
				<span class="label">标题：</span>
				<input type="text" class="input-text" id="loanTitle"
					name="loanTitle" />
				<span class="label">借款标号：</span>
				<input type="text" class="input-text" id="loanNumber"
					name="loanNumber" />
				<span class="label"> 借款人：</span>
				<input type="text" class="input-text" id="name" name="unassureWay" />
				<span class="label">状态：</span>
				<input id="loanstate" style="width: 88px" name="riskAssess" />
				<br />
				<br />
				<span class="label">是否放款：</span>
				<input id="isCredit" style="width: 88px" name="loanCategory" />
				<span class="label">发布时间：</span>
				<input id="beginTime" style="width: 150px" name="creditTime" />
				<span class="label"> 至 </span>
				<input id="endTime" style="width: 150px" name="loanSignTime" />
				<span type="submit" id="button-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="mygridCIR1"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecordCIR"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridCIR2"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="onTimeRepayCIR" class="edit"><span>按时还款</span> </a>
			</li>
			<li>
				<a id="exceedTimeRepayCIR" class="edit"><span>逾期还款</span> </a>
			</li>
			<li>
				<a id="exceedTimeRepayedCIR" class="edit"><span>逾期已还款</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridCIR3"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="addAttachmentIconCIR" class="icon"><span>上传标图</span> </a>
			</li>
			<li>
				<a id="addAttachmentCIR" class="icon"><span>上传借款方资料</span> </a>
			</li>
			<li>
				<a id="deleteAttachmentCIR" class="delete"><span>删除附件</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridCIR4"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="editCommentCIR" class="edit" ><span>编辑</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridCIR5"></table>
	
		<div id="onTimeRepayCIR-form">
		        <table>
		        	<input type="test" name="rid" style="display: none;"/>
		            <tr>
		                <td>&nbsp;&nbsp;还款期数：</td>
		                <td><input type="text"  width: 115px; readonly="readonly" id="periods" name="periods"/></td>
		            </tr>
		            <tr>
		                <td>&nbsp;&nbsp;还款时间：</td>
		                <td><input style="width: 115px" class="input-text" id="repayTimeCIR" name="repayTime" /></td>
		            </tr>
		        </table>
		 </div>
	 	<div id="exceedTimeRepayedCIR-form">
	        <table>
	        	<input type="test" name="rid1" style="display: none;"/>
	            <tr>
	                <td>&nbsp;&nbsp;还款期数：</td>
	                <td><input type="text"  width: 115px; readonly="readonly" id="periods1" name="periods1"/></td>
	            </tr>
	            <tr>
	                <td>&nbsp;&nbsp;还款时间：</td>
	                <td><input style="width: 115px" class="input-text" id="repayTimeCIR1" name="repayTime1" /></td>
	            </tr>
	        </table>
	 </div>
		<!--	回复--->
	<div id="dialogCIR-form">
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
