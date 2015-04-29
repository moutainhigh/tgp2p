function showContract(id){
	$.ajax({
		type:'post',
		data:{id:id,pageNo:1},
		url:'member_index/borrowContractList.htm',
		success:function(msg){
			$("#borrowTable").html(msg);
		}
	});
	$(".tableBg").css({
		display: 'block',
		height: 560
	});
	$(".tableDiv").css({
		display: 'block',
		top: (560-$(".tableDiv").outerHeight())/2+'px'
	});
}

$(".closeTable").click(function(){
	$(".tableBg").css({display: 'none'});
	$(".tableDiv").css({display: 'none'});
});