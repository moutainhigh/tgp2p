$(function() {
	function onload(pageNum) {
		if (pageNum == undefined || pageNum == null || pageNum == "") {
			pageNum = 1;
		}
		$.ajax({
			type : 'post',
			url : '/member_index/system_message',
			data : 'pageNum=' + pageNum,
			success : function(msg) {
				$('#systemmessage').append(msg);
			}
		});
	}

	onload();

});