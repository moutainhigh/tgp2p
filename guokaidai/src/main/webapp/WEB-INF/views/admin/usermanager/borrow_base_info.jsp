<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>用户名：</dt><dd><input readonly="readonly" value="${borrowBaseinfo[0]}" type="text"></dd>
		</dl>
		<dl>
			<dt>积分：</dt><dd><input readonly="readonly" value="${borrowBaseinfo[1]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>授信额度：</dt><dd><input readonly="readonly" value="${borrowBaseinfo[2]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>真实姓名：</dt><dd><input readonly="readonly" value="${borrowBaseinfo[3]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>会员类型：</dt>
			<dd>
				<input type="text" value="${borrowBaseinfo[4]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>手机号码：</dt>
			<dd>
				<input type="text" value="${borrowBaseinfo[5]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>注册时间：</dt>
			<dd>
				<input type="text" value="${borrowBaseinfo[6]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>会员期限：</dt>
			<dd>
				<input type="text" value="${borrowBaseinfo[7]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>身份证号码：</dt>
			<dd>
				<input type="text" value="${borrowBaseinfo[8]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>邮箱地址：</dt>
			<dd>
				<input type="text" value="${borrowBaseinfo[9]}" readonly="readonly" />
			</dd>
		</dl>
	</div>
</div>
</form>
