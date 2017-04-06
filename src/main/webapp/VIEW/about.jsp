<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>关于</title>

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
            <li><a href="/index">我的书架</a></li>
            <li><a href="/progress">阅读进度</a></li>
            <li><a href="/note">阅读笔记</a></li>
            <li><a href="/analysis">阅读分析</a></li>
            <li class="active"><a href="/about">关于<abbr title="Book Marker">BM</abbr></a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <ul class="breadcrumb">
            <li class="active">关于Book Marker</li>
        </ul>
    </div>
    <div class="col-md-10">
        <div class="alert alert-info">
            <p>作者：Book Marker 由<a href="mailto:icemberry@gmail.com">@ICEM</a>设计、搭建及维护</p>
        </div>
        <div class="alert alert-warning">
            <p>版权声明：<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
                <img alt="知识共享许可协议" style="border-width:0"
                     src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png"/>
            </a><br/>
                本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
                    知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议</a>进行许可。</p>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">Book Marker基于以下开源框架</div>
            <div class="panel-body">
                <ul style="font-size: 1.6rem;line-height: 2rem">
                    <li><a href="#">Spring</a></li>
                    <li><a href="#">MyBatis</a></li>
                    <li><a href="#">BootStrap</a></li>
                    <li><a href="#">ECharts</a></li>
                    <li><a href="#">BootStrap-table</a></li>
                    <li><a href="#">MySQL</a></li>
                    <li><a href="#">Alibaba Druid</a></li>
                    <li><a href="#">Apache Maven</a></li>
                    <li><a href="#">Apache Log4j</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>