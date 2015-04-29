<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

<title>太平洋理财-会员中心-在线充值</title>
</head>

<body>
<!--mainBox-->
<div class="mainBox">
  <!--header-->
    <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
  <!--End header-->
  <div class="clear"></div>
  
  <!--content-->
  <div class="content">
    <div class="w960box vipboxbor curvyCorners_2">
      <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp"/>
      <div class="vipcenterright">
         <div class="vipconttabs">
           <ul>
             <li><span class="vipconttabsLink">账户充值</span></li>
             <li><span>账户提现</span></li>
             <li><span>资金记录</span></li>
           </ul>
         </div>
         <div class="vipconttext">
           <div class="vipconttexticon"><img src="/resources/images/sdgd_03.jpg" /></div>
           <p>温馨提示：单笔充值金额必须大于<font class="red bold">100元</font>。为遵守国家反洗钱和套现行为的相关法律规定：信用卡充值，不投标要超过<font class="red bold">30天</font>
后才能提现：储蓄卡充值，不投标要等<font class="red bold">7天</font>后才能提现</p>
         </div>
         <div class="vipcontbuzhou">&nbsp;</div>
         <form>
         <div class="bankLink">
            <table border="0" align="center" style="width:680px; height:80px; background:url(images/charge_bg.jpg) repeat-x center bottom; background-color:#; color:#4d637f; font-family:'微软雅黑'; margin-top:10px; border:1px solid #94b3cd;" cellspacing="0" cellpadding="0">
                  <tr height="35">
                    <td align="center" width="220" class="bank" style="border-right:1px solid #FFF;">&nbsp;</td>
                    <td style="border-left:1px solid #c3d9ec; color:#3a67a3; font-size:24px; padding-left:10px;">
                    	充值金额 <input type="text" style="width:105px; height:30px; line-height:30px; padding:0px; border:1px solid #8ba8d0;" /> 元<br />
                        <span style="color:#c40000; font-size:12px; line-height:18px; margin-left:105px;">最低充值金额50元</span>
                    </td>
                  </tr>
                </table>
                
                <table border="0" align="center" style="width:680px; margin-top:20px;" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="bank">
                    	<input type="radio" name="bank" checked="checked" />&nbsp;<img src="/resources/images/bank1.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank2.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank3.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank4.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank5.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank6.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank7.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank8.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank9.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank10.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank11.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank12.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank13.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank14.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank15.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank16.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank17.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank18.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank19.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank20.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank21.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank22.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank23.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank24.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank25.jpg" align="absmiddle" />
                        <input type="radio" name="bank" />&nbsp;<img src="/resources/images/bank26.jpg" align="absmiddle" />
                    </td>
                  </tr>
           </table>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" class="vipcontta_1">
            <tr><td></td><td><input type="submit" value="提交" class="vipconttabnt" /><input type="reset" value="重置"  class="vipconttabnt" style="background:#b2b2b2;" /></td></tr>
          </table>
          <br />
         <div class="clear"></div>
         </form>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!--End content-->
  <!--footer-->
 <jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
  <!--End footer-->
<div class="clear"></div>
</div>
<!--End mainBox-->
</body>
</html>
