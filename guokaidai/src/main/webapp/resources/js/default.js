// JavaScript Document

/* 太平洋理财首页JS代码 */

var currentindex=1;
function bannerListN(k){
var k;
for (k=1;k<=$("#bannerBox").children("a").length;k++){
	$(".bannerNavBox").append('<a href="javascript:void(0)" id="bnav'+k+'" class="no" onclick="changebanner('+k+');"></a>');
	}
}
function changebanner(i) {	
currentindex=i;
for (j=1;j<=$("#bannerBox").children("a").length;j++){
	if (j==i){
    $("#banner"+j).fadeIn("normal");
	$("#banner"+j).show();
	$("#bnav"+j).removeClass();
	$("#bnav"+j).addClass("yes");
	$(".banner").css("background-color",$("#banner"+j).attr("name"));
	}
	else
	{$("#banner"+j).css("display","none");
	$("#bnav"+j).removeClass();
	$("#bnav"+j).addClass("no");}
}}
function startAm(){
timerID = setInterval("timer_tick()",3000);
}
function stopAm(){
clearInterval(timerID);
}
function timer_tick() {
	var navLength=$(".bannerNavBox").children("a").length;
    currentindex=currentindex>=navLength?1:currentindex+1;
	changebanner(currentindex);
 }


 $(function(){//js加载开始
			
//bannerjs样式
$(".bannerBox").append('<div class="bannerNavBox"></div>');
bannerListN();

$(".bannerNavBox a").mouseover(function(){stopAm();}).mouseout(function(){startAm();});
startAm();
/*$(".bannerBox").append('<div class="bannerNavBox"><a href="#" class="yes" onclick="changebanner(1);"></a><a href="#" class="no" onclick="changebanner(2);"></a><a href="#" class="no" onclick="changebanner(3);"></a><a href="#" class="no" onclick="changebanner(4);"></a></div>');*/

			
});//js加载结束
 
