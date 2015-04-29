// JavaScript Document

/* banner */
var currentindex=1;
function changeflash(i) {	
currentindex=i;
for (j=1;j<=$("#flash").children("a").length;j++){
	if (j==i){
    $("#flash"+j).fadeIn("normal");
	$("#flash"+j).css("display","block");
	$("#f"+j).removeClass();
	$("#f"+j).addClass("dq");
	$(".banner").css("background-color",$("#flash"+j).attr("name"));
	}
	else
	{$("#flash"+j).css("display","none");
	$("#f"+j).removeClass();
	$("#f"+j).addClass("no");}
}}
function startAm(){
timerID = setInterval("timer_tick()",3000);
}
function stopAm(){
clearInterval(timerID);
}
function timer_tick() {
	var navLength=$(".flashmenu").children("a").length;
    currentindex=currentindex>=navLength?1:currentindex+1;
	changeflash(currentindex);}
$(document).ready(function(){
//$(".flashmenu a,#flash a").mouseover(function(){stopAm();}).mouseout(function(){startAm();});
startAm();
});