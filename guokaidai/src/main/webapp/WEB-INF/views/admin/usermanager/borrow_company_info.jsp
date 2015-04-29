<%--    
创建时间：2014年1月24日下午3:49:24   
创 建 人：LiNing   
相关说明：   借款人单位资料显示
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>单位名称：</dt><dd><input readonly="readonly" value="${queryCompany.companyName}" type="text"></dd>
		</dl>
		<dl>
			<dt>单位电话：</dt><dd><input readonly="readonly" value="${queryCompany.companyPhone}" type="text" /></dd>
		</dl>
		<dl>
			<dt>单位地址：</dt><dd><input readonly="readonly" value="${queryCompany.address}" type="text" /></dd>
		</dl>
		<dl>
			<dt>证明人：</dt><dd><input readonly="readonly" value="${queryCompany.referenceMan}" type="text" /></dd>
		</dl>
		<dl>
			<dt>工作年限：</dt>
			<dd>
				<input type="text" value="${queryCompany.workYear}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>证明人手机：</dt>
			<dd>
				<input type="text" value="${queryCompany.referencePhone}" readonly="readonly" />
			</dd>
		</dl>
	</div>
</div>
</form>
