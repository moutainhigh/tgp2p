<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src="resources/js/usermanager/customer.js"></script> -->
<style type="text/css">
	.body{width:670px;background-color: #FFFFFF; border: 0;}
	.inp{
		height: 18px;
		font:10px arial,tahoma,helvetica,sans-serif;
		border: 1px solid #7EADD9
	}
	table{
		border:1px solid #7EADD9; 
		font:11px arial,tahoma,verdana,helvetica; 
		line-height:25px;
		border-collapse:collapse;
	}
	th{
		padding-top: 3px;
		padding-bottom: 3px;
		background-color:#ffffff;
	}
	
	td{
		border:1px solid #7EADD9; 
		background-color:#ffffff;
		text-align:left;
		padding-left:10px;
		padding-top: 3px;
		padding-bottom: 3px;
	}
</style>

<form method="post" action="<%=basePath %>userinfo/saveOrUpdateman"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,dialogAjaxDone)" id="manform">
	<div class="pageContent">
		<div class="pageFormContent" layoutH="50">
		<div class="body">
	<table id="isInput" cellpadding="0" cellspacing="0" style="width:670px;">
		
			<tr>
				<th style="text-align: center;padding:0 5px;line-height:20px;">序号</th>
				<th style="text-align: center;padding:0 5px;line-height:20px;">项目名称</th>
				<th style="text-align: center;padding:0 5px;line-height:20px;">积分规则</th>
				<th style="text-align: center;padding:0 5px;line-height:20px;">实际积分</th>
				<th style="text-align: center;padding:0 5px;line-height:20px;">积分规格说明</th>
			</tr>

			<tr >
				<td colspan="5" align="center">自然状况</td>
			</tr>

			<tr>
			
				<td>1</td>
				<td>年龄</td>
				<td>1-3</td>
				<td><input type="text" name="ck1" id="ck1" />分
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>2</td>
				<td>性别</td>
				<td>1</td>
				<td><input type="text" name="ck2" id="ck2">分 </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>3</td>
				<td>婚姻状况</td>
				<td>1-11</td>
				<td><input type="text" name="ck3" id="ck3"/>分 </td>
				<td>已婚</td>
			</tr>
			<tr>
				<td>4</td>
				<td>文化程度</td>
				<td>1-11</td>
				<td><input type="text" name="ck4" id="ck4"/>分 </td>
				<td>本科及以上</td>
			</tr>
		    <tr>
				<td>5</td>
				<td>户口性质</td>
				<td>1-3</td>
				<td> <input type="text" name="ck5" id="ck5"/>分 </td>
				<td>城镇户口</td>
			</tr>
			<tr>
				<td>6</td>
				<td>驾龄</td>
				<td>1-3</td>
				<td><input type="text" name="ck6"  id="ck6"/>分 </td>
				<td>三年以上</td>
			</tr>
			<tr>
				<td>7</td>
				<td>健康状况</td>
				<td>2</td>
				<td><input type="text" name="ck7" id="ck7"/>分 </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr >
				<td colspan="5" align="center">职业状况
				<input type="hidden" id="ckVaule" name="ckVaule" value="${manualintegral.ckVaule}"/><input type="hidden" id="uid" name="userbasicsinfo.id" value="${uid}"/></td>
			</tr>

			<tr>
				<td>8</td>
				<td>现单位性质</td>
				<td>2</td>
				<td><input type="text" name="ck8" id="ck8"/>分 </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>9</td>
				<td>行业类别</td>
				<td>2</td>
				<td><input type="text" name="ck9"  id="ck9"/>分 </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>10</td>
				<td>在现单位工作年限</td>
				<td>1-3</td>
				<td><input type="text" name="ck10" id="ck10"/>分 </td>
				<td>三年以上加2分</td>
			</tr>
			<tr>
				<td>11</td>
				<td>在现单位岗位性质</td>
				<td>2</td>
				<td><input type="text" name="ck11"  id="ck11"/>分</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>12</td>
				<td>技术职称</td>
				<td>2</td>
				<td><input type="text" name="ck12"  id="ck12"/>分</td>
				<td>&nbsp;</td>
			</tr>

			<tr >
				<td colspan="5" align="center">家庭状况</td>
			</tr>

			<tr>
				<td>13</td>
				<td>家庭人均月收入</td>
				<td>2</td>
				<td><input type="text" name="ck13" id="ck13"/>分   </td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td>14</td>
				<td>固定支出</td>
				<td>2</td>
				<td><input type="text" name="ck14"  id="ck14"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>15</td>
				<td>债务收入比</td>
				<td>2</td>
				<td><input type="text" name="ck15" id="ck15"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>16</td>
				<td>供养人数</td>
				<td>2</td>
				<td><input type="text" name="ck16" id="ck16"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>17</td>
				<td>个人月收入</td>
				<td>2</td>
				<td><input type="text" name="ck17" id="ck17"/>分   </td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td colspan="5" align="center">财产保障</td>
			</tr>

			<tr>
				<td>18</td>
				<td>住房情况</td>
				<td>5</td>
				<td><input type="text" name="ck18" id="ck18"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>19</td>
				<td>存款及投资</td>
				<td>5</td>
				<td><input type="text" name="ck19" id="ck19"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>20</td>
				<td>车辆情况</td>
				<td>5</td>
				<td><input type="text" name="ck20" id="ck20"/>分   </td>
				<td>50万车辆正本和副页齐全</td>
			</tr>

			<tr>
				<td colspan="5" align="center">修正项</td>
			</tr>

			<tr>
				<td>21</td>
				<td>是否我司员工</td>
				<td>1</td>
				<td><input type="text" name="ck21" id="ck21"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>22</td>
				<td>是否我司会员</td>
				<td>2</td>
				<td><input type="text" name="ck22" id="ck22"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>23</td>
				<td>信用记录</td>
				<td>2</td>
				<td><input type="text" name="ck23" id="ck23"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>24</td>
				<td>社会信誉</td>
				<td>2</td>
				<td><input type="text" name="ck24" id="ck24"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>25</td>
				<td>公共记录</td>
				<td>3</td>
				<td><input type="text" name="ck25" id="ck25"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>26</td>
				<td>面谈主观印象</td>
				<td>2</td>
				<td><input type="text" name="ck26" id="ck26"/>分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td align="center" colspan="4">合计：&nbsp;&nbsp;<span id="money" style="color: red;"><b>${amounts}</b></span>分&nbsp;(包含推广奖励积分:<span id="money" style="color: red;"><b>${tgPoints}</b></span>分)</td>
				<td>
<!-- 				<input type="button" id="save" value="保存" style="width: 75px;height26px; margin: 3px 3px 3px 3px;"/>    <input type="button" value="取消" id="close1" style="width: 75px;height26px; margin: 3px 3px 3px 3px;"/> -->
				</td>
			</tr>
		</table>
</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="saveman">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>
<script type="text/javascript">
	$(function($){
		 $("#saveman").click(function(){
			 var _ckVaule="";
 			 $("table input:text").each(function() { 
 				var valValue=$(this).val();
				 if(valValue==""){
					valValue=0;
				 }
				_ckVaule+=valValue+",";  
 			}); 
   		 	 $("#ckVaule").val(_ckVaule);
			 $("#manform").submit();
		 });
		 
		var va= document.getElementById("ckVaule").value;
           if(va!=null&&va!=""){
        	  var strs= new Array();
                  strs=va.split(",");
        	   for (var i=0;i<strs.length;i++){
        		  $("input[name='ck"+(i+1)+"']").val(strs[i]);      
        	    } 
              }
	});
</script>