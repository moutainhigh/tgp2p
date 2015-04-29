		function recalculate(oDocument)
		{
			oDocument.all.TotalSum.value=parseInt(oDocument.all.Match.value)
				+ parseInt(oDocument.all.Lawer.value)
				+ parseInt(oDocument.all.Tax.value)
				+ parseInt(oDocument.all.BuyFee.value)
				+ parseInt(oDocument.all.Fund.value) ;//parseInt(oDocument.all.Insur.value)
		}
		

		function calc(oDocument)
		{
			var HouseSeq=parseFloat(oDocument.all.edHouseArea.value);
	   		var HousePrice=parseFloat(oDocument.all.edHousePrice.value) * HouseSeq;
	   		DebtYear=parseInt(oDocument.all.edHouseYears.value);   		
	   		oDocument.all.Match.value=Math.round(HousePrice * oDocument.all.YHSL.value/100);
		    oDocument.all.Lawer.value=Math.round(HousePrice * oDocument.all.LSFL.value/100);
		    if (HouseSeq<120)
		    {
		    	//oDocument.all.Tax.value=Math.round(HousePrice * 0.02);
				oDocument.all.BuyFee.value=500;
			}
			else	
			{
				//oDocument.all.Tax.value=Math.round(HousePrice * 0.04);
				oDocument.all.BuyFee.value=1500;				
			}
			oDocument.all.Tax.value=Math.round(HousePrice * oDocument.all.edQiTax.value/100);		//aiai 31/5/2004	
			
			oDocument.all.Fund.value=Math.round(HousePrice * oDocument.all.WXFL.value/100);
			oDocument.all.TotalSum.value=parseInt(oDocument.all.Match.value)
				+ parseInt(oDocument.all.Lawer.value)
				+ parseInt(oDocument.all.Tax.value)
				+ parseInt(oDocument.all.BuyFee.value)
				+ parseInt(oDocument.all.Fund.value) ;//parseInt(oDocument.all.Insur.value)
		}
		
		function computecurrvalue(year)
		{
			var v=1/1.02;
			tmp=Math.pow(v,year);
			return (1-tmp)/(v * 0.02);		 
		}
		 
		function locatefeerate(year)
		 {
			if (year<5)
				return 0.0006;
			else if(year<10) 
				return 0.00054;
			else if (year<15)
				return 0.0005;
			else if (year<20)
				return 0.00046;
			else if(year<25)
				return 0.00043; 
			else return 0.0004; 
		 }
