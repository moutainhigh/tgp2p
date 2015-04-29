<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach items="${list}" var="city">
	<option value="${city.id}">${city.name}</option>
</c:forEach>