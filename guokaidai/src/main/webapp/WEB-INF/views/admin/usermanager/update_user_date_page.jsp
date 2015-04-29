<%--    
创建时间：2014年1月26日下午7:45:22   
创 建 人：LiNing   
相关说明：   修改特权会员时间
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<script type="text/javascript">
	function disFn(date) {
		var nowMiddle = new Date();
		if (date < nowMiddle) {
			return false;
		}
	}
	$(function($) {
		$("#vip_endtime").omCalendar({
			editable : false,
			disabledFn:disFn,
			pages :3,
			onSelect : function(date, event) {
				var nowDate = new Date();
				if (nowDate > date) {
					$("#vip_type").val("普通会员");
				} else {
					$("#vip_type").val("特权会员");
				}
			}
		});

	});
</script>
<div class="pageContent">
	<form action="<%=basePath%>userinfo/update_member_date" method="post"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="70">
			<p>
				<label>会员类型：</label> <input name="username" value="特权会员" type="text"
					id="vip_type" readonly="readonly" /> <input type="hidden"
					name="ids" value="${ids }">
			</p>
			<p>
				<label>到期时间：</label> <input name="endtime" class="required"
					type="text" id="vip_endtime" />
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>