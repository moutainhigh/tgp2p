<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/js/elitesetting.js" type="text/javascript"></script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">

<table class="table" width="500px" layoutH="150" height="100%" rel="jbsxBox2">
	<tbody>
		<tr target="sid_obj"    style="cursor: pointer;height:60px"  >
			<td align="right"><b>是否开启体验金机制</b></td>
			<td align="left" style="width:350px">
					<input type="radio" name="is_elite_open" value="1" <c:if test="${is_elite_open=='1'}">checked="true"</c:if> onchange="SETTING.X()">启用</input>

					<input type="radio" name="is_elite_open" value="0" <c:if test="${is_elite_open=='0'}">checked="true"</c:if> onchange="SETTING.X()">不启用</input>
			</td>
		</tr>
		<tr target="sid_obj"    style="cursor: pointer;height:60px"  >
			<td align="right"><b>体验金额</b></td>
			<td align="left" style="width:350px">
				<input type="text" id="elite_money" name="elite_money" style="width:120px" value="<c:out value='${elite_money}'/>" onblur="SETTING.Y()">元
			</td>
		</tr>

		<tr target="sid_obj"    style="cursor: pointer;height:60px">
			<td align="right"><b>体验周期</b></td>
			<td style="align:left" style="width:350px">
				<select name="elite_bonus_period" id="elite_bonus_period" onchange="SETTING.Z()" style="width:70px">
					<c:forEach var="i" begin="1" end="12">
						<option value="${i}" <c:if test="${elite_bonus_period==i}">selected</c:if> >${i}个月</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr target="sid_obj"  style="cursor: pointer;height:60px" >
			<td align="right"><b>月收益率</b></td>
			<td align="left" style="width:350px">
				<input type="radio" name="elite_fee" value="0.5"  onchange="SETTING.R()" <c:if test="${elite_fee=='0.5'}">checked="true"</c:if>>0.5%
				<input type="radio" name="elite_fee" value="1" onchange="SETTING.R()" <c:if test="${elite_fee=='1'}">checked="true"</c:if>>1.0%
				<input type="radio" name="elite_fee" value="1.5" onchange="SETTING.R()" <c:if test="${elite_fee=='1.5'}">checked="true"</c:if>>1.5%
			</td>
		</tr>
		<tr target="sid_obj"    style="cursor: pointer;height:60px">
			<td align="right"><b>收益失效周期</b></td>
			<td style="align:left" style="width:350px">
				<select name="elite_expiry_periods" id="elite_expiry_periods" onchange="SETTING.S()" style="width:70px">
					<c:forEach var="i" begin="1" end="12">
						<option value="${i}" <c:if test="${elite_expiry_periods==i}">selected</c:if> >${i}个月</option>
					</c:forEach>
				</select>
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