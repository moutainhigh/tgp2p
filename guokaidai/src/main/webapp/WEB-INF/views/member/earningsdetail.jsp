<%--    
创建时间：2015年3月17日下午4:37:04
创 建 人：HSQ
相关说明：   推广收益详情
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"  + request.getServerName() + ":" + request.getServerPort()  + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太平洋理财会员中心-收益详情</title>
    <link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css"/>
</head>
<body>
    <table cellpadding="0" cellspacing="0" border="0" class="earningsTable">
        <thead>
        <tr>
            <th>编号</th>
            <th>收益月份</th>
            <th>收益金额</th>
            <th>对应标</th>
            <c:if test="${not empty earnings}">
            <th>被邀请人</th>
            </c:if>
            <c:if test="${not empty invite_list}">
                <th>邀请人</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty earnings}">
            <c:forEach items="${earnings }" var="earning" varStatus="status">
                <tr>
                    <td>${status.index+1 }</td>
                    <td>${earning.month}</td>
                    <td>￥${earning.money}</td>
                    <td>${earning.loan.loansignbasics.loanTitle}</td>
                    <td>${earning.user.userName}</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${not empty invite_list}">
            <c:forEach items="${invite_list }" var="earning" varStatus="status">
                <tr>
                    <td>${status.index+1 }</td>
                    <td>${earning.month}</td>
                    <td>￥${earning.umoney}</td>
                    <td>${earning.loan.loansignbasics.loanTitle}</td>
                    <td>${earning.user.userName}</td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</body>
</html>