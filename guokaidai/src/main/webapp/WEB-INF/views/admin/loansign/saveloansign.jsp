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
	<form id="form1" method="post" action="/loanSign/saveLoansign"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" id="refun" name="Userbasicsinfo.refun" /> <input
			type="hidden" id="borrowmonth" name="Userbasicsinfo.borrowmonth" />
		<input type="hidden" id="rate1" name="Userbasicsinfo.rate" /> <input
			type="hidden" id="money" name="Userbasicsinfo.money" /> <input
			type="hidden" id="loantype" name="Userbasicsinfo.loantype" /> <input
			type="hidden" id="behoof1" name="Userbasicsinfo.behoof" /> <input
			type="hidden" id="cash" name="Userbasicsinfo.cash" />
		<!-- 查找带回结束 -->
		<input type="hidden" id="issueLoan" name="issueLoan" /> <input
			type="hidden" id="rate" name="rate" /> <input type="hidden"
			id="refunway" name="refundWay" /> <input type="hidden" id="type"
			name="type" /> <input type="hidden" id="month" name="month" /> <input
			type="hidden" id="behoof" name="behoof" /> <input type="hidden"
			id="guaranteesAmt" name="guaranteesAmt" />
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<p>
				<label> 借款人</label> <input type="text" class="required"
					name="Userbasicsinfo.name" value="" readonly="readonly" /> <input
					type="hidden" name="Userbasicsinfo.id" value="" /> <a
					class="btnLook" href="/baseLoanSign/borrowersbaseLists" width="520"
					lookupGroup="Userbasicsinfo">查找带回</a>
			</p>
			<p>
				<label>还款方式</label> <input type="text"
					name="Userbasicsinfo.refunway" class="required" readonly="readonly">
			</p>
			<p>
				<label>本期借款额</label> <input type="text" name="Userbasicsinfo.money"
					class="required number" readonly="readonly" min="100"
					maxlength="15">元
			</p>
			<p>
				<label>最小借出单位</label> <select name="loanUnit" id="loanUnit">
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
					<option value="300">300</option>
					<option value="500">500</option>
					<option value="1000">1000</option>
				</select>
			</p>
			<p>
				<label>标种子类型</label> <select name="subType" id="subType">
					<option value="1">富担标</option>
					<option value="2">担保</option>
					<option value="3">抵押</option>
					<option value="4">信用</option>
					<option value="5">实地</option>
				</select>
			</p>
			<p>
				<label>还款期限</label> <input type="text"
					name="Userbasicsinfo.borrowmonth" class="required"
					readonly="readonly">
			</p>
			<p>
				<label>借款标号</label> <input name="loanNumber" type="text" value=""
					class="required number" minlength="1" maxlength="20" />
			</p>
			<p>
				<label>借款标题</label> <input name="loanTitle" type="text"
					class="required" minlength="1" maxlength="20" />
			</p>

			<p>
				<label>风险评估</label> <select name="riskAssess">
					<option value="1">低</option>
					<option value="2">中</option>
					<option value="3">高</option>
				</select>
			</p>

			<p>
				<label>年化利率</label> <input name="Userbasicsinfo.rate" type="text"
					class="required number" min="0" max="30" />%
			</p>
			<p>
				<label>是否显示</label> <input name="isShow" value="1" type="radio"
					checked="checked" />显
				示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					name="isShow" value="2" type="radio" />不显示
			</p>
			<p></p>

			<p>
				<label>推荐到首页</label> <input name="isRecommand" value="1"
					type="radio" checked="checked" />推
				荐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					name="isRecommand" value="2" type="radio" />不推荐
			</p>
			<!-- 			<p> -->
			<!-- 				<label>结束时间</label> -->
			<%-- 				<input type="text" datefmt="yyyy-MM-dd" class="date required" name="endTime" value="${loansign.endTime}" readonly="readonly"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if> /> --%>
			<!-- 			</p> -->
			<p>
				<label>担保方</label> <input name="assure" class="required" type="text"
					maxlength="50" />
			</p>
			<p>
				<label>反担保方式</label> <input name="unassureWay" class="required"
					type="text" maxlength="30" />
			</p>
			<p>
				<label>借款标类型</label> <input type="text" name="Userbasicsinfo.type"
					class="required" readonly="readonly">
			</p>

			<p>
				<label>普通会员最大份数</label> <input name="counterparts" id="counterparts"
					class="required" value="" type="text" maxlength="30" />
			</p>
			<p>
				<label>VIP最大份数</label> <input name="vipCounterparts"
					id="vipCounterparts" class="required" value="" type="text"
					maxlength="30" />
			</p>

			<p>
				<label>招标期限</label> <select name="bidTime">
					<option value="1">1天</option>
					<option value="5">5天</option>
					<option value="10">10天</option>
					<option value="15">15天</option>
					<option value="20">20天</option>
				</select>
			</p>
			<p>
				<label>保证金</label> <input name="Userbasicsinfo.cash" class="number"
					type="text" readonly="readonly" />元
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>借款方商业概述</label>
				<textarea class="textarea required" name="overview" rows="20"
					cols="20"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>借款方借款用途</label>
				<textarea name="Userbasicsinfo.behoof" class="textarea required"
					rows="20" cols="20" readonly="readonly"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>借款方还款来源</label>
				<textarea class="textarea required" name="loanOrigin" rows="20"
					cols="20"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>风险控制措施</label>
				<textarea class="textarea required" name="riskCtrlWay" rows="20"
					cols="20"></textarea>
			</p>
			<p style="clear: both; height: 100px; width: 100%">
				<label>借款人感言</label>
				<textarea class="textarea" name="speech" rows="20" cols="20"></textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>

				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="submit">保存</button>
						</div>
					</div>
				</li>

				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="reset" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
