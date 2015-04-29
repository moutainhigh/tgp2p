<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
 <!--End projectLeft-->
     <!--projectRight-->
     <div class="projectRight">
      <div class="projectMok curvyCorners_5">
        <div class="Moktitlebox  curvyCorners_t5">
          <h2>常见问题</h2>
          <a href="#" class="more">更多</a>
        </div>
        <ul class="Mokul1">
         <li><a href="#">投资人是否要支付费用？</a></li>
         <li><a href="#">我通过稳盈-安e贷达成的交易有什么...</a></li>
         <li><a href="#">我可以投资吗？</a></li>
         <li><a href="#">债权出让人向陆金所提交转让申请的...</a></li>
         <li><a href="#">转让需要支付什么费用吗？</a></li>
        </ul>
      </div>
      <div class="projectMok curvyCorners_5 mar_top10">
        <div class="Moktitlebox  curvyCorners_t5">
        <h2>在线申请</h2>
        </div>
          <form id="online_apply_from" method="post" style="display:block;" onsubmit=" return false">
         <table cellpadding="0" cellspacing="0" class="Applicationtab">
          <tr><td>您的姓名：</td><td><input type="text" id="name" name="name"  value="请输入您的真实姓名" class="ACabtext validate[required,minSize[2],maxSize[4]]" /></td></tr>
          <tr><td>所在城市：</td><td>
          <select id="province" name="province">
          <c:forEach items="${provinceList}" var="pro">
          	<option value="${pro.id }">${pro.name}</option>
          </c:forEach>
            
          </select><select id="city" name="city">
            <c:forEach items="${cityList}" var="cit">
          	<option value="${cit.id }">${cit.name}</option>
          </c:forEach>
          </select></td>
          </tr>
          <tr><td>联系手机：</td><td><input id="phone" name="phone" type="text" class="ACabtext validate[required,minSize[1],maxSize[12],custom[phone]]" /></td></tr>
          <tr><td>服务内容：</td><td><input type="radio" value="太平洋理财" checked="checked" style="display:inline-block; margin:0px 3px;" />太平洋理财</td></tr>
          <tr><td>投资金额：</td><td><input id="money" name="money" type="text" class="ACabtext validate[required,custom[number]]" value="" />&nbsp; 万元</td></tr>
          <tr><td>&nbsp;</td><td><input type="submit" value="提交信息"   class="ACabBnt" /></td></tr>
         </table>
         </form>
      </div>
     </div>
     <!--End projectRight-->
    </div>
    <div class="clear"></div>

<script type="text/javascript">
	$(function() {
		$("#province").change(function(){
			var id=$(this).val();
			$.ajax({
				type:'post',
				data:'provinceId='+id,
				url:'/visitor/querycity',
				success:function(msg){
					$("#city").find("option").remove();
					$("#city").append(msg);
				}
			});
		});
		
		$(".projectTab1 tr").find("td:first").css("text-align", "right");
		$(".projectTab1 tr,.projectTab2 tr").find("td:eq(1)").css("text-align",
				"left");
		$(".pjtTabrow tr:even").css("background", "#f6f5f5");
		$(".Applicationtab tr").find("td:first").css("width", "80px").css(
				"text-align", "right");
		$("input[type='text']").focus(function() {
			$(this).val("");
			$(this).css("color", "#888888");
		});
		$("#online_apply_from").validationEngine({
			promptPosition : "topRight",
			 scroll:false,
			onValidationComplete : function(form, valid) {
				if (valid) {
					var name=$("#name").val();
					var province=$("#province").val();
					var city=$("#city").val();
					var phone=$("#phone").val();
					var money=$("#money").val();
					$.ajax({
						type:'post',
						data:{name:name,provinceId:province,cityId:city,phone:phone,money:money },
						url:'/onlineapply/add',
						success:function(msg){
							$("#name").val('');
							$("#phone").val('');
							$("#money").val('');
							ymPrompt.succeedInfo("你的申请已提交,我们会马上处理！",200,160,"温馨提示",null);
						}
					});
				}
			}
		});
	});
</script>
