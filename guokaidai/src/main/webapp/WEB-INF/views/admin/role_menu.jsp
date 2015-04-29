<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="/resources/js/adminmanager/role_menu.js"></script>

<div class="pageContent" style="padding: 5px">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" style=""
				href="role/transit?pageName=edit_role" maxable="false" width="480" height="300" target="dialog" mask="true"
				title="添加角色"><span>添加</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="javascript:void(0);"
				 id="delrole_a" ><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" id="updaterole_a" href="javascript:void(0);"
				  ><span>修改</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<div>
		<div layoutH="146"
			style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #CCC; line-height: 21px; background: #fff">
			<ul class="tree treeFolder ">
				<li><a href="javascript:void(0)">角色</a>
					<ul id="role_ul">
						<c:forEach items="${rolelist}" var="roleinfo">
							<li><a class="role" href="/menurole/jume?url=menu&id=${roleinfo.id }"
								target="ajax" code="${roleinfo.id }" rel="jbsxBox">${roleinfo.roleName }</a></li>
						</c:forEach>
					</ul></li>
			</ul>
		</div>
		<div id="jbsxBox" class="unitBox" style="margin-left: 246px;"></div>
	</div>
</div>
