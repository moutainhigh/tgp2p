//袁晓荣  2003-02-19
//个人所得税计算器

function CalcTax(oDocument)
{
	IncomeType = oDocument.all.ddlIncomeType.value;
	IncomeBeforeTax = oDocument.all.tbIncomeBeforeTax.value;
	  
	if (IncomeType==0)
	{
		AllInsureFee = oDocument.all.tbAllInsureFee.value;
		ThresholdSum = oDocument.all.tbThresholdSum.value;
	}
	sum= new Array(500,2000,5000,20000,40000,60000,80000,100000,100000);
	rate= new Array(5,10,15,20,25,30,35,40,45);
	tax= new Array(0,25,125,375,1375,3375,6375,10375,15375);

	sum2= new Array(5000,10000,30000,50000,50000);
	rate2= new Array(5,10,20,30,35);
	tax2= new Array(0,250,1250,4250,6750); 

	sum4= new Array(20000,50000,50000);
	rate4= new Array(20,30,40);
	tax4= new Array(0,2000,7000); 
	
// 计算得出：应纳税款。（元，正数，保留两位小数）
// 计算得出：税后收入。（元，正数，保留两位小数）
	var Sums=0;
	var j;
  
	
	switch (IncomeType) 
	{   
		case "0":  //工资、薪金所得（1）
			Sums=IncomeBeforeTax-AllInsureFee-ThresholdSum;
			j=GetRate(Sums,sum);
			//( 月收入额－Point）×适用税率－速算扣除数
			Tax=Sums*rate[j]/100-tax[j];
			break;
		case "2"://个体工商户的生产、经营所得（年度）（2)
			ThresholdSum=0;
			Sums=IncomeBeforeTax-ThresholdSum*12;
			j=GetRate(Sums,sum2);
			//=（全年收入总额－成本、费用以及损失）×适用税率－速算扣除数
			Tax=Sums*rate2[j]/100-tax2[j];
			break;
		case "3"://对企事业单位的承包经营、承租经营所得（年度）（3）
			//ThresholdSum=800;
			Sums=IncomeBeforeTax;//-ThresholdSum*12;
			j=GetRate(Sums,sum2);
			//=（全年收入总额－成本、费用以及损失）×适用税率－速算扣除数
			Tax=Sums*rate2[j]/100-tax2[j];
			break;
		case "4"://劳务报酬所得（4）
			if (IncomeBeforeTax<=4000) //每次收入不足4000元的
			{
				Tax=(IncomeBeforeTax-800)*0.2;
			}
			else//每次收入超过4000元以上的
			{	 
				Sums=IncomeBeforeTax*0.8;
				j=GetRate(Sums,sum4);
				//=（全年收入总额－成本、费用以及损失）×适用税率－速算扣除数
				Tax=Sums*rate4[j]/100-tax4[j];
			}
			break;
		case "5"://稿酬所得（5）
			if (IncomeBeforeTax<=4000)//每次收入不足4000元的
				Tax=(IncomeBeforeTax-800)*0.2*(1-0.3);
			else Tax=IncomeBeforeTax*(1-0.2)*0.2*(1-0.3);
			break;
			
		
		case "6"://特需权使用费所得（6）
		
			if (IncomeBeforeTax<=4000)//每次收入不足4000元的
				Tax=(IncomeBeforeTax-800)*0.2;
			else Tax=IncomeBeforeTax*(1-0.2)*0.2;
			break;	
		case "7"://利息、股息、红利所得（7）
			Tax=IncomeBeforeTax*0.2;
			
			break;
		case "8"://财产租赁所得（8）
	
		   if (IncomeBeforeTax<=4000)//每次收入不足4000元的
				
				 Tax=(IncomeBeforeTax-800)*0.2;
			else 
			
			Tax=IncomeBeforeTax*(1-0.2)*0.2;
			
			break;
		case "9"://财产转让所得（9）
		    Tax=IncomeBeforeTax*0.2;
			break;
		
		case "10"://偶然所得（10）
			Tax=IncomeBeforeTax*0.2;
			break;	
			}
	if(Tax<0)
		Tax=0;
	else
		Tax=NBround(Tax,2);
	if(IncomeType==0)
		IncomeAfterTax=IncomeBeforeTax-AllInsureFee-Tax;
	else
		IncomeAfterTax=IncomeBeforeTax-Tax;
	if(IncomeAfterTax<0)
		IncomeAfterTax=0;
	else
		IncomeAfterTax=NBround(IncomeAfterTax,2);
	oDocument.all.tbTax.value=Tax;
	oDocument.all.tbIncomeAfterTax.value=IncomeAfterTax;
}
function GetRate(Sums,List)
{
	var i=0;
	for (i=0;i<List.length;i++)
	{
		if(Sums<List[i])
			break;
	}
	if (i == List.length) i = List.length - 1;
	return i;
}