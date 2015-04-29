<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="resources/js/jquery-1.7.2.min.js"></script>
    <script src="resources/operamasks/ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="resources/operamasks/ui/om-core.js" type="text/javascript"></script>
    <script src="resources/operamasks/ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="resources/operamasks/ui/jquery.ui.mouse.js"></script>
    <script src="resources/operamasks/ui/om-draggable.js"></script>
    <script src="resources/operamasks/ui/jquery.ui.position.js"></script>
    <script src="resources/operamasks/ui/om-panel.js" type="text/javascript"></script>
	<script src="resources/operamasks/ui/om-tree.js" type="text/javascript"></script>
	<script src="resources/operamasks/ui/om-button.js" type="text/javascript"></script>
	<script src="resources/operamasks/ui/om-buttonbar.js" type="text/javascript"></script>
	<script src="resources/operamasks/ui/om-ajaxsubmit.js" type="text/javascript"></script>
	<script src="resources/operamasks/ui/om-messagebox.js" type="text/javascript"></script>
	<script src="resources/operamasks/ui/om-dialog.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="resources/operamasks/themes/default/om-all.css" />
	<link rel="stylesheet" type="text/css" href="resources/operamasks/themes/default/om-tree.css" />
    <link rel="stylesheet" type="text/css" href="resources/operamasks/common/css/demo.css" />
    <title>多选树</title>
    <script type="text/javascript">
    	$(function(){
<%--        	菜单树开始--%>
    		$("#mytree").omTree({
    			simpleDataModel:true,
    		    dataSource : '/menu/newqueryall',
    		    showCheckbox: true,
    		    cascadeCheck:true,
    		    onSuccess: function(data){
    		    	if(data.length>0){
    		    		$('#subbtn').omButton('enable');
						$('#btnallche').omButton('enable');
						$('#btnallunche').omButton('enable');
	    		    	var roleid=data[6].roleid;
	    		    	var target = $('#mytree').omTree("findNode", "id", "r1");
	    		    	$('#mytree').omTree('remove',target);
						if(null!=roleid||roleid.length>0){
							
		    		    	var roles= new Array();
			    		    	roles=roleid.split(",");
		    		    	for(i=0;i<roles.length;i++){
		    		    		var target = $('#mytree').omTree("findNode", "id", roles[i]);
		    		    		$('#mytree').omTree('check',target);
		    		    	}
						}
    		    	}
        		}
    		});
			<%--菜单树结束--%>

			<%--角色树开始--%>
    		$("#roletree").omTree({
    			simpleDataModel:true,
    		    dataSource : '/role/queryall',
    		    showCheckbox: false,
    		    onClick: function(node,event) {
	    			$('#subbtn').omButton('disable');
					$('#btnallche').omButton('disable');
					$('#btnallunche').omButton('disable');
    			 	$("#mytree").omTree('refresh');
  		        	$("#mytree").omTree('setData','/menu/newqueryall?id='+node.id);
  		        	$("#roleid").val(node.id);
    		    },
    		    onSelect: function(node,event){
    		    	$('#subbtn').omButton('disable');
					$('#btnallche').omButton('disable');
					$('#btnallunche').omButton('disable');
    		    	$("#mytree").omTree('refresh');
  		        	$("#mytree").omTree('setData','/menu/newqueryall?id='+node.id);
  		        	$("#roleid").val(node.id);
    		    }
    		});
			<%--角色树结束--%>

			
			var panel = $("#rolepanl").omPanel({
			    width:'250px',
			    height:'500px',
			    iconCls: "apple",
			    header: true,
			    title:'角色',
			    tools:[
			          	{
			               iconCls:["tool-min","tool-min-hover"],
			        		handler:function(){panel.omPanel("close");}
			    		},
			            {
			    		    iconCls:["tool-help","tool-help-hover"],
			    		    handler:function(){alert("请求帮助。");}
			    }]
			});

			var panel = $("#menupanl").omPanel({
			    width:'250px',
			    height:'500px',
			    iconCls: "apple",
			    header: true,
			    title:'权限',
			    tools:[
			          	{
			               iconCls:["tool-min","tool-min-hover"],
			        		handler:function(){panel.omPanel("close");}
			    		},
			            {
			    		    iconCls:["tool-help","tool-help-hover"],
			    		    handler:function(){alert("请求帮助。");}
			    }]
			});

			 <%--确认修改--%>
        	 $('#subbtn').omButton({disabled:true});
			<%-- 全选--%>
    		 $('#btnallche').omButton({disabled:true,onClick : function(event){$("#mytree").omTree("checkAll", true);}});
			<%-- 取消全选--%>
    		 $('#btnallunche').omButton({disabled:true,onClick : function(event){$("#mytree").omTree("checkAll", false);}});
			<%--表单ajax提交设置--%>
    		 var options = {success : showResponse,method:'POST',dataType: 'json'};
    		 $('#updatemenu').submit(function() {$('#subbtn').omButton('disable');$('#btnallche').omButton('disable');$('#btnallunche').omButton('disable');var nodes = $("#mytree").omTree("getChecked", true);var content = "";for(var i = 0; i < nodes.length; i++){content += nodes[i].id + ",";if(nodes[i].mevel>1){var parnode= $('#mytree').omTree('getParent',nodes[i]);if(content.indexOf(parnode.id)==-1){content+= parnode.id+","}}}$("#menuid").val(content);$(this).omAjaxSubmit(options);
                 return false;//返回false,阻止浏览器默认行为
             });

    		 $('#addrole').omButton({onClick:function(event){
<%--    			 $( "#dialog-modal").omDialog('open');--%>
				dialog.omDialog('open');
    		 }});
    		 $('#updaterole').omButton({});
    		 $('#delrole').omButton({});

<%--    		 $( "#dialog-modal").omDialog({--%>
<%--    				autoOpen: false,--%>
<%--    				height: 140,--%>
<%--    				modal: true--%>
<%--    			});--%>

    		 var dialog = $("#dialog-form").omDialog({
                 width: 350,
                 autoOpen : false,
                 modal : true,
                 resizable : false,
                 buttons : {
                     "提交" : function(){
 		                submitDialog();
 		                return false; //阻止form的默认提交动作
 		            },
                     "取消" : function() {
                         $("#dialog-form").omDialog("close");//关闭dialog
                     }
                 }
             });

    		//dialog中点提交按钮时将数据提交到后台并执行相应的add或modify操作
             var submitDialog = function(){
                 if (validator.form()) {
 	                var submitData={
 	                    operation:isAdd?'add':'modify',
 	                    id:$("input[name='id']",dialog).val(),
 	                    city:$("input[name='city']",dialog).val(),
 	                    address:$("input[name='address']",dialog).val(),
 	                    start:$("input[name='start']",dialog).val(),
 	                    end:$("input[name='end']",dialog).val()
 	                };
 	                $.post('../../../gridcrud.do',submitData,function(){
 	                    if(isAdd){
 	                        $('#grid').omGrid('reload',1);//如果是添加则滚动到第一页并刷新
 	                        $.omMessageTip.show({title: "操作成功", content: "添加数据成功", timeout: 1500});
 	                    }else{
 	                        $('#grid').omGrid('reload');//如果是修改则刷新当前页
 	                        $.omMessageTip.show({title: "操作成功", content: "修改数据成功", timeout: 1500});
 	                    }
 	                    $("#dialog-form").omDialog("close"); //关闭dialog
 	                });
                 }
             };
        });
    	function showResponse(responseText) {
    		$('#subbtn').omButton('enable');
    		$('#btnallche').omButton('enable');
			$('#btnallunche').omButton('enable');
           if(responseText.statusCode!=200){
        	   $("#mytree").omTree('refresh');
        	   $.omMessageBox.alert({
      			 type:'error',
                   title:'提示',
                   content:'参数错误，修改失败'
  			});
           }else{
        	   $.omMessageBox.alert({
        			 type:'success',
                     title:'提示',
                     content:'权限修改成功',
                     onClose:function(v){
                  		return false;
             		  }
    			});
           }
        }

