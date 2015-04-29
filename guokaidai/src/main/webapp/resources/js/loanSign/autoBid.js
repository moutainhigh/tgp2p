//新增按钮点击
$(".addAuto").click(function() {
  $(".autoBid .title").html("新增自动投标规则");
  $("#autoForm")[0].reset();
  // $(".autoBid .authenticateBnt:eq(0)").attr('onclick', 'submitAdd()');
  $(".autoBid .authenticateBnt:eq(0)").css('display', 'inline-block');
  $(".autoBid .authenticateBnt:eq(1)").css('display', 'none');
  $(".autoBg").css({
    display: 'block',
    height: $(".vipRightBox").outerHeight()+'px'
  });
  $(".autoBid").css({
    display: 'block',
    top: ($(".autoBg").outerHeight()-$(".autoBid").outerHeight())/2-20+'px'
  });
});
//编辑@param行号
function editAuto(index){
  $(".autoBid .title").html("修改自动投标规则 "+(index+1));
  if($(".pValidType:eq("+index+")").text()=="天"){
    $("#pValidType_0").val("D");
  }else{
    $("#pValidType_0").val("M");
  }
  $(".autoBid input[name='pValidDate']").val($(".pValidDate:eq("+index+")").text());
  $(".autoBid input[name='pSTrdCycleValue']").val($(".pSTrdCycleValue:eq("+index+")").text());
  $(".autoBid input[name='pETrdCycleValue']").val($(".pETrdCycleValue:eq("+index+")").text());
  if($(".pTrdCycleType:eq("+index+")").text()=="天"){
    $("#pTrdCycleType_0").val("D");
  }else{
    $("#pTrdCycleType_0").val("M");
  }
  $(".autoBid input[name='pSAmtQuota']").val($(".pSAmtQuota:eq("+index+")").text());
  $(".autoBid input[name='pEAmtQuota']").val($(".pEAmtQuota:eq("+index+")").text());
  $(".autoBid input[name='pSIRQuota']").val($(".pSIRQuota:eq("+index+")").text());
  $(".autoBid input[name='pEIRQuota']").val($(".pEIRQuota:eq("+index+")").text());
  if($(".pStatus:eq("+index+")").text()=="未启用"){
    $(".autoBid input[name='pStatus']:eq(0)").attr('checked', 'checked');
  }else{
    $(".autoBid input[name='pStatus']:eq(1)").attr('checked', 'checked');
  }
  // $(".autoBid .authenticateBnt:eq(0)").attr('onclick', 'submitUpdate('+index+')');
  $(".autoBid .authenticateBnt:eq(1)").css('display', 'inline-block');
  $(".autoBid .authenticateBnt:eq(0)").css('display', 'none');
  $(".autoBg").css({
    display: 'block',
    height: $(".vipRightBox").outerHeight()+'px'
  });
  $(".autoBid").css({
    display: 'block',
    top: ($(".autoBg").outerHeight()-$(".autoBid").outerHeight())/2-20+'px'
  });
}
//取消新增
function removeAdd() {
  $(".autoBg").css({display: 'none'});
  $(".autoBid").css({display: 'none'});
}
//新增提交
function submitAdd() {
  var pValidType = $("#pValidType_0").val();
  var pValidDate = $(".autoBid input[name='pValidDate']").val();
  var pTrdCycleType = $("#pTrdCycleType_0").val();
  var pSTrdCycleValue = $(".autoBid input[name='pSTrdCycleValue']").val();
  var pETrdCycleValue = $(".autoBid input[name='pETrdCycleValue']").val();
  var pSAmtQuota = $(".autoBid input[name='pSAmtQuota']").val();
  var pEAmtQuota = $(".autoBid input[name='pEAmtQuota']").val();
  var pSIRQuota = $(".autoBid input[name='pSIRQuota']").val();
  var pEIRQuota = $(".autoBid input[name='pEIRQuota']").val();
  var array = [pValidDate,pSTrdCycleValue,pETrdCycleValue,pSAmtQuota,pEAmtQuota,pSIRQuota,pEIRQuota];
  if(!autoCheck(array)){
    return;
  }
  //alert(user+"/"+pValidType+"/"+pValidDate+"/"+pTrdCycleType+"/"+pSTrdCycleValue+"/"+pETrdCycleValue+"/"+pSAmtQuota+"/"+pEAmtQuota+"/"+pSIRQuota+"/"+pEIRQuota+"/"+pStatus);
	$.ajax({
		type:'post',
		data:'pValidType='+pValidType+'&pValidDate='+pValidDate+'&pTrdCycleType='+pTrdCycleType+'&pSTrdCycleValue='+pSTrdCycleValue+'&pETrdCycleValue='+pETrdCycleValue+'&pETrdCycleValue='+pETrdCycleValue+'&pSAmtQuota='+pSAmtQuota+'&pEAmtQuota='+pEAmtQuota+'&pSIRQuota='+pSIRQuota+'&pEIRQuota='+pEIRQuota,
		url:'automatic/saveAutomatic',
		success:function(msg){
		     if(msg=="1"){
				   ymPrompt.succeedInfo('自动投标规则已受理成功',300,200,'成功',null);
				   removeAdd();
			 }else if(msg==2){
			        ymPrompt.errorInfo('环迅自动投标规则受理失败,请重新输入',300,200,'失败',null);
			        removeAdd();
			 }else if(msg==3){
				   ymPrompt.errorInfo('自动投标规则失败,数据解析失败',300,200,'失败',null);
				   removeAdd();
			 }else if(msg==4){
				 window.open("/baseLoanSign/gotoIPS.htm");
				 removeAdd();
				 
			 }
		}
	});	
}

