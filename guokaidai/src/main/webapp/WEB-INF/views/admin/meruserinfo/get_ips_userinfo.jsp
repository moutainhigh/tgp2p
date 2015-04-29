<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
		<div class="pageFormContent" layoutH="70">
			<c:if test="${merUserInfo.pErrCode eq '0000' }">
			<p>
				<label>用户名：</label>
						${userName }
			</p>
			<p>
				<label>IPS账号：</label>
						${merUserInfo.pIpsAcctNo }
			</p>
			<p>
				<label>注册邮箱：</label>
				${merUserInfo.pEmail }
			</p>
			<p >
				<label>账户开通状态：</label>
					<c:choose>
					<c:when test="${merUserInfo.pStatus eq '01'}">未开通</c:when>
					<c:when test="${merUserInfo.pStatus eq '02'}">未激活</c:when>
					<c:when test="${merUserInfo.pStatus eq '03'}">开通失败</c:when>
					<c:when test="${merUserInfo.pStatus eq '04'}">已开通</c:when>
					<c:when test="${merUserInfo.pStatus eq '05'}">已删除</c:when>
					</c:choose>
			</p>
			<p>
				<label>身份证验证状态：</label>
					<c:choose>
					<c:when test="${merUserInfo.pUCardStatus eq '01'}">未验证</c:when>
					<c:when test="${merUserInfo.pUCardStatus eq '02'}">验证通过</c:when>
					<c:when test="${merUserInfo.pUCardStatus eq '03'}">验证失败</c:when>
					</c:choose>
			</p>
			<p>
				<label>提现银行名称：</label>
					${merUserInfo.pBankName }
			</p>
			<p>
				<label>银行卡号后四位：</label>
					${merUserInfo.pBankCard }
			</p>
			<p>
				<label>银行卡状态：</label>
					<c:choose>
					<c:when test="${merUserInfo.pBCardStatus eq '01'}">未登记</c:when>
					<c:when test="${merUserInfo.pBCardStatus eq '02'}">已登记</c:when>
					<c:when test="${merUserInfo.pBCardStatus eq '02'}">登记失败</c:when>
					</c:choose>
			</p>
			<p>
				<label>代扣签约状态：</label>
					<c:choose>
					<c:when test="${merUserInfo.pSignStatus eq '01'}">签约申请中</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '02'}">签约处理中</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '03'}">签约失败</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '04'}">签约成功</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '05'}">解约申请中</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '06'}">解约处理中</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '07'}">解约失败</c:when>
					<c:when test="${merUserInfo.pSignStatus eq '08'}">解约完成</c:when>
					</c:choose>
			</p>
				</c:if>
			<center>
				<c:if test="${merUserInfo.pErrCode=='02'}">
				<br/>
				<br/>
					查询不到账号	${merUserInfo.pIpsAcctNo } 
				</c:if>
				<c:if test="${merUserInfo.pErrCode!='02'&& merUserInfo.pErrCode!='0000'}">
				<br/>
				<br/>
					获取失败
				</c:if>
				</center>
		</div>
</div>