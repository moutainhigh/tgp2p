<%--    
创建时间：2014年1月24日下午4:14:19   
创 建 人：LiNing   
相关说明：   借款人联保情况展示页面
JDK1.7.0_25 tomcat7.0.47  
--%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>第一联保人：</dt><dd><input readonly="readonly" value="${queryOtherContact.linkman1}" type="text"></dd>
		</dl>
		<dl>
			<dt>第三联保人：</dt><dd><input readonly="readonly" value="${queryOtherContact.linkman3}" type="text" /></dd>
		</dl>
		<dl>
			<dt>关系：</dt><dd><input readonly="readonly" value="${queryOtherContact.relation1}" type="text" /></dd>
		</dl>
		<dl>
			<dt>关系：</dt><dd><input readonly="readonly" value="${queryOtherContact.relation3}" type="text" /></dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${queryOtherContact.phone1}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${queryOtherContact.phone3}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>第二联保人：</dt><dd><input readonly="readonly" value="${queryOtherContact.linkman2}" type="text"></dd>
		</dl>
		<dl>
			<dt>第四联保人：</dt><dd><input readonly="readonly" value="${queryOtherContact.linkman4}" type="text" /></dd>
		</dl>
		<dl>
			<dt>关系：</dt><dd><input readonly="readonly" value="${queryOtherContact.relation1}" type="text" /></dd>
		</dl>
		<dl>
			<dt>关系：</dt><dd><input readonly="readonly" value="${queryOtherContact.relation3}" type="text" /></dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${queryOtherContact.phone2}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${queryOtherContact.phone4}" readonly="readonly" />
			</dd>
		</dl>
	</div>
</div>
</form>
