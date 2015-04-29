<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.tab_detail{background: #f0f0f0;}
	.panel .clear{clear: both;}
	.pag_div{ clear:both; width:100%;  margin:0px 0px 0px 20px; padding:5px 0px 0px 0px;}
	.pag_ul li{ float:left; padding:0px 2px;line-height:24px;}
	.pag_ul li a{ float:left; height:24px; line-height:24px; display:block;text-decoration: none;}
	.pag_s{ background:url(/resources/images/page_h.png) repeat-x;  padding:0px 7px; border-bottom:1px solid #B0B0B0; border-left:1px solid #CECECE; border-right:1px solid #B0B0B0; border-top:1px solid #CECECE; color:#666;}
	.pag_s_1{ background:url(/resources/images/page_r.png) repeat-x;background-color:#F98100;  padding:0px 7px; border-bottom:1px solid #BE2525; border-left:1px solid #D3514F; border-right:1px solid #BE2525; border-top:1px solid #D3514F; color:#fff; font-weight:bold; }
</style>
<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
              <tr>
                <th class="tab_detail">借款编号</th>
                <th class="tab_detail">还款日期</th>
                <th class="tab_detail">还款金额</th>
                <th class="tab_detail">本金+利息</th>
                <th class="tab_detail">本期/总期数</th>
              </tr>
              <c:forEach var="item" items="${planDetail}" varStatus="s">
	              <tr>
	                <td>${item.loanNumber}</td>
					<td>${item.preRepayDate}</td>
					<td><fmt:formatNumber value="${item.preRepayMoney.bj}" pattern="0.00"/></td>
					<td><fmt:formatNumber value="${item.bjAndLx.total}" pattern="0.00"/></td>
					<td>${item.periods}/${item.totalPeriods}</td>
	              </tr>
              </c:forEach>
              <tr>
	           	<td colspan="5" >
	           		<div class="pag_div">
					 	<c:set var="startNo" value="1" />
					 	<c:if test="${pager.totalPage>=10}">
							<c:if test="${pager.pageNum<=2}">
								<c:set var="startNo" value="1" />
							</c:if>
							<c:if test="${pager.pageNum>2 && pager.pageNum<pager.totalPage-5}">
								<c:set var="startNo" value="${pager.pageNum-2}" />
							</c:if>
							<c:if test="${pager.pageNum>2 && pager.pageNum>=pager.totalPage-5}">
								<c:set var="startNo" value="${pager.totalPage-6}" />
							</c:if>
						</c:if>
					  <ul class="pag_ul">
					  	<!--小于10页全部页码都显示  -->
					  	<c:if test="${pager.totalPage<10}">
					  	<c:if test="${pager.pageNum>1}">
					  		<li><a href="javascript:" onclick="fn_queryDetail(0,${pager.pageNum-1 })" class="pag_s">上一页</a></li>
					  	</c:if>
					  	<c:if test="${pager.pageNum==1}">
					  		<li><a href="javascript:" class="pag_s">上一页</a></li>
					  	</c:if>
							
							<c:forEach var="no" begin="1" end="${pager.totalPage}" varStatus="s">
							<li><a href="javascript:" onclick="<c:if test="${pager.pageNum!=no}">fn_queryDetail(0,${no})</c:if>" class="<c:if test="${pager.pageNum==no}">pag_s_1</c:if><c:if test="${pager.pageNum!=no}">pag_s</c:if>">${no}</a></li>
							</c:forEach>
						</c:if>
						<!--大于10页根据当前页显示附近页码  -->
						<c:if test="${pager.totalPage>=10}">
							<li><a href="javascript:" onclick="<c:if test="${pager.pageNum!=1}">fn_queryDetail(0,1)</c:if>" class="pag_s">首页</a></li>
							<li><a href="javascript:" onclick="fn_queryDetail(0,${pager.pageNum-1 })" class="pag_s">上一页</a></li>
							<c:forEach var="no" begin="${startNo}" end="${startNo+3}" varStatus="s">
							<li><a href="javascript:" onclick="<c:if test="${pager.pageNum!=no}">fn_queryDetail(0,${no})</c:if>" class="<c:if test="${pager.pageNum==no}">pag_s_1</c:if><c:if test="${pager.pageNum!=no}">pag_s</c:if>">${no}</a></li>
							</c:forEach>
							<c:if test="${pager.pageNum+2<pager.totalPage-3}">
								<li>...</li>
							</c:if>
							<c:forEach var="no" begin="${pager.totalPage-2}" end="${pager.totalPage}" varStatus="s">
							<li><a href="javascript:" onclick="<c:if test="${pager.pageNum!=no}">fn_queryDetail(0,${no})</c:if>" class="<c:if test="${pager.pageNum==no}">pag_s_1</c:if><c:if test="${pager.pageNum!=no}">pag_s</c:if>">${no}</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${pager.pageNum<pager.totalPage}">
					   		<li><a href="javascript:" onclick="fn_queryDetail(0,${pager.pageNum+1 })" class="pag_s">下一页</a></li>
					   	</c:if>
					   	<c:if test="${pager.pageNum>=pager.totalPage}">
					   		<li><a href="javascript:" class="pag_s">下一页</a></li>
					   	</c:if>
					   <li>&nbsp;共&nbsp;${pager.pageNum}/${pager.totalPage}&nbsp;页&nbsp;/&nbsp;共查询到&nbsp;${pager.totalCount}&nbsp;条记录</li>
					  </ul>
					 </div>
					<!-- page end -->	
	           	</td>
           </tr>
</table>