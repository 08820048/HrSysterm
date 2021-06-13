<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22170
  Date: 2021/6/9
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path",request.getContextPath());
%>
<!doctype html>
<html lang="zh-CN">
<head>
    <!-- 必须的 meta 标签 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 的 CSS 文件 -->
    <link href="${App_Path}/static/bootstrap-5.0.1-dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>Hello, world!</title>
    <style>
        .pages{
            display: flex;
            justify-content: center;
        }
        #footer{
            padding-top: 100px;
        }
    </style>
</head>
<body style="text-align: center">

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">人力资源管理系统</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${App_Path}">首页</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="${App_Path}" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            员工管理
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="list.html">查看员工信息</a></li>
                            <li><a class="dropdown-item" href="input.html">新增员工信息</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div style="margin-top: 30px;margin-left: 10px;">查看员工信息</div>
    <hr>
    <a style="float: right" class="btn btn-danger" role="button" data-bs-toggle="button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>批量删除</a>
    <table class="table table-success table-striped">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th scope="col">ID</th>
            <th scope="col">姓名</th>
            <th scope="col">Email</th>
            <th scope="col">性别</th>
            <th scope="col">部门</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <c:if test="${pageInfo.total eq 0}">
        <tbody>
        <tr>
            <td colspan="7">没有任何员工信息</td>
        </tr>
        </tbody>
        </c:if>
        <c:if test="${pageInfo.total gt 0}">
        <tbody>
        <c:forEach items="${pageInfo.list}" var="emp">
        <tr>
            <th><input type="checkbox"></th>
            <th scope="row">${emp.empId}</th>
            <td>${emp.empName}</td>
            <td>${emp.empEmail}</td>
            <td>${emp.empGender?"女":"男"}</td>
            <td>${emp.department.deptName}</td>
            <td>
                <a href="#" class="btn btn-warning" role="button" data-bs-toggle="button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-tool"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>修改</a>
                <a href="#" class="btn btn-danger" role="button" data-bs-toggle="button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>删除</a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
        </c:if>
        </tbody>
    </table>
    <div>
    <span id="page">当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total}条记录</span>
    </div>
        <div class="pages">
        <div class="page">
            <nav aria-label="...">
                <ul class="pagination">
                    <%--已经在首页，禁用点击--%>
                    <c:if test="${pageInfo.isFirstPage}">
                        <li class="page-item disabled">
                            <span class="page-link" >首页</span>
                        </li>
                    </c:if>

                    <c:if test="${!pageInfo.isFirstPage}">
                    <li class="page-item">
                        <span class="page-link"><a href="${App_Path}/listold?pn=1">首页</a></span>
                    </li>
                    </c:if>

                    <c:if test="${pageInfo.hasPreviousPage}">
                    <li class="page-item">
                        <a class="page-link" href="${App_Path}/list?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="pgNum">
                        <c:if test="${pgNum eq pageInfo.pageNum}">
                            <li class="page-item active"><a class="page-link" href="${App_Path}/list?pn=${pgNum}">${pgNum}</a></li>
                        </c:if>
                        <c:if test="${pgNum ne pageInfo.pageNum}">
                            <li class="page-item"><a class="page-link" href="${App_path}/list?pn=${pgNum}">${pgNum}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                            <li class="page-item">
                                <a class="page-link" href="${App_Path}/listold?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    <c:if test="${pageInfo.isLastPage}">
                    <li class="page-item disabled">
                        <a class="page-link" href="#">末页</a>
                    </li>
                    </c:if>

                    <c:if test="${!pageInfo.isLastPage}">
                        <li class="page-item">
                            <a class="page-link" href="${App_Path}/list?pn=${pageInfo.pages}">末页</a>
                        </li>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>
    <!--分页条-->

    <!-- 选项 1：包含 Popper 的 Bootstrap 集成包 -->
    <script src="${App_Path}/static/bootstrap-5.0.1-dist/js/bootstrap.bundle.min.js" ></script>
    <!-- 选项 2：Popper 和 Bootstrap 的 JS 插件各自独立 -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-ZUl1URfXTK/G8fkXyNMdPx+9X9sv/Bswp6GAPn9jtMr0PZjoAXyhZ2C3Z9CjXCdY" crossorigin="anonymous"></script>
    -->

</div>
<div class="card-footer" id="footer">©2021杭州职业技术学院 软件技术专业</div>
</body>
</html>