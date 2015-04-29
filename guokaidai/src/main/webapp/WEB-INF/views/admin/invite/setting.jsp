<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/js/invitesetting.js" type="text/javascript"></script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">

<table class="table" width="500px" layoutH="150" height="100%" rel="jbsxBox2">
	<tbody>
		<tr target="sid_obj"    style="cursor: pointer;height:60px"  >
			<td align="right"><b>是否启用邀请机制</b></td>
			<td align="left" style="width:350px">
					<input type="radio" name="isRecommendOpen" value="1" <c:if test="${isRecommendOpen=='1'}">checked="true"</c:if> onchange="SETTING.X()">启用</input>
					<input type="radio" name="isRecommendOpen" value="0" <c:if test="${isRecommendOpen=='0'}">checked="true"</c:if> onchange="SETTING.X()">不启用</input>
			</td>
		</tr>
		<tr target="sid_obj"    style="cursor: pointer;height:60px">
			<td align="right"><b>获益周期</b></td>
			<td style="align:left" style="width:350px">
				<input type="radio" name="bonus_period" value="6"  onchange="SETTING.S()" <c:if test="${bonus_period=='6'}">checked="true"</c:if> > 6个月</input>
				<input type="radio" name="bonus_period" value="12" onchange="SETTING.S()" <c:if test="${bonus_period=='12'}">checked="true"</c:if>>12个月</input>
				<input type="radio" name="bonus_period" value="18" onchange="SETTING.S()" <c:if test="${bonus_period=='18'}">checked="true"</c:if>>18个月</input>
				<input type="radio" name="bonus_period" value="24" onchange="SETTING.S()" <c:if test="${bonus_period=='24'}">checked="true"</c:if>>24个月</input>
			</td>
		</tr>
		<tr target="sid_obj"  style="cursor: pointer;height:60px" >
			<td align="right" rowspan="2"><b>佣金比例</b></td>
			<td align="left" style="width:350px">
				邀请人&nbsp;&nbsp;&nbsp;
				<input type="radio" name="recommender_fee" value="0.5"  onchange="SETTING.Z()" <c:if test="${recommender_fee=='0.5'}">checked="true"</c:if>>0.5%
				<input type="radio" name="recommender_fee" value="1" onchange="SETTING.Z()" <c:if test="${recommender_fee=='1'}">checked="true"</c:if>>1.0%
				<input type="radio" name="recommender_fee" value="1.5" onchange="SETTING.Z()" <c:if test="${recommender_fee=='1.5'}">checked="true"</c:if>>1.5%
			</td>
		</tr>
		<tr target="sid_obj" style="cursor: pointer;height:60px"  >
			<td align="left" style="width:350px">
				被邀请人&nbsp;
				<input type="radio" name="recommendee_fee" value="0.5"  onchange="SETTING.R()" <c:if test="${recommendee_fee=='0.5'}">checked="true"</c:if>>0.5%
				<input type="radio" name="recommendee_fee" value="1" onchange="SETTING.R()" <c:if test="${recommendee_fee=='1'}">checked="true"</c:if>>1.0%
				<input type="radio" name="recommendee_fee" value="1.5" onchange="SETTING.R()" <c:if test="${recommendee_fee=='1.5'}">checked="true"</c:if>>1.5%
			</td>
		</tr>
		<tr target="sid_obj"    style="cursor: pointer;height:60px">
			<td align="right"><b>每月结算日</b></td>
			<td style="align:left" style="width:350px">
				<select name="RecommendCalculateDate" onchange="SETTING.Y()" style="width:70px">
					<c:forEach var="i" begin="1" end="31">
						<option value="${i}" <c:if test="${RecommendCalculateDate==i}">selected</c:if> >${i}号</option>
					</c:forEach>
				</select>
				<font color="red">* 如果设为31号则默认为每自然月最后一天</font>
			</td>
		</tr>
		<tr target="sid_obj" style="cursor: pointer;height:30px"  >
			<td colspan="2">
				<span id="rst" style="display:none"></span>
			</td>
		</tr>
	</tbody>
</table>
</div>