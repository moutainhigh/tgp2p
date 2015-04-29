function judge(id){
		$.ajax({
			type:'post',
			data:'id='+id,
			url:'loanManage/judge.htm',
			success:function(msg){
				if(msg=="1"){
					ymPrompt.succeedInfo('余额不足，请充值!',400,200,'提示',function(){});
				}else{
					ymPrompt.confirmInfo(msg,400,200,"提示",function(tp){
						if(tp=="ok"){
							top.window.location="/loanManage/repayment.htm?id="+id;
						}
					});
				}
			}
		});
	}
