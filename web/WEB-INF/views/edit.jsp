<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2021/6/9
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path",request.getContextPath());
%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>HR System - 人力资源管理系统</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="${App_Path}/static/css/sticky-footer-navbar.css">
    <link rel="stylesheet" href="${App_Path}/static/bootstrap-select-1.13.9-dist/css/bootstrap-select.css">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <![endif]-->
</head>
<body>
<h1></h1>
<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${App_Path}">人力资源管理系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${App_Path}">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">员工管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${App_Path}/list">查看员工信息</a></li>
                        <li><a href="${App_Path}/input">新增员工信息</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h3>修改员工信息</h3>
    </div>
    <form class="form-horizontal form" >
        <div class="form-group">
            <span class="help-block">    </span>
            <label for="empName_update_input"  class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" disabled required  id="empName_update_input" name="empName" placeholder="请输入姓名">
            </div>

        </div>
        <div class="form-group">
            <span class="help-block">    </span>
            <label for="empEmail_update_input"  class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" name="empEmail"  required  id="empEmail_update_input" placeholder="请输入Email">
            </div>
        </div>
        <div class="form-group">
            <span class="help-block">    </span>
            <label for="gender" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <label class="radio-inline">
                    <input type="radio" name="empGender"  id="gender" value="0"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio"  name="empGender" id="gender2" value="1"> 女
                </label>
            </div>
        </div>
        <div class="form-group">

            <label for="department" class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <select class="selectpicker" data-width="100%" id="department"   name="department.deptId" title="请选择部门">

                </select>
                <span class="help-block">    </span>
            </div>
        </div>
<%--        <h3>edit:${requestScope.empId}</h3>--%>
<%--        <a class="btn btn-lg btn-primary btn-block" id="emp_save_btn" href="${App_Path}/input"><span class="glyphicon glyphicon-save"></span>修改</a>--%>
        <button type="button"  id="emp_update_btn" class="btn btn-primary btn-lg btn-block" edit_id="${requestScope.empId}" pn="${requestScope.pn}"><span class="glyphicon glyphicon-save"></span>修改</button>
    </form>
</div>

<footer class="footer navbar-fixed-bottom">
    <div class="container">
        <p class="text-muted">@2021 杭州职业技术学院 软件技术专业</p>
    </div>
</footer>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script src="${App_Path}/static/bootstrap-select-1.13.9-dist/js/bootstrap-select.js"></script>

