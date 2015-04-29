<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<div class="pageContent">
	<div class="pageFormContent sortDrag">
		<dl>
			<dt>借款人：</dt><dd><input readonly="readonly" value="${loanSign[0]}" type="text"></dd>
		</dl>
		<dl>
			<dt>年化利率：</dt><dd><input readonly="readonly" value="${loanSign[1]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>借款标号：</dt><dd><input readonly="readonly" value="${loanSign[2]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>借款标标题：</dt><dd><input readonly="readonly" value="${loanSign[3]}" type="text" /></dd>
		</dl>
		<dl>
			<dt>注册时间：</dt>
			<dd>
				<input type="text" value="${loanSign[4]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>担保方名称：</dt>
			<dd>
				<input type="text" value="${loanSign[5]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>反担保方式：</dt>
			<dd>
				<input type="text" value="${loanSign[6]}" readonly="readonly" />
			</dd>
		</dl>
		<dl>
			<dt>最小出借单位：</dt>
			<dd>
				<input type="text" value="${loanSign[7]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>风险评估：</dt>
			<dd>
				<input type="text" value="${loanSign[8]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>是否显示：</dt>
			<dd>
				<input type="text" value="${loanSign[9]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>是否推荐到首页：</dt>
			<dd>
				<input type="text" value="${loanSign[10]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>还款期限：</dt>
			<dd>
				<input type="text" value="${loanSign[11]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>还款方式：</dt>
			<dd>
				<input type="text" value="${loanSign[12]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>普通会员最大购买数：</dt>
			<dd>
				<input type="text" value="${loanSign[13]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>vip最大购买份数：</dt>
			<dd>
				<input type="text" value="${loanSign[14]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>标号：</dt>
			<dd>
				<input type="text" value="${loanSign[15]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>合同编号：</dt>
			<dd>
				<input type="text" value="${loanSign[16]}" readonly="readonly" />
			</dd>
		</dl>
			<dl>
			<dt>招标期限：</dt>
			<dd>
				<input type="text" value="${loanSign[13]}" readonly="readonly" />
			</dd>
		</dl>
		
	</div>
</div>
</form>
