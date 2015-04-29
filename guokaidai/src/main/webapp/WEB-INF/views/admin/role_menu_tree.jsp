<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div style=" float:left; display:block; margin:10px; overflow:auto; width:250px; height:400px; overflow:auto; border:solid 1px #CCC; line-height:21px; background:#FFF;">
<form method="post" action="menurole/updatebyrole" class="pageForm required-validate" onsubmit="return validateCallback(this)">
<input type="hidden" name="roleid" value="${roleid }">
<ul class="tree treeFolder treeCheck expand" oncheck="kkk">
	<li><a >太平洋理财</a>
		<ul>
			<c:forEach items="${menulist}" var="onemenu">
				<li>
<%--					遍历一级菜单--%>
					<a tname="menuid" tvalue="${onemenu.key.id }">${onemenu.key.smenCaption }</a>
					<ul>
						<c:forEach items="${onemenu.value}" var="sendmenu">
<%--							遍历二级菜单--%>
							<li>
								<a <c:if test="${fn:indexOf(rolemenustr,sendmenu.id)>-1 }">checked="true"</c:if> tname="menuid" tvalue="${sendmenu.id }">${sendmenu.smenCaption }</a>
									<c:forEach items="${threemenulist}" var="threemenu">
	<%--									遍历功能点--%>
										<c:if test="${sendmenu.id==threemenu.systemMenu.id}">
											<li><a <c:if test="${fn:indexOf(rolemenustr,threemenu.id)>-1 }">checked="true"</c:if> tname="menuid" tvalue="${threemenu.id }">${threemenu.smenCaption }</a></li>
										</c:if>
									</c:forEach>
							</li>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</li>


</ul>

<input type="submit" value="确认分配"/>
<input type="button" value="获取值" onclick="getValues()">
</form>
</div>


<script type="text/javascript">
function kkk(){
	var json = arguments[0], result="";
	$(json.items).each(function(i){
		result += "<p>name:"+this.name + " value:"+this.value+" text: "+this.text+"</p>";
	});
	$("#resultBox").html(result);
	
}

function getValues(){
	var array = document.getElementsByTagName('checkbox');
	alert(array.length);
	var s = '';
	for(var i=0;i<array.length;i++){
		var a = array[i];
		var tname = a['tname'];
		var tvalue = a['tvalue'];
		alert(tname+","+tvalue+"-");
		if(tname && tvalue){
			s+=tname+"-"+tvalue+",";
		}
	}
	alert(s.substring(0,s.length-1));
  }
</script>
