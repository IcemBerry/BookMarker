<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>修改笔记</title>

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
    <script src="${pageContext.request.contextPath}/assets/js/customize/noteEdit.js"></script>
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
            <li class="active"><a href="/note">阅读笔记</a></li>
            <li><a href="/analysis">阅读分析</a></li>
            <li><a href="/about">关于<abbr title="Book Marker">BM</abbr></a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <ul class="breadcrumb">
            <li><a href="/note">阅读笔记</a></li>
            <li class="active">修改笔记</li>
        </ul>
    </div>
    <div class="col-md-10">
        <div class="alert alert-info">
            <blockquote style="margin-bottom: 0px">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            </blockquote>
        </div>
    </div>

    <div class="col-md-10">
        <div class="well col-md-12">
            <form class="form-horizontal" action="/editNote" method="post">
                <div class="form-group col-md-12">
                    <label class="col-md-1 control-label">书名</label>
                    <div class="col-md-5">
                        <select name="noteId" class="form-control" readonly>
                            <option value="${note.noteId}">
                                ${note.book.bookName}
                            </option>
                        </select>
                    </div>
                    <label class="col-md-1 control-label">页数</label>
                    <div class="col-md-5">
                        <input type="text" class="form-control" name="bookPage" placeholder="页数"
                               value="${note.notePage}" readonly>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="col-md-1 control-label">笔记</label>
                    <div class="col-md-11">
                        <textarea class="form-control" cols="60" rows="6" name="bookNote"
                                  placeholder="眼见何事，情系何处，身在何方，心思何人？">${note.note}</textarea>
                    </div>
                </div>
                <div class="col-md-12">
                    <button class="btn btn-primary col-md-3 col-md-offset-1">修改</button>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>