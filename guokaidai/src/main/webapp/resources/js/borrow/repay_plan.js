$(function() {
		$('#inp11').calendar({
			maxDate : '#inp12'
		});
		$('#inp12').calendar({
			minDate : '#inp11'
		});
	});