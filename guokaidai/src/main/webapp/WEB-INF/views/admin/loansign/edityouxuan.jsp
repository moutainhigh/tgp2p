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
	<form id="form1" method="post" action="/loanSign/updateyouxuan"
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
						<input type="hidden"  name="Userbasicsinfo.id" value="${loansign.userbasicsinfo.id}" />
					</c:if>
				<%-- <c:if test="${operNumber eq '1'}">
					<a class="btnLook" href="/loanSign/borroweryouxuan"
						width="520" lookupGroup="Userbasicsinfo">查找带回</a>
				</c:if>
				<c:if test="${loperNumber ne '3'&& loansign.loanstate eq '1'}">
					<a class="btnLook" href="/loanSign/borroweryouxuan"
						width="520" lookupGroup="Userbasicsinfo">查找带回</a>
				</c:if> --%>
			</p>
			<p>
				<label>还款方式</label> <select name="refundWay"
					<c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>
					<c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if>>
					<option value="1"
						<c:if test="${loansign.refundWay eq  '1'}">selected="selected"</c:if>>按月等额本息</option>
					<%-- <option value="2" <c:if test="${loansign.refundWay eq  '2'}">selected="selected"</c:if>>按月付息到期还本</option>
						<option value="3" <c:if test="${loansign.refundWay eq  '3'}">selected="selected"</c:if>>到期一次性还本息</option> --%>
				</select>
			</p>
			<p>
				<label>计划金额</label> <input type="text" name="issueLoan"
					id="issueLoan" value="${loansign.issueLoan}"
					class="required number" min="100" maxlength="15"
					<c:if test="${operNumber eq '2'}">readonly="readonly"  </c:if>
					<c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>元
			</p>
			<p>
				<label>计划标题</label> <input name="loanTitle" type="text"
					value="${loansignbasics.loanTitle}" class="required" minlength="1"
					maxlength="20"
					<c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>
					<c:if test="${operNumber eq '3'}">  disabled="true" </c:if> />
			</p>
			<p>
				<label>期数</label>
				<input name="loanNumber"  type="text" value="${loansignbasics.loanNumber }"  class="required number"  minlength="1" maxlength="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>  <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>/>
			</p>
			<p>
				<label>最小借出单位</label>
				<select name="loanUnit" id="loanUnit" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>  <c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if>>
						<option value="1000" <c:if test="${loansign.loanUnit eq  '1000'}">selected="selected"</c:if>>1000</option>
						<option value="5000" <c:if test="${loansign.loanUnit eq  '5000'}">selected="selected"</c:if>>5000</option>
						<option value="10000" <c:if test="${loansign.loanUnit eq  '10000'}">selected="selected"</c:if>>10000</option>
						<option value="15000" <c:if test="${loansign.loanUnit eq  '15000'}">selected="selected"</c:if>>15000</option>
						<option value="20000" <c:if test="${loansign.loanUnit eq  '20000'}">selected="selected"</c:if>>20000</option>
						<option value="25000" <c:if test="${loansign.loanUnit eq  '25000'}">selected="selected"</c:if>>25000</option>
						<option value="30000" <c:if test="${loansign.loanUnit eq  '30000'}">selected="selected"</c:if>>30000</option>
						<option value="50000" <c:if test="${loansign.loanUnit eq  '50000'}">selected="selected"</c:if>>50000</option>
				</select>
			</p>
			<p>
				<label>风险评估</label> <select name="riskAssess"
					<c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>
					<c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if>>
					<option value="1"
						<c:if test="${loansignbasics.riskAssess eq  '1'}">selected="selected"</c:if>>低</option>
					<option value="2"
						<c:if test="${loansignbasics.riskAssess eq  '2'}">selected="selected"</c:if>>中</option>
					<option value="3"
						<c:if test="${loansignbasics.riskAssess eq  '3'}">selected="selected"</c:if>>高</option>
				</select>
			</p>
			<c:if test="${!empty loansign.rate}">
				<p>
					<label>预期收益</label> <input name="rate" type="text"
						class="required number" min="0" max="30"
						value='<fmt:formatNumber value="${loansign.rate*100 }" pattern="0"/>'
						<c:if test="${operNumber eq '2'}"> readonly="readonly"</c:if>
						<c:if test="${operNumber eq '3'}">  disabled="true" </c:if> />%
				</p>

			</c:if>
			<c:if test="${empty loansign.rate}">
				<p>
					<label>预期收益</label> <input name="rate" type="text"
						class="required number" min="0" max="30" value="${loansign.rate}"
						<c:if test="${operNumber eq '2'}"> readonly="readonly" </c:if>
						<c:if test="${operNumber eq '3'}">  disabled="true" </c:if> />%
				</p>
			</c:if>
			<p>
				<label>是否显示</label> <input name="isShow"
					<c:if test="${loansign.isShow ne  '2'}">checked="checked"</c:if>
					value="1" type="radio" />显
				示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					name="isShow"
					<c:if test="${loansign.isShow eq  '2'}">checked="checked"</c:if>
					value="2" type="radio" />不显示
			</p>
			<!-- 			<p> -->
			<!-- 				<label>结束时间</label> -->
			<%-- 				<input type="text" datefmt="yyyy-MM-dd" class="date required" name="endTime" value="${loansign.endTime}" readonly="readonly"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if> /> --%>
			<!-- 			</p> -->
			<p>
				<label>投标范围</label>
				<select id="typeid" name="type" style="width: 133px;">
					<option value="7">太平洋理财理财</option>
				</select>
			</p>
			<p>
				<label>保障方式</label> <input name="assure" class="required"
					value="${loansignbasics.assure}" type="text" maxlength="50"
					<c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>
					<c:if test="${operNumber eq '3'}">  disabled="true" </c:if> />
			</p>
            <p>
				<label>普通会员最大份数</label>
				<input name="counterparts" id="counterparts"  class="required" value="${loansign.counterparts}" type="text"  maxlength="30"/>
			</p>		
			<p>
				<label>VIP最大份数</label>
				<input name="vipCounterparts" id="vipCounterparts" class="required" value="${loansign.vipCounterparts}" type="text"  maxlength="30"/>
			</p>
			<p>
				<label>预定时间</label>
				<select name="bidTime"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>  <c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if>>
						<option value="1" <c:if test="${loansignbasics.bidTime eq  '5'}">selected="selected"</c:if>>1天后</option>
						<option value="2" <c:if test="${loansignbasics.bidTime eq  '10'}">selected="selected"</c:if>>2天后</option>
						<option value="3" <c:if test="${loansignbasics.bidTime eq  '15'}">selected="selected"</c:if>>3天后</option>
						<option value="4" <c:if test="${loansignbasics.bidTime eq  '20'}">selected="selected"</c:if>>4天后</option>
				</select>
			</p>

			<p>
				<label>锁定期限</label>
				<select name="month" id="month"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>  <c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if>>
						<option value="12" <c:if test="${loansign.month eq  '12'}">selected="selected"</c:if>>12个月</option>
				</select>
			</p>
			<!-- 			<p> -->
			<!-- 				<label>借款管理费</label> -->
			<%-- 				<input name="mgtMoney" value="${loansignbasics.mgtMoney }" class="number" type="text"  readonly="readonly" maxlength="20" />元 --%>
			<!-- 			</p> -->
			 <p  style="clear: both;height: 100px;width: 100%">
				<label>太平洋理财理财概述</label>
				<textarea class="textarea required"  name="overview" rows="20" cols="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.overview}</textarea>
			</p>
			<p style="clear: both;height: 100px;width: 100%">
				<label>资金用途</label>
				<textarea class="textarea required"  name="behoof"  rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.behoof}</textarea>
			</p>
			<p style="clear: both;height: 100px;width: 100%">
				<label>太平洋理财理财还款来源</label>
				<textarea class="textarea required"   name="loanOrigin" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.loanOrigin}</textarea>
			</p>
			<p  style="clear: both;height: 100px;width: 100%">
				<label>风险控制措施</label>
				<textarea class="textarea required"   name="riskCtrlWay" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.riskCtrlWay}</textarea>
			</p>
			<%-- <p  style="clear: both;height: 100px;width: 100%">
				<label>借款人感言</label>
				<textarea class="textarea" name="speech" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.speech}</textarea>
			</p> --%>
			</div> 
			<div class="formBar">
				<ul>
					<c:if test="${operNumber ne '3'}">
						<li><div class="buttonActive">
								<div class="buttonContent">
									<button type="button" id="submit">保存</button>
								</div>
							</div></li>
					</c:if>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="reset" class="close">
									<c:if test="${operNumber ne '3'}">取消</c:if>
									<c:if test="${operNumber eq '3'}">关闭</c:if>
								</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
	</form>
</div>
