<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>用户名：</dt><dd><input readonly="readonly" value="${userinfo[0]}" type="text"></dd>
		</dl>
		<dl>
			<dt>真实姓名：</dt><dd><input readonly="readonly" value="${userinfo[1]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>会员类型：</dt><dd><input readonly="readonly" value="${userinfo[2]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>手机号码：</dt><dd><input readonly="readonly" value="${userinfo[3]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>注册时间：</dt>
			<dd>
				<input type="text" value="${userinfo[4]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>会员期限：</dt>
			<dd>
				<input type="text" value="${userinfo[5]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>身份证号码：</dt>
			<dd>
				<input type="text" value="${userinfo[6]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>邮箱地址：</dt>
			<dd>
				<input type="text" value="${userinfo[7]}" readonly="readonly" />
			</dd>
		</dl>
	</div>
</div>
</form>
