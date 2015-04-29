<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="LeftMenu curvyCorners_3">
 <c:forEach items="${appDeputys }" var="d">
 <c:if test="${d.topic.id == topicId }">
	 <ul class="listNavUL">
	 	<li><a href="${d.url }" <c:if test="${d.id == deputyId }">class="LeftMenuLink" </c:if> >${d.name }</a></li>
	 <%--
	 	<c:if test="${d.name eq '公司简介' }">
	   	  <li><a href="${d.url }" class="gsjs <c:if test="${d.id == deputyId }">LeftMenuLink</c:if>" >${d.name }</a></li>
	    </c:if>
	    <c:if test="${d.name ne '公司简介' }">
	   	  <li><a href="${d.url }" <c:if test="${d.id == deputyId }">class="LeftMenuLink" </c:if> >${d.name }</a></li>
	    </c:if>
	    --%>
	  </ul>
  </c:if>
</c:forEach>
</div>
