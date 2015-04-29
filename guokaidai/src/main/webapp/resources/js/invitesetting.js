var SETTING = {
    X:function(){
        $("input:radio[name='isRecommendOpen']").click(function () {
            var u = $("input:radio[name='isRecommendOpen']:checked");
            ajax_save(u);
        });
    },
    Y:function(){
        $("select[name='RecommendCalculateDate']").click(function () {
            var u = $(this);
            console.log("debug info::",u.val() +":"+ u.attr("name"));
            ajax_save(u);
        });
    },
    Z:function(){
        $("input:radio[name='recommender_fee']").click(function () {
            var u = $("input:radio[name='recommender_fee']:checked");
            ajax_save(u);
        });
    },
    R:function(){
        $("input:radio[name='recommendee_fee']").click(function () {
            var u = $("input:radio[name='recommendee_fee']:checked");
            ajax_save(u);
        })
    },
    S:function(){
        $("input:radio[name='bonus_period']").click(function () {
            var u = $("input:radio[name='bonus_period']:checked");
            ajax_save(u);
        })
    }
}

function ajax_save(u){
    $.ajax({
        url: "/invite/savesetting",
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