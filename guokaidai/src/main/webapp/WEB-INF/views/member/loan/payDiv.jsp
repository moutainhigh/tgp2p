<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form id="payForm" action="/plank/getLoaninfo.htm" method="post">
	<input type="hidden" id="loanid" name="id" value="${loan.id}" /> <input
		type="hidden" id="loanuserId" name="loanuserId"
		value="${loan.userbasicsinfo.id }" /> <input type="hidden"
		id="userId" name="userId" value="${session_user.id}" />
<%-- 		<input type="hidden" id="investMoney" name="money" value="${preset.loanMoney}" />
 --%>	<div id="payDiv"
		style="display: none; width: 450px; height: auto; padding-bottom: 20px; border: 1px solid #ddd; background-color: #fff; position: absolute; left: 150px; top: 100px; z-index: 1000">
		<div style="width: 100%; height: 40px; background-color: #efefef">
			<span
				style="float: left; line-height: 40px; font-size: 20px; padding-left: 140px">请确认支付信息</span>
			<a class="closepay"
				style="display: block; width: 22px; height: 22px; float: right; background: url(/resources/images/close.gif) no-repeat; margin: 8px 8px 0 0"></a>
		</div>
		<div style="width: 100%; height: 120px; padding: 10px 0;">
			<span
				style="font-size: 12px; color: #444; line-height: 25px; padding: 0 10px 0 120px">计划名称</span>
			<span style="font-size: 13px; color: #000; line-height: 25px">${loan.loansignbasics.loanTitle}</span><br />
			<span
				style="font-size: 12px; color: #444; line-height: 25px; padding: 0 10px 0 120px">预期收益</span>
			<span style="font-size: 13px; color: #000; line-height: 25px"><fmt:formatNumber
					value="${loan.rate*100}" pattern="##.#" minFractionDigits="1" />%每年</span><br />
			<span
				style="font-size: 12px; color: #444; line-height: 25px; padding: 0 10px 0 120px">锁定期限</span>
			<span style="font-size: 13px; color: #000; line-height: 25px">${loan.month}个月</span><br />
			<span
				style="font-size: 12px; color: #444; line-height: 25px; padding: 0 10px 0 120px">加入金额</span>
			<span style="font-size: 13px; color: #000; line-height: 25px"><fmt:formatNumber
					value="" pattern="##.#" minFractionDigits="1" />元</span><br />
		</div>
		<a id="submit" href="javascript:;"
			style="display: block; width: 80px; height: 30px; line-height: 30px; text-align: center; font-size: 16px; color: #fff; background-color: #0398da; border-radius: 5px; border: 1px solid #1970a6; margin: 20px 0 0 110px; float: left">确认</a>
		<a class="closepay"
			style="display: block; width: 80px; height: 30px; line-height: 30px; text-align: center; font-size: 16px; color: #333; background-color: #dbdbdb; border-radius: 5px; border: 1px solid #d5d5d5; margin: 20px 0 0 50px; float: left">取消</a>
	</div>
	<div id="payBg"
		style="display: none; position: fixed; top: 0; left: 0; z-index: 999; width: 100%; background: #000; opacity: 0.2; filter: alpha(opacity = 20);"></div>
</form>