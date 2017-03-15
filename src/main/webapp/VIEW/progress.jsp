<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li><a href="/index">我的书库</a></li>
            <li class="active"><a href="/progress">阅读进度</a></li>
            <li><a href="/analysis">阅读分析</a></li>
            <li><a href="/note">阅读笔记</a></li>
            <li><a href="/about">关于BM</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <ol class="breadcrumb">
            <li class="active">阅读进度</li>
        </ol>
    </div>
    <div class="col-md-10">
        <div class="well well-sm">
            检索到
            <mark>${progressList.size()}</mark>
            本书的阅读进度，其中
            <mark>${done}</mark>
            本书已阅读完毕
        </div>
    </div>
    <div class="col-md-10 bootstrap-table">
        <section class="panel">
            <table class="table table-striped table-advance table-hover">
                <thead>
                <tr>
                    <th class="col-md-2"><i class="fa fa-book fa-fw"></i> 书名</th>
                    <th class="col-md-1"><i class="fa fa-info fa-fw"></i> 总页</th>
                    <th class="col-md-1"><i class="fa fa-bookmark fa-fw"></i> 当前</th>
                    <th class="col-md-2"><i class="fa fa-calendar fa-fw"></i> 更新时间</th>
                    <th class="col-md-4"><i class="fa fa-check fa-fw"></i> 阅读进度</th>
                    <th class="col-md-2"><i class="fa fa-edit fa-fw"></i> 操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${progressList}" var="progress">
                    <tr>
                        <td><a href="/book?bookId=${progress.bookId}">${progress.book.bookName}</a></td>
                        <td>${progress.book.bookPage}</td>
                        <td>${progress.progress}</td>
                        <td><fmt:formatDate value="${progress.progressDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <div class="progress">
                                <div class="progress-bar"role="progressbar" aria-valuenow="<fmt:formatNumber type="number" value="${progress.progress/progress.book.bookPage*100}" maxFractionDigits="0"/>"
                                     aria-valuemin="0" aria-valuemax="100" style="width: <fmt:formatNumber type="number" value="${progress.progress/progress.book.bookPage*100}" maxFractionDigits="0"/>%">
                                    <fmt:formatNumber type="number" value="${progress.progress/progress.book.bookPage*100}" maxFractionDigits="0"/>%
                                </div>
                            </div>
                        </td>
                        <td>
                            <button class="btn btn-primary btn-xs"><i class="icon-pencil"></i>更新进度</button>
                            <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>完成</button>
                        </td>
                    </tr>
                </c:forEach>
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