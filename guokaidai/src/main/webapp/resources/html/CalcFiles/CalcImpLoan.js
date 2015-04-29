function CalcImpLoan(oDocument)
{
	var InitSaveInDate=new Date(oDocument.all.edInitSaveInDate.value.replace("-","/"));
	var SaveYears;
        var interestRate = 0.05; //利息税率
	switch(oDocument.all.edSaveYears.selectedIndex)
	{
	  case 0:
	    SaveYears=0.25;
	    break;
	  case 1:
	    SaveYears=0.5;
	    break;	  
	  case 2:
	    SaveYears=1;
	    break;	  
	  case 3:
		SaveYears=2;
		break;
	  case 4:
	    SaveYears=3;
	    break;
	  case 5:
	    SaveYears=5;
	    break;
	}
	var InitSaveInSum=parseInt(oDocument.all.edInitSaveInSum.value);
	var FixedDepositRate=parseFloat(oDocument.all.edFixedDepositRate.value)/100;
	var CurrentDepositRate=parseFloat(oDocument.all.edCurrentDepositRate.value)/100;
	var AdvanceDrawDate=new Date(oDocument.all.edAdvanceDrawDate.value.replace("-","/"));
	var AdvanceDrawSum=parseInt(oDocument.all.edAdvanceDrawSum.value);
	var ImpawnSum=parseInt(oDocument.all.edImpawnSum.value);
	var ImpawnRate=parseFloat(oDocument.all.edImpawnRate.value)/100;
	var ImpawnTime=parseInt(oDocument.all.edImpawnTime.value);

	var AdvanInterest=0,ImpawnInterest=0;
	var StandDate=new Date("1999/11/1");
	var tDays,tDays2,tDays3;
	var tempDate=new Date(InitSaveInDate.getFullYear(),InitSaveInDate.getMonth(),InitSaveInDate.getDate());
	tempDate.setMonth(tempDate.getMonth() + ImpawnTime);
	
	tDays=GetDayLen(tempDate,StandDate);//（G+n－g2）
	tDays2=GetDayLen(AdvanceDrawDate,InitSaveInDate);//（g1-G）
	tDays3=GetDayLen(AdvanceDrawDate,StandDate);//（g1-g2）
	
	if (AdvanceDrawSum==InitSaveInSum)//全额提取
	{
		if (InitSaveInDate>=StandDate)//存入日期是99年11月1日后（含）
		{
            /*
                提前支取利息=M ×（b％÷360）×（g1-G）×（1-利息税率）
                存单质押贷款利息= M × a％× m（1-利息税率）－ N2×n×c％
            */
            AdvanInterest=InitSaveInSum *(CurrentDepositRate/360.0)*tDays2*(1-interestRate);
            ImpawnInterest=InitSaveInSum*FixedDepositRate*SaveYears*(1-interestRate)-ImpawnSum*(ImpawnTime/12.0)*ImpawnRate; 
		}
		else
		{
			/*
			 * 存入日期是99年11月1日前：
               提前支取利息= M ×（b％÷360）×（g1-G）－M ×（b％÷360）×（g1-g2）×利息税率
               存单质押贷款利息= M × a％× m－利息税率×M×（G+n－g2）×（a％÷360）－ N2×n×c％
			 * */
			AdvanInterest=InitSaveInSum *(CurrentDepositRate/360.0)*(tDays2-tDays3*interestRate);
			ImpawnInterest=InitSaveInSum*(FixedDepositRate*SaveYears-interestRate*tDays*(FixedDepositRate/360.0))-ImpawnSum*(ImpawnTime/12.0)*ImpawnRate; 
		}
	}
	else if (AdvanceDrawSum<InitSaveInSum)//部分提取
	{
		if (InitSaveInDate>=StandDate)//存入日期是99年11月1日后（含）
		{
			/*
			   提前支取利息=（M - N1 ) ×a％×m×（1-利息税率）+N1×（b％÷360）×（g1-G）×（1-利息税率）
			   存单质押贷款利息= M×a％×m（1-利息税率）－ N2×n×c％
			*/
			AdvanInterest=(InitSaveInSum-AdvanceDrawSum)*FixedDepositRate*SaveYears*(1-interestRate) + (AdvanceDrawSum*(CurrentDepositRate/360.0)*tDays2*(1-interestRate));
			ImpawnInterest=InitSaveInSum*FixedDepositRate*SaveYears*(1-interestRate) - ImpawnSum*(ImpawnTime/12.0)*ImpawnRate; 
		}
		else
		{
			/*
			2、存入日期是99年11月1日前：
			   提前支取利息= （M－N1） × a％× m－利息税率×（M－N1）×（G+n－g2）×（a％÷360） + N1 ×（b％÷360）×（g1-G）－N1×（b％÷360）×（g1-g2）×利息税率
			   其中：（G+n－g2）为天数
			   存单质押贷款利息= M × a％× m－利息税率×M×（G+n－g2）×（a％÷360）－ N2×n×c％
	        */
			AdvanInterest=(InitSaveInSum-AdvanceDrawSum)*FixedDepositRate*(SaveYears-interestRate*tDays/360)+AdvanceDrawSum*(CurrentDepositRate/360.0)*(tDays2-tDays3*interestRate);
			ImpawnInterest=InitSaveInSum*(FixedDepositRate*SaveYears-interestRate*tDays*(FixedDepositRate/360.0))-ImpawnSum*(ImpawnTime/12.0)*ImpawnRate; 
		}
	}
	CompResult=ImpawnInterest-AdvanInterest;
	
	return CompResult;
}

		
function GetDayLen(sStartDate,sStandDate)
{
	//以每月30天算一月，一年为360天
	var StartDate=new Date(sStartDate);
	var StandDate=new Date(sStandDate);	
	var DiffDay=(StartDate.getFullYear()-StandDate.getFullYear())*360+(StartDate.getMonth()-StandDate.getMonth())*30+(StartDate.getDate()-StandDate.getDate());
	
	return DiffDay;
}