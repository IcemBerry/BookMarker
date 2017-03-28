/**
 * Created by cacri on 2017/3/10.
 */
$(document).ready(function () {
    getData();
})

function getData() {
    $.ajax({
        url: "/index",
        type: 'POST',
        dataType: 'json',
        success: function (json) {
            var bookList = json.bookList;
            initTable(bookList);
            document.getElementById("bookNum").innerHTML = bookList.length;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('XMLHttpRequest:' + XMLHttpRequest.status +
                '     textStatus:' + XMLHttpRequest.readyState +
                '     textStatus:' + textStatus);
        }
    });
}

function initTable(bookList) {
    $('#indexBookTable').bootstrapTable('destroy');
    $('#indexBookTable').bootstrapTable({
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
            title: "书名",
            sortable: true,
            formatter: function (value, row, index) {
                return '<a href="/book?bookId=' + row.bookId + '" mce_href="#">' + row.bookName + '</a> ';
            },
            order: "desc"
        }, {
            title: "作者",
            field: "bookAuthor",
            sortable: true,
            order: "desc"
        }, {
            title: "页数",
            field: "bookPage",
            sortable: true,
            order: "desc"
        }, {
            title: "操作",
            align: 'center',
            field: "bookId",
            formatter: function () {
                return '<button class="btn btn-danger btn-default" id="delButton" href="javascript:void(0)">删除</button>'
            },
            events: operateEvents
        }]
    });
}

window.operateEvents = {
    'click #delButton': function (e, value, row) {
        var id = row.bookId;
        $.ajax({
            url: "/deleteUserBook",
            type: 'POST',
            dataType: 'json',
            data: {"bookId": id},
            success: function (json) {
                if (json.status) {
                    getData();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert('XMLHttpRequest:' + XMLHttpRequest.status +
                    '     textStatus:' + XMLHttpRequest.readyState +
                    '     textStatus:' + textStatus);
            }
        });
    }
}