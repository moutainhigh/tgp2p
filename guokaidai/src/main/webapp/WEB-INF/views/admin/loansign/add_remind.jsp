<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	<form action="/baseLoanSign/sendSms.htm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
		<input type="hidden" value="${loan[2]}" name="phone"/>
		<input type="hidden" value="${loan[5]}" name="email"/>
		<div class="pageFormContent" width=492px; height=330px; layoutH="100">
		<table>
			<tr>
				<td width=80px; height=30px;>真实姓名：</td>
				<td width=100px; height=30px;>${loan[0]}</td>
				<td width=80px; height=30px;>身份证号码：</td>
				<td width="120px;" height="30px;">${loan[1]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>联系电话：</td>
				<td width=100px; height=30px;>${loan[2]}</td>
				<td width=80px; height=30px;>现居地址：</td>
				<td width=80px; height=30px;>${loan[3]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>工作单位：</td>
				<td width=100px; height=30px;>${loan[4]}</td>
				<td width=80px; height=30px;>常用邮箱：</td>
				<td width=80px; height=30px;>${loan[5]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>通知方式：</td>
				<td colspan="3" width=310px; height=30px;><select name="fashion">
					<option value="0">发送短信</option>
					<option value="1">发送邮件</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>通知内容：</td>
				<td colspan="3" width=310px; height=30px;><textarea rows="4" cols="50" class="required" name="content">
					
				</textarea></td>
			</tr>
		</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">确定发送</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
 <script type="text/javascript" src="/resources/js/creditor.js" type="text/javascript"></script>