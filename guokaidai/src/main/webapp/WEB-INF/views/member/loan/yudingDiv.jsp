<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="yudingDiv" style="display: none;width:450px;height:auto;padding-bottom:20px;border:1px solid #ddd;background-color:#fff;position:absolute;left:220px;top:60px;z-index:1000">
  <div style="width:100%;height:40px;background-color:#efefef">
  	<span style="float:left;line-height:40px;font-size:20px;padding-left:140px">请确认预定信息</span>
  	<a class="closeYuding" style="display:block;width:22px;height:22px;float:right;background:url(/resources/images/close.gif) no-repeat;margin: 8px 8px 0 0 "></a>
  </div>
  <div style="width:100%;height:120px;padding:10px 0;">
	<span style="font-size:12px;color:#444;line-height:25px;padding:0 10px 0 20px">计划名称</span>
	<span style="font-size:13px;color:#000;line-height:25px">${loan.loansignbasics.loanTitle}</span><br/>
	<span style="font-size:12px;color:#444;line-height:25px;padding:0 10px 0 20px">预期收益</span>
	<span style="font-size:13px;color:#000;line-height:25px"><fmt:formatNumber value="${loan.rate*100}" pattern="##.#" minFractionDigits="1" />%每年</span><br/>
	<span style="font-size:12px;color:#444;line-height:25px;padding:0 10px 0 20px">锁定期限</span>
	<span style="font-size:13px;color:#000;line-height:25px">${loan.month}个月</span><br/>
	<span style="font-size:12px;color:#444;line-height:25px;padding:0 10px 0 20px">加入费用</span>
	<span style="font-size:13px;color:#000;line-height:25px">0元</span><br/>
	<span style="font-size:12px;color:#444;line-height:25px;padding:0 10px 0 20px">加入金额</span>
	<span style="font-size:13px;color:#000;line-height:25px"><font class="yudingMoney" style="font-size:13px;color:#000;line-height:25px"></font>元</span>
  </div>
  <div style="width:430px;margin-left:10px;background-color:#fde7c0;border-radius:5px;border:1px solid #eee0c5">
  	<div style="width:400px;margin-left:10px;padding:5px 0;">
      <span style="font-size:12px;color:#333;line-height:30px">温馨提示：</span><br/>
	  <span style="font-size:12px;color:#333;line-height:20px">若您预定成功，请于<font style="font-size:12px;color:#fb8d3e">2014-09-10 12:30</font>前支付剩余金额<font class="yudingMoney" style="font-size:12px;color:#fb8d3e;line-height:20px"></font>元。超过时限未完成支付，视为您主动放弃加入本计划，加入资格作废，定金不予返还。</span>
	</div>
  </div>
  <a id="submit" href="javascript:;" style="display:block;width:80px;height:30px;line-height:30px;text-align:center;font-size:16px;color:#fff;background-color:#0398da;border-radius:5px;border:1px solid #1970a6;margin:20px 0 0 110px;float:left">确认</a>
  <a class="closeYuding" style="display:block;width:80px;height:30px;line-height:30px;text-align:center;font-size:16px;color:#333;background-color:#dbdbdb;border-radius:5px;border:1px solid #d5d5d5;margin:20px 0 0 50px;float:left">取消</a>
</div>
<div id="yudingSuccess" style="display: none;width:380px;height:auto;padding-bottom:20px;border:1px solid #ddd;background-color:#fff;position:absolute;left:260px;top:120px;z-index:1000">
  <div style="width:100%;height:40px;background-color:#efefef">
    <span style="float:left;line-height:40px;font-size:20px;padding-left:75px">太平洋理财理财计划预定成功！</span>
    <a class="closeYudingSuccess" style="display:block;width:22px;height:22px;float:right;background:url(/resources/images/close.gif) no-repeat;margin: 8px 8px 0 0 "></a>
  </div>
  <div style="width:350px;margin-left:15px;margin-top:10px">
    <span style="font-size:12px;color:#444;line-height:25px;">
      您已支付定金0.00元，请您于<font style="color:#fb8d3e">2014-09-10 12:30</font>前支付剩余金额<font class="yudingMoney"></font>元。超过时限未完成支付，视为您主动放弃加入本计划，加入资格将作废，定金不予返还。
    </span>
  </div>
  <a href="/member_index/myYouxuan.htm" style="display:block;width:80px;height:30px;line-height:30px;text-align:center;font-size:16px;color:#fff;background-color:#0398da;border-radius:5px;border:1px solid #1970a6;margin:10px 0 0 140px;float:left">立即支付</a>
</div>
<div id="yudingBg" style="display: none;position: absolute;top: 0;left: 0;z-index: 999;width:1000px;background: #000;opacity: 0.2;filter: alpha(opacity=20);"></div>
