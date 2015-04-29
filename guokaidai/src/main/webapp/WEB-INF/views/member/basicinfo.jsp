<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="${application_keyword.keywords}" http-equiv="keywords"/>
<meta content="${application_keyword.description}" http-equiv="description"/>
<title>太平洋理财贷款平台-个人基本资料</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/Validform.css"/>
<link type="text/css" rel="stylesheet" href="<%=basePath %>resources/css/lhgcalendar.css" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include></head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="<%=basePath %>resources/js/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/Validform_v5.3_min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/Validform_Datatype.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/lhgcalendar.min.js"></script>
<!--End top-->

<!--Content-->
<div class="Content">
 <div class="w960px">

<!--vipContent-->
<div class="vipContentBox">
<!--vipLeft-->
<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
<!--End vipLeft-->

<!--vipRight-->
<div class="vipRightBox">
<div class="vipHeadMenuBox">
 <ul>
  <li><a href="<%=basePath%>update_info/forword_url?url=head">我的头像</a></li>
  <li><a href="<%=basePath%>update_info/basicinfo" class="vipHeadLink">个人资料</a></li>
 </ul>
</div>


<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="<%=basePath %>resources/images/vipseversicon.png" /></span>尊敬的用户请填写以下个人基本信息，提升信用等级也能更好的保护您账号的安全。</h1>
<p>1、昵称可以是2-12位的中文或字母、数字、下划线的组合。</p>
<p>2、昵称初始是与用户名相同的，您可以给自己修改一个更加个性化的昵称。</p>
<p>3、出于对会员的负责，请您如实填写以下信息，我们将为您保密个人信息</p>
</div>
<form id="myform" action="/update_info/update_basicinfo" method="post">
<table cellpadding="0" cellspacing="0" border="0" class="vippersonalInfo">
 <tbody>
  <tr><th>用户名:</th><td>${user.userName}</td></tr>
  <tr><th>昵称:</th><td><input type="text" name="nickname" value="${user.nickname}"/></td></tr>
  <tr><th>真实姓名:</th><td>${empty user.name ? '未设置':user.name}</td></tr>
  <tr><th>身份证号:</th><td>${empty user.userrelationinfo.cardId ? '未设置':user.userrelationinfo.cardId}</td></tr>
  <tr><th>手机号码:</th><td><input dataType="/^(((1[0-9]{1}[0-9]{1}))+\d{8})$/" sucmsg=". " nullmsg=" " errormsg=" " type="text" name="phone" value="${user.userrelationinfo.phone}"/></td></tr>
  <tr><th>邮箱地址:</th><td>${user.userrelationinfo.email}</td></tr>
  <tr><th>性别:</th><td>
  	<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.sex eq '男'}">checked="checked"</c:if> value="男" name="sex"/>&nbsp;&nbsp;男</label>
	<label style="margin-left: 50px;"><input type="radio" <c:if test="${user.userrelationinfo.sex eq '女'}">checked="checked"</c:if> value="女" name="sex"/>&nbsp;&nbsp;女</label> </td></tr>
  <tr><th>出生日期:</th><td>
  	<input type="text"  value="${user.userrelationinfo.birthDay}" class="timeInput_Day" readonly="readonly" id="inp11" name="birthDay"/>
  	<input type="hidden"  value="${date}" class="timeInput_Day" readonly="readonly" id="date"/>
  </td></tr>
  <tr><th>最高学历:</th><td>
  	<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.qualifications eq '高中以上'}">checked="checked"</c:if> value="高中以上"  name="qualifications"/>&nbsp;&nbsp;高中以上</label>
  	<label style="margin-left: 10px;"><input type="radio"<c:if test="${user.userrelationinfo.qualifications eq '大专或本科'}">checked="checked"</c:if>  value="大专或本科" name="qualifications"/>&nbsp;&nbsp;大专或本科</label>
  	<label style="margin-left: 10px;"><input type="radio" <c:if test="${user.userrelationinfo.qualifications eq '硕士或硕士以上'}">checked="checked"</c:if> value="硕士或硕士以上" name="qualifications"/>&nbsp;&nbsp;硕士或硕士以上</label>
  </td></tr>
  <tr><th>毕业院校:</th><td><input dataType="*3-20" sucmsg=". " errormsg="长度为3-20" type="text" name="institutions" value="${user.userrelationinfo.institutions}"/></td></tr>
  <tr><th>婚姻状况:</th><td><label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.marriage eq '已婚'}">checked="checked"</c:if> value="已婚" name="marriage"/>&nbsp;&nbsp;已婚</label>
  						<label style="margin-left: 50px;"><input type="radio" <c:if test="${user.userrelationinfo.marriage eq '未婚'}">checked="checked"</c:if> value="未婚" name="marriage"/>&nbsp;&nbsp;未婚</label></td></tr>
  <tr><th>居住地址:</th><td><input dataType="*3-20" sucmsg=". " errormsg="长度为3-20" type="text" name="newaddress" value="${user.userrelationinfo.newaddress}"/> </td></tr>
  <tr><th>公司行业:</th><td><input dataType="*2-20" sucmsg=". " errormsg="长度为2-20" type="text" name="industry" value="${user.userrelationinfo.industry }"/></td></tr>
  <tr><th>公司规模:</th><td>
  		<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.scale eq '50以下'}">checked="checked"</c:if> name="scale" value="50以下"/>&nbsp;50以下</label>
  		<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.scale eq '50-100人'}">checked="checked"</c:if> name="scale" value="50-100人"/>&nbsp;50-100人</label>
  		<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.scale eq '100-500人'}">checked="checked"</c:if> name="scale" value="100-500人"/>&nbsp;100-500人</label>
  		<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.scale eq '500-1000人'}">checked="checked"</c:if> name="scale" value="500-1000人"/>&nbsp;500-1000人</label>
  		<label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.scale eq '1000人以上'}">checked="checked"</c:if> name="scale" value="1000人以上"/>&nbsp;1000人以上</label>
  </td></tr>
  <tr><th>职位:</th><td><input dataType="*2-20" sucmsg=". " errormsg="长度为2-20" type="text" name="post" value="${user.userrelationinfo.post }"/> </td></tr>
  <tr><th>月收入:</th><td>
  <label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.income eq '5000以下'}">checked="checked"</c:if> name="income" value="5000以下"/>&nbsp;5000以下</label>
  <label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.income eq '5000-10000'}">checked="checked"</c:if> name="income" value="5000-10000"/>&nbsp;5000-10000</label>
  <label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.income eq '10000-50000'}">checked="checked"</c:if> name="income" value="10000-50000"/>&nbsp;10000-50000</label>
  <label style="margin-left: 2px;"><input type="radio" <c:if test="${user.userrelationinfo.income eq '50000以上'}">checked="checked"</c:if> name="income" value="50000以上"/>&nbsp;50000以上</label>
  </td></tr>
 </tbody>
</table>
<div class="tableSetBntBox"><input type="button" value="修改资料" id="update_basainfo"/></div>
</form>
</div>
<!--End vipContBox-->

</div>
<!--End vipRight-->
</div>
<!--End vipcontent-->
 
 </div>
</div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<script type="text/javascript">
function reset(){
	window.location.href='/update_info/basicinfo';
}
	$(function() {
		$('#inp11').calendar({
			format:'yyyy-MM-dd',
			maxDate : '#date'
		});
		$("#myform").Validform({
			btnSubmit:'#update_basainfo',
			tiptype : 3,
			beforeSubmit : function(curform) {
				$('#myform').ajaxSubmit({
					dataType : 'text',
					success : function(msg) {
						if (msg == "true") {
							ymPrompt.succeedInfo('修改成功', 260, 160, '成功', reset);
						}else {
							ymPrompt.errorInfo('修改失败', 260, 160, '失败', reset);
						}
					}
				});
				return false;
			}
		});
	});
</script>
<!--End footer-->
</body>
</html>
