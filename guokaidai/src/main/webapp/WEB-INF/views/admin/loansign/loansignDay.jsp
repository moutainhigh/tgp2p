
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/loanSign/loanSignDay.js"></script>

<style>
#searchLDAY-panel span.om-combo,#searchLDAY-panel span.om-calendar {
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
			<li><a class="add" href="/loanSignOfDay/queryDetails?operNumber=1" target="navTab" height="500" width="750" rel="addloanSignday" mask="true"><span>添加</span></a></li>
			<li><a class="edit" id="editLoansignday" href="javascript:void(0);" height="350" width="520"><span>编辑</span></a></li>
			<li><a class="delete" id="daydeleteAll" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="icon" id="dayFBloansign"><span>发布</span> </a></li>
			<li><a class="icon" id="dayFKloansign"><span>放款</span> </a></li>
			<li><a class="icon" id="loanEnd"><span>结束</span> </a></li>
			<li><a class="icon" id="dayqueryLoansign" href="javascript:void(0);" height="350" width="520"  ><span>查看详情</span></a></li>
			<li><a class="icon" id="dayEXPloansign"><span>导出借款标</span> </a></li>
			<li><a class="icon" href="/baseLoanSign/toLoanSignExpiring?loanType=2" target="dialog" rel="dlg_page1"  title="即将到期 [天标]" max="true"><span>即将到期</span></a></li>
		</ul>
	</div>

	<div id="searchLDAY-panel">
		<div>
			<form method="post" id="searchLDAYfrom">
				<span class="label">标题：</span>
				<input type="text" class="input-text" id="loanTitle" name="loanTitle" />
				<span class="label">借款标号：</span>
				<input type="text" class="input-text" id="loanNumber" name="loanNumber" />
				<span class="label"> 借款人名称：</span>
				<input type="text" class="input-text" id="name" name="unassureWay" />
				<span class="label">状态：</span>
				<input id="dayloanstate" style="width: 88px" name="riskAssess" />
				<br />
				<br />
				<span class="label">是否放款：</span>
				<input id="dayiscredit" style="width: 88px" name="loanCategory" />
				<span class="label">发布时间：</span>
				<input id="daybeginTime" style="width: 150px" name="creditTime" />
				<span class="label"> 至 </span>
				<input id="dayendTime" style="width: 150px" name="loanSignTime" />
				<span class="label">借款人名称：</span>
				<input type="text" class="input-text" id="name" name="unassureWay" />
				<span type="submit" id="buttonLDY-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="mygridLDAY1"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPDAYLoanRecord"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridLDAY2"></table>
	<table id="mygridLDAY3"></table>
	
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="addAttachmentIconDay" class="icon"><span>上传标图</span> </a>
			</li>
			<li>
				<a id="addAttachmentDay" class="icon"><span>上传借款方资料</span> </a>
			</li>
			<li>
				<a id="dayDeleteAttachment" class="edit"><span>删除附件</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridLDAY4"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="dayEditComment" class="edit" ><span>编辑</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridLDAY5"></table>
	
	 <div id="DayTimeRepay-form">
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
	                <td>实际还款金额:</td>
	                <td><input type="text" width: 115px; class="input-text" readonly="readonly" id="repaymentMoney2" name="repaymentMoney2" /></td>
	            </tr>
	        </table>
	 </div>
	<div id="dialogDay-form">
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
