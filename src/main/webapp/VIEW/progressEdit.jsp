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
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">Book Marker</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Jack</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="/index">我的书库</a></li>
            <li><a href="/progress">阅读进度</a></li>
            <li><a href="/analysis">阅读分析</a></li>
            <li><a href="/note">阅读笔记</a></li>
            <li><a href="/about">关于BM</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <ol class="breadcrumb">
            <li class="active">我的书库</li>
        </ol>
    </div>

    <div class="col-md-10">
        <div class="alert alert-info col-md-12">
            <div class="col-md-12">
                <p>进度预览</p>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                         aria-valuemax="100" style="width: 60%;">
                        60%
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-10">
        <div class="well col-md-12">
            <form class="form-horizontal col-md-12" action="/updateProgress" method="post">
                <div class="form-group col-md-12 ">
                    <label class="col-md-2 control-label">书名:</label>
                    <div class="col-md-4">
                        <input class="form-control" type="text" value="${progress.book.bookName}" readonly>
                    </div>
                    <label class="col-md-2 control-label">当前进度:</label>
                    <div class="col-md-4">
                        <input class="form-control" type="text" value="${progress.progress}" readonly>
                    </div>
                </div>
                <div class="form-group col-md-12 ">
                    <label class="col-md-2 control-label">新进度:</label>
                    <div class="col-md-4">
                        <input class="form-control" name="progress" type="text">
                    </div>
                    <label class="col-md-2 control-label">总页数:</label>
                    <div class="col-md-4">
                        <input class="form-control" type="text" value="${progress.book.bookPage}" readonly>
                    </div>
                </div>
                <input type="hidden" name="progressId" value="${progress.progressId}">
                <div class="col-md-12">
                    <button id="noteAddBtn" class="btn btn-success col-md-2 col-md-offset-2">更新进度</button>
                </div>
            </form>

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