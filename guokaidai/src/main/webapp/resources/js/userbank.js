//注释例子
/**
* @description 描述
* @param {Num} 参数1 
* @param {Num} 参数2 
* @return {Num} result 结果
*/

$(function() {
    var flag = true;

    var SendSmsCode = {
        smsobj:null,
        count:10,
        start:function(){
            console.log("1",this.count);
            this.count = this.count-1;
            if(this.count >0){
                this.smsobj.text(this.count+"秒重新获取");
                var _this = this;
                setInterval(function(){
                    _this.start();
                },1000);
            }else{
                smsobj.attr("disabled",false);
                smsobj.css("background","#33B9FF");
                smsobj.text("获取验证码");
                this.count = 10;
            }
        },
        //初始化
        init:function(smsobj){
            this.smsobj = smsobj;
            smsobj.attr("disabled",true);
            smsobj.css("background","#999");
            this.start();
        }
    };

    /**
     * 删除银行卡
     * */
    $("#del_card").click(function(){
        if(confirm("您确定删除该张银行卡吗？")){
            return true;
        }else{
            $(this).attr("href","/mybankCard/mybankCard.htm");
        }
    });

    /*联动菜单*/
    $("#province").change(function(){
        $.ajax({
            url:"/mybankCard/getCityList",
            data:{
                province_id:$(this).val()
            }
        }).success(function(data) {
            if (data.length > 1) {
                $("#city").css("display","");
                $("#city").empty();
                console.log("data", data);
                for (var i = 0; i < data.length; i++) {
                    $("#city").append("<option value='" + data[i].cityId + "'>" + data[i].name + "</option>");
                }
            }else{
                $("#city").css("display","none")
            }
        });
    });

    /**
     * 添加银行卡
     */
    $("#btn_add_card").click(function(){
        if( $("#accountName").val().length<1
            || $("#bankAccount").val().length<1
            || $("#confirm_bankAccount").val()!=$("#bankAccount").val()
            || $("#branch").val().length<1
            || !luhmCheck($("#bankAccount").val()
            ||$.trim($("#sms_code").val())=='')
        )
        {
            $("#error_info").html("<font color='red'>信息输入有误,请修改</font>");
            return false;
        }else {
                console.log("info::", $("#bankAccount").val() + "|" + $("#accountName").val() + "|" + $("#banktype").val() + "|" + $("#branch").val() + "|" + $("#city").val() + "|" + $("#province").val());
                $.ajax({
                    type: "POST",
                    url: "/mybankCard/saveUserBank",
                    data: {
                        bankAccount: $("#bankAccount").val(),
                        accountName: $("#accountName").val(),
                        banktype: $("#banktype").val(),
                        bankname: $("#banktype").find("option:selected").text(),
                        branch: $("#branch").val(),
                        city: $("#city").val(),
                        province: $("#province").val(),
                        smscode:$.trim($("#sms_code").val())
                    },
                    success: function(data){
                        console.log("success_data",data);
                        if(data=="success"){
                            alert('银行卡添加成功');
                            ymPrompt.succeedInfo('银行卡添加成功', 400, 200, '成功', null);
                            window.location.href="/mybankCard/mybankCard.htm";
                        }
                        if(data=="sms_not_equal"){
                            alert('银行卡添加失败,短信验证码错误');
                            ymPrompt.succeedInfo('银行卡添加失败,短信验证码错误', 400, 200, '失败', null);
                        }
                        if(data=="sms_code_failure"){
                            alert('银行卡添加失败,短信验证码己过期');
                            ymPrompt.succeedInfo('银行卡添加失败,短信验证码己过期', 400, 200, '失败', null);
                        }
                        if(data=="fail"){
                            alert('银行卡添加失败');
                            ymPrompt.succeedInfo('银行卡添加失败', 400, 200, '失败', null);
                        }
                    }
                })
        }
    });

    $("#accountName").blur(function(){
        if($(this).val().length<1){
            $("#an_require_info").html("<font color='red'> *开户人姓名不能为空</font> ");
        }else{
            $("#an_require_info").html("<font color='green'> 输入正确</font> ");
        };
    });

    $("#sms_code").blur(function(){
        if ($.trim($("#sms_code").val())=='') {
            $("#sms_code_info").html("<font color='green'> 请输入手机验证码</font> ");
            //$("#sms_code").focus();
        }
    });

    $("#bankAccount").blur(function(){
        if($(this).val().length<1){
            $("#ba_require_info").html("<font color='red'> *银行帐号不能为空</font> ");
        }else{
            if(!luhmCheck($(this).val())){
                $("#ba_require_info").html("<font color='red'>*银行帐号输入错误,请检查</font>");
            }else{
                $("#ba_require_info").html("<font color='green'> 输入正确</font> ");
            }
        }
    });

    $("#confirm_bankAccount").blur(function(){
        if($(this).val().length<1){
            $("#cba_require_info").html("<font color='red'> *确认银行帐号不能为空</font> ");
        };

        if($("#bankAccount").val().length>0 ){
            if($(this).val()!=$("#bankAccount").val()){
                $("#cba_require_info").html("<font color='red'> *两次银行卡号输入不一致</font>")
            }else{
                $("#cba_require_info").html("<font color='green'> 输入一致</font>")
            }
        }else{
            $("#cba_require_info").html("<font color='red'> 请输入正确的银行卡号</font>")
        }

    });

    $("#branch").blur(function(){
        if($(this).val().length<1){
            $("#branch_require_info").html("<font color='red'> *开户行不能为空</font> ");
        }else{
            $("#branch_require_info").html("<font color='green'> 输入正确</font> ");
        }
    });

    $("#send_sms_code").click(function(){
        var obj = $(this);
        /*
        fn_ajax("/member/sendSMS",function(data) {
            alert(data);
            if (data == "1") {
                 ymPrompt.succeedInfo('手机验证码已成功发送至您的手机，请注意查收', 400, 200, '成功',  null);
                 SendSmsCode.init($(this));
            } else {
                 ymPrompt.errorInfo('手机验证码发送失败！', 400, 200, '失败', null);
            }
        });*/
        /* */
        $.ajax({
            type:'post',
            url:'/member/sendSMS',
            data:{
                phone:$("#phone_num").val()
            },
            success:function(data){
                if (data == "1") {
                    ymPrompt.succeedInfo('手机验证码已成功发送至您的手机，请注意查收', 400, 200, '成功',  null);
                    //SendSmsCode.init(obj);
                } else {
                    ymPrompt.errorInfo('手机验证码发送失败！', 400, 200, '失败', null);
                }
            }
        })
    });

    //bankno为银行卡号 banknoInfo为显示提示信息的DIV或其他控件
    function luhmCheck(bankno){
        var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）

        var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
        var newArr=new Array();
        for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
            newArr.push(first15Num.substr(i,1));
        }
        var arrJiShu=new Array();  //奇数位*2的积 <9
        var arrJiShu2=new Array(); //奇数位*2的积 >9

        var arrOuShu=new Array();  //偶数位数组
        for(var j=0;j<newArr.length;j++){
            if((j+1)%2==1){//奇数位
                if(parseInt(newArr[j])*2<9)
                    arrJiShu.push(parseInt(newArr[j])*2);
                else
                    arrJiShu2.push(parseInt(newArr[j])*2);
            }
            else //偶数位
                arrOuShu.push(newArr[j]);
        }

        var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
        var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
        for(var h=0;h<arrJiShu2.length;h++){
            jishu_child1.push(parseInt(arrJiShu2[h])%10);
            jishu_child2.push(parseInt(arrJiShu2[h])/10);
        }

        var sumJiShu=0; //奇数位*2 < 9 的数组之和
        var sumOuShu=0; //偶数位数组之和
        var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
        var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
        var sumTotal=0;
        for(var m=0;m<arrJiShu.length;m++){
            sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
        }

        for(var n=0;n<arrOuShu.length;n++){
            sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
        }

        for(var p=0;p<jishu_child1.length;p++){
            sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
            sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
        }
        //计算总和
        sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);

        //计算Luhm值
        var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;
        var luhm= 10-k;

        if(bankno.length>=15){
            if(lastNum==luhm){
                $("#ba_require_info").html("<font color='green'> *银行帐号输入正确</font> ");
                return true;
            }else{
                $("#ba_require_info").html("<font color='red'> *银行帐号输入错误,请检查</font> ");
                return false;
            }
        }else{
            $("#ba_require_info").html("<font color='red'> *银行帐号输入错误,请检查</font> ");
            return false;
        }
    }

});