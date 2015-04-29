$(document).ready(function(){
	var ids=$("#ids").val();
	$('#user_generalize_list').omGrid({
		width:'fit',
		height:400,
        dataSource : '/generalizemoney/querypage?ids='+ids,
        limit : 10,
        title:'推广记录',
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有数据',
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '发生日期', name : 'adddate', width : 120, align : 'left'}, 
                     {header : '被推广人用户名', name : 'userName', align : 'left', width : 100}, 
                     {header : '被推广人收益', name : 'umoney', align : 'left', width : 100},
                     {header : '奖金', name : 'bonuses', align : 'left', width : 100}
                     ]
    });
});