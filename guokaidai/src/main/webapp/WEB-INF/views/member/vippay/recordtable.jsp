<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
                  <tr height="35" bgcolor="#fcfcfc">
                  <td width="243" align="center"><b>订单号</b></td>
                  <td width="243" align="center"><b>支付会员费</b></td>
                  <td width="243" align="center"><b>开始时间</b></td>
                  <td width="243" align="center"><b>到期时间</b></td>
                  <td width="243" align="center"><b>操作</b></td>
                  </tr>
                  <c:forEach items="${page.list}" var="vip">
                  <tr>
	                    <td align="center">${vip[1]}</td>
	                    <td align="center">${vip[2]}</td>
	                    <td align="center">${vip[3]}</td>
	                    <td align="center">${vip[4]}</td>
	                    <c:if test="${vip[5]==1}">
	                    	<td align="center"><a onclick="ShowDiv('MyDiv','fade');$(this).parents('tr').find('td a').attr('date-value','0');$(this).attr('date-value','1');" date-value="0" id="${vip[0]}">重新支付</a>&nbsp;|&nbsp;<a onclick="deletes(${vip[0]})">删除记录</a></td>
	                    </c:if>
	                    <c:if test="${vip[5]==2}">
	                    	<td align="center">完成支付</td>
	                    </c:if>
	                    <c:if test="${vip[5]==3}">
	                    	<td align="center"><a title="${vip[0]}">支付失败</a></td>
	                    </c:if>
                  </tr>
                  </c:forEach>
                  <tr>
                  	<td colspan="5" style="border:0px;">
            			<jsp:include page="/WEB-INF/views/member/communal/page.jsp"/>
                  	</td>
                  </tr>
            	</table>  
