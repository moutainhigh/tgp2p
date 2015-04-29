<%@ tag language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@attribute name="pm" required="true" rtexprvalue="true" type="com.cddgg.base.model.PageModel" description="分页模型"%>
<%@attribute name="url" required="true" rtexprvalue="true"  type="java.lang.String" description="查询路径" %>
<%@attribute name="parameter" required="false" rtexprvalue="true" description="查询的参数" %>

<style type="text/css">
 #link_box{width:300px; margin:0 auto; margin-top:200px;}
 a{display:block; float:left; margin:3px; width:20px; height:20px;color:#006; font:12px/20px Verdana, Arial, Helvetica, sans-serif; text-decoration:none; text-align:center; background:#EEE; border:1px solid #DDD;}
 a:hover{color:#000; position:relative; width:40px; height:40px; font:30px/40px Verdana, Arial, Helvetica, sans-serif; border-color:#006; margin-top:-7px; margin-left:-7px; margin-right:-7px;}
 .current{background-color: #33B9FF;color: #FFF;}
</style>

<div id="link_box">
	共计${pm.totalPage }条  每页显示${pm.numPerPage}条 第${pm.pageNum==0?1:pm.pageNum}/${pm.totalPage}页
	<c:if test="${pm.pageNum>1 }">
		<a href="<%=basePath%>url?pageNum=1&${parameter}">首页</a>
	</c:if>
	<c:if test="${pm.totalPage>=1 && pm.totalPage<=5 }">
		<a <c:if test="${pm.pageNum==1 }">class="current"</c:if>  href="<%=basePath%>url?pageNum=1&${parameter}">1</a>
		<a <c:if test="${pm.pageNum==2 }">class="current"</c:if> href="<%=basePath%>url?pageNum=2&${parameter}">2</a>
		<a <c:if test="${pm.pageNum==3 }">class="current"</c:if> href="<%=basePath%>url?pageNum=3&${parameter}">3</a>
		<a <c:if test="${pm.pageNum==4 }">class="current"</c:if> href="<%=basePath%>url?pageNum=4&${parameter}">4</a>
		<a <c:if test="${pm.pageNum==5 }">class="current"</c:if> href="<%=basePath%>url?pageNum=5&${parameter}">5</a>
	</c:if>
	<c:if test="${pm.totalPage>5}">
		<a href="<%=basePath%>url?pageNum=${pm.pageNum-5 }&${parameter}">&lt;&lt;</a>
		<a href="<%=basePath%>url?pageNum=${pm.pageNum-2 }&${parameter}">${pm.pageNum-2 }</a>
		<a href="<%=basePath%>url?pageNum=${pm.pageNum-1 }&${parameter}">${pm.pageNum-1 }</a>
		<a class="current" href="<%=basePath%>url?pageNum=${pm.pageNum}&${parameter}">${pm.pageNum}</a>
		<a href="<%=basePath%>url?pageNum=${pm.pageNum+1 }&${parameter}">${pm.pageNum+1 }</a>
		<a href="<%=basePath%>url?pageNum=${pm.pageNum+2 }&${parameter}">${pm.pageNum+2 }</a>
		<a href="<%=basePath%>url?pageNum=${pm.pageNum+5 }&${parameter}">&gt;&gt;</a>
		<a href="<%=basePath%>url?pageNum=${pm.totalPage }&${parameter}">尾页</a>
	</c:if>
	
</div>

