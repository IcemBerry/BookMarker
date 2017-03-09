<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>登陆</title>

    <!-- 通用样式表 -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/goldbootstrap.css" rel="stylesheet">

    <!-- 通用动态脚本 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- 无法连接外部网络时，使用 "${pageContext.request.contextPath}/assets/js/jquery.min.js"-->

    <link href="${pageContext.request.contextPath}/assets/css/marker.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3" id="loginBox">
        <div class="well bs-component">
            <form class="form-horizontal" action="/user/login" method="post">
                <fieldset>
                    <legend>用户登录</legend>
                    <div class="form-group">
                        <label for="inputUserName" class="col-lg-2 control-label">用户名</label>
                        <div class="col-lg-10">
                            <input type="text" name="username" class="form-control" id="inputUserName"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-lg-2 control-label">密码</label>
                        <div class="col-lg-10">
                            <input type="password" name="password" class="form-control" id="inputPassword"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <button type="reset" class="btn btn-default">重置</button>
                            <button type="submit" class="btn btn-primary">登陆</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

</body>
</html>