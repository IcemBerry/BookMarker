<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>库</title>

    <!-- 通用样式表 -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">

    <!-- 通用动态脚本 -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- 无法连接外部网络时，使用 "${pageContext.request.contextPath}/assets/js/jquery.min.js"-->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-zh-CN.min.js"></script>

    <link href="${pageContext.request.contextPath}/assets/css/marker.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/note.js"></script>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">Book Marker</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">${user.userName}</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li><a href="/index">我的书库</a></li>
            <li><a href="/progress">阅读进度</a></li>
            <li><a href="/analysis">阅读分析</a></li>
            <li class="active"><a href="/note">阅读笔记</a></li>
            <li><a href="/about">关于BM</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <ul class="breadcrumb">
            <li><a href="#">Library</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <div class="alert alert-info">
            <p>
                共检索到
                <mark id="noteNum"></mark>
                条笔记
            </p>
        </div>
    </div>
    <div class="col-md-10" id="mainList">
        <table id="noteTable">

        </table>

        <div class="well well-sm">
            <button class="btn btn-success btn-default">添加</button>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
    </div>
</footer>

</body>
</html>