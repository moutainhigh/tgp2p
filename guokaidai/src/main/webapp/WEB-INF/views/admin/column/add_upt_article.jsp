<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<div class="pageContent">
	<form action="/article/addOrUpdateArticle?operation=${operation }" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
		<input type="hidden" id="deputyId" name="deputysection.id" value="${article.deputysection.id}"/>
		<c:if test="${operation == 'upt'}">
		  <input type="hidden" name="id" value="${article.id }"/>
		  <input type="hidden" name="url" value="${article.url }"/>
		  <input type="hidden" name="createTime" value="${article.createTime }"/>
		  </c:if>
		  <c:if test="${operation == 'add'}"><input type="hidden" name="id" value="0"/></c:if>
		<div class="pageFormContent" layoutH="56">
		
			<div style="width:600px; margin:0 auto;">
			
				<div style="width:100%; float: left; margin-top: 10px;"><p>
					<label>文章标题：</label>
					<input style="width: 135px;" class="required" type="text" name="title" value="${article.title }">
				</p></div>
				<div style="width:100%; float: left; margin-top: 10px;"><p>
					<label>是否显示：</label>
					<c:if test="${article.isShow == '1'}"><input type="checkbox" name="isShow" checked="checked" value="1"></c:if>
	   		        <c:if test="${article.isShow != '1'}"><input type="checkbox" name="isShow" value="1"></c:if>
				</p></div>
				<div style="width:100%; float: left; margin-top: 10px;"><p>
					<label>是否显示在推荐区：</label>
					 <c:if test="${article.isRecommend == '1'}"><input type="checkbox" readonly="readonly" name="isRecommend" checked="checked" value="1"></c:if>
	   		 	     <c:if test="${article.isRecommend != '1'}"><input type="checkbox" readonly="readonly" name="isRecommend" value="1"></c:if>
				</p></div>
				<div style="width:100%; float: left; margin-top: 10px;"><p>
					<label>一级栏目：</label>
					<select id="topic" name="deputysection.topic.id" onchange="topicSelectChange();" style="width: 135px;">
		    	   <c:forEach  items="${topics}" var="t">
		    	   <c:if test="${operation == 'upt'}"><option value="${t.id}" <c:if test="${t.id eq topicId}">selected="selected"</c:if>>${t.name}</option></c:if>
		    	   <c:if test="${operation == 'add'}"><option value="${t.id}">${t.name}</option></c:if>
		    	   </c:forEach>
		    	   </select> 
				</p></div>
				<div style="width:100%; float: left; margin-top: 10px;"><p>
					<label>二级栏目：</label>
					 <select id="deputysection" class="required " style="width: 135px;" <c:if test="${operation eq 'upt'}">disabled="disabled"</c:if> onchange="deputsectionChange();">
			    	   <option value="${article.deputysection.id}">${article.deputysection.name}</option>
			    	   </select>
				</p></div>
				<div style="width:100%; float: left; margin-top: 10px;"><p>
					<label>内容编辑器：</label>
					<textarea class="editor" name="context" rows="13" cols="80"
					upImgUrl="/admincolum/uploadFile" upImgExt="jpg,jpeg,gif,png" >${article.context }</textarea>
				</p></div>
			
			</div>
			
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
 <script type="text/javascript" src="/resources/js/article.js"></script>
 <script>
 $(function(){
		//进入到添加页面时加载对应一级栏目下面栏目类型为‘列表’的所有二级栏目
		if(${operation eq 'add'}){
			 var htmlData = "<option value=''>请选择</option>";
			 var tid=document.getElementById("topic").value;
			fn_ajax("/admincolum/topicSelectChange",{id:tid},function(data){
				 for (var i = 0; i < data.length; i++) {
		               htmlData = htmlData + "<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
			     }
		        $("#deputysection").html(htmlData);
			});
		}
		$("#deputysection").change(function(){
			$("#deputyId").val($("#deputysection ").val());
		});
	});
 </script>