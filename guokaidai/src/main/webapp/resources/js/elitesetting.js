var SETTING = {
    X:function(){
        var u = $("input:radio[name='is_elite_open']:checked");
        ajax_save(u);
    },
    Y:function(){
        ajax_save($("#elite_money"));
    },
    Z:function(){
        ajax_save($("#elite_bonus_period"));
    },
    R:function(){
        var u = $("input:radio[name='elite_fee']:checked");
        ajax_save(u);
    },
    S:function(){
       ajax_save( $("#elite_expiry_periods"));
    }
}

function ajax_save(u){
    $.ajax({
        url: "/myelite/savesetting",
        async:true,
        data: {
            name: u.attr('name'),
            value: u.val()
        },
        success: function (data) {
            if(data=='fail'){
                $("#rst").html("<font color='red'>保存失败!</font>").show();
                $('#rst').delay(3000).hide(0);
            }
            if(data=='success'){
                $("#rst").html("<font color='green'>保存成功!</font>").show();
                $('#rst').delay(3000).hide(0);
            }
        },
        fail: function () {},
        complete: function () {}
    })
}