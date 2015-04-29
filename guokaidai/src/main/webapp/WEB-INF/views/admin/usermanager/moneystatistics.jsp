<%--    
创建时间：2014年2月25日上午9:09:47   
创 建 人：LiNing   
相关说明：   后台会员资金统计
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="pageFormContent" layoutH="50">

	<fieldset>
		<legend>资金存量</legend>
		<dl>
			<dt>可用现金:</dt>
			<dd><input type="text" <c:if test="${empty sumMoney }">value="￥0.00元"</c:if> <c:if test="${!empty sumMoney }">value="￥<fmt:formatNumber value="${sumMoney}" pattern="0.00"/>元"</c:if> readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>待收本息金额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${toBeClosed+interestToBe}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>待付本息金额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${colltionPrinInterest}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		
		<dl>
			<dt>待确认投标:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${lentBid }" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>待确认提现:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${withdrawTobe}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>待确认充值:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${rechargeTobe}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>累计奖励:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${accumulative}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
		<dt>太平洋理财累计支付:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${adminAccumulative}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>账户资金总额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${sumMoney+lentBid+withdrawTobe-adminAccumulative}"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
	</fieldset>
	<fieldset>
		<legend>资金收益</legend>
		<dl>
			<dt>净赚利息:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${netInterest}"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
		<dt>累计支付会员费:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${vipSum }"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>累计提现手续费:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${witharwDeposit}"  pattern="0.00"/>元" readonly="readonly" /></dd>
			</dl>
		<dl>
		<dt>累计盈亏总额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${netInterest-vipSum-witharwDeposit}" pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
	</fieldset>
	<fieldset>
		<legend>资金流量</legend>
		<dl>
			<dt>累计投资金额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${investmentRecords }"  pattern="0.00"/>元" readonly="readonly" /></dd>
			</dl>
		<dl>
		<dt>累计借入金额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${borrowing }"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>累计充值金额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${rechargeSuccess }"  pattern="0.00"/>元" readonly="readonly" /></dd>
			</dl>
		<dl>
		<dt>累计提现金额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${withdrawSucess }"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		<dl>
			<dt>累计支付佣金:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${commission}"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
	</fieldset>
	<fieldset>
		<legend>资金预期</legend>
		<dl>
			<dt>待收利息总额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${interestToBe}"  pattern="0.00"/>元" readonly="readonly" /></dd>
			</dl>
		<dl>
		<dt>待付利息总额:</dt>
			<dd><input type="text" value="￥<fmt:formatNumber value="${colltionInterest}"  pattern="0.00"/>元" readonly="readonly" /></dd>
		</dl>
		
	</fieldset>
</div>
