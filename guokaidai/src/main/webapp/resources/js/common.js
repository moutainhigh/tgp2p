//注释例子
/**
* @description 描述
* @param {Num} 参数1 
* @param {Num} 参数2 
* @return {Num} result 结果 
*/

;var itz = itz || {};
//判断浏览器类型，常用的判断就是ie6
itz.ua = {
    ie6 : !-[1,] && !window.XMLHttpRequest
};
//ie6下，header的导航下拉菜单
if(itz.ua.ie6){
    $('.h-m-n-item').mouseenter(function(){
        $(this).addClass("cur").find(".hd-sub-nav").show();
    }).mouseleave(function(){
        $(this).removeClass("cur").find(".hd-sub-nav").hide();
    });

    $('.h-l-w-item').mouseenter(function(){
        $(this).find(".hd-login-handle").show();
    }).mouseleave(function(){
        $(this).find(".hd-login-handle").hide();
    });

    $('.hd-quick-menu-sub').mouseenter(function(){
        $(this).find(".hd-quick-help").show();
    }).mouseleave(function(){
        $(this).find(".hd-quick-help").hide();
    });

    $('.hd-quick-menu-contact').mouseenter(function(){
        $(this).find(".hd-quick-contact").show();
    }).mouseleave(function(){
        $(this).find(".hd-quick-contact").hide();
    });
}


/**
* 返回顶部插件
*/

$.fn.goToTop = function(obj){
    var defaultObj={
            fn : function(){},
            static : false,
            ele : document.body.scrollTop ? $(document.body) : $(document.documentElement),
            eletop : 0
        },
        options = $.extend({},obj,defaultObj);
    $(this).click(function(){
        options.ele = document.body.scrollTop ? $(document.body) : $(document.documentElement);
        options.ele.animate({scrollTop:0},{easing: 'swing',duration: 600, complete: function(){
            options.static = false;
        },step: function(num){
            options.static = true;
            options.eletop = num;        
        }});
        options.fn();
    });
    $(window).scroll(function(){
        if(options.static == true && options.ele.scrollTop() > options.eletop){
           options.ele.stop(); //如果滚动条触发事件，则停止动画
        }
    });
}

/**
* @微信弹出框
*/
itz.weiXin = function(){
    $(".icon-ft-weixin").hover(function(){
        $("#QRcode").show().animate({
                opacity: '1'
            },{duration:500,queue:false,specialEasing:{marginLeft:'easeOutCubic'}});
        $(this).addClass("cur");
        if(itz.ua.ie6){
            $("#QRcode").show();
        }
    },function(){
        $("#QRcode").hide().animate({
                opacity: '0'
            },{duration:500,queue:false,specialEasing:{marginLeft:'easeOutCubic'}});
        $(this).removeClass("cur");
        if(itz.ua.ie6){
            $("#QRcode").hide();
        }
    });
};


/**
* @微信弹出框
*/
itz.qun = function(){
    $(".icon-ft-qun").hover(function(){
        $("#QRcode1").show().animate({
                opacity: '1'
            },{duration:500,queue:false,specialEasing:{marginLeft:'easeOutCubic'}});
        $(this).addClass("icon-ft-qun-cur");
        if(itz.ua.ie6){
            $("#QRcode1").show();
        }
    },function(){
        $("#QRcode1").hide().animate({
                opacity: '0'
            },{duration:500,queue:false,specialEasing:{marginLeft:'easeOutCubic'}});
        $(this).removeClass("icon-ft-qun-cur");
        if(itz.ua.ie6){
            $("#QRcode1").hide();
        }
    });
};


/**
* @意见反馈
*/
itz.feedback = function(){
       
};

/**
* @description ajax更新头部登录状态和头部站内消息，一般用在静态页面，更新登录状态
*/
itz.updateHeaderStatus = function(){
    
};

/**
* @description ajax更新头部站内消息
*/
itz.updateHeaderMsg = function(){
    
};

/**
* @description 实时获得服务器时间戳，jsonp
*/
itz.getTimeStamp = function(success){
    
};

/**
* @description 公用初始化
*/
itz.init = function(){
    this.feedback();
    this.weiXin();
    this.qun();
};

//得到json格式的url参数
$.getQueryJson = function(){
    var ret = {};//定义数组
    var url = location.search; //获取url中"?"符后的字串
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0,len = strs.length; i < len; i++) {
           ret[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
        return ret;
    }
    return {};
};
/**
 * $.getQueryString得到url中的某个参数值
 * @name url的某个参数名
 */
$.getQueryString = function(name){
    var paramJson = $.getQueryJson();
    return paramJson[name];
}
$.fn.itzTabs = function(options){
    var def = {
        type: 'click',//hover，待开发
        currentClass: 'current'//当前的class开关
    };
    var $tabs = this;
    var num = 0;
    options = $.extend({}, def, options);
    var $con = options.$content;
    if(!$con){
        return;
    }
    
    $tabs.click(function(){
        var $t = $(this);
        $tabs.removeClass(options.currentClass);
        $t.addClass(options.currentClass);
        $tabs.filter(function(index){
            if(this == $t[0]){
                num = index;
            }
        });
        $con.hide();
        $($con[num]).fadeIn();
        if(options.afterFn){
            options.afterFn(num);
        }
    });
};
//格式化数字,整数逗号
itz.numFormat = function numFormat(nStr){
    nStr += '';  
    x = nStr.split('.');  
    x1 = x[0];  
    x2 = x.length > 1 ? '.' + x[1] : '';  
    var rgx = /(\d+)(\d{3})/;  
    while (rgx.test(x1)) {  
        x1 = x1.replace(rgx, '$1' + ',' + '$2');  
    }  
    return x1 + x2;
}
itz.init();
