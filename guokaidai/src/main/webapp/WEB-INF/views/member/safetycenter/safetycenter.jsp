<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太平洋理财贷款平台-会员中心</title>
    <link rel="stylesheet" type="text/css" href="resources/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css"/>
    <script type="text/javascript" src="resources/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="resources/js/global.js"></script>
    <script type="text/javascript" src="resources/js/recharge.js"></script>
    <script type="text/javascript" src="resources/js/safetycenter.js"></script>
    <jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
<input type="hidden" id="id" value="${session_user.id }"/>
<script type="text/javascript">

</script>
<!--Content-->
<div class="Content">
    <div class="w960px">
        <!--vipContent-->
        <div class="vipContentBox">
            <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp"/>
            <!--vipRight-->
            <div class="vipRightBox">
                <div class="vipHeadMenuBox">
                    <ul>
                        <li><a href="javascript:void(0);" class="vipHeadLink" id="phone_valid">手机验证</a></li>
                        <li><a href="javascript:void(0);" id="cardid_valid">身份验证</a></li>
                        <li><a href="javascript:void(0);" id="tradepwd_valid">交易密码</a></li>
                        <li><a href="javascript:void(0);"  id="email_valid" >邮箱验证</a></li>
                        <!--
                        <li><a href="javascript:void(0);">安全问题</a></li>
                        -->
                    </ul>
                </div>
                <!--vipContBox绑定手机-->
                <div class="vipContBox">
                    <div class="vipContTitleBox">
                        <h1 class="vipContTitle">
                            <span><img src="../resources/images/vipseversicon.png"/>
                            </span>通过绑定手机，能够为您的账号提供更安全的保障。
                        </h1>
                        <p>尊敬的太平洋理财会员，在绑定手机并通过验证之后，您可以通过手机找回登录密码。</p>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0"
                           class="vipVerification">
                        <tbody>
                        <tr>
                            <th><img src="../resources/images/vipcenterziliao_03.jpg"
                                     title="" alt=""/></th>
                            <c:if test="${!empty session_user.userrelationinfo.phone}">
                            <td>
                                <p>
                                温馨提示： 您好，您已经绑定了手机号为<font>
												${fun:substring(session_user.userrelationinfo.phone,0,2)}*******
												${fun:substring(session_user.userrelationinfo.phone,fun:length(session_user.userrelationinfo.phone)-2,fun:length(session_user.userrelationinfo.phone)+1)}</font>
												的手机。

                                </p>
                                <div style="width: 100%;  height: auto; margin: 20px 0px;  text-align: left;">
                                <input type="button" value="修改" class="btn_style" onclick="SAFTY_SETTING.SHOW_MODIFY_PHONE_WINDOW()"/>
                                    </div>
                            </td>
                            </c:if>

                            <c:if test="${empty session_user.userrelationinfo.phone}">
                                <td>
                                    <p>
                                        温馨提示：<span>您好，您还没有绑定手机号。</span>
                                    </p> 未绑定手机号不能进行充值，提现，投标操作。
                                </td>
                            </c:if>
                        </tr>
                        </tbody>
                    </table>

                    <c:if test="${!empty session_user.userrelationinfo.phone}">
                    <div id="modify_bind_phone_div" style="display:none">
                        <div class="vipPromptBox">
                            <p>您已绑定手机，如果需要修改已绑定手机号，请在下面填写您的新手机号及验证码!</p>
                        </div>
                        <form>
                            <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                                <tbody>
                                    <tr>
                                        <th>己绑定手机</th>
                                        <td>
                                            <font>
                                            <input id="bind_phone" type="text"
                                            value="${fun:substring(session_user.userrelationinfo.phone,0,2)}*******${fun:substring(session_user.userrelationinfo.phone,fun:length(session_user.userrelationinfo.phone)-2,fun:length(session_user.userrelationinfo.phone)+1)}"
                                            readonly="readonly" class="vipTextBox" style="width:240px;"/>
                                            </font>
                                            <a href="javascript:;" id="send_sms_code_2_1" class="btn_style"  >点击获取验证码</a>
                                            <input type="hidden" id="phone_num_2" value="${session_user.userrelationinfo.phone}"/>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th>短信验证码</th>
                                        <td>
                                            <input id="bind_phone_sms_code_2_1" type="text" class="vipTextBox" style="width: 240px;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>新手机号:</th>
                                        <td>
                                            <input id="new_phone_num" type="text" class="vipTextBox" style="width:240px;"/>
                                            <!--
                                            <a href="javascript:;" id="send_sms_code_2_2" class="btn_style"  >点击获取验证码</a>
                                            -->
                                        </td>
                                    </tr>
                                    <!--
                                    <tr>
                                        <th>新手机验证码:</th>
                                        <td>
                                            <input id="new_phone_sms_code_2_2" type="text" class="vipTextBox" style="width:240px;"/>
                                        </td>
                                    </tr>
                                    -->
                                </tbody>
                            </table>
                            <div class="tableSetBntBox">
                                <input type="button" value="保存" onclick="SAFTY_SETTING.MODIFY_MOBILE()"/> <input type="reset" value="取消"/>
                            </div>
                        </form>
                    </div>
                    </c:if>
                    <c:if test="${empty session_user.userrelationinfo.phone}">
                        <div class="vipPromptBox">
                            <p>您还没有绑定手机，请在下面填写您的手机号及验证码!</p>
                        </div>
                        <form>
                            <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                                <tbody>
                                <tr>
                                    <th>手机号:</th>
                                    <td>
                                        <input id="phone_num_1" type="text" class="vipTextBox" style="width:240px;"/>
                                        <input type="button" id="send_sms_code_1_1" class="btn_style" value="点击获取验证码">
                                    </td>
                                </tr>
                                <tr>
                                    <th>手机验证码:</th>
                                    <td>
                                        <input id="phone_sms_code_1" type="text" class="vipTextBox" style="width:240px;"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="tableSetBntBox">
                                <input type="button" value="保存" onclick="SAFTY_SETTING.MOBILE()"/>
                                <input type="reset" value="取消"/>
                            </div>
                        </form>
                    </c:if>
                </div>
                <!--End vipContBox-->

                <!--vipContBox身份认证-->
                <div class="vipContBox" style="display: none;">
                    <div class="vipContTitleBox">
                        <h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png"/>
								</span>通过身份认证，能够为您的账号提供更安全的保障。
                        </h1>
                        <p>尊敬的${session_user.name }会员，通过身份验证后可以提升您在太平洋理财的用户安全等级。</p>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0"
                           class="vipVerification">
                        <tbody>
                        <tr>
                            <th><img src="../resources/images/vipcentereperson.jpg" title="" alt=""/></th>
                            <td>
                                <c:if  test="${!empty session_user.userrelationinfo.cardId}">
                                <p> 温馨提示：<span>你已经完成了身份验证，你的身份信息如下。</span>  </p>
                                真实姓名：<font>*${fun:substring(session_user.name,1,fun:length(session_user.name))}</font><br/>
                                身份证号：
                                    <font>
                                        <c:if test="${!empty session_user.userrelationinfo.cardId && fun:length(session_user.userrelationinfo.cardId)>5}">${fun:substring(session_user.userrelationinfo.cardId,0,4)}
                                            <c:forEach begin=""   end="${fun:length(fun:substring(session_user.userrelationinfo.cardId,4,fun:substring(session_user.userrelationinfo.cardId,fun:length(session_user.userrelationinfo.cardId)-4,fun:length(session_user.userrelationinfo.cardId))))-5}">*</c:forEach>
                                            ${fun:substring(session_user.userrelationinfo.cardId,fun:length(session_user.userrelationinfo.cardId)-4,fun:length(session_user.userrelationinfo.cardId))}
                                        </c:if>
                                    </font>
                                </c:if>
                                <c:if  test="${empty session_user.userrelationinfo.cardId}">
                                    <p> 温馨提示：<span>你尚未进行实名验证，请完善你的身份信息。实名认证成功后，不能修改。</span>  </p>
                                </c:if>
                        </td>
                        </tr>
                        </tbody>
                    </table>
                    <c:if  test="${empty session_user.userrelationinfo.cardId}">
                    <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                        <tbody>
                        <tr>
                            <th>真实姓名:</th>
                            <td>
                                <input id="realname" type="text" class="vipTextBox" style="width: 240px;"/>
                                <span id="rninfo"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>身份证号:</th>
                            <td>
                                <input id="cardId" type="text" class="vipTextBox" style="width: 240px;"/>
                                <span id="cidinfo"></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="uptCardId" type="button" value="保存" onclick="SAFTY_SETTING.CARDID();"   style="width: auto; height: 28px; line-height: 28px; padding: 0px 10px;border: 0px; background: #33b9ff;color: #fff;display: inline-block; cursor: pointer; margin: 0px 300px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                                <span id="uptCardInfo" style="float:left"></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </c:if>
                    <div class="vipPromptBox" style="display:none">
                        <h6>温馨提示：</h6>
                        <p>如果你在公安机关修改了名字，请联系我们的客服，凭有关公安机关改名的核证材料修改您的身份信息。谢谢!</p>
                    </div>
                </div>
                <!--End vipContBox-->

                <!--vipContBox交易密码-->
                <div class="vipContBox" style="display: none;">
                    <div class="vipContTitleBox">
                        <h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png"/>
								</span>通过设置交易密码，能够为您的资金提供更安全的保障。
                        </h1>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0"
                           class="vipVerification">
                        <tbody>
                        <tr>
                            <th><img src="../resources/images/vipcenterziliao_03.jpg"  title="" alt=""/></th>
                            <c:if  test="${!empty session_user.transPassword}">
                            <td>
                                <p>
                                温馨提示：<span>您好，您已经设定了您的交易密码</span>
                                </p>
                                <div style="width: 100%;  height: auto; margin: 20px 0px;  text-align: left;">
                                    <input id="modify_trade_pwd" type="button" value="修改" class="btn_style" onclick="SAFTY_SETTING.SHOW_MODIFY_TRADEPWD_WINDOW()"/>
                                    <input id="find_trade_pwd" type="button" value="找回" class="btn_style" onclick="SAFTY_SETTING.SHOW_FIND_TRADEPWD_WINDOW()"/>
                                </div>
                            </td>
                            </c:if>
                            <c:if  test="${empty session_user.transPassword}">
                            <td>
                                <p>
                                    温馨提示：<span>您好，您还没有设定了您的交易密码</span>
                                </p>
                            </td>
                            </c:if>
                        </tr>
                        </tbody>
                    </table>
                    <c:if  test="${!empty session_user.transPassword}">
                    <div id="modify_trade_pwd_div" style="display:none">
                        <div class="vipPromptBox">
                            <p>请在下面填写原始密码和新密码来修改交易密码</p>
                        </div>
                        <form>
                            <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                                <tbody>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>原交易密码:</th>
                                    <td>
                                        <input id="old_trade_pwd" type="password" class="vipTextBox" style="width: 240px;" onblur="SAFTY_SETTING.CHECK_OLD_TRADE_PWD()"/>
                                        <span id="otp_rsp"><span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>新交易密码:</th>
                                    <td>
                                        <input id="new_trade_pwd" type="password" class="vipTextBox" style="width: 240px;"/>
                                        <span id="ntp_rsp"><span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>确认交易密码:</th>
                                    <td>
                                        <input id="confirm_new_trader_pwd" type="password" class="vipTextBox" style="width: 240px;"/>
                                        <span id="cntp_rsp"><span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="tableSetBntBox">
                                <input id="save_trade_pwd" type="button" value="保存" onclick="SAFTY_SETTING.MODIFY_TRADE_PWD();"/>
                                <input type="reset" value="取消"/>
                            </div>
                        </form>
                    </div>
                    <div id="find_trade_pwd_div" style="display:none">
                        <div class="vipPromptBox">
                            <p>请填写短信验证码和新密码</p>
                        </div>
                        <form>
                            <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                                <tbody>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>短信验证码:</th>
                                    <td>
                                        <input id="sms_code_3_1" type="text" class="vipTextBox" style="width: 240px;" />
                                        <c:if  test="${!empty session_user.userrelationinfo.phone}">
                                            <input type="button" id="send_sms_code_3_1" class="btn_style" value="点击获取验证码">
                                            <input type="hidden" id="phone_num_3" value="${session_user.userrelationinfo.phone}"/>
                                        </c:if>
                                        <c:if  test="${empty session_user.userrelationinfo.phone}">
                                            您没有绑定手机号,无法发送验证码.请先<font color="#33b9ff"><a href="/member/mail">绑定手机</a></font>!
                                        </c:if>
                                        <span id="sms_code_rsp"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>新密码:</th>
                                    <td>
                                        <input id="set_new_trade_pwd" type="password" class="vipTextBox" style="width: 240px;"/>
                                        <span id="set_new_trade_pwd_rsp"><span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>确认密码:</th>
                                    <td>
                                        <input id="confirm_set_new_trader_pwd" type="password" class="vipTextBox" style="width: 240px;"/>
                                        <span id="confirm_set_new_trader_pwdp_rsp"></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="tableSetBntBox">
                                <input type="button" value="保存" onclick="SAFTY_SETTING.RESET_TRADE_PWD()"/>
                                <input type="reset" value="取消"/>
                            </div>
                        </form>
                    </div>

                    </c:if>
                    <c:if  test="${empty session_user.transPassword}">
                    <div style="display:block">
                        <div class="vipPromptBox">
                            <p>请输入您要设置的交易密码</p>
                        </div>
                        <form>
                            <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                                <tbody>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>交易密码:</th>
                                    <td>
                                        <input id="trade_pwd" type="password" class="vipTextBox" style="width: 240px;"/>
                                        <span id="tp_rsp"><span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span style="color: red;margin-right: 6px;font-size: 14px;">*</span>确认密码:</th>
                                    <td>
                                        <input id="confirm_trader_pwd" type="password" class="vipTextBox" style="width: 240px;"/>
                                        <span id="ctp_rsp"><span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="tableSetBntBox">
                                <input id="upt_trade_pwd" type="button" value="保存" onclick="SAFTY_SETTING.TRADEPWD();"/>
                                <input type="reset" value="取消"/>
                            </div>
                        </form>
                    </div>
                    </c:if>
                </div>
                <!--End vipContBox-->

                <!--vipContBox绑定邮箱-->
                <div class="vipContBox" style="display:none">
                    <div class="vipContTitleBox">
                        <h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png"/>
								</span>通过绑定邮箱，能够为您的账号提供更安全的保障。
                        </h1>

                        <p>尊敬的${session_user.name }会员，在绑定邮箱并通过验证之后，您可以提升您在太平洋理财的用户安全等级。</p>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0"
                           class="vipVerification">
                        <tbody>
                        <tr>
                            <th><img src="../resources/images/vipcenteremail.jpg"
                                     title="" alt=""/></th>

                            <c:if  test="${!empty session_user.userrelationinfo.email}">
                            <td><p>
                                您好，您已经绑定了邮箱 <font>
                                <c:if test="${!empty session_user.userrelationinfo.email && fun:length(session_user.userrelationinfo.email)>5}">
                                <c:if test="${fun:length(fun:substring(session_user.userrelationinfo.email,0,fun:indexOf(session_user.userrelationinfo.email,'@'))) > 5 }">
                                    ${fun:substring(session_user.userrelationinfo.email,0,3)}
                                    <c:forEach begin="0" end="${fun:length(fun:substring(session_user.userrelationinfo.email,3,fun:indexOf(session_user.userrelationinfo.email,'@')-2)) - 1}">*</c:forEach>
                                    ${fun:substring(session_user.userrelationinfo.email,fun:indexOf(session_user.userrelationinfo.email,'@')-2,fun:length(session_user.userrelationinfo.email))}
                                </c:if>
                                <c:if test="${fun:length(fun:substring(session_user.userrelationinfo.email,0,fun:indexOf(session_user.userrelationinfo.email,'@'))) < 6 }">
                                    ${session_user.userrelationinfo.email }
                                </c:if>
                            </c:if> </font>

                            </p>
                                <div style="width: 100%;  height: auto; margin: 20px 0px;  text-align: left;">
                                    <input type="button" value="修改" class="btn_style" onclick="SAFTY_SETTING.SHOW_MODIFY_EMAIL_WINDOW()"/>
                                </div>
                            </td>
                            </c:if>
                            <c:if  test="${empty session_user.userrelationinfo.email}">
                            <td>
                                <p>您好，您还没有绑定邮箱</p>
                            </td>
                            </c:if>
                        </tr>
                        </tbody>
                    </table>
                    <c:if  test="${!empty session_user.userrelationinfo.email}">
                    <div id="modify_email_div" style="display:none">
                        <div class="vipPromptBox">
                            <p>您已绑定邮箱，如果修改请在下面填写您的新邮箱!</p>
                        </div>
                        <form>
                            <table cellpadding="0" cellspacing="0" border="0"
                                   class="vipPwdManage">
                                <tbody>
                                <tr>
                                    <th>输入新邮箱:</th>
                                    <input id="oldemail" type="hidden" value="${session_user.userrelationinfo.email}"/>
                                    <td><input id="email" type="text" class="vipTextBox" style="width: 240px;"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="tableSetBntBox">
                                <input type="button" value="发送邮件" onclick="SAFTY_SETTING.MODIFY_BIND_EMAIL()"/>
                                <input type="reset" value="取消"/>
                            </div>
                        </form>
                    </div>
                    </c:if>
                    <c:if  test="${empty session_user.userrelationinfo.email}">
                        <div id="modify_email_div" style="display:block">
                            <div class="vipPromptBox">
                                <p>输入正确的邮箱地址后会往您的邮箱发送一封邮件，请查收并激活。</p>
                            </div>
                            <form>
                                <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                                    <tbody>
                                    <tr>
                                        <th>输入邮箱:</th>
                                        <td><input id="email" type="text" class="vipTextBox" style="width: 240px;"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="tableSetBntBox">
                                    <input type="button" value="发送邮件" onclick="SAFTY_SETTING.BIND_EMAIL()"/>
                                    <input type="reset" value="取消"/>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </div>
                <!--End vipContBox-->

                <!--vipContBox安全问题-->
                <div class="vipContBox" style="display: none;">
                    <div class="vipContTitleBox">
                        <h1 class="vipContTitle">
								<span>
									<img src="../resources/images/vipseversicon.png"/>
								</span>通过绑定邮箱，能够为您的账号提供更安全的保障
                        </h1>
                        <p>尊敬的太平洋理财会员，设置安全问题并通过验证之后，可以提升您在太平洋理财的用户安全等级。</p>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0" class="vipVerification">
                        <tbody>
                        <tr>
                            <th><img src="../resources/images/vipcentereQs.jpg" title="" alt=""/></th>
                            <td><p>
                                温馨提示：<span>您好，您的安全问题已设置。</span>
                            </p> 1.会员可通过填写安全问题答案来修改已设置的安全问题。<br/>
                                2.会员若遗忘安全问题答案，请联系客服人员40012345678。
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="vipPromptBox">
                        <p>请在下面重新设置您的安全问题。</p>
                    </div>
                    <form id="Security_1">
                        <table cellpadding="0" cellspacing="0" border="0"
                               class="vipPwdManage">
                            <tbody>
                            <tr>
                                <th>安全问题1:</th>
                                <td><select style="width: 240px;" id="question05"
                                            name="question01">
                                    <option>请选中安全问题</option>
                                    <c:forEach items="${safetyQuestions }" var="s">
                                        <option value="${s.id }">${s.problem }</option>
                                    </c:forEach>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th>答案1:</th>
                                <td><input id="anwser05" type="text" class="vipTextBox"
                                           style="width: 240px;"/></td>
                            </tr>
                            <tr>
                                <th>安全问题2:</th>
                                <td><select style="width: 240px;" id="question06"
                                            name="question01">
                                    <option>请选中安全问题</option>
                                    <c:forEach items="${safetyQuestions }" var="s">
                                        <option value="${s.id }">${s.problem }</option>
                                    </c:forEach>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th>答案2:</th>
                                <td><input id="anwser06" type="text" class="vipTextBox"
                                           style="width: 240px;"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="tableSetBntBox">
                            <input id="safety_problem01" type="button" value="提交"
                                   onclick="safety(this);"/> <input id="safety_problem02"
                                                                    type="button" value="提交" onclick="safety(this);"
                                                                    style="display: none;"/> <input type="reset"
                                                                                                    value="取消"/>
                        </div>
                    </form>
                    <form id="Security_2" style="display: none;">
                        <table cellpadding="0" cellspacing="0" border="0"
                               class="vipPwdManage">
                            <tbody>
                            <tr>
                                <th>安全问题1:</th>
                                <td><select style="width: 240px;" id="question07"
                                            name="question01">
                                    <option>请选中安全问题</option>
                                    <c:forEach items="${safetyQuestions }" var="s">
                                        <option value="${s.id }">${s.problem }</option>
                                    </c:forEach>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th>答案1:</th>
                                <td><input id="anwser07" type="text" class="vipTextBox"
                                           style="width: 240px;"/></td>
                            </tr>
                            <tr>
                                <th>安全问题2:</th>
                                <td><select style="width: 240px;" id="question08"
                                            name="question01">
                                    <option>请选中安全问题</option>
                                    <c:forEach items="${safetyQuestions }" var="s">
                                        <option value="${s.id }">${s.problem }</option>
                                    </c:forEach>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th>答案2:</th>
                                <td><input id="anwser08" type="text" class="vipTextBox"
                                           style="width: 240px;"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="tableSetBntBox">
                            <input id="safety_problem" value="保存"/> <input type="reset"
                                                                           value="取消"/>
                        </div>
                    </form>
                </div>
                <!--End vipContBox-->

            </div>
            <!--End vipRight-->
        </div>
        <!--End vipcontent-->
    </div>
</div>
<!--End vipContent-->
<!--End vipRight-->
</div>
<!--End vipcontent-->
</div>
</div>
<!--End vipContent-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
</body>
</html>
