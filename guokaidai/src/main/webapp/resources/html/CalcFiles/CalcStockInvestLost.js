function CalcStockInvest(oDocument)
{
	var StockType=oDocument.all.TradeType.selectedIndex+1;
	var BuyNumber=parseInt(oDocument.all.edinnum.value);
	var BuyPrice=parseFloat(oDocument.all.edinprice.value);
	var FeeRate=parseFloat(oDocument.all.edtraderate.value)/100;
	var Cash=parseFloat(oDocument.all.edcashprofit.value);
	var Stock=parseInt(oDocument.all.edstockprofit.value);
	var SalePrice=parseFloat(oDocument.all.edoutprice.value);

	var capitalprofit = (SalePrice-BuyPrice) * BuyNumber; //资本利得
	var stockprofit = Cash + Stock * SalePrice; //获得股利

	var handcharge_in=ComputeTradeFee(StockType,BuyNumber,BuyPrice,FeeRate);//买入时手续费
	var handcharge_out=ComputeTradeFee(StockType,BuyNumber,SalePrice,FeeRate);//卖出时手续费

	var stocklost=capitalprofit+stockprofit-handcharge_in-handcharge_out;

	oDocument.all.txttotal.value=NBround(new Number(stocklost),2);
	oDocument.all.txt1.value=NBround(new Number(capitalprofit),2);
	oDocument.all.txt2.value=NBround(new Number(stockprofit),2);
	oDocument.all.txt3.value=NBround(new Number(handcharge_in+handcharge_out),2);
}


function ComputeTradeFee(Type,tradenum,tradeprice,traderate)
{			
	//traderate/=100;
	var tradesum=tradeprice * tradenum;						

      //  var xmlroot=xmlDoc.documentElement;
	var type;
	
	switch(Type)
	{
		case 1:
		{
		    type=6;
		    break;
		}
		case 2:
		{
		    type=10;
		    break;
		}
		case 3:
		{
		    type=1;
		    break;
		}
		case 4:
		{
		    type=5;
		    break;
		}						
	}
	
	/*for (i=0;i<xmlroot.childNodes.length;i++)
	{
		if(xmlroot.childNodes.item(i).childNodes.item(0).text ==type)
		{
			var yhs=xmlroot.childNodes.item(i).childNodes.item(3).text;
			var zdyj=xmlroot.childNodes.item(i).childNodes.item(4).text;
			var ghf=xmlroot.childNodes.item(i).childNodes.item(5).text;
			var jsf=xmlroot.childNodes.item(i).childNodes.item(7).text;
			var jygf=xmlroot.childNodes.item(i).childNodes.item(8).text;
			break;
		}
	}*/	
        
	r1=tradesum * 0.002; //印花税					
	r2 =tradesum * traderate; //佣金
	switch (Type)
	{				
		case 1: //上A
		{					
			r3=tradenum*0.001; //过户费
			if(r3<1) //aiai, 过户费最低为￥1.0
				r3=1;
			if(r2 < 5)//aiai,佣金最低为￥5.0
				r2 = 5;
			break;
		}
		case 3: //深A
		{					
			r3=tradesum * 0.0001875; //监督管理费和经手费
			if(r2 < 5)//aiai,佣金最低为￥5.0
				r2 = 5;
			break;
		}
		case 2: //上B
		{					
			r3=tradesum * 0.0005; //结算费
			r4=tradenum * 0.001;  //交易过户费
			break;
		}	
		case 4: //深B
		{					
			r3=tradesum * 0.000341; //交易规费
			r4=tradesum * 0.0005;  //结算费
			if (r4>500)
				 r4=500;
			break;
		}			
	}  

	var tradetotal=(r1+r2+r3);
	if ( (Type==2) || (Type==4) )
		tradetotal+=r4;

	return tradetotal;
}
