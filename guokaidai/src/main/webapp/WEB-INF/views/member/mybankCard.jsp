<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太平洋理财会员中心-我的银行卡</title>
    <link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css"/>
    <jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" charset="utf-8" href="resources\css\mybankCard.css"/>

    <c:if test="${not empty del_success}">
        <script type="javascript">
            alert("删除成功");
        </script>
    </c:if>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
<script type="text/javascript" src="resources/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="resources/js/userbank.js"></script>
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
                        <li><a href="javascript:void(0);" class="vipHeadLink">我的银行卡</a></li>
                    </ul>
                </div>
                <!--vipBankCardBox-->
                <div class="vipContBox">

                    <div class="p20bs.addattr">
                        <div id="bankList" class="bankList">
                            <c:if test="${not empty userbank.bankAccount}">
                                <div class="title">
                                    已添加银行卡<br/>
                                    <span>[每个帐号只能添加一张银行卡]</span>
                                </div>
                            </c:if>
                            <c:if test="${not empty to_userbank_add}">
                                <c:if test="${empty userbank.bankAccount}">
                                    <div class="title">请添加银行卡</div>
                                </c:if>
                            </c:if>
                            <div id="banklis" class="mt20">
                                <ul class="fn-clear">
                                    <c:if test="${not empty userbank_show}">
                                        <c:if test="${not empty userbank.bankAccount}">
                                            <li data-bank="317874">
                                                    <c:if test="${userbank.banktype.id==1}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_308.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==2}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_104.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==3}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_301.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==4}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_307.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==5}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_309.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==6}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_303.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==7}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_304.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==8}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_302.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==9}"> <img alt="" title=${userbank.bankname} src="/resources/images/banks/code_103.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==10}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_102.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==11}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_305.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==12}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_308.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==13}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_306.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==14}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_105.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==15}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_310.jpg"></c:if>
                                                    <c:if test="${userbank.banktype.id==16}"><img alt="" title=${userbank.bankname} src="/resources/images/banks/code_403.jpg"></c:if>
                                                <div style="font-size:16px;padding-top:5px">${userbank.bankAccount}</div>
                                                <div class="card">
                                                    <a href="/mybankCard/delBankCard" class="link del"
                                                       id="del_card">删除</a>
                                                </div>
                                            </li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${not empty to_userbank_add}">
                                        <c:if test="${empty userbank.bankAccount}">
                                            <li>
                                                <a href="/mybankCard/addBankCard" class="addBank" tabindex="-1">
                                                    <img src="/resources/images/add.jpg">
                                                </a>
                                                <div class="card"><a href="/mybankCard/addBankCard" class="addBank"  id="addBank" tabindex="-1">新增银行卡</a></div>
                                            </li>
                                        </c:if>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 添加银行卡 -->
                    <c:if test="${not empty userbank_add}">
                        <div id="addCard" style="display: block">
                            <div class="addCardTitle" style="margin-top: 15px;display:none">添加银行卡</div>
                            <div class="addBank">
                                <table class="addBankTable">
                                    <tr>
                                        <td class="left"><em>*</em>银行卡账户类型</td>
                                        <td>借记卡 不支持添加信用卡账户</td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>开户人姓名</td>
                                        <td>
                                            <input type="text" smartracker="on" name="accountName" id="accountName">
                                            <span id="an_require_info"></span><br/>
                                            <font color="red"><strong>*</strong></font><span> 该银行卡开户姓名必须与实名认证名字一致，否则会提现失败!</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>银行账号</td>
                                        <td><input onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                   onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text"
                                                   maxlength="19" id="bankAccount">
                                            <span id="ba_require_info"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>确认银行账号</td>
                                        <td><input onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                   onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text"
                                                   maxlength="19" id="confirm_bankAccount">
                                            <span id="cba_require_info"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>选择银行</td>
                                        <td>
                                            <select id="banktype">
                                                <c:forEach items="${bankTypeList}" var="bank" varStatus="status">
                                                    <option value="${bank.id}">${bank.name}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>开户行在地</td>
                                        <td>
                                            <select id="province" style="width:125px">
                                                <c:forEach items="${provinceList}" var="province" varStatus="status">
                                                    <option value="${province.id}">${province.name}</option>
                                                </c:forEach>
                                            </select>
                                            <select id="city" style="width:125px;display:none">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>开户行</td>
                                        <td>
                                            <input type="text" autocomplete="off" smartracker="on" id="branch" >
                                            <!-- <a href="/mybankCard/mybankCard.htm" class="btn">搜索</a> -->
                                            <span id="branch_require_info"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left"><em>*</em>手机验证码</td>
                                        <td>
                                            <input type="text" autocomplete="off" smartracker="on" id="sms_code" style="width:135px">
                                            <input type="hidden" id="phone_num" value="${session_user.userrelationinfo.phone}"/>
                                            <a href="javascript:;" id="send_sms_code" class="btn_ok"  style="width: 110px; vertical-align:middle; text-align:center; padding:0px;">获取验证码</a>
                                            <br/>
                                            <span id="sms_code_info"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="bottombtn">
                                            <a class="btn_ok" id="btn_add_card">添加</a>
                                            <a onclick="javascript:location.reload()" class="btn_cl" id="btn_add_card2">取消</a>
                                            <span id="error_info"></span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:if>
                </div>
                <!--End vipBankCardBox-->
            </div>
            <!--End vipRight-->
        </div>
        <!--End vipcontent-->
    </div>
</div>
<!--End vipContent-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp"/>
</body>
</html>