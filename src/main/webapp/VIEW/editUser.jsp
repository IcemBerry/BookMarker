<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>用户设置</title>

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
    <div class="well col-md-6 col-md-offset-3" id="editBox">
        <form class="form-horizontal" action="/editUser" method="post">
            <div class="text-center">
                <p><h3 style="margin-top: -10px;margin-bottom: 20px">修改密码</h3></p>
            </div>
            <div class="alert alert-info">带有<span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>号的为必填项</div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user" style="color: #555"></span>
                        </span>
                        <input type="text" name="username" class="form-control" placeholder="用户名">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon ">
                            <span class="glyphicon glyphicon-grain" style="color: #555"></span>
                        </span>
                        <input type="password" name="oldPassword" class="form-control" placeholder="旧密码">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon ">
                            <span class="glyphicon glyphicon-leaf" style="color: #555"></span>
                        </span>
                        <input type="password" name="newPassword" class="form-control" placeholder="新密码">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">修改</button>
                </div>
            </div>
        </form>
    </div>
    <div class="well col-md-6 col-md-offset-3" id="delBox">

        <form class="form-horizontal" action="/delUser" method="post">
            <div class="text-center">
                <p><h3 style="margin-top: -10px;margin-bottom: 20px">永久注销</h3></p>
            </div>
            <div class="alert alert-warning">如果希望网站不再保留您的数据，可通过该操作消除数据</div>
            <div class="alert alert-danger"><span class="glyphicon glyphicon-certificate" style="color: #d9534f"></span>
                注意<br>
                该操作<mark>不可逆</mark>，所有用户数据将被抹除！<br>
                抹除的数据包含但不仅限于:用户书架、阅读进度及阅读笔记<br>
                但用户单独添加的书目将会<strong>保留</strong>在书库
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon ">
                            <span class="glyphicon glyphicon-console" style="color: #555"></span>
                        </span>
                        <input type="text" name="doublePassword" onpaste="return false" class="form-control" placeholder="连续输入两次密码以确认删除">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-danger btn-lg btn-block">永久注销</button>
                </div>
            </div>
        </form>

    </div>

</div>

</body>
</html>