// JavaScript Document

$(document).ready(function($) {
  
//生成pjRightCont样式
$(".pjRightCont").wrap('<div class="pjRightContBox"></div>');
$(".pjRightContBox").append('<span class="pjRtTop"></span><span class="pjRtBottom"></span>');
$(".pjRightCont").find("span[data-position='titlebox']").wrap('<div class="h2WrapBox"></div>');
$(".h2WrapBox").append('<i></i>');
$(".h2WrapBox>span").load("javascript:void(0)",function(){
				var pjSpanindex=$(this).parents().parent(".pjRightContBox").index()+1;
				$(this).prepend(pjSpanindex+"、");
				$(this).attr("id","index_"+pjSpanindex);
				if($(this).width()>569)
				{
					$(this).css("width","569px").css("overflow","hidden");
				};
			});
$(".Blue").next().css("background-position","right -41px");
$(".Orange").next().css("background-position","right -127px");
$(".Green").next().css("background-position","right -215px");
$(".Red").next().css("background-position","right -301px");
$(".pjRightCont").append('<div class="clear"></div>');
var i;
for(i=1;i<=$(".h2WrapBox").length;i++)
{
	$("#tbox").prepend('<a class="taoba" href="javascript:void(0)" title="'+i+'">'+i+'</a>');
};
//滑块，回到顶部
$(".taoba").click(function(event) { 
   var index=this.title
   var id='#'+'index_'+index
  $("html,body").animate({scrollTop: $(id).offset().top-18}, 500);
});
});
