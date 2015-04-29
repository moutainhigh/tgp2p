<%--    
创建时间：2014年1月24日下午3:26:13   
创 建 人：LiNing   
相关说明：   显示借款人联系信息
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>现居住地址：</dt><dd><input readonly="readonly" value="${queryContact.newaddress}" type="text"></dd>
		</dl>
		<dl>
			<dt>住宅电话：</dt><dd><input readonly="readonly" value="${queryContact.addressPhone}" type="text" /></dd>
		</dl>
		<dl>
			<dt>第一联系人：</dt><dd><input readonly="readonly" value="${queryContact.linkman1}" type="text" /></dd>
		</dl>
		<dl>
			<dt>第二联系人：</dt><dd><input readonly="readonly" value="${queryContact.linkman2}" type="text" /></dd>
		</dl>
		<dl>
			<dt>关系：</dt>
			<dd>
				<input type="text" value="${queryContact.relation1}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>关系：</dt>
			<dd>
				<input type="text" value="${queryContact.relation2}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${queryContact.phone1}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${queryContact.phone2}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>其它：</dt>
			<dd>
				<input type="text" value="${queryContact.other1}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>其它：</dt>
			<dd>
				<input type="text" value="${queryContact.other2}" readonly="readonly" />
			</dd>
		</dl>
	</div>
</div>
</form>
