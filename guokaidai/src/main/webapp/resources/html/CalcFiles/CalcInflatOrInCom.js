function CalcInflatOrInCom(oDocument)
{
	var Sum=0;
	var CashSum;// 目前持有的现金金额
	var Price;// 目前该种商品的价格
	var Years = parseInt(oDocument.all.edYear.value);
	var Sum1 = parseInt(oDocument.all.edSum.value);
	var Inflate = parseFloat(oDocument.all.edInflatRate.value)/100;// 您所预期的年通货膨胀率：％
	
	switch(oDocument.all.cbType.selectedIndex)
	{
		case 0:
			CashSum = Sum1;
			Sum=CashSum/Math.pow(1+Inflate,Years);
			break;
		case 1:
			Price = Sum1;
			Sum=Price*Math.pow(1+Inflate,Years);
			break;
	}
	return Sum;
}