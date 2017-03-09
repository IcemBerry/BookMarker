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
    <div class="bs-docs-section">
        <div class="row">
            <div class="col-md-12">
                <div class="bs-component">
                    <nav class="navbar navbar-inverse">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <a class="navbar-brand" href="#">Book Marker</a>
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="#">${user.userName}</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="col-md-3">
                <div class="bs-component">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="#">Library</a></li>
                        <li><a href="#">Progress</a></li>
                        <li><a href="#">Analysis</a></li>
                        <li><a href="#">Note</a></li>
                        <li><a href="#">About</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">

            </div>
        </div>
    </div>


</div>

</body>
</html>