<script type="text/javascript">
   $(function () {
       getDepts();
   });

   function getDepts() {
       $.ajax({
           url:"${App_Path}/depts",
           type:"GET",
           dataType:"json",
           success:function (result) {
               $("form select").empty();
               $.each(result.extend.depts,function (index, department) {
                   optionElement = $("<options></options>").append(department.deptName).attr({"value":department.deptId});
                   optionElement.appendTo($("form select"));
               });
               getEmp($("#emp_update_btn").attr("edit_id"));
           }
       });
   }
   function getEmp(id) {
       //alert("edit中的id:"+id)
       $.ajax({
           url:"${App_Path}/emp/"+id,
           type:"GET",
           dataType:"json",
           success:function (result) {
               if(result.code===100){
                   var empData=result.extend.emp;
                   $("#empName_update_input").val(empData.empName);
                   $("#empEmail_update_input").val(empData.empEmail);
                   if(empData.empGender==true){
                       $('input:radio:last').attr("checked",'checked');
                   }else{
                       $('input:radio:first').attr("checked",'checked');
                   }
                   $(".selectpicker").selectpicker('val',[empData.department.deptId]);
               }
           }
       });
   }

   $("#emp_update_btn").click(function () {
       var empEmail=$("#empEmail_update_input").val();
       var regEmail=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
       if(!regEmail.test(empEmail)){
           show_validate_msg("#empEmail_update_input","error","Email格式不正确！");
           return false;
       }else{
           show_validate_msg("#empEmail_update_input","success","");
       }
       var pn =$(this).attr("pn");
       $.ajax({
           url:"${App_Path}/emp/"+$(this).attr("edit_id"),
           data:$("form").serialize(),
           type:"PUT",
           dataType:"json",
           success:function (result) {
               if(result.code==100){
                   window.location.href="${App_Path}/list?pn="+pn;
               }else{
                   if(result.extend.fieldErrors.empEmail!=undefined){
                       show_validate_msg("#empEmail_update_input","error",result.extend.fieldErrors.empEmail);
                   }
               }
           }

       });
   });







   <%--var checkNameflag=false;--%>
   <%--  $("#emp_save_btn").click(function () {--%>
   <%--      /*用户名如果不可以*/--%>
   <%--      if (!checkNameflag) {--%>
   <%--          return false;--%>
   <%--      }--%>
   <%--      var empName = $("#empName_add_input").val();--%>
   <%--      var reg = /[\u4e00-\u9fa5_a-zA-Z]{2,5}$/;--%>
   <%--      if (!reg.test(empName)) {--%>
   <%--          show_validate_msg("#empName_add_input", "error", "用户名必须是2-5位中英文组合！");--%>
   <%--          return false;--%>
   <%--      } else {--%>
   <%--          show_validate_msg("#empName_add_input", "success", "");--%>
   <%--      }--%>
   <%--      /*邮箱验证*/--%>
   <%--      var empEmail = $("#empEmail_add_input").val();--%>
   <%--      var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;--%>
   <%--      if (!reg.test(empEmail)) {--%>
   <%--          show_validate_msg("#empEmail_add_input", "error", "Email格式不正确hhh！");--%>
   <%--          return false;--%>
   <%--      } else {--%>
   <%--          show_validate_msg("#empEmail_add_input", "success", "");--%>
   <%--      }--%>
   <%--      if ($("[name='empGender']:checked").length == 0) {--%>
   <%--          show_validate_msg("[name='empGender']", "error", "请选择性别！");--%>
   <%--          return false;--%>
   <%--      } else {--%>
   <%--          show_validate_msg("[name='empGender']", "success", "");--%>
   <%--      }--%>
   <%--      /*验证部门选择*/--%>
   <%--      if ($("[name='dId']").val() === "") {--%>
   <%--          show_validate_msg("[name='dId']", "error", "请选择部门!",);--%>
   <%--          return false;--%>
   <%--      } else {--%>
   <%--          show_validate_msg("[name='dId']", "success", "");--%>
   <%--      }--%>
   <%--  });--%>
   <%-- $("#empName_add_input").change(function () {--%>
   <%--     $.ajax({--%>
   <%--         url:"${App_Path}/checkName",--%>
   <%--         data:{"empName":$(this).val()},--%>
   <%--         type:"GET",--%>
   <%--         dataType:"json",--%>
   <%--         success:function (result) {--%>
   <%--             if(result.code==100){--%>
   <%--                 show_validate_msg("#empName_add_input","success",result.extend.msg);--%>
   <%--                 checkNameflag=true;--%>
   <%--             }else{--%>
   <%--                 show_validate_msg("#empName_add_input","error",result.extend.msg)--%>
   <%--                 checkNameflag=false;--%>
   <%--             }--%>
   <%--         }--%>
   <%--     });--%>
   <%-- })--%>





        //与服务器交互的校验
    <%--$("#emp_save_btn").click(function () {--%>
    <%--    $.ajax({--%>
    <%--        url: "${App_Path}/emp",--%>
    <%--        data: $("form").serialize(),--%>
    <%--        type: "POST",--%>
    <%--        dataType: "json",--%>
    <%--        success: function (result) {--%>
    <%--            if (result.code === 100) {--%>
    <%--                //重定向到员工信息列表页面--%>
    <%--                alert(result.msg);--%>
    <%--                window.location.href = "${App_Path}/list";--%>
    <%--            } else {--%>
    <%--                //姓名错误--%>
    <%--                if (result.extend.fieldError.empName != undefined) {--%>
    <%--                    $("#empName_add_input").parents("div.form-group").addClass("has-error");--%>
    <%--                    $("#empName_add_input").parents("div.form-group").find("span.help-block").text(result.extend.fieldError.empName);--%>
    <%--                    return false;--%>
    <%--                }--%>
    <%--                //Email错误--%>
    <%--                if (result.extend.fieldError.empEmail != undefined) {--%>
    <%--                    $("#empEmail_add_input").parents("div.form-group").addClass("has-error");--%>
    <%--                    $("#empEmail_add_input").parents("div.form-group").find("span.help-block").text(result.extend.fieldError.empEmail);--%>
    <%--                    return false;--%>
    <%--                }--%>
    <%--                //性别错误--%>
    <%--                if (result.extend.fieldError.empGender != undefined) {--%>
    <%--                    $("[name='empGender']").parents("div.form-group").addClass("has-error");--%>
    <%--                    $("[name='empGender']").parents("div.form-group").find("span.help-block").text(result.extend.fieldError.empGender);--%>
    <%--                    return false;--%>
    <%--                }--%>
    <%--                //部门错误--%>
    <%--                if (result.extend.fieldError.dId != undefined) {--%>
    <%--                    $("[name='dId']").parents("div.form-group").addClass("has-error");--%>
    <%--                    $("[name='dId']").parents("div.form-group").find("span.help-block").text(result.extend.fieldError.dId);--%>
    <%--                    return false;--%>
    <%--                }--%>
    <%--            }--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>


    /*提交函数*/
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


<script type="text/javascript">
    $(function () {
        /*异步请求获取部门信息并显示*/
       $.ajax({
           url:"${App_Path}/depts",
           type:"GET",
           dataType:"json",
           beforeSend:function () {
               $(".selectpicker").empty();
               $(".selectpicker").attr({"title":"正在加载部门信息..."});
               $(".selectpicker").prop('disabled', false);
               $(".selectpicker").selectpicker('refresh');
           },
           success:function (result) {
               if(result.code==100){
                   $(".selectpicker").empty();
                   $.each(result.extend.depts,function (index,dept) {
                      $("<option></option>").attr({"value":dept.deptId})
                          .append(dept.deptName)
                          .appendTo($(".selectpicker"));
                   });
                   $(".selectpicker").selectpicker("refresh");
                   $(".selectpicker").parent().find("button").attr({'title':"请选择部门"});
                   $(".selectpicker").parent().find("div.filter-option-inner-inner").text("请选择部门");
               }
           }
       });
    });


</script>

</body>
</html>
