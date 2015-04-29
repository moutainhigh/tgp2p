<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台-会员中心</title>
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<style>.vipRightBox{margin:0 auto;float:none}</style>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" /> --%>
<!--Content-->
<%-- <div class="Content">
  <div class="w960px">
    <!--vipContent-->
    <div class="vipContentBox">
      <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" /> 
      <!--vipRight-->--%>
      <div class="vipRightBox">
      <!--头部信息-->
        <div class="vipmainHeadBox curvyCorners_5">
        <!--vipHeadLeft-->
          <div class="vipHeadLeft">
            <div class="basicBox">
              <div class="userImg">
               <c:if test="${empty user.userrelationinfo.imgUrl}">
               <img src="<%=basePath %>resources/images/img/user.gif"/>
               </c:if>
               <c:if test="${!empty user.userrelationinfo.imgUrl}">
              	<img src="${user.userrelationinfo.imgUrl}" alt="${session_user.userName }" title="${session_user.userName }" />
              	</c:if>
              </div>
              <h2>
              	<c:if test="${empty isVip }">普通会员</c:if>
              	<c:if test="${!empty isVip }"><font id="blink">特权会员</font></c:if>
              </h2>
              <div class="rzIconBox"> 
              	<a href="/member/mail"
              		<c:if test="${!empty user.userrelationinfo.cardId }"> title="身份证已填写"  class="rzIcon_01 already"</c:if>
              		<c:if test="${empty user.userrelationinfo.cardId || fn:length(user.userrelationinfo.cardId)<=0}">title="身份证未填写" class="rzIcon_01"</c:if>
              	></a> 
              	<a href="/member/mail"
              		<c:if test="${!empty user.userrelationinfo.phone }">title="手机已认证"  class="rzIcon_02 already"</c:if>
              		<c:if test="${empty user.userrelationinfo.phone || fn:length(user.userrelationinfo.phone)<=0}">title="手机未认证" class="rzIcon_02"</c:if>
              	></a> 
              	<a href="/member/mail"
              		<c:if test="${session_user.userrelationinfo.emailisPass==1 }">title="邮箱已认证"  class="rzIcon_04 already"</c:if>
              		<c:if test="${session_user.userrelationinfo.emailisPass!=1 }">title="邮箱未认证" class="rzIcon_04"</c:if>
              	 ></a> 
              	<a href="/member/mail" 
              		<c:if test="${bool }">title="安全问题已设置"  class="rzIcon_05 already"</c:if>
              		<c:if test="${!bool }">title="安全问题未设置" class="rzIcon_05"</c:if>
              	 ></a> 
              </div>
            </div>
            <div class="datainfo">
              <h1>您好，
              <c:if test="${empty session_user.name || fn:length(session_user.name)<=0}">您还没有填写真实姓名</c:if>
              <c:if test="${!empty session_user.name }"> ${session_user.name }</c:if></h1>
              <label>账户余额：<font><fmt:formatNumber value="${empty user.userfundinfo.cashBalance ? '0.00':user.userfundinfo.cashBalance}" pattern="0.00" /></font>元</label>
              <div class="operatingBnt">
              	<a href="/recharge/openRecharge" class="curvyCorners_5" style="background:#ff8a00;">充值</a>
              	<a href="/withdraw/openWithdraw" class="curvyCorners_5" style="background:#33b9ff;">提现</a>
              </div>
              <div style="color:#666666;padding-top:10px;">上次登录：${loginLog.address } ${fn:substring(loginLog.logintime,0,10) }</div>
            </div>
            <div class="clear"><br />
            <c:if test="${empty user.userrelationinfo.cardId || fn:length(user.userrelationinfo.cardId)<=0 || empty user.userrelationinfo.phone || fn:length(user.userrelationinfo.phone)<=0 || empty session_user.userrelationinfo.email || fn:length(session_user.userrelationinfo.email)<=0}">     
            	<a href="/member/mail" class="authenticateBnt">立即进入宝付，注册宝付账户</a>
            </c:if>
            <c:if test="${!empty user.userrelationinfo.cardId && fn:length(user.userrelationinfo.cardId)>0 && !empty user.userrelationinfo.phone && fn:length(user.userrelationinfo.phone)>0 && !empty session_user.userrelationinfo.email && fn:length(session_user.userrelationinfo.email)>0 && empty user.userfundinfo.pIdentNo}">     
            	<!--
				<a href="javascript:regist_bf();" class="authenticateBnt">立即进入宝付，注册宝付账户</a>
				-->
				<a href="#" class="authenticateBnt">立即进入宝付，注册宝付账户</a>
            </c:if>
            </div>
          </div>
        <!--End vipHeadLeft-->
        <!--vipHeadRight-->
          <div class="vipHeadRight">
           <table cellpadding="0" cellspacing="0" class="vipHeadTab">
            <tr><th>昵称：</th><td>${session_user.userName}<i 
            	<c:if test="${empty isVip }">class="vipSeverIconone"</c:if>
              	<c:if test="${!empty isVip }">class="vipSeverIcontwo"</c:if>
            ></i></td></tr>
            <tr><th>信用等级：</th>
            <td>
            <c:choose>
            	<c:when test="${score eq 0}">
            		<img src="resources/images/xing00.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=1 && score <=10}">
            		<img src="resources/images/xing01.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=11 && score <=20}">
            		<img src="resources/images/xing03.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=21 && score <=30}">
            		<img src="resources/images/xing04.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=31 && score <=40}">
            		<img src="resources/images/xing05.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=41 && score <=50}">
            		<img src="resources/images/xing06.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=51 && score <=60}">
            		<img src="resources/images/xing07.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=61 && score <=80}">
            		<img src="resources/images/xing08.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=81 && score <=110}">
            		<img src="resources/images/xing09.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:when test="${score>=111 && score <=180}">
            		<img src="resources/images/xing10.gif" alt="信用等级" title="信用等级" />
            	</c:when>
            	<c:otherwise>
            		<img src="resources/images/xing11.gif" alt="信用等级" title="信用等级" />
            	</c:otherwise>
            </c:choose>
            </td></tr>
            <tr><th>推广编号：</th><td>TG-${session_user.id }</td></tr>
            <tr><th>最新消息：</th><td><a href="/member_index/system_message" class="vipmsg">（${messagecount}）</a></td></tr>
            <tr><th>会员期限：</th>
            	<td>
            	
	            	<c:if test="${empty isVip }">永久</c:if>
	              	<c:if test="${!empty isVip }">${isVip }</c:if>
            	</td>
            </tr>
            <tr><td colspan="2">  <a href="http://58.246.68.126:7082/IpsSmsTimer/index.jsp" class="authenticateBnt" target="blank">环迅获取手机号码</a></td></tr>
           </table>
          </div>
        <!--End vipHeadRight-->
          <div class="clear"></div>
        </div>
      <!--End 头部信息-->
        <table cellpadding="0" cellspacing="0" class="vipBasicInfo">
         <tbody>
          <tr>
          	<th>真实姓名：</th>
          	<td>
	          	<c:if test="${empty session_user.name || fn:length(session_user.name)<=0}">未设置</c:if>
	            <c:if test="${!empty session_user.name }"> ${session_user.name }</c:if>
          	</td>
          	<th>身份证号码：</th>
          	<td>
          		<c:if test="${empty user.userrelationinfo.cardId || fn:length(user.userrelationinfo.cardId)<=0}">未设置</c:if>
	            <c:if test="${!empty user.userrelationinfo.cardId }"> ${user.userrelationinfo.cardId }</c:if>
          	</td>
          </tr>
          <tr>
          	<th>手机号码：</th>
          	<td>
          		<c:if test="${empty user.userrelationinfo.phone || fn:length(user.userrelationinfo.phone)<=0}">未设置</c:if>
	            <c:if test="${!empty user.userrelationinfo.phone }"> ${user.userrelationinfo.phone }<a href="/member/mail">[修改并验证]</a></c:if>
          	</td>
          	<th>安全问题：</th>
          	<td>
          		<c:if test="${!bool}">未设置</c:if>
	            <c:if test="${bool}">已设置<a href="/member/mail">[修改并验证]</a></c:if>
          	</td>
          </tr>
          <tr>
          	<th>昵称：</th>
          	<td>
          		<c:if test="${empty session_user.nickname || fn:length(session_user.nickname)<=0}">未设置</c:if>
	            <c:if test="${!empty session_user.nickname }"> ${session_user.nickname }<a href="#">[修改]</a></c:if>
          	</td>
          	<th>电子邮箱：</th>
          	<td>
          		<c:if test="${empty session_user.userrelationinfo.email || fn:length(session_user.userrelationinfo.email)<=0}">未设置</c:if>
	            <c:if test="${!empty session_user.userrelationinfo.email }"> ${session_user.userrelationinfo.email }<a href="/member/mail">[修改并验证]</a></c:if>
          	</td>
          </tr>
          <tr>
          	<th>注册时间：</th>
          	<td>${fn:substring(session_user.createTime,0,10)}</td>
          	<th>会员等级：</th>
          	<td> 
          		<c:if test="${empty isVip }">普通会员<a href="/userinfovip/upgrade.htm">[升级成VIP]</a></c:if>
              	<c:if test="${!empty isVip }"><font id="blink">特权会员</font></c:if>
          	</td>
          </tr>
         </tbody>
         <tfoot>
          <tr>
	          <td colspan="4">
	          <div style="display: inline-block; padding-left: 15px; vertical-align: top; "><img src="/resources/images/vipcenter_tishiiocn.jpg" align="absmiddle"/>&nbsp;&nbsp;温馨提示：为了您账户安全，请尽快完善安全验证！</div>
	          </td>
	      </tr>
         </tfoot>
        </table>
        <div class="vipBasicInfoBox">
         <table cellpadding="0" cellspacing="0" class="basicTabIn">
          <tr><th>账户资金总额</th><td><font><fmt:formatNumber value="${user.userfundinfo.cashBalance+lentBid+noTransfer-payment}" pattern="0.00"/></font>元</td></tr>
          <tr><th>可用金额</th><td><font><fmt:formatNumber value="${empty user.userfundinfo.money ? '0.00':user.userfundinfo.money}" pattern="0.00" /></font>元</td></tr>
          <tr><th>冻结金额</th><td><font><fmt:formatNumber value="${empty user.userfundinfo.frozenAmtN ? '0.00':user.userfundinfo.frozenAmtN}" pattern="0.00"/></font>元</td></tr>
          <tr><th>预计账户总收益</th><td><font><fmt:formatNumber value="${interest}" pattern="0.00"/></font>元</td></tr>
         </table>
         <table cellpadding="0" cellspacing="0" class="basicTabIn">
          <tr><th>已得收益</th><td><font><fmt:formatNumber value="${realMoney}" pattern="0.00"/></font>元</td></tr>
          <tr><th>待收收益</th><td><font><fmt:formatNumber value="${dueRepay}" pattern="0.00"/></font>元</td></tr>
          <tr><th>待收本金</th><td><font><fmt:formatNumber value="${toMoney}" pattern="0.00"/></font>元</td></tr>
          <tr><th>奖励金额</th><td><font><fmt:formatNumber value="${user.userfundinfo.bonusBalance}" pattern="0.00"/></font>元</td></tr>
         </table>
         <table cellpadding="0" cellspacing="0" class="basicTabIn" style="margin:0px;">
          <tr><th>累计已出借总额</th><td><font><fmt:formatNumber value="${lentBid+recoveryLoan+harvestedLoan}" pattern="0.00"/></font>元</td></tr>
          <tr><th>待确认充值</th><td><font><fmt:formatNumber value="${noRecharge==null?'0.00':noRecharge}" pattern="0.00"/></font>元</td></tr>
          <tr><th>待确认提现</th><td><font><fmt:formatNumber value="${noTransfer==null?'0.00':noTransfer}" pattern="0.00"/></font>元</td></tr>
          <tr><th>提现处理中</th><td><font><fmt:formatNumber value="${noTransfer==null?'0.00':noTransfer}" pattern="0.00"/></font>元</td></tr>
         </table>
         <div class="clear"></div>
        </div>
        <table cellpadding="0" cellspacing="0" class="vipRecordTab">
         <thead><tr><td colspan="5">投资记录<a href="depositshistory/init_two">[明细]</a></td></tr></thead>
         <tbody>
          <tr>
          	<th>竞标中投资</th>
          	<th>回收中投资</th>
          	<th>收完的投资</th>
          	<th>累计收益</th>
          	<th>累计逾期</th>
          </tr>
          <tr>
          	<td>
          		<fmt:formatNumber value="${lentBid==null?'0.00':lentBid}" pattern="0.00"/> 元
          	</td>
          	<td>
				<fmt:formatNumber value="${recoveryLoan==null?'0.00':recoveryLoan}" pattern="0.00"/> 元
			</td>
          	<td>
          		<fmt:formatNumber value="${harvestedLoan==null?'0.00':harvestedLoan}" pattern="0.00"/> 元
          	</td>
          	<td>
          		<fmt:formatNumber value="${inCome==null?'0.00':inCome}" pattern="0.00"/> 元
          	</td>
          	<td>
          		<fmt:formatNumber value="${overPayment}" pattern="0.00"/> 元
          	</td>
          </tr>
         </tbody>
        </table>
        
        <table cellpadding="0" cellspacing="0" class="vipRecordTab">
         <thead><tr><td colspan="6">借款记录<a href="borrower_record/toRecord">[明细]</a></td></tr></thead>
         <tbody>
          <tr>
          	<th>发标中借款</th>
          	<th>偿还中借款</th>
          	<th>还清的借款</th>
          	<th>累计利息成本</th>
          	<th>授信额度</th>
          	<th>已用额度</th>
          </tr>
          <tr>
          	<td><font><fmt:formatNumber value="${issuingThe==null?'0.00':issuingThe}" pattern="0.00"/></font> 元</td>
          	<td><font><fmt:formatNumber value="${repaymentThe==null?'0.00':repaymentThe}" pattern="0.00"/></font> 元</td>
          	<td><font><fmt:formatNumber value="${borrowed==null?'0.00':borrowed}" pattern="0.00"/></font> 元</td>
          	<td><font><fmt:formatNumber value="${interest==null?'0.00':interest}" pattern="0.00"/></font> 元</td>
          	<td><font><fmt:formatNumber value="${user.userfundinfo.credit}" pattern="0.00"/></font> 元</td>
          	<td><font><fmt:formatNumber value="${usedAmount==null?'0.00':usedAmount}" pattern="0.00"/></font> 元</td>
          </tr>
         </tbody>
        </table>
      </div>
      <!--End vipRight-->
    <%-- </div>
    <!--End vipcontent-->
  </div>
</div>
<!--End vipContent-->--%>
<%-- <jsp:include page="/WEB-INF/views/visitor/footer.jsp" /> --%>
</body>
</html>
