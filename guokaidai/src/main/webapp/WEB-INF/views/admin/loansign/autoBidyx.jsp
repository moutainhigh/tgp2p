<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
function autoCheck(array){
  for (var i = array.length - 1; i >= 0; i--) {
    if(array[i]==""){
      alertMsg.info("请完整填写自动投标规则！",null,null,"提示",null);
      return false;
    }
  }
  for (var i = 1; i <= array.length - 2; i+=2) {
    if(parseInt(array[i])>parseInt(array[i+1])){
      alertMsg.info("取值范围不合理，小值不能大于大值！",340,null,"提示",null);
      return false;
    }
  }
  return true;
}
function check(){
	var pValidType = $("#pValidType_0").val();
	var pValidDate = $("input[name='pValidDate']").val();
	var pTrdCycleType = $("#pTrdCycleType_0").val();
	var pSTrdCycleValue = $("input[name='pSTrdCycleValue']").val();
	var pETrdCycleValue = $("input[name='pETrdCycleValue']").val();
	var pSAmtQuota = $("input[name='pSAmtQuota']").val();
	var pEAmtQuota = $("input[name='pEAmtQuota']").val();
	var pSIRQuota = $("input[name='pSIRQuota']").val();
	var pEIRQuota = $("input[name='pEIRQuota']").val();
	var array = [pValidDate,pSTrdCycleValue,pETrdCycleValue,pSAmtQuota,pEAmtQuota,pSIRQuota,pEIRQuota];
	if(!autoCheck(array)){ 
	  return;
	}
	$("#formAddAuto").submit();
}
</script>
<style>span.error{left:345px}</style>
<div class="pageContent">
	<form id="formAddAuto" action="<%=basePath %>loanSign/saveAuto" method="post"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="70">
		<input type="hidden" name="userId" value="${userId }"  />
		    <p>
				<label>规则有效期：</label>
				<input name="pValidDate"  class="required" type="text" size="25" maxlength="4" />
				<select name="pValidType" id="pValidType_0">
				<option value="D">天</option>
				<option value="M">月</option>
				</select>
			</p>
			
			<p>
				<label>标的借款周期：</label>
				<input name="pSTrdCycleValue"  class="required" type="text" size="10" maxlength="4" />
				<b style="float:left;">--</b><input name="pETrdCycleValue"  class="required" type="text" size="10" maxlength="4" />
				<select name="pTrdCycleType" id="pTrdCycleType_0">
				<option value="D">天</option>
				<option value="M">月</option>
				</select>
			</p>
			
			<p>
				<label>标的借款额度：</label>
				<input name="pSAmtQuota"  class="required" type="text" size="10" maxlength="12" />
				<b style="float:left;">--</b>
				<input name="pEAmtQuota"  class="required" type="text" size="10" maxlength="12" />元
				
			</p>
			<p>
				<label>标的利率限额：</label>
				<input name="pSIRQuota"  class="required" type="text" size="10" maxlength="4" />
				<b style="float:left;">--</b>
				<input name="pEIRQuota"  class="required" type="text" size="10" maxlength="4" />%
				
			</p>
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="check()">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
		<script>
		$("input[name='pValidDate']").bind("input propertychange",checkValidDate);
		$("input[name='pSTrdCycleValue']").bind("input propertychange",checkCycleValue);
		$("input[name='pETrdCycleValue']").bind("input propertychange",checkCycleValue);
		$("input[name='pSAmtQuota']").bind("input propertychange",checkAmtQuota);
		$("input[name='pEAmtQuota']").bind("input propertychange",checkAmtQuota);
		$("input[name='pSIRQuota']").bind("input propertychange",checkAmtQuota);
		$("input[name='pEIRQuota']").bind("input propertychange",checkAmtQuota);
		
		function checkValidDate(){
		  if(/\D/.test($(this).val())||isNaN($(this).val())){
		    $(this).val($(this).val().replace(/[^\d]/g,''));
		  }else if(parseInt($(this).val())>360&&($("#pValidType_0").val()=="D")){
		    alertMsg.info("以天计算有效期，数值范围为1~360",null,null,"提示",null);
		    $(this).val(360);
		  }else if(parseInt($(this).val())>12&&($("#pValidType_0").val()=="M")){
		    alertMsg.info("以月计算有效期，数值范围为1~12",null,null,"提示",null);
		    $(this).val(12);
		  }else if(/^0/.test($(this).val())){
		    alertMsg.info("最小值为1，请重新输入！",null,null,"提示",null);
		    $(this).val(1);
		  }
		}
		function checkCycleValue(){
		  if(/\D/.test($(this).val())||isNaN($(this).val())){
		    $(this).val($(this).val().replace(/[^\d]/g,''));
		  }else if(parseInt($(this).val())>1800&&($("#pTrdCycleType_0").val()=="D")){
		    alertMsg.info("以天计算周期，数值范围为1~1800",null,null,"提示",null);
		    $(this).val(1800);
		  }else if(parseInt($(this).val())>60&&($("#pTrdCycleType_0").val()=="M")){
		    alertMsg.info("以月计算周期，数值范围为1~12",null,null,"提示",null);
		    $(this).val(60);
		  }else if(/^0/.test($(this).val())){
		    alertMsg.info("最小值为1，请重新输入！",null,null,"提示",null);
		    $(this).val(1);
		  }
		}
		function checkAmtQuota(){
		  if(isNaN($(this).val())){
		    $(this).val($(this).val().replace(/[^\d]$/g,''));
		  }else if(/[.][\d]{3}$/.test($(this).val())){
		    alertMsg.info("只能保留到两位有效小数！",null,null,"提示",null);
		    $(this).val($(this).val().replace(/[\d]$/g,''));
		  }else if(parseInt($(this).val())>999999999){
		    alertMsg.info("最大值为999999999.99！",null,null,"提示",null);
		    $(this).val("999999999.99");
		  }else if(/^0/.test($(this).val())){
		    alertMsg.info("最小值为1，请重新输入！",null,null,"提示",null);
		    $(this).val(1);
		  }
		}
		</script>
	</form>
</div>