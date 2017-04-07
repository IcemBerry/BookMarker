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
            <li class="active">${book.bookName}</li>
        </ol>
    </div>

    <div class="col-md-4">
        <img width="100%" height="100%" class="img-thumbnail" src="/assets/cover/${book.bookISBN}.jpg">
    </div>
    <div class="col-md-6">
        <table class="table table-bordered col-md-12">
            <tr>
                <td>ISBN编号</td>
                <td>${book.bookISBN}</td>
            </tr>
            <tr>
                <td>书名</td>
                <td>${book.bookName}</td>
            </tr>
            <tr>
                <td>作者</td>
                <td>${book.bookAuthor}</td>
            </tr>
            <tr>
                <td>页数</td>
                <td>${book.bookPage}</td>
            </tr>
            <tr>
                <td>备注</td>
                <td>${book.bookNote}</td>
            </tr>
        </table>

        <div class="col-md-12 well well-sm">
            <p>阅读进度：${progress.progress}/${book.bookPage}</p>
            <div class="progress" style="margin: 10px 0px 10px">
                <div class="progress-bar" role="progressbar" aria-valuenow="${progressPercent}" aria-valuemin="0"
                     aria-valuemax="100"
                     style="width: ${progressPercent}%">${progressPercent}%
                </div>
            </div>
            <p class="text-right">进度更新时间:
                <ins><fmt:formatDate value="${progress.progressDate}" pattern="yyyy-MM-dd HH:mm"/></ins>
            </p>
        </div>

        <table class="col-md-12 table table-bordered">
            <thead>
            <tr>
                <th>序号</th>
                <th>位置</th>
                <th>标注日期</th>
                <th>摘录内容（节选）</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${noteList}" var="note" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${note.notePage}</td>
                    <td><fmt:formatDate value="${note.noteDate}" pattern="yyyy年MM月dd日 HH:mm"/></td>
                    <td>${note.note}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>