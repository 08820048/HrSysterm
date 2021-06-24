<%--
  Created by IntelliJ IDEA.
  User: 22170
  Date: 2021/6/16
  Time: 10:45
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
<h1>人力资源管理系统-登录</h1>
<!--内容主题范围-->

<div class="page-header" style="margin-top: 10%">
    <h1><small>
        <form class="form-horizontal" id="login_form" style="margin-left: 20%;">
            <div class="form-group">
                <span class="help-block"></span>
                <label for="userName" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text"  style="width: 500px" required  class="form-control" name="userName" id="userName" placeholder="2-5为中英文字符组成"/>
                </div>
            </div>
            <div class="form-group">
                <span class="help-block"></span>
                <label for="userPassword" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password"  style="width: 500px" required class="form-control" name="userPassword" id="userPassword" placeholder="2-10为字符">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox" style="margin-left: -90%">
                        <label>
                            <span><a href="${App_Path}/registerInfo">没有账号？</a></span>
                        </label>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <!-- Split button -->
                    <div class="btn-group" style="margin-right: 50%">
                        <button type="button" class="btn btn-primary" id="login_btn">登录</button>
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
<script src="/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/bootstrap-3.37-dist/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">

    /*表单校验*/
    $("#login_btn").click(function () {
        /*用户名是否可用校验*/
        var flag = false;
        /*用户名校验*/
        var userName=$("#userName").val();
        var reg = /[\u4e00-\u9fa5_a-zA-Z]{2,5}$/;
        if(!reg.test(userName)){
            show_validate_msg("#userName","error","用户名必须是2-5位中英文组合！");
            flag= false;
        }else{
            show_validate_msg("#userName","success","");
            flag=true;
        }
        /*密码校验*/
        var userPassword = $("#userPassword").val();
        var reg = /[a-zA-Z0-9]{4,10}$/;
        if(!reg.test(userPassword)){
            show_validate_msg("#userPassword","error","密码必须由4-10位数字字母组成！");
           flag=false;
        }else{
            show_validate_msg("#userPassword","success","");
            flag=true;
        }
        if(flag==true){
            $.ajax({
                url:"${App_Path}/login",
                data:$("#login_form").serialize(),
                type:"POST",
                dataType:"json",
                success:function (result) {
                    if(result.code==100){
                        //alert("登录信息"+result.extend.user)
                        window.location.href="${App_Path}/index.jsp";
                    }else{
                        show_validate_msg("#userName","error",result.extend.msg);
                    }
                }
            });
        }
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


</script>
</html>
