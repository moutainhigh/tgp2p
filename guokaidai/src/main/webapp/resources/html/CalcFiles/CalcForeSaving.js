var interestRate = 0.05;  //利息税率
function CalcForeSaving()
{
	var SaveType;	// 储蓄类型：（1.定期存款、2.活期存款、3.七天通知存款；默认为定期存款）
	var Sum;	// 初期存入金额：元（正整数；无默认值）
	var YearRate;	// 年利率：正小数
	var SaveTerm = 12;	// 储蓄存期(月)(与储蓄类型中的“定期存款”相对应，与“预期提取日期”互斥
	//var StandDate = new Date("1999/11/1");	// 标准日期1999年11月1日
	var BeginDate = new Date();	// 初始存入日期：年月日（默认值为当前日期）
	var DrawDate = new Date();	// 预期提取日期：“活期存款”默认值为当前日期，此项不得小于初始存入日期
							    // “七天通知存款”默认值为当前日期+七天，此项不得小于初始存入日期+七天）
	//var Kind = parseInt(cbKind.SelectedItem.Value);
	var ShresholdDate=new Date("1999/11/1");  //第一时间段
    var secondSegment = new Date("2007/08/14"); //第二个日期段

	SaveType = parseInt(ForeSavingCalc.cbType.selectedIndex) + 1;
	Sum = parseFloat(ForeSavingCalc.edSum.value);
	YearRate = parseFloat(ForeSavingCalc.edRate.value)/100;
	BeginDate.setTime(StrToDate(ForeSavingCalc.beginDateID.value));
	//初始日期
	var dtime=new Date(BeginDate.getFullYear(),BeginDate.getMonth(),BeginDate.getDate());
	var enddate=new Date(BeginDate.getFullYear(),BeginDate.getMonth(),BeginDate.getDate());
	
	if(SaveType == 1)
		SaveTerm = parseInt(ForeSavingCalc.cbTerm.options[ForeSavingCalc.cbTerm.selectedIndex].value);
	else
		DrawDate.setTime(StrToDate(ForeSavingCalc.drawDateID.value));	
	//结束日期（定期存款）
	//var enddatemid = Date.parse(dtime)+SaveTerm*30*1000*3600*24;
	//var enddatemid1 = new Date(enddatemid) ;
	//var enddate = new Date(enddatemid1.getFullYear(),enddatemid1.getMonth(),enddatemid1.getDate()-1);
	enddate = new Date(enddate.setMonth(enddate.getMonth() + SaveTerm));
	//预期提取日期（活期和通知存款）	
	var ytime = new Date(DrawDate.getFullYear(),DrawDate.getMonth(),DrawDate.getDate());
		
	switch (SaveType)
	{
		case 1:FixedDeposit(dtime,ShresholdDate,secondSegment,enddate,Sum,YearRate,SaveTerm);break;//1.定期存款
		case 2://2.活期存款
		case 3:CurrentAndSevenNotifySave(dtime,ytime,ShresholdDate,secondSegment,Sum,YearRate);break;//3.七天通知存款
		default :break;//没有这种存款方式
	}
}

// 活期存款和七天通知存款
function CurrentAndSevenNotifySave(dtime,ytime,ShresholdDate,secondSegment,InitSaveInSum,YearRate)
{
	var tDays,tDays2;
	var TermEndSum=0;	//到期本息总额：元
	var InterestTaxSum=0;	// 扣除利息税金额：元
	    //如果到期日<1999年11月01日或者（1999年11月01日<=起存日<=2007年08月14日 并且 到期日<=2007年08月14日）或者起存日>2007年08月14日
        if(ytime<ShresholdDate)
        {
            TermEndSum=InitSaveInSum*((YearRate/360.0)*getSaveTime(dtime,ytime,2)+1);
            InterestTaxSum=0;
        }
		if(ShresholdDate<=dtime && dtime<=secondSegment && ytime<=secondSegment)
		{
				TermEndSum=InitSaveInSum*((YearRate/360.0)*getSaveTime(dtime,ytime,2)*0.8+1);
				InterestTaxSum=InitSaveInSum*(YearRate/360.0)*getSaveTime(dtime,ytime,2)*0.2;
		}
		if(dtime>secondSegment)
		{
				TermEndSum=InitSaveInSum*((YearRate/360.0)*getSaveTime(dtime,ytime,2)*0.95+1);
				InterestTaxSum=InitSaveInSum*(YearRate/360.0)*getSaveTime(dtime,ytime,2)*0.05;
		}


		//如果起存日<1999年11月01日，并且到期日>2007年08月14日【这在实际中不可能出现，不过从算法上是完善的】
		if(dtime<ShresholdDate && ytime>secondSegment)
		{
				TermEndSum=InitSaveInSum*((YearRate/360.0)*(getSaveTime(dtime,ShresholdDate,2)+getSaveTime(ShresholdDate,secondSegment,2)*0.8+getSaveTime(secondSegment,ytime,2)*0.95)+1);
				InterestTaxSum=InitSaveInSum*(YearRate/360.0)*(getSaveTime(ShresholdDate,secondSegment,2)*0.2+getSaveTime(secondSegment,ytime,2)*0.05);
		}
	      
	      
		//如果起存日<1999年11月01日，并且1999年11月01日<=到期日<=2007年08月14日
		if(dtime<ShresholdDate && ShresholdDate<=ytime && ytime<=secondSegment)
		{
				TermEndSum=InitSaveInSum*((YearRate/360.0)*(getSaveTime(dtime,ShresholdDate,2)+getSaveTime(ShresholdDate,ytime,2)*0.8)+1);
				InterestTaxSum=InitSaveInSum*(YearRate/360.0)*getSaveTime(ShresholdDate,ytime,2)*0.2;
		}
		
		
		//如果1999年11月01日<=起存日<=2007年08月14日，并且到期日>2007年08月14日
		if(ytime>secondSegment && ShresholdDate<=dtime && dtime<=secondSegment)
		{
				TermEndSum=InitSaveInSum*((YearRate/360.0)*(getSaveTime(dtime,secondSegment,2)*0.8+getSaveTime(secondSegment,ytime,2)*0.95)+1);
				InterestTaxSum=InitSaveInSum*(YearRate/360.0)*(getSaveTime(dtime,secondSegment,2)*0.2+getSaveTime(secondSegment,ytime,2)*0.05);
  		}

		ForeSavingCalc.lbSum.value=NBround(TermEndSum,2);
		ForeSavingCalc.lbTaxSum.value=NBround(InterestTaxSum,2);
}

