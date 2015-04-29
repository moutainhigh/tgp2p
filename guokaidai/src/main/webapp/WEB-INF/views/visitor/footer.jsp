<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="clear"></div>
<!--footer-->
<style>
.footer span {
	display: block;
	width: 150px;
	height: 27px;
}

.footer .last span {
	display: block;
	width: 120px;
	height: 27px;
}

.footer .top_2 span {
	display: block;
	width: 250px;
	height: 27px;
	line-height: 27px;
}

.footer a {
	color: #eee;
	font-size: 12px;
}
</style>
<div class="footer"
	style="background-color: #475058; height: 340px; margin: 0; padding: 0;">
	<div class="w960px">
		<div style="height: 190px;">
			<div
				style="width: 435px; height: 190px; border-right: 1px solid #475058; float: left;">
				<table
					style="width: 425px; height: 150px; margin: 40px 0 0 10px; text-align: left;">
					<tr>
						<c:forEach items="${topics}" var="item">
							<c:if test="${item.isfooter==1}">
								<c:set var="isMatch" scope="page">0</c:set>
								<c:forEach items="${appDeputys}" var="item1">
									<c:if
										test="${item1.isfooter==1&&item.id==item1.topic.id&& isMatch ne 1}">
										<c:set var="isMatch" scope="page">1</c:set>
										<td style="width: 150px; height: 150px" valign="top"><span
											style="font-weight: bold; color: #fff"> <a
												href="javascript:void(0)" style="font-size: 13px;">
													${item.name}</a> </span> <c:forEach items="${appDeputys}" var="item1">
												<c:if test="${item1.isfooter==1&&item.id==item1.topic.id}">
													<span><a href="${item1.url}">${item1.name}</a> </span>
												</c:if>
											</c:forEach></td>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div
				style="width: 280px; height: 190px; border-right: 1px solid #475058; float: left;position: relative;">
				<table
					style="width: 230px; height: 150px; margin: 40px 0 0 30px; text-align: left;">
					<tr>
						<td class="top_2" valign="top"><span
							style="font-weight: bold; color: #fff"><a
								href="to/single-6-69.htm" style="font-size: 13px;"><img
									src="resources/images/img/zxkf.jpg"
									style="width: 25px; height: 27px" align="absmiddle" />在线客服</a> </span> <span
							style="height: 30px;"> &nbsp;<span
								style="font-size: 24px; color: #fff;display: inline;">${footer.phone}</span> </span> <span
							style="height: 20px; font-size: 12px; color: #fff"> （工作时间
								<font style="font-size: 12px; color: #eee;">${footer.workTime}</font>） </span>
							<div style="margin: 35px 0 0 0px;">
								<div class="ft-serv-handle clearfix">
									<div title="微信"
										class="icon-hdSprite icon-ft-weixin a-move a-moveHover">
										<div class="QRcodePop clearfix" id="QRcode"
											style="display: none; opacity: 1.0;">
											<!-- <div class="h-q-c-right icon-hdSprite icon-hd-erweima"></div> -->
											<img src="/resources/images/img/weixin.png" style="width:85px;height:85px; display: block;"/>
											<span class="css-triangle"
												style="margin-top: 14px;height: 0px;width: 0px;"></span>
										</div>
									</div>
									<a href="${footer.xlurl }" target="_blank"
										title="新浪微博"
										class="icon-hdSprite icon-ft-sina a-move a-moveHover"></a> <a
										href="${footer.txurl }" target="_blank"
										title="腾讯微博"
										class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover"></a>
									<div title="QQ群" class="icon-ft-qun a-move a-moveHover">
										<div class="QRcodePop QRcodePop1 clearfix" id="QRcode1"
											style="display: none; opacity: 1;">
											<div class="h-q-c-right icon-hd-qun">
												<p>太平洋理财QQ交流群</p>
												<p>
													Q群：<font style="color:#e25353">${footer.qqGroupNumber}</font>
												</p>
											</div>
											<span class="css-triangle"
												style="margin-top: 14px;height: 0px;width: 0px;"></span>
										</div>
									</div>
									<a href="mailto:${footer.email }" target="_blank"
										title="email"
										class="icon-hdSprite icon-ft-email a-move a-moveHover mrn"></a>
								</div> </div></td>
					</tr>
				</table>
			</div>
			<script>
				$(".icon-ft-weixin").hover(function() {
					$("#QRcode").css("display", "block");
				}, function() {
					$("#QRcode").css("display", "none");
				});
				$(".icon-ft-qun").hover(function() {
					$("#QRcode1").css("display", "block");
				}, function() {
					$("#QRcode1").css("display", "none");
				});
			</script>
			<div class="ft-wap clearfix">
            <!-- <span class="icon-hdSprite icon-ft-phone"></span> -->
            <!-- <ul class="mobile-client">
                <li class="mobile-client-iphone"><a target="_blank" href="javascript:void(0)">iPhone</a></li>
                <li class="mobile-client-android"><a target="_blank" href="javascript:void(0)">Android</a></li>
                <li class="mobile-client-wap"><a target="_blank" href="javascript:void(0)">点击访问手机版</a></li>
            </ul> -->
            <dl>
                <dt style="color:#fff;font-size:12px;">扫描登陆太平洋理财</dt>
                <dd>
                    <img src="/resources/images/img/client.png" style="width:91px;height:91px;float:left"/>
                    <%-- <div class="icon-hdSprite icon-ft-erweima"></div> --%>
                </dd>
            </dl>
       	 	</div>
		</div>
	</div>
	<div style="height: 150px; border-top: 1px solid #000000; background-color: #000000">
		<div style="width: 360px; height: 60px; margin: 0 auto; padding-top: 30px;">
			<a href="http://www.miibeian.gov.cn/publish/query/indexFirst.action" class="icon-approve approve-1 fadeIn-2s"></a>
			<a href="http://webscan.360.cn/index/checkwebsite?url=www.cdbdai.com " class="icon-approve approve-2 fadeIn-2s"></a>
			<a href="https://ss.knet.cn/verifyseal.dll?sn=e14072844120051842bdox000000&comefrom=trust" class="icon-approve approve-3 fadeIn-2s"></a>
			<a href="http://www.cyberpolice.cn/wfjb/" class="icon-approve approve-4 fadeIn-2s"></a>
		</div>
		<div style="width: 650px; margin: 0 auto;">
			<span
				style="width: 650px; font-size: 12px; color: #ddd; text-align: center;">
				© ${footer.copyright }&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${footer.url }">${footer.name
					}</a>&nbsp;&nbsp;|&nbsp;&nbsp;${footer.records}</span>
		</div>
	</div>
</div>
<!-- end footer -->
