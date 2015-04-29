<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h2 class="contentTitle">资金统计</h2>
<%--sortDrag--%>
<div class="pageContent" style="border:1px #B8D0D6 solid;background: white;" layoutH="280">
<h3 style="width:31%;margin:5px;float: left;">会员统计</h3>
<h3 style="width:31%;margin:5px;float: left;">网站收益统计</h3>
<h3 style="width:31%;margin:5px;float: left;">投资者收益统计</h3>
<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">会员总数：${obj[0]}</div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">VIP会员 ：${obj[1]}</div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">普通会员：${obj[0]-obj[1]}</div>
</div>
<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">投资者管理费用总额：<fmt:formatNumber pattern="0.00" value="${obj[2]}"/></div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借款者管理费用总额：<fmt:formatNumber pattern="0.00" value="${obj[3]}"/></div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">VIP费用总额：<fmt:formatNumber pattern="0.00" value="${obj[4]}"/></div>
</div>
<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">成功借款总额：<fmt:formatNumber pattern="0.00" value="${obj[5]}"/></div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借款投标奖励总额：<fmt:formatNumber pattern="0.00" value="${obj[6]}"/></div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">推广奖金：<fmt:formatNumber pattern="0.00" value="${obj[7]}"/></div>
</div>


<h3 style="width:31%;margin:5px;float: left;">资金进出统计</h3>
<h3 style="width:31%;margin:5px;float: left;">&nbsp;</h3>
<h3 style="width:31%;margin:5px;float: left;">&nbsp;</h3>
<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:70px">
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">线上充值：<fmt:formatNumber pattern="0.00" value="${obj[8]}"/></div>
	<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">成功提现：<fmt:formatNumber pattern="0.00" value="${obj[9]}"/></div>
</div>
<div class="" style="width:31%;border:0px solid #B8D0D6;margin:5px;float:left;min-height:70px">
	<div style="border:0px solid #B8D0D6;padding:5px;margin:5px">&nbsp;</div>
	<div style="border:0px solid #B8D0D6;padding:5px;margin:5px">&nbsp;</div>
</div>
<div class="" style="width:31%;border:0px solid #B8D0D6;margin:5px;float:left;min-height:70px">
	<div style="border:0px solid #B8D0D6;padding:5px;margin:5px">&nbsp;</div>
	<div style="border:0px solid #B8D0D6;padding:5px;margin:5px">&nbsp;</div>
</div>

<br/>
</div>

<%--根据标类型分类统计 --%>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>助 人 贷</span></a></li>
					<li><a href="javascript:;"><span>助 企 贷</span></a></li>
					<li><a href="javascript:;"><span>企业群联保贷</span></a></li>
					<li><a href="javascript:;"><span>投资人周转贷</span></a></li>
					<li><a href="javascript:;"><span>秒&nbsp;&nbsp;&nbsp;标</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height:150px;">
			<%--助人贷 --%>
			<div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借出总金额：<fmt:formatNumber pattern="0.00" value="${type1[0]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已还金额：<fmt:formatNumber pattern="0.00" value="${type1[1]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待还金额：<fmt:formatNumber pattern="0.00" value="${type1[2]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已支付利息：<fmt:formatNumber pattern="0.00" value="${type1[3]}"/></div>
					
				</div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待支付利息：<fmt:formatNumber pattern="0.00" value="${type1[4]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">逾期还款总额：<fmt:formatNumber pattern="0.00" value="${type1[5]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">提前还款总额：<fmt:formatNumber pattern="0.00" value="${type1[6]}"/></div>
				</div>
			</div>
			
			<%--助企贷 --%>
			<div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借出总金额：<fmt:formatNumber pattern="0.00" value="${type2[0]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已还金额：<fmt:formatNumber pattern="0.00" value="${type2[1]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待还金额：<fmt:formatNumber pattern="0.00" value="${type2[2]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已支付利息：<fmt:formatNumber pattern="0.00" value="${type2[3]}"/></div>
					
				</div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待支付利息：<fmt:formatNumber pattern="0.00" value="${type2[4]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">逾期还款总额：<fmt:formatNumber pattern="0.00" value="${type2[5]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">提前还款总额：<fmt:formatNumber pattern="0.00" value="${type2[6]}"/></div>
				</div>
			</div>
			
			<%--企业群联保贷 --%>
			<div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借出总金额：<fmt:formatNumber pattern="0.00" value="${type3[0]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已还金额：<fmt:formatNumber pattern="0.00" value="${type3[1]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待还金额：<fmt:formatNumber pattern="0.00" value="${type3[2]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已支付利息：<fmt:formatNumber pattern="0.00" value="${type3[3]}"/></div>
					
				</div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待支付利息：<fmt:formatNumber pattern="0.00" value="${type3[4]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">逾期还款总额：<fmt:formatNumber pattern="0.00" value="${type3[5]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">提前还款总额：<fmt:formatNumber pattern="0.00" value="${type3[6]}"/></div>
				</div>
			</div>
			
			<%--投资人周转贷 --%>
			<div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借出总金额：<fmt:formatNumber pattern="0.00" value="${type4[0]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已还金额：<fmt:formatNumber pattern="0.00" value="${type4[1]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待还金额：<fmt:formatNumber pattern="0.00" value="${type4[2]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已支付利息：<fmt:formatNumber pattern="0.00" value="${type4[3]}"/></div>
					
				</div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待支付利息：<fmt:formatNumber pattern="0.00" value="${type4[4]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">逾期还款总额：<fmt:formatNumber pattern="0.00" value="${type4[5]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">提前还款总额：<fmt:formatNumber pattern="0.00" value="${type4[6]}"/></div>
				</div>
			</div>
			
			<%--秒标 --%>
			<div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">借出总金额：<fmt:formatNumber pattern="0.00" value="${second[0]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已还金额：<fmt:formatNumber pattern="0.00" value="${second[1]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待还金额：<fmt:formatNumber pattern="0.00" value="${second[2]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">已支付利息：<fmt:formatNumber pattern="0.00" value="${second[3]}"/></div>
					
				</div>
				<div class="" style="width:31%;border:1px solid #B8D0D6;margin:5px;float:left;min-height:100px">
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">待支付利息：<fmt:formatNumber pattern="0.00" value="${second[4]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">逾期还款总额：<fmt:formatNumber pattern="0.00" value="${second[5]}"/></div>
					<div style="border:1px solid #B8D0D6;padding:5px;margin:5px">提前还款总额：<fmt:formatNumber pattern="0.00" value="${second[6]}"/></div>
				</div>
			</div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>