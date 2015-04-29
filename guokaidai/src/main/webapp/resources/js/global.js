// JavaScript Document

$(document).ready(function($) {
  
	// 闪烁的文字（加上id=blink即可让文字闪烁）
	setInterval(function(){
		var color="#f00|#0f0|#00f|#880|#808|#088|yellow|green|blue|gray"; 
		color=color.split("|"); 
		var _index=parseInt(Math.random()*color.length);
		$(".blink").css({"color":color[_index]});
		
	},200);
// 首页登录
			$(".df_loginBox").hide();
			$("#df_loginNav").click(function(event){
					$(this).removeClass("loginNavCkA").addClass("loginNavCkB");	
					$(".df_loginBox").slideDown("fast");
				$(document).one("click", function (){	
					$(".df_loginBox").slideUp("fast");	
					$("#df_loginNav").removeClass("loginNavCkB").addClass("loginNavCkA");
											   });
				event.stopPropagation();// 点击this阻止事件冒泡到document
						 });
			$(".df_loginBox").click(function (event) { 
                event.stopPropagation();// 在#区域内的点击事件阻止冒泡到document
            }); 
			$(".df_loginTx").focus(function(){
					$(this).css("border-color","#51abff");						
			});
			$(".df_loginTx").focusout(function(){
					$(this).css("border-color","");						
			});
			
			$("#tip1").hover(function(){
				$("#information").slideDown("fast");
			},function(){
				$("#information").slideUp("fast");
			});	

//导航菜单
$(".navBox>span").hover(function(){
			/*$(this).find("div").stop().slideDown(100);
			$(this).find("div").siblings("a").addClass("navHover");
								   },function(){
			$(this).find("div").stop().slideUp(100);
			$(this).find("a").removeClass("navHover");*/
			$(this).find("div").css("display","block");
			$(this).find("div").siblings("a").addClass("navHover");},
			function(){
				$(this).find("div").css("display","none");
				$(this).find("a").removeClass("navHover");
			});

//借款的进度条
$(".jiekuanTable>tbody>tr").find("td:first").css("text-align","left");
$(".DataLoadding b").load("javascript:void(0)",function(){
				var $data_value=$(this).parent("span").attr("data-value");					   
					$(this).parent("span").animate({
					width:$data_value+"%"	
							});	
					if($data_value<50)
					{
					  $(this).parent("span").css("background","#2a90d8");
					  $(this).parents(".DataLoadding").css("border-color","#a9a9a9");
					}
					$(this).text("完成进度"+$data_value+"%");
		});


//$("body").append('<div id="tbox" class="tbox"></div>');
//$("#tbox").append('<a id="gotop" href="javascript:void(0)" title="回到顶部">∧</a>');

//footer底部信息
var footerRight=$(".footerRight");
if(footerRight.height()>160)
{
 $(".footerLeft").height(footerRight.height());
};


 

   function a(x,y){
    l = $('#main').offset().left;
    w = $('#main').width();
    $('#tbox').css('left',(l + w + x) + 'px');
    $('#tbox').css('bottom',y + 'px');
}//获取#tbox的div距浏览器底部和页面内容区域右侧的距离函数#main为页面的可视宽度

$(function() { 		   
    $(window).scroll(function(){
    t = $(document).scrollTop();
    if(t>300){
      $('#tbox').fadeIn('slow');
    }else{
      $('#tbox').fadeOut('slow');
    }
    if(t > 50){
        $('#gotop').fadeIn('slow');
    }else{
        $('#gotop').fadeOut('slow');
    }       
});
    a(10,100);//#tbox的div距浏览器底部和页面内容区域右侧的距离
    $('#gotop').click(function(){ 
        $('body,html').animate({
            scrollTop: 0
        },
        800);//点击回到顶部按钮，缓懂回到顶部,数字越小越快
        return false;  
    });
 });
//登录与注册
$(".loginTx").focus(function(){
		$(this).removeClass("iconBg_1");
		$(this).addClass("iconBg_2");
		$(this).next().removeClass("Vf_P2");
		$(this).next().addClass("Vf_P1");
		if($(this).attr("name")=="userName"){
			$(this).next().text("请输入用户名");
		}
		if($(this).attr("name")=="userName"&&checkOnly("userName",$(this).val())=="[null,false]"){
			$(this).next().text("该用户名已被使用");
		}
		if($(this).attr("name")=="phone"){
			$(this).next().text("请输入手机号码");
		}
		if($(this).attr("name")=="phone"&&checkOnly("phone",$(this).val())=="[null,false]"){
			$(this).next().text("该手机号码已被使用");
		}
		$(this).next().show();
});
$(".loginTx").focusout(function(){
	if($(this).val()==""){
		$(this).next().removeClass("Vf_P1");
		$(this).next().addClass("Vf_P2");
		if($(this).attr("name")=="userName"){
			$(this).next().text("用户名不能为空");
		}
		if($(this).attr("name")=="phone"){
			$(this).next().text("手机号码不能为空");
		}
	}else if($(this).attr("name")=="userName"&&checkOnly("userName",$(this).val())=="[null,false]"){
		$(this).next().removeClass("Vf_P1");
		$(this).next().addClass("Vf_P2");
		$(this).next().text("该用户名已被使用");
	}else if($(this).attr("name")=="phone"&&!/^1[3,4,5,7,8]{1}[0-9]{1}[0-9]{8}$/.test($(this).val())){
		$(this).next().removeClass("Vf_P1");
		$(this).next().addClass("Vf_P2");
		$(this).next().text("请输入正确的手机号码");
	}else if($(this).attr("name")=="phone"&&checkOnly("phone",$(this).val())=="[null,false]"){
		$(this).next().removeClass("Vf_P1");
		$(this).next().addClass("Vf_P2");
		$(this).next().text("该手机号码已被使用");
	}else{
		$(this).removeClass("iconBg_2");
		$(this).addClass("iconBg_1");
		$(this).next().hide();
	}
});
function checkOnly(name,value){
	if(name=="userName"){
		return $.ajax({
			url:'/registration/checkOnly_username?fieldValue='+value,async:false
		}).responseText;
	}else if(name=="phone"&&$("input[name='phone']").val()!=""){
		return $.ajax({
			url:'/registration/checkOnly_phone?fieldValue='+value,async:false
		}).responseText;
	}
}
 //search样式生成
  //$(".contwrap").wrap('<div class="contwrapBox"></div>');
  //$(".contwrapBox").prepend('<span class="contwrapTop"></span><span class="contwrapBottom"></span>');
  
  $(".prctItemTitle").append("<em></em>");
  
 //porjectHead Tab切换
 $(".porjectHead li span").click(function(){
			$(this).parent("li").siblings().find("span").removeClass("porjectHeadTabLink");
			$(this).addClass("porjectHeadTabLink");
										  });
 //找回密码
 $(".forgotpwdHead span").click(function(){
				var $pwdIndex=$(this).index();
				if($pwdIndex==0)
				{
					$(this).siblings().removeClass("iconPwd_twos").addClass("iconPwd_two");
					$(this).removeClass("iconPwd_one").addClass("iconPwd_ones");
					$("#forgotpwdEmail").hide();
					$("#forgotpwdMobile").show();
				}else if($pwdIndex==1)
				{
					$(this).siblings().removeClass("iconPwd_ones").addClass("iconPwd_one");
					$(this).removeClass("iconPwd_two").addClass("iconPwd_twos");
					$("#forgotpwdEmail").show();
					$("#forgotpwdMobile").hide();
				}
										 });
 
 //会员中心tab效果
 $(".vipHeadMenuBox ul li a").click(function(){
			var $vipHead=$(this).parent("li").index();
            $(this).parent("li").siblings().find("a").removeClass("vipHeadLink");	
		    $(this).addClass("vipHeadLink");
			for(var i=0;i<$(this).parent("li").length;i++){
			if($vipHead==i){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}else if($vipHead==1){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}else if($vipHead==2){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}else if($vipHead==3){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}else if($vipHead==4){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}else if($vipHead==5){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}else if($vipHead==7){
				$(".vipContBox:eq("+$vipHead+")").siblings(".vipContBox").hide();
				$(".vipContBox:eq("+$vipHead+")").show();
				}
			}
											 });
 
 //安全问题
 $("#Security_1 input[type='submit']").click(function(){
				$("#Security_1").hide();
				$("#Security_2").show();
				return false;
													  });
 
 //自动投标
 $("#closeStatusBnt").click(function(){
			$(this).parent(".autoStatusBntBox").hide();	
			$("#autoStatus_1").hide();
			$("#autoStatus_2").show();
			$(".autoStatusBox").find("h1").removeClass().addClass("tabColor_Orange");
			$(".autoStatusBox").find("h1").html("自动投标状态： 关闭状态");
			$(this).parent(".autoStatusBntBox").next().show();
									 });
  $("#autoSetBnt").click(function(){
			$(this).removeClass().addClass("bg_blue")
			$("#handSetBnt").removeClass().addClass("bg_gray");	
			$("#autoStatus_3").hide();
			$("#autoStatus_2").show();
								  });
  $("#handSetBnt").click(function(){
			$(this).removeClass().addClass("bg_blue")
			$("#autoSetBnt").removeClass().addClass("bg_gray");	
			$("#autoStatus_2").hide();
			$("#autoStatus_3").show();
								  });
  $("#autoStatus_2,#autoStatus_3").find("input[type='submit']").click(function(){
			$(".autoStatusBox").find("h1").removeClass().addClass("tabColor_Green");
			$(".autoStatusBox").find("h1").html("自动投标状态： 开启状态");		
			$("#autoStatus_2,#autoStatus_3").hide();
			$("#closeStatusBnt").parent(),next().hide();
			$("#autoStatus_1").show();
			$("#closeStatusBnt").parent().show();
			return false;
																			   });
  
  //上传文件

  });

//dom方法
function layerClose(){
	$(".layerBox").hide();
	$(".wrapBox").hide();
	top.window.location = "/member_index/member_center";
	}
function layerOpen(){
	$(".wrapBox").show();
	$(".layerBox").show();
	}