</script>
</head>
<body>
  <div id="main">
  	<table>
       <tr>
          <td style="color: blue;">
          	<button id="addrole" type="button">新增角色</button>
          	<button id="updaterole" type="button">修改角色</button>
          	<button id="delrole" type="button">删除角色</button>	
          </td>
          <td style="color: blue;">
       		<form action="menurole/updatebyrole" id="updatemenu">
	    		<input type="hidden" id="roleid" name="roleid">
	    		<input type="hidden" id="menuid" name="menuids">
	    		<button id="subbtn" type="submit">确认分配</button>
	    		<button id="btnallche" type="button" >全选</button>
				<button id="btnallunche" type="button" >取消全选</button>
    		</form>
       	</td>
       </tr>
       <tr valign="top">
          <td>
          	<div id="rolepanl">
<%--          		<div id="buttonbar"></div>--%>
          		 <ul id="roletree"></ul></td>
          	</div>
         
          <td>
			<div id="menupanl">
				<ul id="mytree"></ul>
			</div>
          </td>
       </tr>
    </table>
    </div>
    <div id="dialog-form">
    	
        <form action="" id="roleFrom" method="post">
        	<table>
        		<tr>
        			<td>角色名称:</td>
        			<td><input type="text" name="rolename" /></td>
        		</tr>
        		<tr>
        			<td>备注:</td>
        			<td><textarea rows="3" cols="19"></textarea></td>
        		</tr>
        	</table>
        </form>
    </div>
</body>
</html>
