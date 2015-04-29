<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" action="/footer/updatefooter" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>地址</label>
				<input type="hidden" value="${footer.id}" name="id"/>
				<input name="address" type="text" size="30" class="required" value="${footer.address}"/>
			</p>
			<p>
				<label>公司名称</label>
				<input name="name" type="text" size="30"  class="required" value="${footer.name}"/>
			</p>
			<p>
				<label>电话号码</label>
				<input type="text"  name="phone"  size="30" class="phone" value="${footer.phone }">
			</p>
			<p>
				<label>网址</label>
				<input name="url"  type="text" size="30" class="required url" value="${footer.url}"/>
			</p>
			<p>
				<label>邮箱</label>
				<input name="email"  type="text" size="30" class="required email" value="${footer.email}"/>
			</p>
			<p>
				<label>QQ群</label>
				<input name="qqGroupNumber"  type="text" size="30" class="required" value="${footer.qqGroupNumber}"/>
			</p>
			<p>
				<label>工作时间</label>
				<input name="workTime"  type="text" size="30" class="required" value="${footer.workTime}"/>
			</p>
			<p>
				<label>版权所有</label>
				<input name="copyright"  type="text" size="30" class="required" value="${footer.copyright}"/>
			</p>
			<p>
				<label>备案号</label>
				<input name="records"  type="text" size="30" class="required" value="${footer.records}"/>
			</p>
			
			<p>
				<label>新浪微博链接</label>
				<input name="xlurl"  type="text" size="30" class="required" value="${footer.xlurl}"/>
			</p>
			<p>
				<label>腾讯微博链接</label>
				<input name="txurl"  type="text" size="30" class="required" value="${footer.txurl}"/>
			</p>
			<p>
				<label>其他</label>
				<input name="context"  type="text" size="30" maxlength="50" value="${footer.context}"/>
			</p>
			</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="reset" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
