<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="clear"></div>
<!--footer-->
<div class="footer">
	<div class="w960px">
		<div class="webLinkBox">
			<div class="webLinks">
				<span style="font-weight: bold;">友情链接：</span>
				<c:forEach items="${application_link}" var="link">
					<c:if test="${link.type eq 0 }">
						<a href="${link.url}" target="_bank">${link.name}</a>
					</c:if>
				</c:forEach>
			</div>
			<div class="weibeBox">
				<span>关注我们:</span><a href="#"><img
					src="../resources/images/weiboicon_1.png" title="关注我们微信" alt="" onmousemove="$(this).attr('src','../resources/images/weiboicon_1s.png')" onmouseout="$(this).attr('src','../resources/images/weiboicon_1.png')" /></a><a
					href="#"><img src="../resources/images/weiboicon_2.png"
					title="我们新浪微博" alt="" onmousemove="$(this).attr('src','../resources/images/weiboicon_2s.png')" onmouseout="$(this).attr('src','../resources/images/weiboicon_2.png')"/></a><a href="#"><img
					src="../resources/images/weiboicon_3.png" title="我们腾讯微博" alt="" onmousemove="$(this).attr('src','../resources/images/weiboicon_3s.png')" onmouseout="$(this).attr('src','../resources/images/weiboicon_3.png')"/></a>
			</div>
		</div>
		<div class="footerCont">
			<div class="footerLeft">
				<img src="../resources/images/footerTelImg.jpg"
					style="margin-top: 30px;" />
			</div>
			<div class="footerRight">
				<div style="border-top: 0px; text-align: center;">
					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:forEach items="${topics }" var="t">
						<c:if test="${t.isfooter == 1 && i <= 3}">
							<c:set var="i" value="${i+1}" />
							<dl>
								<dt>
									<i class="footerIcon_${i }"></i>${t.name }</dt>
								<c:forEach items="${appDeputys }" var="d">
									<c:if test="${d.isfooter == 1 && d.topic.id == t.id && j<=4}">
										<c:set var="j" value="${j+1}" />
										<dd>
											<a href="${d.url }">${d.name }</a>
										</dd>
									</c:if>
								</c:forEach>
							</dl>
						</c:if>
						<c:set var="j" value="0" />
					</c:forEach>
					<div class="clear" style="padding: 0px; border: 0px;"></div>
				</div>
				<div>
					公司地址：${footer.address}&nbsp;&nbsp;&nbsp;E-mail：${footer.email}<br />
					© ${footer.copyright } <a href="#">${footer.name }</a>
					${footer.context }<a href="#">备ICP证 ${footer.records}</a>
				</div>
				<div style="text-align: center;">
					<c:set var="verify_count" value="0"/>
					<c:forEach items="${application_link}" var="link">
						<c:if test="${link.type eq 1 && verify_count < 5 }">
							<a href="${link.url}" target="_bank"><img src="${link.verifyImg}" title="${link.remark}" alt=""/></a>
						</c:if>
						<c:set var="verify_count" value="${verify_count+1 }"/>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<!--End footer-->