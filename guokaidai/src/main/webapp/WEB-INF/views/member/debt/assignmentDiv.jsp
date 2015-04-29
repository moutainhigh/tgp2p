<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/vipcenter.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>resources/js/ymPrompt.js"></script>
<script  type="text/javascript">
var path="<%=basePath%>";
function showOne(){
    document.getElementById("isShowDiv").style.display="none";
 }
 function showClick(){
	 var loan_Id=document.getElementById("loanId").value;
	 var tender_Money=document.getElementById("tenderMoney").value;
	 var discount=document.getElementById("discount").value;
	 var appreciation=document.getElementById("appreciation").value;
	 if(discount==""&&appreciation==""){
		 ymPrompt.errorInfo('申请债权转让失败,请填写升值点或折扣点',400,200,'失败',null);
		 document.getElementById("isShowDiv").style.display="none";
		 return;
	 }
	 if(discount!=""&&appreciation!=""){
		 ymPrompt.errorInfo('申请债权转让失败,在升值点或折扣点只能输入一个',400,200,'失败',null);
		 document.getElementById("discount").value="";
		 document.getElementById("appreciation").value="";
		 document.getElementById("isShowDiv").style.display="none";
		 return;
	 }
	 if(!isNaN(discount)){   
		 if(discount<0||discount>100){
			 ymPrompt.errorInfo('请填写数字在0-100之内的',300,200,'失败',null);
			 document.getElementById("isShowDiv").style.display="none";
			 document.getElementById("discount").value="";
			 return;
		 }
	 }else{  
		ymPrompt.errorInfo('请填写数字',300,200,'失败',null);
		document.getElementById("isShowDiv").style.display="none";
		document.getElementById("discount").value="";
		return;
	   }
	 if(!isNaN(appreciation)){   
		 if(appreciation<0||appreciation>100){
			 ymPrompt.errorInfo('请填写数字在0-100之内的',300,200,'失败',null);
			 document.getElementById("isShowDiv").style.display="none";
			 document.getElementById("appreciation").value="";
			 return;
		 }
	 }else{  
		ymPrompt.errorInfo('请填写数字',300,200,'失败',null);
		document.getElementById("isShowDiv").style.display="none";
		document.getElementById("appreciation").value="";
		return;
	   }
	 document.getElementById("isShowDiv").style.display="none";
	 $.ajax({
			type:'post',
			data:'tenderMoney='+tender_Money+'&loanId='+loan_Id+'&discount='+discount+'&appreciation='+appreciation,
			url:path+'member_debt/assignmentPost',
			success:function(msg){
			     if(msg=="0"){
					   ymPrompt.succeedInfo('申请债权转让成功',300,200,'成功',null);
				 }else if(msg==1){
				        ymPrompt.errorInfo('已申请转让过，不能再申请',300,200,'失败',null);
				 }else if(msg==2){
					   ymPrompt.errorInfo('申请债权转让失败',300,200,'失败',null);
				 }
			}
		});	 
	document.getElementById("loanId").value="";
	document.getElementById("tenderMoney").value="";
	document.getElementById("discount").value="";
	document.getElementById("appreciation").value="";
 }
</script>
</head>
<body onload="showOne()">
<div id="isShowDiv" style="display: block; border:1px #000000 solid; padding:10px; padding-right:30px;   height: 200px; position: absolute; top: 400px; left: 700px; z-index:1000000; ">
	<div  style="display:block;">
		<!--步骤图-->
		<span >&nbsp;</span>
		<!--End 步骤图-->
		<div >
			
			<table cellpadding="0" cellspacing="0" border="0" >
				<tbody>
				<tr>
				<td colspan="2"><input type="hidden" id="loanId" name="loanId" />&nbsp;</td>
				</tr>
				<tr>
					<td width="100" align="right">投标金额：</td>
					<td><input id="tenderMoney" type="text" readonly="readonly" />元</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td width="100" align="right">折扣点：</td>
					<td><input id="discount" type="text"/>%</td>					
				</tr>				
				
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                
				<tr>
					<td width="100" align="right">升值点：</td>
					<td><input id="appreciation" type="text" />%</td>					
				</tr>
                
               
				<tr>
				<td colspan="2"><input type="hidden" id="tenderMoney" name="tenderMoney" />&nbsp;</td>
				</tr>
				
				<tr>
					<td align="center" colspan="2">
                    <a id="update_email"  class="authenticateBnt" onclick="showClick()">确认</a>
                    <a id="update_email" style=" margin-left:60px;" class="authenticateBnt"  onclick="showOne()">取消</a>
                    </td>                   
				</tr>
				
			</tbody></table>
			<div class="clear"></div>
		</div>
	</div>
</div>
</body>
</html>


