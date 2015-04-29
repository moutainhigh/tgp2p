function showAssign(loanId,loanTitile,tenderMoney,loanUnit){
	$.ajax({
		type:'post',
		data:'loanId='+loanId,
		url:'member_debt/assignmentMoeny',
		success:function(duemoney){
			var content = "";
			content+="<div class=\"applyTransDiv\"><input type=\"hidden\" value=\""+duemoney+"\" id=\"duemoney\">";
			content+="当前申请转让的标为：<font style=\"color:red\">"+loanTitile+"（￥"+tenderMoney+"）,剩余转让本金：（￥"+duemoney+"）</font>"
			content+="<input type=\"hidden\" value=\""+loanId+"\" id=\"loanId\"><input type=\"hidden\" value=\""+loanUnit+"\" id=\"loanUnit\"></div>";
			content+="<div class=\"applyTransDiv\">";
			content+="	转让份额：";
			content+="    <select name=\"transPercent\" id=\"transPercent\">";
			content+="        <option value=\"1\">全部转让</option>";
			content+="        <option value=\"2\">部分转让</option>";
			content+="    </select>";
			content+="    <input type=\"text\" name=\"transNum\" id=\"transNum\" value=\""+parseInt(tenderMoney)/parseInt(loanUnit)+"\" width=\"80\" readonly=\"readonly\">份，共<span style=\"color:red\">"+duemoney+"</span>元（每份"+parseFloat(parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))).toFixed(2)+"元）";
			content+="</div>";
			content+="<div class=\"applyTransDiv\">";
			content+="	转让价格：";
			content+="    <select name=\"transValue\" id=\"transValue\">";
			content+="        <option value=\"3\">不变</option>";
			content+="        <option value=\"1\">折扣</option>";
			content+="        <option value=\"2\">升值</option>";
			content+="    </select>";
			content+="    <input type=\"text\" name=\"percent\" id=\"percent\" value=\"0\" width=\"80\" readonly=\"readonly\">％，<span>转让价每份<font style='color:red'>"+parseFloat(parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))).toFixed(2)+"</font>元</span>";
			content+="</div>";
			content+="<div style=\"line-height:25px;margin-top:10px\">";
			content+="    您决定转让 <font id=\"resultNum\" style=\"color:red\">"+parseInt(tenderMoney)/parseInt(loanUnit)+"</font> 份债权，转让价为 <font id=\"resultPrice\" style=\"color:red\">"+parseFloat(parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))).toFixed(2)+"</font> 元/份（原价"+parseFloat(loanUnit).toFixed(2)+"元/份）";
			content+="</div>";
			content+="<div style=\"margin-top:10px\">";
			content+="	<a class=\"authenticateBnt\" onclick=\"submitAssign()\" style=\"height:25px;line-height:25px;margin-left:0px\">确认</a>";
			content+="	<a class=\"authenticateBnt\" onclick=\"removeAssign()\" style=\"height:25px;line-height:25px;margin-left:30px\">取消</a>";
			content+="</div>";
			content+="<script>";
			content+="$(\"#transPercent\").change(function() {";
			content+="    if ($(this).val()==\"1\") {";
			content+="        $(this).next().val("+parseInt(tenderMoney)/parseInt(loanUnit)+");";
			content+="		  $(\"#transNum\").next().text(\""+duemoney+"\");";
			content+="        $(this).next().attr(\"readonly\",\"readonly\");";
			content+="    };";
			content+="    if ($(this).val()==\"2\") {";
			content+="        $(this).next().removeAttr(\"readonly\");";
			content+="    };";
			content+="});";
			content+="$(\"#transValue\").change(function() {";
			content+="	  $(\"#resultPrice\").text(parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+").toFixed(2));";
			content+="    if ($(this).val()==\"3\") {";
			content+="        $(this).next().val(\"0\");";
			content+="        $(this).next().attr(\"readonly\",\"readonly\");";
			content+="        $(this).next().next().html(\"转让价每份<font style='color:red'>\"+parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+").toFixed(2)+\"</font>元\");";
			content+="    }else if ($(this).val()==\"1\"){";
			content+="        $(this).next().val(\"0\");";
			content+="        $(this).next().removeAttr(\"readonly\");";
			content+="        $(this).next().next().html(\"转让价每份<font style='color:red'>\"+parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+"*(1-$(this).next().val()/100)).toFixed(2)+\"</font>元\");";
			content+="    }else{";
			content+="        $(this).next().val(\"0\");";
			content+="        $(this).next().removeAttr(\"readonly\");";
			content+="        $(this).next().next().html(\"转让价每份<font style='color:red'>\"+parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+"*(1+$(this).next().val()/100)).toFixed(2)+\"</font>元\");";
			content+="    };";
			content+="});";
			content+="$(\"#transNum\").bind(\"input propertychange\",function(){";
			content+="	  if(isNaN($(this).val())){";
			content+="		  $(this).val($(this).val().replace(/[^\\d]/g,''));";
			content+="	  }else if(parseInt($(this).val())>"+parseInt(tenderMoney)/parseInt(loanUnit)+"){";
			content+="        ymPrompt.alert(\"转让份额不得大于总份额\");";
			content+="        $(this).val("+parseInt(tenderMoney)/parseInt(loanUnit)+")";
			content+="    }else if(parseInt($(this).val())<1){";
			content+="        ymPrompt.alert(\"最小转让份额为1\");";
			content+="        $(this).val(1)";	
			content+="    }else{";
			content+="      $(\"#resultNum\").text($(this).val());";
			content+="    	$(this).next().text(parseFloat($(this).val()*"+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+").toFixed(2));";
			content+="	  }";
			content+="});";
			content+="$(\"#percent\").bind(\"input propertychange\",function(){";
			content+="	  if(isNaN($(this).val())){";
			content+="    	$(this).val($(this).val().replace(/[^\\d]/g,''));";
			content+="    }else if($(this).val()>30){";
			content+="        ymPrompt.alert(\"折扣或升值不得超过30%\");";
			content+="        $(this).val(30)";
			content+="    }else if($(this).val()<0){";
			content+="        ymPrompt.alert(\"请输入0-30范围内数字\");";
			content+="        $(this).val(1)";
			content+="    }else{";
			content+="    if($(this).prev().val()==\"1\"){";
			content+="        $(\"#resultPrice\").text(parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+"*(1-$(this).val()/100)).toFixed(2));";
			content+="        $(this).next().find(\"font\").text(parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+"*(1-$(this).val()/100)).toFixed(2));";
			content+="    }else{";
			content+="        $(\"#resultPrice\").text(parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+"*(1+$(this).val()/100)).toFixed(2));";
			content+="        $(this).next().find(\"font\").text(parseFloat("+parseInt(duemoney)/(parseInt(tenderMoney)/parseInt(loanUnit))+"*(1+$(this).val()/100)).toFixed(2));";
			content+="    }}";
			content+="});";
			content+="</script>";
			$(".applyTrans").html(content);
			$(".applyBg").css({
				display: 'block',
				height: $(".vipRightBox").outerHeight()+'px'
			});
			$(".applyTrans").css({
				display: 'block',
				top: ($(".vipRightBox").outerHeight()-$(".applyTrans").outerHeight())/2-20+'px'
			});
		}
	});	
}

