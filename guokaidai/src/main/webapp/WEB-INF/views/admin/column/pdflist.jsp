<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/pdflist.js"></script>
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

.unit textarea {
	width: 280px;
	height: 5em;
}
</style>
<div layoutH="0" class="pageContent">

	<div id="search-panel">
		<div>
			<form method="post" id="searchfrom">
				<span class="label">标题：</span> <input type="text" class="input-text"
					id="saveName" name="saveName" /> <span class="label">上传人：</span> <input
					type="text" class="input-text" id="name" name="name" /> <span
					type="submit" id="button-search">搜索</span>
			</form>
		</div>
	</div>
	
  

	<table id="mygridpdf"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a id="addAttachmentIcon" class="icon"><span>上传PDF文件</span>
			</a></li>
			<li><a class="delete" onclick="delConfirmMsg()"><span>删除附件</span>
			</a></li>
		</ul>
	</div>


</div>