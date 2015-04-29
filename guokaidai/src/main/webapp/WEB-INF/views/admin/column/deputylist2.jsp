<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form id="pagerForm" method="post" action="/article/openArticles">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="title" value="${title}" />
	<input type="hidden" name="showStatus" value="${showStatus }" />
	<input type="hidden" name="recommendStatus" value="${recommendStatus }" />
	<input type="hidden" name="deputyId" value="${deputyId}" />
</form>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/article/openArticles" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
					 	文章标题：
					 			  <input type="text" name="title" value=""/>
					</td>
					<td>
					 	显示状态：<select name="showStatus">
					 			   <option value="-1" >不限</option>
					 			   <c:forEach items="${enum_show_state}"  var="show_state" varStatus="show">
										<option value="${show.index}" <c:if test="${show.index eq showStatus}">selected="selected"</c:if> >${show_state}</option>
									</c:forEach>
						    	   </select>
					</td>
					<td>
					 	推荐区显示状态：<select name="recommendStatus">
					 			  <option value="-1">不限</option>
						    	   <c:forEach items="${enum_show_state}"  var="show_state" varStatus="show">
										<option value="${show.index}" <c:if test="${show.index eq recommendStatus}">selected="selected"</c:if> >${show_state}</option>
									</c:forEach>
						    	   </select>
					</td>
					<td>
					 	二级栏目：<select name="deputyId" >
					 			   <option value="">不限</option>
						    	   <c:forEach  items="${deputysections}" var="d">
						    	   <option value="${d.id}" <c:if test="${d.id eq deputyId}">selected="selected"</c:if>>${d.name}</option>
						    	   </c:forEach>
						    	   </select>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="panelBar">
	<ul class="toolBar">
		<li><a class="add" href="/article/queryArticleById?operation=add&id=0" target="navTab" rel="adddeputy" mask="true" resizable="false" maxable="false" width="618" height="500"><span>添加</span></a></li>
		<li><a class="delete" href="/article/deleteArticle?id={aid}" title="确实要删除选中文章吗?" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
		<li><a class="edit" href="/article/queryArticleById?operation=upt&id={aid}" target="navTab" rel="adddeputy" mask="true" resizable="false" maxable="false" warn="请选择文章！" width="618" height="500"><span>修改</span></a></li>
	</ul>
</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
			    <th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="30px;">序号</th>
				<th>文章标题</th>
				<th>是否显示</th>
				<th>是否将文章显示到推荐区</th>
				<th>添加时间</th>
				<th>所属二级栏目</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${articleList}" var="a" varStatus="article">
			<tr target="aid" rel="${a.id}" class="checkall" onclick="javascript:selecteddefault(${topic.id});" style="cursor: pointer;">
				<td><input name="ids" value="${a.id}" type="checkbox"></td>
<%-- 				<td>${a.id}</td> --%>
				<td>${article.index+1}</td>
				<td>${a.title}</td>
				<td>${enum_show_state[a.isShow]}</td>
				<td>${enum_show_state[a.isRecommend]}</td>
				<td>${a.createTime}</td>
				<td>${a.deputysection.name}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
