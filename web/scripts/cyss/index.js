
$(function(){
    DWZ.init(BaseUrl + "dwz.frag.xml", {
        loginUrl:"index.do", 
        loginTitle:"登录",	// 弹出登录对话框
        statusCode:{
            ok:200, 
            error:300, 
            timeout:301
        }, //【可选】
        pageInfo:{
            pageNum:"pageNum", 
            numPerPage:"numPerPage", 
            orderField:"orderField", 
            orderDirection:"orderDirection"
        }, //【可选】
        debug:false,	// 调试模式 【true|false】
        callback:function(){
            initEnv();
            $("#themeList").theme({
                themeBase:"themes"
            }); // themeBase 相对于index页面的主题base路径
        }
    });
});