function removeAssign(){
	$(".applyBg").css({display: 'none'});
	$(".applyTrans").html("");
	$(".applyTrans").css({display: 'none'});
}
function submitAssign(){
	var loanId = $("#loanId").val();
	var tenderMoney = $("#duemoney").val();
	var pcrettype = $("#transPercent").val();
	var share = $("#transNum").val();
	var distype = $("#transValue").val();
	var appreciation = $("#percent").val();
	var loanUnit = $("#loanUnit").val();
	$.ajax({
			type:'post',
			data:'tenderMoney='+tenderMoney+'&loanId='+loanId+'&pcrettype='+pcrettype+'&appreciation='+appreciation+'&loanUnit='+loanUnit+'&share='+share+'&distype='+distype,
			url:'member_debt/assignmentPost',
			success:function(msg){
			     if(msg=="0"){
					   ymPrompt.succeedInfo('申请债权转让成功',300,200,'成功',null);
					   removeAssign();
				 }else if(msg==1){
				        ymPrompt.errorInfo('已申请转让过，不能再申请',300,200,'失败',null);
				        removeAssign();
				 }else if(msg==2){
					   ymPrompt.errorInfo('申请债权转让失败',300,200,'失败',null);
					   removeAssign();
				 }else if(msg==3){
					   ymPrompt.errorInfo('该标中有逾期还款金额，不能申请',300,200,'失败',null);
					   removeAssign();
				 }else if(msg==5){
					   ymPrompt.errorInfo('不能在购标当天进行转让',300,200,'失败',null);
					   removeAssign();
				 }
			}
		});	
	//alert(loanId+"|"+tenderMoney+"|"+pcrettype+"|"+share+"|"+distype+"|"+appreciation+"|"+loanUnit);
}