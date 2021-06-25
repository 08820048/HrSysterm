<%--
  Created by IntelliJ IDEA.
  User: 22170
  Date: 2021/6/24
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>忘记密码</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${App_Path}/static/bootstrap-3.37-dist/css/bootstrap.min.css" >

    <style>
        body{text-align:center}

    </style>
</head>
<body class="bg-info">
<h1>忘记密码</h1>
<!--内容主题范围-->

<div class="page-header" style="margin-top: 10%">
    <h1><small>
        <span class="password_msg"></span>
        <form class="form-horizontal" style="margin-left: 20%;">
            <div class="form-group">
                <span class="help-block"></span>
                <label for="input_telephone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-10">
                    <input type="text" style="width: 500px" class="form-control" name="userTelephone"  id="input_telephone" required placeholder="请输入注册时的手机号"/>
                </div>
            </div>
            <div class="form-group">
                <span class="help-block"></span>
                <label for="input_password" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-10">
                    <input type="password"  style="width: 500px" class="form-control" name="userPassword" id="input_password" required placeholder="2-10为字符">
                </div>
            </div>

            <div class="form-group">
                <span class="help-block"></span>
                <label for="input_code" class="col-sm-2 control-label">验证码</label>
                <div class="input-group" style="padding-left: 15px;">
                    <input type="text" class="form-control" name="userCode" id="input_code" required placeholder="6位短信验证码" />
                    <div class="input-group-btn" style="width: 80px;">
                        <button type="button" class="btn btn-info " id="btn_getcode">获取验证码</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <!-- Split button -->
                    <div class="btn-group" style="margin-right: 50%">
                        <button type="button" class="btn btn-primary" id="btn_password">提交</button>
                    </div>
                </div>
            </div>
        </form></small>
    </h1>

</div>

<!--内容主题范围-->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/static/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/bootstrap-3.37-dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<!--自定义JS区域-->
<script type="text/javascript">
/*手机号是否存在*/
var isCheckuserTelephone = false;
$("#input_telephone").change(function () {
    $.ajax({
        url:"${App_Path}/checkuserTelephone",
        data:{"userTelephone":$(this).val()},
        type:"GET",
        dataType:"json",
        success:function (result) {
            if(result.code==100){
                show_validate_msg("#input_telephone","success",result.extend.msg);
                isCheckuserTelephone=true;
            }else{
                show_validate_msg("#input_telephone","error",result.extend.msg);
                isCheckuserTelephone=false;
            }
        }
    });
})

/*表单校验*/
$("#btn_password").click(function () {
   if(!isCheckuserTelephone){
       return false;
   }
   /*手机号校验*/
    var userTelephone = $("#input_telephone").val();
    var reg = /1\d{10}/;
    if(!reg.test(userTelephone)){
        show_validate_msg("#input_telephone","error","手机号由以1开头的11为数字组成！");
        return false;
    }else{
        show_validate_msg("#input_telephone","success","");
    }
    /*新密码校验*/
    /*密码校验*/
    var userPassword = $("#input_password").val();
    var reg = /[a-zA-Z0-9]{4,10}$/;
    if(!reg.test(userPassword)){
        show_validate_msg("#input_password","error","密码必须由4-10位数字字母组成！");
        return false;
    }else{
        show_validate_msg("#input_password","success","");
    }
    /*短信验证码校验*/
    var SMScode = $("#input_code").val();
    var reg = /^\d{6}/;
    if(!reg.test(SMScode)){
        show_validate_msg("#input_code","error","验证码由6位数字组成！");
        return false;
    }else{
        show_validate_msg("#input_code","success","");
    }
    $(function () {
        $.ajax({
            url:"${App_Path}/editUserPassword",
            data:$("form").serialize(),
            type:"POST",
            dataTpe:"json",
            success:function (result) {
                if(result.code==100){
                 alert(result.extend.msg,"即将跳转登录...");
                 window.location.href="${App_Path}/loginInfo";
                }else{
                    show_validate_msg("#input_code","error",result.extend.msg)
                }
            }
        });
    })
});
/*修改密码请求*/
var tel=$("#input_telephone").val();

$("#btn_getcode").click(function () {
    $.ajax({
        url:"${App_Path}/sendcode",
        data:{"userTelephone":$("#input_telephone").val()},
        type:"GET",
        dataType:"json",
        success:function (result) {
            if(result.code==100){
               // alert("手机号：",{"userTelephone":$(this).val()},);
               /// alert("cg")
                alert(result.extend.msg);
                outime(60);
            }else{
                alert("手机号不能空",result.extend.msg)
                show_validate_msg(".password_msg","error",result.extend.msg);
            };
        }
    });
});
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

/*短信再次发送倒计时*/
    function outime(time) {
        if(time==0){
            $("#btn_getcode").removeClass("disabled");
            $("#btn_getcode").html("重新发送");
        }else{
            time--;
            $("#btn_getcode").addClass("disabled");
            $("#btn_getcode").html(time+"s后重新发送");
            setTimeout(function () {
                outime(time);
            },1000);
        }
    }
</script>
</body>
</html>