/// 定期存款
function FixedDeposit(dtime,ShresholdDate,secondSegment,enddate,InitSaveInSum,YearRate,SaveTerm)
{
	var years,tDays;
	var TermEndSum=0, InterestTaxSum=0;
	years=SaveTerm/12.0;
	    //如果到期日<1999年11月01日或者（1999年11月01日<=起存日<=2007年08月14日 并且 到期日<=2007年08月14日）或者起存日>2007年08月14日
        if(enddate<ShresholdDate)
        {
            TermEndSum=InitSaveInSum*(YearRate*getSaveTime(dtime,enddate,1)+1);
            InterestTaxSum=0;
        }
		if(ShresholdDate<=dtime && dtime<=secondSegment && enddate<=secondSegment)
		{
				TermEndSum=InitSaveInSum*(YearRate*getSaveTime(dtime,enddate,1)*0.8+1);
				InterestTaxSum=InitSaveInSum*YearRate*getSaveTime(dtime,enddate,1)*0.2;
		}
		if(dtime>secondSegment)
		{
				TermEndSum=InitSaveInSum*(YearRate*getSaveTime(dtime,enddate,1)*0.95+1);
				InterestTaxSum=InitSaveInSum*YearRate*getSaveTime(dtime,enddate,1)*0.05;
		}


		//如果起存日<1999年11月01日，并且到期日>2007年08月14日【这在实际中不可能出现，不过从算法上是完善的】
		if(dtime<ShresholdDate && enddate>secondSegment)
		{
				TermEndSum=InitSaveInSum*(YearRate*(getSaveTime(dtime,ShresholdDate,1)+getSaveTime(ShresholdDate,secondSegment,1)*0.8+getSaveTime(secondSegment,enddate,1)*0.95)+1);
				InterestTaxSum=InitSaveInSum*YearRate*(getSaveTime(ShresholdDate,secondSegment,1)*0.2+getSaveTime(secondSegment,enddate,1)*0.05);
		}
	      
	      
		//如果起存日<1999年11月01日，并且1999年11月01日<=到期日<=2007年08月14日
		if(dtime<ShresholdDate && ShresholdDate<=enddate && enddate<=secondSegment)
		{
				TermEndSum=InitSaveInSum*(YearRate*(getSaveTime(dtime,ShresholdDate,1)+getSaveTime(ShresholdDate,enddate,1)*0.8)+1);
				InterestTaxSum=InitSaveInSum*YearRate*getSaveTime(ShresholdDate,enddate,1)*0.2;
		}
		
		
		//如果1999年11月01日<=起存日<=2007年08月14日，并且到期日>2007年08月14日
		if(enddate>secondSegment && ShresholdDate<=dtime && dtime<=secondSegment)
		{
				TermEndSum=InitSaveInSum*(YearRate*(getSaveTime(dtime,secondSegment,1)*0.8+getSaveTime(secondSegment,enddate,1)*0.95)+1);
				InterestTaxSum=InitSaveInSum*YearRate*(getSaveTime(dtime,secondSegment,1)*0.2+getSaveTime(secondSegment,enddate,1)*0.05);
  		}
		ForeSavingCalc.lbSum.value=NBround(TermEndSum,2);
		ForeSavingCalc.lbTaxSum.value=NBround(InterestTaxSum,2);
}

//获得实际的储期(flag=1--年；flag=2--日)
function getSaveTime(startdate,enddate,flag)
{
        //实际年
        var tsYear = enddate.getFullYear()-startdate.getFullYear();
        var tstartMonth = startdate.getMonth();
        var tendMonth = enddate.getMonth();
        var tstartDay = startdate.getDate();
        var tendDay = enddate.getDate();
        if(tendMonth<tstartMonth)
        {
          tsYear--;
          tendMonth += 12;
        }
        //实际月
        var tsMonth = tendMonth-tstartMonth;
        if(tendDay<tstartDay)
        {
          tsMonth--;
          if(tsMonth<0)
          {
            tsYear--;
            tsMonth += 12;
          }
          tendDay += 30;
        }
        //实际日
        var tsDay = tendDay - tstartDay;
        var ret;
        if(flag==1)//返回年
        {
          ret = tsYear+tsMonth/12+tsDay/360;
        }
        if(flag==2)//返回日
        {
          ret = tsYear*360+tsMonth*30+tsDay;
        }
        return ret;
}
