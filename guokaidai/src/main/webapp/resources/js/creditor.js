$(function($){
     $('#timeStart').omCalendar({onSelect : function(date,event) {
    	 var days = document.getElementById("timeDuring").value;
    	 change_date(date,days);
    	 }});
     $('#date1').omCalendar();
     $('#date2').omCalendar();
     $("#detail").hide();
});

//根据开始时间和天数自动计算出结束日期
var change_date = function(date,days) {
    // 参数表示在当前日期下要增加的天数  
    var now = new Date(date);  
    // + 1 代表日期加，- 1代表日期减  
    now.setDate(now.getDate() + (1 * days));  
    var year = now.getFullYear();  
    var month = now.getMonth() + 1;  
    var day = now.getDate();  
    if (month < 10) {  
        month = '0' + month;  
    }  
    if (day < 10) {  
        day = '0' + day;  
    }  
	$("#endDate").val(year + '-' + month + '-' + day);
//     return year + '-' + month + '-' + day;  
};  

var length = $("#page_list tr").size()-1;
function info(){
	$.each($("#page_list tr:lt("+length+")"),function(i,item){
		$(item).bind("dblclick",function(){
			$("#detail").trigger("click");
		});
		
	});
}

DWZ.init("/resources/dwz.frag.xml", {
	callback:function(){
		info();
	}
});