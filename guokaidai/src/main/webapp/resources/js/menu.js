// JavaScript Document
var temp="dh_1";
var div_width=Array();
div_width[1]=900;
div_width[2]=780;
div_width[3]=663;
div_width[4]=545;
div_width[5]=425;
div_width[6]=315;
div_width[7]=185;
div_width[8]=75;

function _over(obj){
	if(document.getElementById(temp))
	{
    var demo=document.getElementById(temp);
	demo.style.display="none";
	}
	
	temp = "dh_"+obj;
	if(document.getElementById(temp))
	{
    var demo=document.getElementById(temp);
	demo.style.display="block";
	  if(demo.offsetWidth<div_width[obj]&&obj!=9)
	  {
		   demo.style.width=div_width[obj]+"px";
	  }
	}
	
}

function _out(obj){
	
	temp = "dh_"+obj;
	if(document.getElementById(temp))
	{
    var demo=document.getElementById(temp);
	demo.style.display="none";
	  if(demo.offsetWidth<div_width[obj]&&obj!=9)
	  {
		   demo.style.width=div_width[obj]+"px";
	  }
	}
	
}