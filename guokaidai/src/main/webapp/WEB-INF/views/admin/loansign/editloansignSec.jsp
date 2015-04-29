<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.textarea{width: 510px;height: 100px;border:1px red soild}
</style>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="/loanSignOfSec/saveORupdateSecLoansign" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<input type="text" style="display: none;" name="id" value="${loansign.id}"/>
			<p>
				<label> 借款人</label>
					<input type="text" class="required" name="Userbasicsinfo.name" value="${loansign.userbasicsinfo.name}" readonly="readonly"/>
					<input type="hidden"  name="Userbasicsinfo.id" value="${loansign.userbasicsinfo.id}" />
					<c:if test="${operNumber eq '1'}">
						<a class="btnLook" href="/baseLoanSign/borrowersbaseList" width="520" lookupGroup="Userbasicsinfo">查找带回</a>
					</c:if>
					<c:if test="${loperNumber ne '3'&& loansign.loanstate eq '1'}">
						<a class="btnLook" href="/baseLoanSign/borrowersbaseList" width="520" lookupGroup="Userbasicsinfo">查找带回</a>
					</c:if>
			</p>
			<p>
				<label>是否显示</label>
				<input name="isShow" <c:if test="${loansign.isShow ne  '2'}">checked="checked"</c:if>  value="1" type="radio"/>显 示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="isShow" <c:if test="${loansign.isShow eq  '2'}">checked="checked"</c:if> value="2" type="radio"/>不显示
			</p>
			<p>
				<label>本期借款额</label>
				<input type="text"  name="issueLoan" value="${loansign.issueLoan}"  class="required number"  min="100" maxlength="15"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>  <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>元
			</p>
			
			<p>
				<label>推荐到首页</label>
				<input name="isRecommand" <c:if test="${loansign.isRecommand ne  '2'}">checked="checked"</c:if> value="1" type="radio"/>推 荐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="isRecommand"  <c:if test="${loansign.isRecommand eq  '2'}">checked="checked"</c:if> value="2" type="radio"/>不推荐
			</p>
			<p>
				<label>借款标号</label>
				<input name="loanNumber"  type="text" value="${loansignbasics.loanNumber }"  class="required"  minlength="1" maxlength="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>  <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>/>
			</p>
			
			<p>
				<label>借款标题</label>
				<input name="loanTitle"  type="text"  value="${loansignbasics.loanTitle}" class="required"  minlength="1" maxlength="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>  <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>/>
			</p>
			
			<p>
				<label>利率</label>
				<input name="rate"  type="text" class="required number"  min="0" max="30" value="${loansign.rate}"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if>  <c:if test="${operNumber eq '3'}">  disabled="true" </c:if> />%
			</p>
			
			<p>
				<label>最小借出单位</label>
				<select name="loanUnit"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>  <c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if> style="width: 133px;">
						<option value="50" <c:if test="${loansign.loanUnit eq  '50'}">selected="selected"</c:if>>50</option>
						<option value="100" <c:if test="${loansign.loanUnit eq  '100'}">selected="selected"</c:if>>100</option>
						<option value="200" <c:if test="${loansign.loanUnit eq  '200'}">selected="selected"</c:if>>200</option>
						<option value="300" <c:if test="${loansign.loanUnit eq  '300'}">selected="selected"</c:if>>300</option>
						<option value="500" <c:if test="${loansign.loanUnit eq  '500'}">selected="selected"</c:if>>500</option>
						<option value="1000" <c:if test="${loansign.loanUnit eq  '1000'}">selected="selected"</c:if>>1000</option>
				</select>
			</p>

			<p>
				<label>还款期限</label>
				<input name="useDay" class="required" value="${loansign.useDay}" type="text"  maxlength="50"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if><c:if test="${operNumber eq '3'}">  disabled="true" </c:if>/>
			</p>						
			<p>
				<label>担保方</label>
				<input name="assure" class="required" value="${loansignbasics.assure}" type="text"  maxlength="50"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if><c:if test="${operNumber eq '3'}">  disabled="true" </c:if>/>
			</p>
			<p>
				<label>反担保方式</label>
				<input name="unassureWay"  class="required" value="${loansignbasics.unassureWay}" type="text"  maxlength="30"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>/>
			</p>
			<p>
				<label>招标期限</label>
				<select name="bidTime"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="disabled" </c:if>  <c:if test="${operNumber eq '3'}"> disabled="disabled" </c:if>>
						<option value="1" <c:if test="${loansignbasics.bidTime eq  '1'}">selected="selected"</c:if>>1天</option>
						<option value="5" <c:if test="${loansignbasics.bidTime eq  '5'}">selected="selected"</c:if>>5天</option>
						<option value="10" <c:if test="${loansignbasics.bidTime eq  '10'}">selected="selected"</c:if>>10天</option>
						<option value="15" <c:if test="${loansignbasics.bidTime eq  '15'}">selected="selected"</c:if>>15天</option>
						<option value="20" <c:if test="${loansignbasics.bidTime eq  '20'}">selected="selected"</c:if>>20天</option>
				</select>
			</p>
			<p  style="clear: both;height: 100px;width: 100%">
				<label>借款方说明</label>
				<textarea class="textarea" name="loanExplain" rows="20" cols="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.loanExplain}</textarea>
			</p>
			<p style="clear: both;height: 100px;width: 100%">
				<label>借款方借款用途</label>
				<textarea  name="behoof" class="textarea required" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.behoof}</textarea>
			</p>
			<p  style="clear: both;height: 100px;width: 100%">
				<label>风险控制措施</label>
				<textarea class="textarea"  name="riskCtrlWay" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if>>${loansignbasics.riskCtrlWay}</textarea>
			</p>
			</div>
		<div class="formBar">
			<ul>
				<c:if test="${operNumber ne '3'}">
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				</c:if>
				<li>
					<div class="button"><div class="buttonContent"><button type="reset" class="close"><c:if test="${operNumber ne '3'}">取消</c:if><c:if test="${operNumber eq '3'}">关闭</c:if></button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
