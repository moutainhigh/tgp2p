var systemOS = {
	validataOS:function() {
		var ua = navigator.userAgent.toLowerCase();
		if (ua.indexOf("windows nt 5") > 0) {
			return "win xp";
		} else if (ua.indexOf("windows nt 6") > 0) {
			return "Winows 7";
		} else if (ua.indexOf("mac os x") > 0) {
			return "Mac ";
		} else if (navigator.userAgent.indexOf("linux") > 0) {
			return "Linux";
		} else {
			return "NUll";
		}
	},
	checkBrowser:function() {
		var Sys = {};
		var ua = navigator.userAgent.toLowerCase();
		var s;
		(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] : (s = ua
				.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] : (s = ua
				.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] : (s = ua
				.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] : (s = ua
				.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

		if (Sys.ie) {
			if (Sys.ie != 7.0) {
				return " IE" + Sys.ie + "浏览器";
			}else{
				return "IE7浏览器!为了您能有良好的体验，我们建议您使用IE8版本以上的浏览器或谷歌Chrome";
			}
		} else if (Sys.firefox) {
			return " Firefox" + Sys.firefox + "浏览器!";
		} else if (Sys.chrome) {
			return " Chrome" + Sys.chrome + "浏览器!";
		} else if (Sys.opera) {
			return " Opera" + Sys.opera + "浏览器!";
		} else if (Sys.safari) {
			return "Safari" + Sys.safari + "浏览器!";
		} else {
			return "无法检测出您正在使用的浏览器版本!为了您使用的方便,我们建议您使用IE8.0及以上版本浏览器!";
		}
	},
	init:function(){
		$("#pc_info").html("您电脑目前使用的系统是: "+systemOS.validataOS()+"<br/>当前使用的浏览器是: "+systemOS.checkBrowser());
	}
};
/* 
* .serializeObject (c) Dan Heberden
* danheberden.com
* 
* Gives you a pretty object for your form elements
*/
$.fn.serializeObject = function(){    
  var o = {};    
   var a = this.serializeArray();    
   $.each(a, function() {    
       if (o[this.name]) {    
           if (!o[this.name].push) {    
               o[this.name] = [o[this.name]];    
           }    
          o[this.name].push(this.value || '');    
       } else {    
           o[this.name] = this.value || '';    
       }    
  });    
   return o;    
};  
