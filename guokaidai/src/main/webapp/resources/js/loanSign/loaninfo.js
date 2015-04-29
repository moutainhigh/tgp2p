/*$.fn.imgscroll = function(o){
	var defaults = {
		speed: 40,
		amount: 0,
		width: 1,
		dir: "left"
	};
	o = $.extend(defaults, o);
	
	return this.each(function(){
		var _li = $("li", this);
		_li.parent().parent().css({overflow: "hidden", position: "relative"}); //div
		_li.parent().css({margin: "0", padding: "0", overflow: "hidden", position: "relative", "list-style": "none"}); //ul
		_li.css({position: "relative", overflow: "hidden"}); //li
		if(o.dir == "left") _li.css({float: "left"});
		
		//初始大小
		var _li_size = 0;
		for(var i=0; i<_li.size(); i++)
			_li_size += o.dir == "left" ? _li.eq(i).outerWidth(true) : _li.eq(i).outerHeight(true);
		
		//循环所需要的元素
		if(o.dir == "left") _li.parent().css({width: (_li_size*3)+"px"});
		_li.parent().empty().append(_li.clone()).append(_li.clone()).append(_li.clone());
		_li = $("li", this);

		//滚动
		var _li_scroll = 0;
		function goto(){
			_li_scroll += o.width;
			if(_li_scroll > _li_size)
			{
				_li_scroll = 0;
				_li.parent().css(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll });
				_li_scroll += o.width;
			}
				_li.parent().animate(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll }, o.amount);
		}
		
		//开始
		var move = setInterval(function(){ goto(); }, o.speed);
		_li.parent().hover(function(){
			clearInterval(move);
		},function(){
			clearInterval(move);
			move = setInterval(function(){ goto(); }, o.speed);
		});
	});
};

$(document).ready(function(){
	$(".dataContBox").imgscroll({
		speed: 40,    //图片滚动速度
		amount: 0,    //图片滚动过渡时间
		width: 1,     //图片滚动步数
		dir: "left"   // "left" 或 "up" 向左或向上滚动
	});
});
*/
function showtime(){	
	var loantype=$("#loantype").val();
	var loanstate=$("#loanstate").val();
	var loanrate=$("#loanrate").val();
	var yuding=$("#yuding").val();
	var bidEndTime=$("#bidEndTime").val();
	if(loantype==3){
		$("#showtime").html("<lable class='showtime'>无时间限制</lable>");
	}else if(loanstate==3||loanstate==4){
		$("#showtime").html("<lable class='showtime'>招标已结束</lable>");
		$("#suBnt_a").attr("href","").unbind( "click" );
		$("#plank").text("招标己结束").css({"background-color": "#eeeeee","color": "#cccccc"});
	}else{
		var sTime=new Date();
		var sumSecond=parseInt((bidEndTime-sTime.getTime())/1000);sumSecond=sumSecond+(24*60*60);
		var showSecond=sumSecond%60;
		var sumMinute=(sumSecond-showSecond)/60;
		var showMinute=sumMinute%60;
		var sumHour=(sumMinute-showMinute)/60;
		var showHour=sumHour%24;
		var showData=(sumHour-showHour)/24-1;
		if(showData>=0){
			$("#showday").html(showData);
			$("#showhour").html(showHour);
			$("#showminute").html(showMinute);
			$("#showsecond").html(showSecond);
			timerID=setTimeout(function(){showtime();},1000);
		}else{
			if(yuding==""){
				$("#showtime").html("<lable class='showtime'><font style=' font-size: 15px;'>招标已结束</font></lable>");
				$("#suBnt_a").attr("href","").unbind( "click" );
				$("#plank").text("招标己结束").css({"background-color": "#eeeeee","color": "#cccccc"});
			}else{
			$("#showtime").html("<lable class='showtime'><font style=' font-size: 15px;'>离预定时间：已结束</font></lable>");
			}
		}
	}
}

function showtime1(i){
	var loantype=$("#loantype"+i).val();
	var loanstate=$("#loanstate"+i).val();
	var loanrate=$("#loanrate"+i).val();
	var bidEndTime=$("#bidEndTime").val();
	if(loantype==3){
		$("#showtime"+i).html("<lable class='showtime'>无时间限制</lable>");
	}else if(loanstate==3||loanstate==4){
		$("#showtime"+i).html("<lable class='showtime'>招标已结束</lable>");
	}else{
		var sTime=new Date();
		var sumSecond=parseInt((bidEndTime-sTime.getTime())/1000);sumSecond=sumSecond+(24*60*60);
		var showSecond=sumSecond%60;
		var sumMinute=(sumSecond-showSecond)/60;
		var showMinute=sumMinute%60;
		var sumHour=(sumMinute-showMinute)/60;
		var showHour=sumHour%24;
		var showData=(sumHour-showHour)/24-1;
		if(showData>=0){
			$("#showday"+i).html(showData);
			$("#showhour"+i).html(showHour);
			$("#showminute"+i).html(showMinute);
			$("#showsecond"+i).html(showSecond);
			timerID=setTimeout(function(){showtime1(i);},1000);
		}else{
			$("#showtime"+i).html("<lable class='showtime'>招标已结束</lable>");
		}
	}
}

function showtime2(length){
	for(var i=0;i<length;i++){
		showtime1(i);
	}
}