<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/logo.ico" type="image/x-icon"/>
    <title>添加图书</title>

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
    <%--<script src="${pageContext.request.contextPath}/assets/js/customize/bookAdd.js"></script>--%>
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
            <li><a href="/index">我的书架</a></li>
            <li><a href="/toBookLibrary">全局书库</a></li>
            <li class="active">添加图书</li>
        </ol>
    </div>

    <div class="col-md-10">
        <div class="alert alert-info" role="alert" id="infoText">
            带有
            <span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>
            号的为必填项
        </div>
        <div class="well">
            <form class="form-horizontal" enctype="multipart/form-data" action="/addBook" method="post">
                <div class="form-group">
                    <label class="col-md-2 control-label">ISBN编号</label>
                    <div class="col-md-10">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="ISBN编号" id="bookISBN" name="bookISBN">
                            <div class="input-group-addon">
                                <span class="glyphicon glyphicon-asterisk" style="color: #db4d6d"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">书名</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="bookName" placeholder="书名" name="bookName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">作者</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="bookAuthor" placeholder="作者" name="bookAuthor">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">页数</label>
                    <div class="col-md-10">
                        <input type="number" min="1" class="form-control" id="bookPage" placeholder="页数" name="bookPage">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">备注</label>
                    <div class="col-md-10">
                        <textarea class="form-control" cols="60" rows="5" id="bookNote" name="bookNote"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cover" class="col-md-2 control-label">封面</label>
                    <div class="col-md-10">
                        <input type="file" id="cover" name="cover">
                        <p class="help-block">建议使用355*500的jpg图片，文件大小不能超过20K</p>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-10 col-md-offset-2">
                        <input type="submit" class="btn btn-success" value="添加">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>