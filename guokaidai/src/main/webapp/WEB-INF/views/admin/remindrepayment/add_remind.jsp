<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
	function doSubmit(){
		var content=$("#content").val().replace(/\s+/g,"");
		if(content.length==0){
			alertMsg.info("通知内容不能为空！");
			return false;
		}
		return true;
	}
</script>
<div class="pageContent">
	<form action="/remindRepaymentList/sendSms.htm" method="post" class="pageForm required-validate" onsubmit="return doSubmit()">
		<input type="hidden" value="${contactInfo[2]}" name="phone"/>
		<input type="hidden" value="${contactInfo[5]}" name="email"/>
		<input type="hidden" value="${repayId}" name="repayId"/>
		<div class="pageFormContent" width=492px; height=330px; layoutH="100">
		<table>
			<tr>
				<td width=80px; height=30px;>真实姓名：</td>
				<td width=100px; height=30px;>${contactInfo[0]}</td>
				<td width=80px; height=30px;>身份证号码：</td>
				<td width="120px;" height="30px;">${contactInfo[1]}</td>
				<td width=80px; height=30px;>联系电话：</td>
				<td width=100px; height=30px;>${contactInfo[2]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>现居地址：</td>
				<td width=80px; height=30px;>${contactInfo[3]}</td>
				<td width=80px; height=30px;>工作单位：</td>
				<td width=100px; height=30px;>${contactInfo[4]}</td>
				<td width=80px; height=30px;>常用邮箱：</td>
				<td width=80px; height=30px;>${contactInfo[5]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>借款标号：</td>
				<td width=80px; height=30px;>${contactInfo[6]}</td>
				<td width=80px; height=30px;>标题：</td>
				<td width=100px; height=30px;>${contactInfo[7]}</td>
				<td width=80px; height=30px;>借款标类型：</td>
				<td width=80px; height=30px;>${contactInfo[8]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>借款金额：</td>
				<td width=80px; height=30px;>${contactInfo[9]}</td>
				<td width=80px; height=30px;>还款期限：</td>
				<td width=100px; height=30px;>${contactInfo[10]}</td>
				<td width=80px; height=30px;>还款方式：</td>
				<td width=80px; height=30px;>${contactInfo[11]}</td>
			</tr>
			<tr>
				<td width=80px; height=30px;>预还款期数：</td>
				<td width=80px; height=30px;>${contactInfo[12]}</td>
				<td width=80px; height=30px;>预还款时间：</td>
				<td width=80px; height=30px;>${contactInfo[13]}</td>
				<td width=80px; height=30px;>预还款金额：</td>
				<td width=100px; height=30px;>${contactInfo[14]}</td>
			</tr>
			<tr>
				<td width=120px; height=30px;>催收邮件发送次数：</td>
				<td width=80px; height=30px;>${contactInfo[15]}</td>
				<td width=120px; height=30px;>催收短信发送次数：</td>
				<td width=80px; height=30px;>${contactInfo[16]}</td>
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
				<td colspan="3" width=310px; height=30px;><textarea rows="4" cols="50" class="required" name="content" id="content">
					
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