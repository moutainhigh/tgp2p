<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/loanSign/loanSignSec.js"></script>

<style>
#searchLSEC-panel span.om-combo,#searchLSEC-panel span.om-calendar {
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
			<li><a class="add" href="/loanSignOfSec/queryDetails?operNumber=1" target="navTab" height="500" width="750" rel="addloanSignday" mask="true"><span>添加</span></a></li>
			<li><a class="edit" id="editLoansignSec" href="javascript:void(0);" height="350" width="520"><span>编辑</span></a></li>
			<li><a class="delete" id="secdeleteAll" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="icon" id="secFBloansign"><span>发布</span> </a></li>
			<li><a class="icon" id="secHKloansign"><span>放款</span> </a></li>
			<li><a class="icon" id="secHKloansign"><span>还款</span> </a></li>
			<li><a class="icon" id="loanEnd"><span>结束</span> </a></li>
			<li><a id="SECAddAttachment" class="icon"><span>上传标图</span> </a></li>
			<li><a class="icon" id="secqueryLoansign" href="javascript:void(0);" height="350" width="520"  ><span>查看详情</span></a></li>
			<li><a class="icon" id="secEXPloansign"><span>导出借款标</span> </a></li>
		</ul>
	</div>

	<div id="searchLSEC-panel">
		<div>
			<form method="post" id="searchLSECfrom">
				<span class="label">标题：</span>
				<input type="text" class="input-text" id="loanTitle" name="loanTitle" />
				<span class="label">借款标号：</span>
				<input type="text" class="input-text" id="loanNumber" name="loanNumber" />
				<span class="label">状态：</span>
				<input id="secloanstate" style="width: 88px" name="riskAssess" />
				<span class="label">是否放款：</span>
				<input id="seciscredit" style="width: 88px" name="loanCategory" />
				<br />
				<br />
				<span class="label">借款人名称：</span>
				<input type="text" class="input-text" id="name" name="unassureWay" />
				<span class="label">发布时间：</span>
				<input id="secbeginTime" style="width: 150px" name="creditTime" />
				<span class="label"> 至 </span>
				<input id="secendTime" style="width: 150px" name="loanSignTime" />
				<span type="submit" id="buttonLSY-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="mygridLSEC1"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPSECLoanRecord"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridLSEC2"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="SECEditComment" class="edit" ><span>编辑</span> </a>
			</li>
		</ul>
	</div>
	<table id="mygridLSEC5"></table>
	
	<div id="dialogSEC-form">
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
