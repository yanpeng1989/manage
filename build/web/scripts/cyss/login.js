$().ready(function(){
    $('#login_btn').click(function(){
        $.ajax({
            url:BaseUrl+'dologin.do',
            method:"get",
            data:{
                username:$('#username').val(),
                password:$('#password').val()
                },
            success:function(data){
                var json = eval('('+data+')');
                if(json[0]){
                    window.location.href = BaseUrl+'index.do';
                } else {
                    alert(json[2]);
                }
            }
        });
    });
    
    $("#username,#password,#check_num").keydown(function(e){
        if(e.keyCode == 13){
            $("#login_btn").click();
        }
    });
});
