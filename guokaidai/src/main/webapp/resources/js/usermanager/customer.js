/**
 * 给会员分配客服
 */
$(function($){
	$("#adminid").omCombo({
     	width : 70,
        dataSource : '/adminuser/getadminsuer_by_meneber',
     });
	$("#vipTime").omCalendar({
		dateFormat : 'yy-mm-dd',
		editable : false,
		pages:3,
		startDay : 1,
		minDate : new Date()
			});
});