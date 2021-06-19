<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
  <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
  <!--[if lt IE 9]>
  <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<script type="text/javascript">
  /*获取地址栏session参数*/
  function GetSessionP(user){
    var reg=new RegExp(("^|&")+user+"=([^?]*)(&|$)");
    var p = window.location.search.substr(1).match(reg);
    if(p!=null){
      return unescape(p[2]);
    }else{
      return null;
    }
  }
  alert(GetSessionP("user"));
</script>
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
      <a class="navbar-brand" href="#">人力资源管理系统</a>
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
      <c:if test="${sessionScope.user ne null}">
      <span style="float: right;">${user} <span  class="label label-success" >在线</span> <button type="button" class="btn btn-default navbar-btn">登出</button></span>
      </c:if>

      <c:if test="${sessionScope.user eq null}">
        <c:redirect url="${App_Path}"></c:redirect>
        <span style="float: right;">未登录<span  class="label label-success" >离线</span> <button type="button" class="btn btn-default navbar-btn">登出</button></span>
      </c:if>
    </div><!--/.nav-collapse -->

  </div>
</nav>

<!-- Begin page content -->
<div class="container">
  <div class="page-header">
    <h3>请选择操作</h3>
  </div>
  <a class="btn btn-lg btn-primary btn-block" href="${App_Path}/list"><span class="glyphicon glyphicon-th-list"></span>查看员工信息</a>
  <a class="btn btn-lg btn-primary btn-block" href="${App_Path}/input"><span class="glyphicon glyphicon-save"></span>新增员工信息</a>
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
</body>

</html>