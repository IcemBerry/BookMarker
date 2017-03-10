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
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- 无法连接外部网络时，使用 "${pageContext.request.contextPath}/assets/js/jquery.min.js"-->

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
                <li><a href="#">${user.userName}</a></li>
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
        <ul class="breadcrumb">
            <li><a href="#">Progress</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <div class="well well-sm">
            检索到
            <mark>12</mark>
            本书的阅读进度,另有
            <mark>3</mark>
            本书已阅读完毕
        </div>
    </div>
    <div class="col-md-10 bootstrap-table">
        <section class="panel">
            <table class="table table-striped table-advance table-hover">
                <thead>
                <tr>
                    <th class="col-md-1"><i class="fa fa-tag fa-fw"></i> 编号</th>
                    <th class="col-md-2 hidden-phone"><i class="fa fa-book fa-fw"></i> 书名</th>
                    <th class="col-md-2"><i class="fa fa-inbox fa-fw"></i> 总页数</th>
                    <th class="col-lg-5"><i class="fa fa-bookmark fa-fw"></i> 阅读进度</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td><a href="#">Vector Ltd</a></td>
                    <td>121 </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar" style="width: 60%"></div>
                        </div>
                    </td>
                    <td>
                        <button class="btn btn-primary btn-xs"><i class="icon-pencil"></i>更新进度</button>
                        <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>完成</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="#">Vector Ltd</a></td>
                    <td>121 </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar" style="width: 60%"></div>
                        </div>
                    </td>
                    <td>
                        <button class="btn btn-primary btn-xs"><i class="icon-pencil"></i>更新进度</button>
                        <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>完成</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </section>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
    </div>
</footer>

</body>
</html>