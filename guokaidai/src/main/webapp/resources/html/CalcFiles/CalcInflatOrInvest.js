function CalcInflatOrInvest(oDocument)
{
	var Sum = 0,CashValue = 0,EndRate = 0;
	var InvestCost = parseInt(oDocument.all.edSum.value);// 初始投资金额
	var Rate = parseFloat(oDocument.all.edRate.value)/100;//预期的年收益率：％
	var Inflate = parseFloat(oDocument.all.edInflatRate.value)/100;//预期的年通货膨胀率：％
	var Years = parseInt(oDocument.all.edTerm.value);//投资年限

	Sum=InvestCost*Math.pow(1+Rate,Years);
	CashValue=InvestCost*Math.pow((1+Rate)/(1+Inflate),Years);
	EndRate=(1+Rate)/(1+Inflate)-1;
	
	
	oDocument.all.lbEndSum.value = NBround(Sum,2);
	oDocument.all.lbRealSum.value = NBround(CashValue,2);
	oDocument.all.lbRealRate.value = Math.round(EndRate*10000)/100;
}