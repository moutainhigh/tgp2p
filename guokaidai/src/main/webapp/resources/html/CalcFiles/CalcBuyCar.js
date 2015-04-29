
		function calc(oDocument)
		{
	   		CarPrice=parseInt(oDocument.all.edCarPrice.value);	 		    
	   		CarSeat=parseInt(oDocument.all.edCarSeat.value); 
	   		FeeRate = oDocument.all.FeeRate.value/100;
	   		TaxRate = oDocument.all.TaxRate.value/100;
		    oDocument.all.Insur.value=Math.round(1540+CarPrice * FeeRate);
		    oDocument.all.Extra.value=Math.round(CarPrice * TaxRate);
			//oDocument.all.Justify.value=100;
			//oDocument.all.Setax.value=200;
			//oDocument.all.Road.value=264*CarSeat;
			//oDocument.all.Tagfee.value=174;
			if (oDocument.all.edChecked.checked)
				oDocument.all.Examcar.value=8;
			else
				oDocument.all.Examcar.value=56;
			//oDocument.all.Stop.value=1700;
			oDocument.all.Total.value=parseInt(oDocument.all.Insur.value)
				+ parseInt(oDocument.all.Extra.value)
				+ parseInt(oDocument.all.Justify.value)
				+ parseInt(oDocument.all.Setax.value)
				+ parseInt(oDocument.all.Road.value)
				+ parseInt(oDocument.all.Tagfee.value)
				+ parseInt(oDocument.all.Examcar.value);
				//+ parseInt(oDocument.all.Stop.value);
		}
		function recalc(oDocument)
		{
			oDocument.all.Total.value=parseInt(oDocument.all.Insur.value)
				+ parseInt(oDocument.all.Extra.value)
				+ parseInt(oDocument.all.Justify.value)
				+ parseInt(oDocument.all.Setax.value)
				+ parseInt(oDocument.all.Road.value)
				+ parseInt(oDocument.all.Tagfee.value)
				+ parseInt(oDocument.all.Examcar.value);
				//+ parseInt(oDocument.all.Stop.value);
		}