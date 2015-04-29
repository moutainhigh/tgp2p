<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="${application_keyword.keywords}" http-equiv="keywords"/>
    <meta content="${application_keyword.description}" http-equiv="description"/>
    <title>太平洋理财贷款平台-密码管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/vipcenter.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/Validform.css"/>
    <jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
</head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
<script type="text/javascript" src="<%=basePath %>resources/js/Validform_v5.3_min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/Validform_Datatype.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/jquery.form.js"></script>
<!--End top-->

<!--Content-->
<div class="Content">
    <div class="w960px">

        <!--vipContent-->
        <div class="vipContentBox">
            <!--vipLeft-->
            <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp"/>
            <!--End vipLeft-->

            <!--vipRight-->
            <div class="vipRightBox">
                <div class="vipHeadMenuBox">
                    <ul>
                        <li><a href="javascript:void(0);" class="vipHeadLink">修改登录密码</a></li>
                    </ul>
                </div>

                <!--vipContBox-->
                <div class="vipContBox">
                    <div class="vipContTitleBox">
                        <h1 class="vipContTitle"><span><img
                                src="<%=basePath %>resources/images/vipseversicon.png"/></span>您可以通过经常性修改登录密码更好的保护您的账号安全，以避免您受到意外损失。
                        </h1>

                        <p>1、经常性修改登录密码能有效的保护您的帐号安全</p>

                        <p>2、涉及到您的账户安全，请勿设置简单的登录密码，不要设置和其它网站相同的登录密码</p>
                    </div>
                    <form id="myform">
                        <table cellpadding="0" cellspacing="0" border="0" class="vipPwdManage">
                            <tbody>
                            <tr>
                                <th>用户名:</th>
                                <td>${user.userName}</td>
                            </tr>
                            <tr>
                                <th>请输入原密码:</th>
                                <td><input name="oldPwd" datatype="*6-20" sucmsg=" " nullmsg="请输入密码" errormsg="长度6-20位 "
                                           id="oldPwd" type="password" type="password" class="vipTextBox"/><font>（请输入您的原密码）</font>
                                    <span id="oldPwdInfo"></span>
                                </td>

                            </tr>
                            <tr>
                                <th>请输入新密码:</th>
                                <td><input name="pwd" datatype="*6-20" sucmsg=" " nullmsg="请输入密码" errormsg="长度6-20位 "
                                           id="newPwd" type="password"
                                           class="vipTextBox"/><font>（请输入您的新密码，并牢记新密码）</font>
                                    <span id="newPwdInfo"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>请确认新密码:</th>
                                <td><input recheck="pwd" datatype="*6-20" sucmsg=" " nullmsg="请再次输入密码"
                                           errormsg="密码输入不一致" id="newPwdConfirm" type="password"
                                           class="vipTextBox"/><font>（请再次输入新密码）</font>
                                    <span id="newPwdConfirmInfo"></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="tableSetBntBox">
                            <input type="button" value="提交密码" id="commit"/>
                            <input type="reset" value="取消"/>
                            <span id="rst">  </span>
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

<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
<script src="/resources/js/updatePwd.js" type="text/javascript"></script>
<!--End footer-->
</body>
</html>
