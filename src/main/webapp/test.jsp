<div class="col-md-10">
    <c:forEach items="${noteList}" var="noteDTO" varStatus="status">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/book?bookId=${noteDTO.book.bookId}"><h5>${noteDTO.book.bookName}</h5></a>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th class="col-md-1">序号</th>
                    <th class="col-md-1">位置</th>
                    <th class="col-md-10">笔记</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${noteDTO.noteList}" var="note" varStatus="status">
                    <tr>
                        <td>${status.index+1}</td>
                        <td>${note.notePage}</td>
                        <td>${note.note}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="panel-footer">
                <button class="btn btn-primary btn-sm">管理</button>
                <button class="btn btn-success btn-sm">添加</button>
            </div>
        </div>
    </c:forEach>
</div>