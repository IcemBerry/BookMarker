<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/logo.ico" type="image/x-icon"/>
    <title>我的书架</title>

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
    <script src="${pageContext.request.contextPath}/assets/js/customize/index.js"></script>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand text-center" href="/index">
                <span class="glyphicon glyphicon-bookmark" style="color: #db4d6d"></span>
                Book Marker
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        ${user.userName}
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/editUser">设置</a></li>
                        <li><a href="/logout">登出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="/index">我的书架</a></li>
            <li><a href="/progress">阅读进度</a></li>
            <li><a href="/note">阅读笔记</a></li>
            <li><a href="/analysis">阅读分析</a></li>
            <li><a href="/about">关于<abbr title="Book Marker">BM</abbr></a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <ol class="breadcrumb">
            <li class="active">我的书架</li>
        </ol>
    </div>
    <div class="col-md-10">
        <div class="alert alert-info">
            共检索到
            <mark id="bookNum"></mark>
            本书
        </div>
    </div>

    <div class="col-md-10">
        <table id="indexBookTable">
        </table>

        <div class="well well-sm">
            <button class="btn btn-success btn-default" onclick="location='/toBookLibrary'">从书库添加</button>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="text-muted">暂时无用的页脚</p>
    </div>
</footer>

</body>
</html>