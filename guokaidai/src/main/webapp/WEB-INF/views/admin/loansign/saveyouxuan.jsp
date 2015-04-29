<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.textarea {
	width: 510px;
	height: 100px;
	border: 1px red soild
}
</style>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="resources/js/loanSign/addLoanSign.js"
	type="text/javascript"></script>
<div class="pageContent">
	<form id="form1" method="post" action="/loanSign/saveyouxuan"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<input type="text" style="display: none;" name="id"
				value="${loansign.id}" />
			<p>
				<label> 太平洋理财理财融资人</label> <input type="text" class="required"
					name="Userbasicsinfo.name" value="${loansign.userbasicsinfo.name}"
					readonly="readonly" />
				<c:if test="${loperNumber ne '3'&& loansign.loanstate eq '1'}">
					<input type="hidden" name="Userbasicsinfo.id"
						value="${loansign.userbasicsinfo.id}" />
				</c:if>
				<c:if test="${operNumber eq '1'}">
					<a class="btnLook" href="/loanSign/borroweryouxuan" width="520"
						lookupGroup="Userbasicsinfo">查找带回</a>
				</c:if>
				<c:if test="${loperNumber ne '3'&& loansign.loanstate eq '1'}">
					<a class="btnLook" href="/loanSign/borroweryouxuan" width="520"
						lookupGroup="Userbasicsinfo">查找带回</a>
				</c:if>
			</p>
			<p>
				<label>还款方式</label> <select name="refundWay">
					<option value="1">按月等额本息</option>
					<%-- <option value="2" <c:if test="${loansign.refundWay eq  '2'}">selected="selected"</c:if>>按月付息到期还本</option>
						<option value="3" <c:if test="${loansign.refundWay eq  '3'}">selected="selected"</c:if>>到期一次性还本息</option> --%>
				</select>
			</p>
			<p>
				<label>计划金额</label> <input type="text" name="issueLoan"
					id="issueLoan" class="required number" min="10000" maxlength="15">元
			</p>
			<p>
				<label>计划标题</label> <input name="loanTitle" type="text"
					class="required" minlength="1" maxlength="20" />
			</p>
			<p>
				<label>期数</label> <input name="loanNumber" type="text"
					class="required number" minlength="1" maxlength="20" />
			</p>
			<p>
				<label>最小借出单位</label> <select name="loanUnit" id="loanUnit">
				    <option value="10000">1000</option>
				    <option value="10000">5000</option>
					<option value="10000">10000</option>
					<option value="15000">15000</option>
					<option value="20000">20000</option>
					<option value="25000">25000</option>
					<option value="30000">30000</option>
					<option value="50000">50000</option>
				</select>
			</p>
			<p>
				<label>风险评估</label> <select name="riskAssess">
					<option value="1">低</option>
					<option value="2">中</option>
					<option value="3">高</option>
				</select>
			</p>
			<p>
				<label>预期收益</label> <input name="rate" type="text"
					class="required number" min="0" max="30" pattern="0" />%
			</p>
			<p>
				<label>是否显示</label> <input name="isShow" value="1" type="radio" checked="checked"/>显
				示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					name="isShow" value="2" type="radio" />不显示
			</p>
			<!-- 			<p> -->
			<!-- 				<label>结束时间</label> -->
			<%-- 				<input type="text" datefmt="yyyy-MM-dd" class="date required" name="endTime" value="${loansign.endTime}" readonly="readonly"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if> /> --%>
			<!-- 			</p> -->
			<p>
				<label>投标范围</label> <select id="typeid" name="type"
					style="width: 133px;">
					<option value="7">太平洋理财理财</option>
				</select>
			</p>
			<p>
				<label>保障方式</label> <input name="assure" class="required"
					value="${loansignbasics.assure}" type="text" maxlength="50" />
			</p>
			<p>
				<label>普通会员最大份数</label> <input name="counterparts" id="counterparts"
					class="required" type="text" maxlength="30" />
			</p>
			<p>
				<label>VIP最大份数</label> <input name="vipCounterparts"
					id="vipCounterparts" class="required" type="text" maxlength="30" />
			</p>
			<p>
				<label>预定时间</label> <select name="bidTime">
					<option value="1">1天后</option>
					<option value="2">2天后</option>
					<option value="3">3天后</option>
					<option value="4">4天后</option>
				</select>
			</p>

			<p>
				<label>锁定期限</label> <select name="month" id="month">
					<option value="12">12个月</option>
				</select>
			</p>
			<!-- 			<p> -->
			<!-- 				<label>借款管理费</label> -->
			<%-- 				<input name="mgtMoney" value="${loansignbasics.mgtMoney }" class="number" type="text"  readonly="readonly" maxlength="20" />元 --%>
			<!-- 			</p> -->
			<p style="clear: both; height: 100px; width: 100%">
				<label>太平洋理财理财概述</label>
				<textarea class="textarea required" name="overview" rows="20"
					cols="20"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>资金用途</label>
				<textarea class="textarea required" name="behoof" rows="20"
					cols="20"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>太平洋理财理财还款来源</label>
				<textarea class="textarea required" name="loanOrigin" rows="20"
					cols="20"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>风险控制措施</label>
				<textarea class="textarea required" name="riskCtrlWay" rows="20"
					cols="20"></textarea>
			</p>
			<%-- <p  style="clear: both;height: 100px;width: 100%">
				<label>借款人感言</label>
				<textarea class="textarea" name="speech" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.speech}</textarea>
			</p> --%>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="reset" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
