<%--
  Created by IntelliJ IDEA.
  User: 22170
  Date: 2021/6/16
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${App_Path}/static/bootstrap-3.37-dist/css/bootstrap.min.css" >

    <style>
        body{text-align:center}

    </style>
</head>
<body class="bg-info">
<h1>人力资源管理系统-注册</h1>
<!--内容主题范围-->

<div class="page-header" style="margin-top: 10%">
    <h1><small>
        <span class="register_msg"></span>
        <form class="form-horizontal" style="margin-left: 20%;">

            <div class="form-group">
                <span class="help-block" style="margin-left: -200px"> </span>
                <label for="input_telephone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-10">
                    <input type="text" style="width: 500px" class="form-control" name="userTelephone" id="input_telephone" required placeholder="11位手机号"/>
                </div>
            </div>

            <div class="form-group">
                <span class="help-block" style="margin-left: -200px"> </span>
                <label for="input_username" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" style="width: 500px" class="form-control" name="userName" id="input_username" required placeholder="2-5为中英文字符组成"/>
                </div>
            </div>
            <div class="form-group">
                <span class="help-block" style="margin-left: -200px"></span>
                <label for="input_password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password"  style="width: 500px" class="form-control" name="userPassword" id="input_password" required placeholder="4-10位数字字母组成">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox" style="margin-left: -90%">
                        <label>
                            <span><a href="${App_Path}/loginInfo"  style="text-decoration: none">已有帐号？</a></span>
                        </label>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <!-- Split button -->
                    <div class="btn-group" style="margin-right: 50%">
                        <button type="button"  id="btn_register" class="btn btn-primary">注册</button>
                    </div>
                </div>
            </div>
        </form></small>
    </h1>

</div>

<!--内容主题范围-->
<%--<script src="${App_Path}/static/js/jquery.min.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->

<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/bootstrap-3.37-dist/js/bootstrap.min.js"></script>

<!--自定义JS区域-->
<script type="text/javascript">
    /*注册之前校验用户名是否已经被注册：被注册的用户名不能再使用*/
var isCheckuserName=false;
$("#input_username").change(function () {
    $.ajax({
        url:"${App_Path}/checkuserName",
        data:{"userName":$(this).val()},
        type:"GET",
        dataType:"json",
        success:function (result) {
            if(result.code===100){
                show_validate_msg("#input_username","success",result.extend.msg);
              // alert(result.extend.msg)
                isCheckuserName=true;
            }else{
                show_validate_msg("#input_username","error",result.extend.msg);
                //alert(result.extend.msg)
                isCheckuserName=false;
            }
        }
    });
});


/*表单校验*/
$("#btn_register").click(function () {
    /*用户名是否可用校验*/
    if(!isCheckuserName){
        return false;
    }
    /*用户名校验*/
    var userName=$("#input_username").val();
    var reg = /[\u4e00-\u9fa5_a-zA-Z]{2,5}$/;
    if(!reg.test(userName)){
        show_validate_msg("#input_username","error","用户名必须是2-5位中英文组合！");
        return false;
    }else{
        show_validate_msg("#input_username","success","");
    }
    /*密码校验*/
    var userPassword = $("#input_password").val();
    var reg = /[a-zA-Z0-9]{4,10}$/;
    if(!reg.test(userPassword)){
        show_validate_msg("#input_password","error","密码必须由4-10位数字字母组成！");
        return false;
    }else{
        show_validate_msg("#input_password","success","");
    }
    /*手机号校验*/
    var userTelephone = $("#input_telephone").val();
    var reg = /1\d{10}/;
    if(!reg.test(userTelephone)){
        show_validate_msg("#input_telephone","error","手机号由11为数字组成！");
        return false;
    }else{
        show_validate_msg("#input_telephone","success","");
    }
    $(function () {
        $.ajax({
            url:"${App_Path}/register",
            data:$("form").serialize(),
            type:"POST",
            dataType:"json",
            success:function (result) {
                if(result.code===100){
                    alert(result.extend.msg);
                    window.location.href="${App_Path}/loginInfo";
                }else{
                    show_validate_msg("#input_telephone","error",result.extend.msg)
                }
            }
        });
    })
});

/*提交注册*/



/*信息反馈提示函数*/
function show_validate_msg(element, status, msg) {
    var ctrl=$(element).parents("div.form-group");
    ctrl.removeClass("has-error has-success");
    if ("success" === status) {
        ctrl.addClass("has-success");
    } else if ("error" === status) {
        ctrl.addClass("has-error");
    }
    ctrl.find("span.help-block").text(msg);
}
</script>

</body>
</html>
