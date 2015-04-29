// JavaScript Document

var $imgs=null;//所有图片
var imgLength=3; //多少个图片
var nextImg=1; //迭代变量n
var firstimgsrc="";
var alinks = null;
var firstalinks="";
var times = 8000;
var clicks = 1;

$(function(){
	$imgs=$(".center_Img img");
	alinks=$(".center_Img a");
	imgLength=$imgs.length;
	$(".center_Img img:gt(0)").hide();
/*		if(imgLength>5){
			$(".scroll_number").css("right","+="+((imgLength-5)*0+(imgLength-5)*0)+"px");
		}*/
	
	var liHtml="";
	for(var i=0;i<imgLength;i++){
		liHtml+="<li class='scroll_number_out'></li>";
	}
	$(".lilist").append($(liHtml)).find("li").click(function(){
		$(this).addClass("scroll_number_over").siblings().removeClass("scroll_number_over");
		nextImg=$(".lilist li").index(this);
		if(clicks == 1){
			clearInterval(theTimer);
			clicks = 0;
		}
		_showImg();	
		clicks = 1;
		theTimer=setInterval('_showImg()', times);
	})
	$(".lilist li:eq(0)").addClass("scroll_number_over");
	firstimgsrc=$($imgs.get(0)).attr("src");  //存取第一张图片，以免被最后一张替换
	firstalinks=$(alinks.get(0)).attr("href");
	var theTimer=setInterval('_showImg()', times);
})

function _showImg(){
	if(nextImg==imgLength){
		nextImg=0;
		$(".center_Img a:eq(0)").attr("href",firstalinks);
	}
	if(nextImg<imgLength){	
		var src=$($imgs.get(nextImg)).attr("src");
		if(nextImg==0){
			src=firstimgsrc;
		}
		var $first=$(".center_Img img:eq(0)").stop(false,true).fadeTo("slow", 0.00);
		$(".lilist li:eq("+nextImg+")").addClass("scroll_number_over").siblings().removeClass("scroll_number_over");
		$(".center_Img img:eq(0)").attr("src",src).stop(false,true).fadeTo("slow", 0.99);
		var nowlinks=$(alinks.get(nextImg)).attr("href");
		$(".center_Img a:eq(0)").attr("href",nowlinks);
		if(nextImg==0){
			$(".center_Img a:eq(0)").attr("href",firstalinks);
		}
		nextImg++;
	}else{
		$(".center_Img a:eq(0)").attr("href",firstalinks);
		nextImg=0;
	}
}


function showid_zzjs_net(){
	$('#SLB-Wrapper').hide();
	$('#1334731980455').hide();
	var idname = 'MyDiv';
	var isIE = (document.all) ? true : false;
	var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1] == 6);
	var newbox=document.getElementById(idname);
	newbox.style.zIndex="9999";
	newbox.style.display="block"
	newbox.style.position = !isIE6 ? "fixed" : "absolute";
	newbox.style.top =newbox.style.left = "50%";
	newbox.style.marginTop = - newbox.offsetHeight / 2 + "px";
	newbox.style.marginLeft = - newbox.offsetWidth / 2 + "px";
	var layer=document.createElement("div");
	layer.id="layer";
	layer.style.width=layer.style.height="100%";
	layer.style.position= !isIE6 ? "fixed" : "absolute";
	layer.style.top=layer.style.left=0;
	layer.style.backgroundColor="#000";
	layer.style.zIndex="9998";
	layer.style.opacity="0.6";
	document.body.appendChild(layer);
	var sel=document.getElementsByTagName("select");
	for(var i=0;i<sel.length;i++){
	sel[i].style.visibility="hidden";
	}
	function layer_iestyle(){
	layer.style.width=Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth)
	+ "px";
	layer.style.height= Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) +
	"px";
	}
	function newbox_iestyle(){
	newbox.style.marginTop = document.documentElement.scrollTop - newbox.offsetHeight / 2 + "px";
	newbox.style.marginLeft = document.documentElement.scrollLeft - newbox.offsetWidth / 2 + "px";
	}
	if(isIE){layer.style.filter ="alpha(opacity=60)";}
	if(isIE6){
	layer_iestyle()
	newbox_iestyle();
	window.attachEvent("onscroll",function(){
	newbox_iestyle();
	})
	window.attachEvent("onresize",layer_iestyle)
	} 
	layer.onclick=function(){newbox.style.display="none";layer.style.display="none";for(var i=0;i<sel.length;i++){
	sel[i].style.visibility="visible";
	}}
	//========关闭按钮========================
		var oClose = document.getElementById('close');
	    oClose.onclick = function(){
	      layer.style.display = 'none';
		  newbox.style.display = 'none';
	    }
}

