<%--
  Created by IntelliJ IDEA.
  User: 86139
  Date: 2021/6/9
  Time: 10:31
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
    <title>HR System - 人力资源管理系统</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="${App_Path}/static/css/sticky-footer-navbar.css">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1></h1>
<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">人力资源管理系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${App_Path}">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">员工管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${App_Path}list">查看员工信息</a></li>
                        <li><a href="${App_Path}input">新增员工信息</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h3>查看员工信息</h3>
    </div>
    <input type="hidden" id="pn" value="${requestScope.pn}">
    <div style="float: right;margin-bottom: 20px">
<%--        <a class="btn btn-primary" style="" href="${App_Path}input">新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增</a>--%>
        <a href="${App_Path}/input"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>新增</button></a>
        <button type="button" class="btn btn-danger" id="emp_del_btn"><span class="glyphicon glyphicon-remove"></span>批量删除</button>
<%--        <a class="btn btn-danger" href="#"><span class="glyphicon glyphicon-remove"></span><button id="#emp_del_btn">批量删除</button></a>--%>
    </div>

    <table class="table table-striped table-hover success" id="emps-table">
        <thead>
        <tr class="info">
            <th class="col-md-1"><input type="checkbox" id="check_all"></th>
            <th class="col-md-1">ID</th>
            <th class="col-md-1">姓名</th>
            <th class="col-md-1">性别</th>
            <th class="col-md-3">Email</th>
            <th class="col-md-2">部门</th>
            <th class="col-md-3">操作</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
        <tfoot>

        </tfoot>
    </table>
</div>

<footer class="footer navbar-fixed-bottom">
    <div class="container">
        <p class="text-muted">@2021 杭州职业技术学院 软件技术专业</p>
    </div>
