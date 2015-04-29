<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	#borrow-search-panel span.om-combo,#borrow-search-panel span.om-calendar{
			vertical-align: middle;
		}
</style>
<script type="text/javascript" src="/resources/js/usermanager/borrowlist201401101109.js"></script>
<div layoutH="0">
		<div id="borrow-search-panel">
		   			<div>
		   				<form action="" method="post" id="searchborrowfrom">
		   				<span class="label">用户名：</span>
			   			<input type="text" name="userName" style="width: 88px;" class="input-text" />
			   			<span class="label">身份证号：</span>
			   			<input type="text" name="name" class="input-text" style="width: 88px;" onkeyup="value=value.replace(/[^\d\.]/g,'')" />
			   			<span class="label">注册时间：</span>
			   			<input type="text" id="bstart-time" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="bend-time" style="width: 88px;"  name="failTime" class="input-text"/>
			   			<span class="label">是否通过：</span>
			   			<input name="isLock" style="width: 88px;" id="bsearch-type" />
			   			<br /><br />
			   			<span class="label">积分：</span>
			   			<input name="errorNum" style="width: 88px;" />
			   			<span class="label">至：</span>
			   			<input name="isCreditor" style="width: 88px;" />
			   			<span class="label">申请时间：</span>
			   			<input type="text" id="bstart2-time" style="width: 88px;" name="pIpsAcctDate" class="input-text" />
			   			<span class="label">至：</span>
			   			<input type="text" name="pMerBillNo" style="width: 88px;" id="bend2-time"  class="input-text"/>
			   			<span class="label">授信额度：</span>
			   			<input type="text" name="password" style="width: 88px;" class="input-text" /> 以上
			   			<span class="label">登录次数：</span>
			   			<input type="text" id="countlogin" name="id" style="width: 88px;" class="input-text" /> 以上
			   			<span id="button-bsearch">搜索</span>
			   			</form>
		   			</div>
		   		</div>
		<div class="panelBar">
			<ul class="toolBar">
<!-- 				<li><a class="add" href="javascript:void(0);" id="adduser" ><span>添加借款人</span></a></li> -->
<!-- 				<li class="line">line</li> -->
				<li><a class="add" href="javascript:void(0);" id="updatecredit" ><span>修改授信额度</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="borrow-audit"><span>审核通过</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="borrow-noaudit"><span>审核不通过</span></a></li>
				<li class="line">line</li> 
				<li><a class="add" href="javascript:void(0);" id="set-suminte"><span>设置积分</span></a></li>
				<li class="line">line</li>
				<!-- <li><a class="add" href="javascript:void(0);" id="query-suminte"><span>自动积分查询</span></a></li>
				<li class="line">line</li>-->
				<li><a class="add" href="javascript:void(0);" id="browbtoRecordinfo"><span>历史交易记录</span></a></li>
			</ul>
		</div>
		<table id="borrow_show_list"></table>
		<div id="make-tab">
			<ul>
				<li><a id="baseinfo1" href="javascript:void(0);">基本信息</a></li>
				<li><a id="baseinfo2" href="javascript:void(0);">个人资料</a></li>
				<li><a id="baseinfo3" href="javascript:void(0);">联系方式</a></li>
				<li><a id="baseinfo4" href="javascript:void(0);">单位资料</a></li>
				<li><a id="baseinfo5" href="javascript:void(0);">财务状况</a></li>
				<li><a id="baseinfo6" href="javascript:void(0);">联保情况</a></li>
				<li><a id="baseinfo7" href="javascript:void(0);">商业图片</a></li>
				<li><a id="baseinfo8" href="javascript:void(0);">资料上传</a></li>
			</ul>
			
			<div id="userbaseinfo" >
				<table>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
       		</div>
			
		</div>
</div>
