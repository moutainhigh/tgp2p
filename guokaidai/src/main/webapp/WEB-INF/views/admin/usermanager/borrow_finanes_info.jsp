<%--    
创建时间：2014年1月24日下午4:15:34   
创 建 人：LiNing   
相关说明：   显示借款人财务状况
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>月均收入：</dt><dd><input readonly="readonly" value="${queryFinanes.income}" type="text"></dd>
		</dl>
		<dl>
			<dt>是否购车：</dt><dd><input readonly="readonly" value="${queryFinanes.isbuycar}" type="text" /></dd>
		</dl>
		<dl>
			<dt>收入构成描述：</dt><dd><input readonly="readonly" value="${queryFinanes.incomeRemark}" type="text" /></dd>
		</dl>
		<dl>
			<dt>房屋价值：</dt><dd><input readonly="readonly" value="${queryFinanes.propertyValue}" type="text" /></dd>
		</dl>
		<dl>
			<dt>车辆价值：</dt>
			<dd>
				<input type="text" value="${queryFinanes.carValue}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>月均支出(元)：</dt>
			<dd>
				<input type="text" value="${queryFinanes.pay}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>参股企业名称：</dt>
			<dd>
				<input type="text" value="${queryFinanes.companyName}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>支出构成描述：</dt>
			<dd>
				<input type="text" value="${queryFinanes.payRemark}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>参股企业出资额(万元)：</dt>
			<dd>
				<input type="text" value="${queryFinanes.companyPayMoney}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>住房条件：</dt>
			<dd>
				<input type="text" value="${queryFinanes.housecondition}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>其他资产描述：</dt>
			<dd>
				<input type="text" value="${queryFinanes.otherPropertyDescribe}" readonly="readonly" />
			</dd>
		</dl>
	</div>
</div>
</form>