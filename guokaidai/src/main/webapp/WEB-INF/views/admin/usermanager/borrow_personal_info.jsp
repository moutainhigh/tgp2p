<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>真实姓名：</dt><dd><input readonly="readonly" value="${borrowPersonal[0]}" type="text"></dd>
		</dl>
		<dl>
			<dt>申请时间：</dt><dd><input readonly="readonly" value="${fn:substring(borrowPersonal[1],0,10)}" type="text" /></dd>
		</dl>
		<dl>
			<dt>申请额度：</dt><dd><input readonly="readonly" value="${borrowPersonal[2]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>最高学历：</dt><dd><input readonly="readonly" value="${borrowPersonal[3]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>身份证号码：</dt>
			<dd>
				<input type="text" value="${borrowPersonal[4]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>月收入：</dt>
			<dd>
				<input type="text" value="${borrowPersonal[5]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>年龄：</dt>
			<dd>
				<input type="text" value="${borrowPersonal[6]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${borrowPersonal[7]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>婚姻状况：</dt>
			<dd>
				<input type="text" value="${borrowPersonal[8]}" readonly="readonly" />
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>个人描述：</dt>
			<dd>
				<textarea class="editor" rows="8" cols="90" readonly="readonly">${borrowPersonal[9]}</textarea>
			</dd>
		</dl>
	</div>
</div>
</form>