//启用和停用自动投标规则
function enAuto(id){
  ymPrompt.confirmInfo("确定启用该自动投标规则吗？",null,null,"提示",function(tp){
    if(tp=="ok"){
      var $result=$.ajax({
            url:"/loanSign/updateAutoState?state=1&ids="+id+",",async:false
          }).responseText;
      if($result=='"success"'){
        ymPrompt.alert("自动投标规则启用成功",null,null,"提示",function(){
          window.location.reload();
        });
      }
    }
  });
}

function disAuto(id){
  ymPrompt.confirmInfo("确定停用该自动投标规则吗？",null,null,"提示",function(tp){
    if(tp=="ok"){
      var $result=$.ajax({
            url:"/loanSign/updateAutoState?state=2&ids="+id+",",async:false
          }).responseText;
      if($result=='"success"'){
        ymPrompt.alert("自动投标规则停用成功",null,null,"提示",function(){
          window.location.reload();
        });
      }
    }
  });
}

//修改提交
/*function submitUpdate(index) {
  var autoBidId = $(".autoBidId:eq("+index+")").val();
  var user = $("#session_userName").val();
  var pValidType = $("#pValidType_0").val();
  var pValidDate = $(".autoBid input[name='pValidDate']").val();
  var pTrdCycleType = $("#pTrdCycleType_0").val();
  var pSTrdCycleValue = $(".autoBid input[name='pSTrdCycleValue']").val();
  var pETrdCycleValue = $(".autoBid input[name='pETrdCycleValue']").val();
  var pSAmtQuota = $(".autoBid input[name='pSAmtQuota']").val();
  var pEAmtQuota = $(".autoBid input[name='pEAmtQuota']").val();
  var pSIRQuota = $(".autoBid input[name='pSIRQuota']").val();
  var pEIRQuota = $(".autoBid input[name='pEIRQuota']").val();
  var pStatus = $(".autoBid input[name='pStatus']:checked").val();
  var array = [pValidDate,pSTrdCycleValue,pETrdCycleValue,pSAmtQuota,pEAmtQuota,pSIRQuota,pEIRQuota];
  if(!autoCheck(array)){
    return;
  }
  alert(autoBidId+"/"+user+"/"+pValidType+"/"+pValidDate+"/"+pTrdCycleType+"/"+pSTrdCycleValue+"/"+pETrdCycleValue+"/"+pSAmtQuota+"/"+pEAmtQuota+"/"+pSIRQuota+"/"+pEIRQuota+"/"+pStatus);
}*/
//删除自动投标规则
/*function deleteAuto(index){
  var autoBidId = $(".autoBidId:eq("+index+")").val();
  var user = $("#session_userName").val();
  ymPrompt.confirmInfo("确定删除自动投标规则（"+(index+1)+"）吗？",null,null,"提示",function(result){
    if(result=="ok"){
      //删除代码
      alert(index+1+"："+autoBidId+"删除成功！",null,null,"提示",null);
    }
  });
}*/
//表单验证
function autoCheck(array){
  for (var i = array.length - 1; i >= 0; i--) {
    if(array[i]==""){
      ymPrompt.alert("请完整填写自动投标规则！",null,null,"提示",null);
      return false;
    }
  }
  for (var i = 1; i <= array.length - 2; i+=2) {
    if(parseInt(array[i])>parseInt(array[i+1])){
      ymPrompt.alert("取值范围不合理，小值不能大于大值！",340,null,"提示",null);
      return false;
    }
  }
  return true;
}
//类型为"月"时,最大12
$("#pValidType_0").change(function() {
  if($(this).val()=="M"&&parseInt($(this).prev("input").val())>12){
    $(this).prev("input").val("12");
  }
});
$("#pTrdCycleType_0").change(function() {
  if($(this).val()=="M"&&parseInt($(this).prev("input").val())>12){
    $(this).prev("input").val("12");
  }
  if($(this).val()=="M"&&parseInt($(this).prev("input").prev("input").val())>12){
    $(this).prev("input").prev("input").val("11");
  }
});
//input框限定输入
$(".autoBid input[name='pValidDate']").bind("input propertychange",checkValidDate);
$(".autoBid input[name='pSTrdCycleValue']").bind("input propertychange",checkCycleValue);
$(".autoBid input[name='pETrdCycleValue']").bind("input propertychange",checkCycleValue);
$(".autoBid input[name='pSAmtQuota']").bind("input propertychange",checkAmtQuota);
$(".autoBid input[name='pEAmtQuota']").bind("input propertychange",checkAmtQuota);
$(".autoBid input[name='pSIRQuota']").bind("input propertychange",checkAmtQuota);
$(".autoBid input[name='pEIRQuota']").bind("input propertychange",checkAmtQuota);

