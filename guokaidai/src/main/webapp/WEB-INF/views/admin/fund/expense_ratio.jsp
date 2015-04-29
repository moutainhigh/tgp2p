<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h2 class="contentTitle">费用比列设置</h2>

<div class="pageFormContent" layoutH="60" style="height: 400px;">
<form action="/expenseRatio/add.htm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<fieldset>
		<legend>借款管理费</legend>
		<dl>
			<dt>普通会员：</dt>
			<dd><input name="id" type="hidden" value="${costratio.id}"/>
			<input class="required number" name="pmfeeratio" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.pmfeeratio*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>VIP会员：</dt>
			<dd><input class="required number" name="vipPmfeeratio" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipPmfeeratio*100}"/>"/>%</dd>
		</dl>		
		<dl>
			<dt>VIP会员上限金额：</dt>
			<dd><input class="required number" name="vipPmfeetop" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipPmfeetop}"/>"/></dd>
		</dl>		
	</fieldset>
	<fieldset>
		<legend>投资管理费</legend>
		<dl>
			<dt>普通会员：</dt>
			<dd><input class="required number" name="mfeeratio" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.mfeeratio*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>VIP会员：</dt>
			<dd><input class="required number" name="vipMfeeratio" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipMfeeratio*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>VIP会员上限金额：</dt>
			<dd><input class="required number" name="vipMfeetop" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipMfeetop}"/>"/></dd>
		</dl>		
	</fieldset>
	<fieldset>
		<legend>违约金(借款人)</legend>
		<dl>
			<dt>提前还款违约金：</dt>
			<dd><input class="required number" name="prepaymentRate" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.prepaymentRate*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>逾期还款违约金：</dt>
			<dd><input class="required number" name="overdueRepayment" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.overdueRepayment*100}"/>"/>%</dd>
		</dl>
	</fieldset>
	<fieldset>
		<legend>充值费用</legend>
		<dl>
			<dt>普通会员：</dt>
			<dd><input class="required number" name="recharge" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.recharge*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>VIP会员：</dt>
			<dd><input class="required number" name="viprecharge" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.viprecharge*100}"/>"/>%</dd>
		</dl>
	</fieldset>
	<fieldset>
		<legend>提现费用</legend>
		<dl>
			<dt>普通会员：</dt>
			<dd><input class="required number" name="withdraw" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.withdraw*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>VIP会员：</dt>
			<dd><input class="required number" name="vipwithdraw" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipwithdraw*100}"/>"/>%</dd>
		</dl>
		<dl>
			<dt>VIP会员上限：</dt>
			<dd><input class="required number" name="vipwithdrawtop" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipwithdrawtop}"/>"/></dd>
		</dl>
	</fieldset>
		<fieldset>
		<legend>其它费用</legend>
		<dl>
			<dt>升级VIP：</dt>
			<dd><input class="required number" name="vipUpgrade" type="text" value="<fmt:formatNumber pattern="0.00" value="${costratio.vipUpgrade}"/>"/></dd>
		</dl>
	</fieldset>
<div class="formBar">
	<ul>
		<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
		<li>
			<div class="button"><div class="buttonContent"><button type="reset" class="close">取消</button></div></div>
		</li>
	</ul>
</div>
</form>
</div>
