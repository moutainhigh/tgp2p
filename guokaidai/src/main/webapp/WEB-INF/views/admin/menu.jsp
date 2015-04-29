<%--    
创建时间：2014年2月17日上午8:47:48   
创 建 人：LiNing   
相关说明：   
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function($){
		var role_id="${id}";
		<%--        	菜单树开始--%>
		$("#mytree").omTree({
			simpleDataModel:true,
		    dataSource : '/menu/newqueryall?id='+role_id,
		    showCheckbox: true,
		    cascadeCheck:true,
		    onSuccess: function(data){
    			var ajaxbg = $("#background,#progressBar");
    			ajaxbg.hide();
		    	if(data.length>0){
    		    	var roleid=data[(data.length-1)].roleid;
    		    	var target = $('#mytree').omTree("findNode", "id", "r1");
    		    	$('#mytree').omTree('remove',target);
					if(null!=roleid||roleid.length>0){
						
	    		    	var roles= new Array();
		    		    	roles=roleid.split(",");
	    		    	for(var i=0;i<roles.length;i++){
	    		    		var targets = $('#mytree').omTree("findNode", "id", roles[i]);
	    		    		if(null!=targets){
	    		    			$('#mytree').omTree('check',targets);
	    		    		}
	    		    	}
					}
					$('#mytree').omTree('collapseAll');
		    	}
    		}
		});
		
		 <%--确认修改--%>
         $("#sub_a").click(function(){
        	 if(role_id>0){
				$("#updatemenu").submit();
        	 }else{
        		  alertMsg.correct("请先选择要修改的角色");
        	 }
         });
         <%-- 全选--%>
         $("#allche_a").click(function(){
	         if(role_id>0){
	        	 $("#mytree").omTree("checkAll", true);
	         }else{
        		  alertMsg.correct("请先选择要修改的角色");
        	 }
	     });
         <%-- 取消全选--%>
	     $("#allunche_a").click(function(){

	    	 if(role_id>0){
	    		 $("#mytree").omTree("checkAll", false);
	         }else{
        		  alertMsg.correct("请先选择要修改的角色");
        	 }
		 });
	     <%--表单ajax提交设置--%>
		 var options = {success : showResponse,method:'POST',dataType: 'json'};
		 $('#updatemenu').submit(function() {var nodes = $("#mytree").omTree("getChecked", true);var content = "";for(var i = 0; i < nodes.length; i++){content += nodes[i].id + ",";if(nodes[i].mevel>1){var parnode= $('#mytree').omTree('getParent',nodes[i]);if(content.indexOf(parnode.id)==-1){content+= parnode.id+","}}}$("#menuid").val(content);$(this).omAjaxSubmit(options);
		 	var ajaxbg = $("#background,#progressBar");
			ajaxbg.show();
         	return false;//返回false,阻止浏览器默认行为
         });
	});
	
	function showResponse(responseText) {
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.hide();
      if(responseText.statusCode!=200){
   	   $("#mytree").omTree('refresh');
   	   alertMsg.warn(responseText.message);
      }else{
   	   alertMsg.correct(responseText.message);
      }
   }
</script>
<div class="pageContent" style="padding: 5px">
	<div class="panelBar">
					<ul class="toolBar">
						<li><a class="edit" href="javascript:void(0);" id="sub_a"><span>确认修改</span></a></li>
						<li class="line">line</li>
						<li><a class="add" href="javascript:void(0);" id="allche_a"><span>全选</span></a></li>
						<li class="line">line</li>
						<li><a class="delete" id="allunche_a"
							href="javascript:void(0);"><span>取消全选</span></a></li>
						<li class="line">line</li>
					</ul>
				</div>
	<ul id="mytree"></ul>
	
	<form action="menurole/updatebyrole" id="updatemenu">
					<input type="hidden" id="roleid" value="${id }" name="roleid"> <input
						type="hidden" id="menuid" name="menuids">
	</form>
</div>