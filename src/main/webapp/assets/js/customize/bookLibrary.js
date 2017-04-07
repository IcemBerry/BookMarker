/**
 * Created by cacri on 2017/3/22.
 */
$(document).ready(function () {
    getData();
})

function getData() {
    $.ajax({
        url: "/getAllBook",
        type: 'POST',
        dataType: 'json',
        success: function (json) {
            var bookList = json.bookList;
            initTable(bookList);
            document.getElementById("bookNum").innerHTML = bookList.length;
        }
    });
}

function initTable(bookList) {
    $('#libraryBookTable').bootstrapTable('destroy');
    $('#libraryBookTable').bootstrapTable({
        data: bookList,
        cache: false,
        pagination: true,
        pageSize: 5,
        pageList: [5, 10, 20],
        search: true,
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return '';
        },
        columns: [{
            title: "ISBN编号",
            sortable: true,
            order: "desc",
            field: "bookISBN"
        }, {
            title: "书名",//标题
            field: "bookName",//键名
            sortable: true,//是否可排序
            order: "desc"//默认排序方式
        }, {
            title: "作者",//标题
            field: "bookAuthor",//键名
            sortable: true,//是否可排序
            order: "desc"//默认排序方式
        }, {
            title: "页数",//标题
            field: "bookPage",//键名
            sortable: true,//是否可排序
            order: "desc"//默认排序方式
        }, {
            title: "添加至书架",//标题
            align: 'center',
            field: "bookId",//键名
            formatter: function () {
                return '<button class="btn btn-primary btn-default" id="addButton" href="javascript:void(0)">添加</button>'
            },
            events: operateEvents
        }]
    });
}

window.operateEvents = {
    'click #addButton': function (e, value, row) {
        var id = row.bookId;
        $.ajax({
            url: "/addBookFromLib",
            type: "post",
            dataType: 'json',
            data: {"bookId": id},
            success: function (json) {
                if (json.status) {
                    getData();
                }
            }
        })
    }
}