</footer>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    var curPage=$("#pn").val();
    $(function (){
        to_page(curPage);
    });

    function to_page(pn){
        $.ajax({
            url:"${App_Path}/emps",
            type:"GET",
            data:{"pn":pn},
            dataType:"json",
            beforeSend:function (){
                $("#emps-table tbody").empty();
                $("#emps-table tfoot").empty();
                $("#emps-table tbody").append($("<tr></tr>").append($("<td></td>").attr({"colspan":"7"}).append("数据加载中...,请稍候")));

            },
            success:function (result){
                if(result.code == 100){
                    //1.显示员工的列表信息
                    build_emp_table(result.extend.pageInfo);
                    //2.显示分页信息
                    build_page_nav(result.extend.pageInfo);
                    curPage = result.extend.pageInfo.pageNum;
                    //alert("xurpage=:"+curPage)
                    $("#pn").val(curPage);
                }else{
                    $("#emps-table tbody").empty();
                    $("#emps-table tfoot").empty();
                    $("#emps-table tbody").append($("<tr></tr>").append($("<td></td>").attr({"colspan":"7"}).append(result.msg)));
                }

            },
            error:function(){
                $("#emps-table tbody").empty();
                $("#emps-table tfoot").empty();
                $("#emps-table tbody").append($("<tr></tr>").append($("<td></td>").attr({"colspan":"7"}).append("查询出错,请稍候再试")));

            }
        });
    }


    function build_emp_table(result) {
        $("#emps-table tbody").empty();
        var emps = result.list;
        $.each(emps, function (index, emp) {
            var chkTd = $("<td></td>").append($("<input>").addClass("check_item").attr({"type": "checkbox"}));
            var empIdTd = $("<td></td>").addClass("success").append((emp.empId));
            var empNameTd = $("<td></td>").addClass("success").append((emp.empName));
            var empGenderTd = $("<td></td>").addClass("success").append((emp.empGender ? "女" : "男"));
            var empEmailTd = $("<td></td>").addClass("success").append((emp.empEmail));
            var deptNameTd = $("<td></td>").addClass("success").append((emp.department.deptName));

            var editBtn = $("<button></button>").addClass("btn btn-xs btn-warning edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-wrench")).append("修改");
            editBtn.attr({"edit_id":emp.empId});
           // alert(result.pageNum)
            editBtn.attr({"pn":result.pageNum});
            var deleteBtn = $("<button></button>").addClass("btn btn-xs btn-danger delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("删除");
            deleteBtn.attr({"delete_id":emp.empId})
            var empOperationTd = $("<td></td>").append(editBtn).append("  ").append(deleteBtn);

            $("<tr></tr>").addClass("success").append(chkTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(deptNameTd)
                .append(empOperationTd)
                .appendTo("#emps-table tbody");
        });
    }

    function build_page_nav(result){
        $("#emps-table tfoot").empty();
        var pageInfoTd = $("<td></td>").addClass("text-left").attr({"colspan":"3"})
            .append("当前第"+result.pageNum+"页，总"+result.pages+"页，总"+result.total+"条记录");

        var navPgUL = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));

        if (result.isFirstPage){
            firstPageLi.addClass("disabled");
        }else {
            firstPageLi.click(function (){
                to_page(1);
            })
        }
        navPgUL.append(firstPageLi);

        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!result.hasPreviousPage){
            prePageLi.addClass("disabled");
        }else {
            prePageLi.click(function (){
                to_page(result.pageNum-1);
            })
        }
        navPgUL.append(prePageLi);

        $.each(result.navigatepageNums,function (index,pgNum){
            var navPageLi = $("<li></li>").append($("<a></a>").append(pgNum));

            if (result.pageNum === pgNum){
                navPageLi.addClass("active");
            }else {
                navPageLi.click(function (){
                    to_page(pgNum);
                })
            }

            navPgUL.append(navPageLi);
        });

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        if (!result.hasNextPage){
            nextPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function (){
                to_page(result.pageNum+1);
            })
        }
        navPgUL.append(nextPageLi);

        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.isLastPage){
            lastPageLi.addClass("disabled");
        }else {
            lastPageLi.click(function (){
                to_page(result.pages);
            })
        }
        navPgUL.append(lastPageLi);

        var navPageTd = $("<td></td>").addClass("text-center").attr({"colspan":"4"}).append(navPgUL);
        $("<tr></tr>").append(pageInfoTd).append(navPageTd).appendTo("#emps-table tfoot")

    }

    $(document).on("click",".edit_btn",function () {
        window.location.href="${App_Path}/edit/"+$(this).attr("edit_id")+"_"+$(this).attr("pn");
    });
   // $(".delete_btn").click(function () {
        $(document).on("click",".delete_btn",function () {
            var empName=$(this).parents("tr").find("td:eq(2)").text();
            var id=$(this).attr("delete_id");
            //$(this).parents("tr").find("td:eq(1)").text();
            if(confirm("确认删除["+empName+"]的信息吗？")){
                $.ajax({
                    url:"${App_Path}/emp/"+id,
                    type:"DELETE",
                    dataType:"json",
                    success:function (result) {

                        if(result.code==100){
                            /*重新加载页面列表信息*/
                            to_page(curPage);
                        }
                        alert(result.msg);
                        //alert("ok")
                    },
                    error:function () {

                    }
                })
            }

        });

    $("#check_all").click(function () {
        /*attr用于获取自定义属性，原生DOM属性用prop获取或修改*/
        //alert($(this).prop("checked"));
        $(".check_item").prop("checked",$(this).prop("checked"));
        $(document).on("click",".check_item",function () {
            var flag=$(".check_item").length ==$(".check_item:checked").length
            $("#check_all").prop("checked",flag);
        })
    })

    $("#emp_del_btn").click(function () {
        var empIDs="",empNames="";
        if($(".check_item:checked").length==0){
            alert("请选择要删除的员工!");
            return;
        }
        $.each($(".check_item:checked"),function () {
            empIDs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
        });
        empIDs=empIDs.substring(0,empIDs.length-1);
        empNames=empNames.substring(0,empNames.length-1);
        if(confirm("确认删除["+empNames+"]的信息吗？")){
            $.ajax({
                url:"${App_Path}/emp/"+empIDs,
                type:"DELETE",
                dataType:"json",
                success:function (result) {
                    alert(result.msg)
                    if(result.code==100){
                        /*重新加载页面列表信息*/
                        to_page(curPage);
                    }
                    alert(result.msg);
                    //alert("ok")
                },
                error:function () {

                }
            })
        }
    })

</script>
</body>
</html>
