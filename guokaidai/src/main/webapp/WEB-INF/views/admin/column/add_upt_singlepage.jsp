<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <style>
.p_div_01{width:40%; float: left; margin-top: 10px;margin-left:10%;}
</style>
<div class="pageContent">
	 <form action="/single/add_upt_single?operation=${operation }" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
	  <c:if test="${operation == 'upt'}">
		  <input type="hidden" name="id" value="${deputy1.id }"/>
		  <input type="hidden" name="url" value="${deputy1.url }"/>
		  <input type="hidden" name="orderNum" value="${id }"/>
		  <input type="hidden" name="isfixed" value="${deputy1.isfixed }"/>
	   </c:if>
	  <c:if test="${operation == 'add'}"><input type="hidden" name="orderNum" value="${id }"/></c:if>
		<div class="pageFormContent" layoutH="56">
			 <div class="p_div_01"><p>
		    	<label>栏目名称：</label>
		   		<input type="text" class="required textInput" name="name" value="${deputy1.name }">
		   	</p></div>
		   	<div class="p_div_01"><p>
		    	<label>网页标题：</label>
		   		<input type="text" name="pageTitile" value="${deputy1.pageTitile }">
		   	</p></div> 
		   	<div class="p_div_01"><p>
		    	<label>是否显示：</label>
		   		
		   		<c:if test="${deputy1.isShow == '1'}"><input type="checkbox" name="isShow" checked="checked" value="1"></c:if>
   		  		 <c:if test="${deputy1.isShow != '1'}"><input type="checkbox" name="isShow" value="1"></c:if>
		   	</p></div>
		   	<div class="p_div_01"><p>
		    	<label>是否显示在页脚：</label>
		   		
		   		<c:if test="${deputy1.isfooter == '1'}"><input id="isfooter" type="checkbox" readonly="readonly" name="isfooter" checked="checked" value="1"  ></c:if>
	   		    <c:if test="${deputy1.isfooter != '1'}"><input id="isfooter" type="checkbox" readonly="readonly" name="isfooter" value="1" ></c:if>
		   	</p></div>
		   	<div class="p_div_01"><p>
		    	<label>栏目类型：</label>
		   		
		   		<input type="hidden" name="sectiontype.id" value="1">
		   		单页
		   	</p></div>  
		   	<div class="p_div_01"><p>
		    	<label>所属一级栏目：</label>
		   		
		   		<select name="topic.id" style="width:135px;">
			    	   <c:forEach  items="${topics}" var="t">
			    	   <c:if test="${operation == 'upt'}"><option <c:if test="${t.id eq topicId}">selected="selected"</c:if> value="${t.id}">${t.name}</option></c:if>
			    	   <c:if test="${operation == 'add'}"><option value="${t.id}">${t.name}</option></c:if>
			    	   </c:forEach>
		    	   </select>
		   	</p></div>
		    <div class="p_div_01"><p>
		    	<label>页面内容编辑器：</label>
		    	<textarea class="editor" name="pageHtml" rows="17" cols="98"
						upImgUrl="/admincolum/uploadFile" upImgExt="jpg,jpeg,gif,png" >${deputy1.pageHtml }</textarea>
		</p></div>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
