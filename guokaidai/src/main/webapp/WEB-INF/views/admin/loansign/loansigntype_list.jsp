<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/loanSign/loansigntype.js"></script>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/loansigntype/seeDetails" target="navTab" height="500" width="750" rel="addloansigntype" mask="true"><span>添加</span></a></li>
			<li><a class="edit" id="editloansigntype" href="javascript:void(0);" height="350" width="520"><span>修改</span></a></li>
			<li><a class="delete" id="deleteone" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div id="search-lstype-panel">
		<div>
			<form method="post" id="searchlotypefrom">
				<span class="label">类&nbsp;&nbsp;型&nbsp;&nbsp;名：</span>
				<input type="text" class="" id="typename" name="typename" width="80px" height="35px" style="width:80px" />
				<span class="label">借款额度：</span>
				<input type="text" class="input-text" id="mincredit" name="mincredit"  style="width:70px" />
				<span class="label"> 元&nbsp;&nbsp;---</span>
				<input type="text" class="input-text" id="maxcredit" name="maxcredit"  style="width:70px"  />
				<span class="label">元 &nbsp;&nbsp;借款期限：</span>
				<input type="text" class="input-text" id="minmoney" name="minmoney"  style="width:70px"  />
				<span class="label"> 月&nbsp;&nbsp;---</span>
				<input type="text" class="input-text" id="maxmoney" name="maxmoney"  style="width:70px"  />
				<span class="label">月</span>
				<br/>
				<br/>
				<span class="label">借款标期：</span>
				<input type="text" class="input-text"  id="money"  name="money" style="width:80px"  />
				<span class="label">借款利率：</span>
				<input type="text" class="input-text" id="minrate" name="minrate"  style="width:70px"  />
				<span class="label">%&nbsp;&nbsp; ---</span>
				<input type="text" class="input-text" id="maxrate" name="maxrate"  style="width:70px"  />
				<span class="label">%&nbsp;&nbsp;&nbsp;&nbsp;</span>
				
				<span type="submit" id="button-lstype-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="loantypemygrid"></table>
	</div>