function checkValidDate(){
  if(/\D/.test($(this).val())||isNaN($(this).val())){
    $(this).val($(this).val().replace(/[^\d]/g,''));
  }else if(parseInt($(this).val())>360&&($("#pValidType_0").val()=="D")){
    ymPrompt.alert("以天计算有效期，数值范围为1~360",null,null,"提示",null);
    $(this).val(360);
  }else if(parseInt($(this).val())>12&&($("#pValidType_0").val()=="M")){
    ymPrompt.alert("以月计算有效期，数值范围为1~12",null,null,"提示",null);
    $(this).val(12);
  }else if(/^0/.test($(this).val())){
    ymPrompt.alert("最小值为1，请重新输入！",null,null,"提示",null);
    $(this).val(1);
  }
}
function checkCycleValue(){
  if(/\D/.test($(this).val())||isNaN($(this).val())){
    $(this).val($(this).val().replace(/[^\d]/g,''));
  }else if(parseInt($(this).val())>1800&&($("#pTrdCycleType_0").val()=="D")){
    ymPrompt.alert("以天计算周期，数值范围为1~1800",null,null,"提示",null);
    $(this).val(1800);
  }else if(parseInt($(this).val())>60&&($("#pTrdCycleType_0").val()=="M")){
    ymPrompt.alert("以月计算周期，数值范围为1~12",null,null,"提示",null);
    $(this).val(60);
  }else if(/^0/.test($(this).val())){
    ymPrompt.alert("最小值为1，请重新输入！",null,null,"提示",null);
    $(this).val(1);
  }
}
function checkAmtQuota(){
  if(isNaN($(this).val())){
    $(this).val($(this).val().replace(/[^\d]$/g,''));
  }else if(/[.][\d]{3}$/.test($(this).val())){
    ymPrompt.alert("只能保留到两位有效小数！",null,null,"提示",null);
    $(this).val($(this).val().replace(/[\d]$/g,''));
  }else if(parseInt($(this).val())>999999999){
    ymPrompt.alert("最大值为999999999.99！",null,null,"提示",null);
    $(this).val("999999999.99");
  }else if(/^0/.test($(this).val())){
    ymPrompt.alert("最小值为1，请重新输入！",null,null,"提示",null);
    $(this).val(1);
  }
}