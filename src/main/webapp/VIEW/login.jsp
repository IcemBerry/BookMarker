<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/logo.ico" type="image/x-icon"/>
    <title>登陆</title>

    <!-- 通用样式表 -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css" rel="stylesheet">

    <!-- 通用动态脚本 -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-zh-CN.min.js"></script>

    <!-- 自定义内容 -->
    <link href="${pageContext.request.contextPath}/assets/css/marker.css" rel="stylesheet">
</head>

<body>
<div class="container">

    <div class="well col-md-6 col-md-offset-3" id="loginBox">
        <form class="form-horizontal" action="/login" method="post">
            <div class="alert alert-info">还没有账号？<a href="/register">立即注册</a></div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user" style="color: #555"></span>
                        </span>
                        <input type="text" name="username" class="form-control" placeholder="用户名">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon ">
                            <span class="glyphicon glyphicon-leaf" style="color: #555"></span>
                        </span>
                        <input type="password" name="password" class="form-control" placeholder="密码">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">登陆</button>
                </div>
            </div>
        </form>
    </div>

</div>

</body>
</html>