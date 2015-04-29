<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"  + request.getServerName() + ":" + request.getServerPort()  + path + "/";
%>
<style>
    .sh-div{
        font-family: 'microsoft yahei';
        color:#666;
        font-size:16px;
        position:relative;
        width:360px;
        float:left;
        padding:20px 50px;
        border:1px solid #fff;
    }
    .sh-div .warninfo{
        color:#D32E62;
    }
    .sh-div .safeinfo{
        color:#2ea7e1;
    }

    .sh-div .saftyinfo a{
        color:#2ea7e1;
    }

    .sh-div .close{
        height:30px;
        width:80px;
        border-radius: 5px;
        border:none;
        background-color:#2ea7e1;
        color:white;
        font-size:16px;
        position:relative;
        margin-left:153px;
        cursor: pointer;
        margin-top: 15px;
    }
</style>
<div class="layerBox layerBG_one">
    <input type="hidden" id="login_userid" value="${session_user.id }">

    <div class="sh-div">
        <p>尚未完成<span class="warninfo">
            <c:if test="${empty session_user.userrelationinfo.phone}">手机绑定，</c:if>
            <c:if test="${empty session_user.userrelationinfo.cardId}">实名认证， </c:if>
            <c:if test="${empty session_user.transPassword}">交易密码设置， </c:if>
        </span>请前往<span class="saftyinfo"><a href="/member/mail">安全中心</a></span>进行设置</p>
        <button class="close" onclick="layerClose();" >关闭</button>
    </div>

    <!--欢迎页-->
    <div class="layerBodyBox" style="display: block;">
    </div>
    <!--End 欢迎页-->
</div>
<div class="wrapBox"></div>
