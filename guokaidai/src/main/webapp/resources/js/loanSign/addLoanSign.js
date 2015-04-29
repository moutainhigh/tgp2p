$(function(){
	
	//判断普通会员的购买份数
	/*$("#counterparts").blur(function(){
		var issueloan = $("#issueLoan").val();
		var loanUnit = $("#loanUnit").val();
		var counterparts = $("#counterparts").val();
		var num = parseFloat(issueloan)/parseFloat(loanUnit);
		if(counterparts>num){
			alertMsg.info('您的数据输入有误，请输入小于'+num+'的份数！');
			return;
		}
	});
	$("#vipCounterparts").blur(function(){
		var issueloan = $("#issueLoan").val();
		var loanUnit = $("#loanUnit").val();
		var counterparts = $("#counterparts").val();
		var vipCounterparts = $("#vipCounterparts").val();
		var num = parseFloat(issueloan)/parseFloat(loanUnit);
		if(vipCounterparts>num){
			alertMsg.info('您的数据输入有误，请输入小于'+num+'的份数！');
			return;
		}
		if(counterparts>vipCounterparts){
			alertMsg.info('您的数据输入有误，请输入大于'+counterparts+'的份数！');
			return;
		}
		
	});*/
	
	$("#submit").click(function(){
		var $refun = $("#refun").val();
		var $borrowmonth = $("#borrowmonth").val();
		var $rate = $("#rate1").val();
		var $money = $("#money").val();
		var $loantype = $("#loantype").val();
		var $behoof = $("#behoof1").val();
		var $cash = $("#cash").val();
		
		$("#issueLoan").val($money);
		 $("#rate").val($rate);
		 $("#refunway").val($refun);
		$("#type").val($loantype);
		 $("#month").val($borrowmonth);
		 $("#behoof").val($behoof);
		 $("#guaranteesAmt").val($cash);
		
		var loanUnit = $("#loanUnit").val();
		var counterparts = $("#counterparts").val();
		var num = parseFloat($money)/parseFloat(loanUnit);
		var vipCounterparts = $("#vipCounterparts").val();
		if(counterparts>num){
			alertMsg.info('普通会员最大份数输入有误，请输入小于'+num+'的份数！');
			$("#counterparts").val("");
			return;
		}
		if(vipCounterparts>num){
			alertMsg.info('VIP会员最大份数输入有误，请输入小于'+num+'的份数！');
			$("#vipCounterparts").val("");
			return;
		}
		if(counterparts>vipCounterparts){
			alertMsg.info('普通会员最大份数不得大于VIP会员最大份数！');
			$("#counterparts").val("");
			return;
		}
		$("#form1").submit();
	});
});