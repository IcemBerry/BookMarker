/**
 * Created by cacri on 2017/3/23.
 */
$(document).ready(function () {
    getData();
})

function getData() {
    $.ajax({
        url: "/progress",
        type: 'POST',
        dataType: 'json',
        success: function (json) {
            var progressDTOList = json.progressDTOList;
            initProgressTable(progressDTOList);

            var unOpenedBookList = json.unOpenedBookList;
            initUnOpenBookTable(unOpenedBookList);

            document.getElementById("progressNum").innerHTML = progressDTOList.length;
            document.getElementById("unOpenNum").innerHTML = unOpenedBookList.length;
        }
    });
}

function initProgressTable(progressDTOList) {
    $('#progressTable').bootstrapTable('destroy');
    $('#progressTable').bootstrapTable({
        data: progressDTOList,
        cache: false,
        pagination: true,
        pageSize: 5,
        pageList: [5, 10, 20],
        search: true,
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return '';
        },
        columns: [{
            title: "书名",
            sortable: true,formatter: function (value, row, index) {
                return '<a href="/book?bookId=' + row.bookId + '" mce_href="#">' + row.bookName + '</a> ';
            },
            field: "bookName"
        }, {
            title: "总页",//标题
            field: "bookPage",//键名
            sortable: true,//是否可排序
            order: "desc"//默认排序方式
        }, {
            title: "当前",//标题
            field: "progress",//键名
            sortable: true,//是否可排序
            order: "desc"//默认排序方式
        },{
            title: "阅读进度",//标题
            formatter: operateFormatter,
            sortable: false,//是否可排序
            order: "desc"//默认排序方式
        }, {
            title: "操作",//标题
            align: 'center',
            field: "bookId",//键名
            formatter: function () {
                return '<button class="btn btn-primary btn-default" id="updateButton" href="javascript:void(0)">更新进度</button>'
            },
            events: operateEvents
        }]
    });
}

function initUnOpenBookTable(unOpenedBookList) {
    $('#unOpenBookTable').bootstrapTable('destroy');
    $('#unOpenBookTable').bootstrapTable({
        data: unOpenedBookList,
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
            sortable: true,//是否可排序
            formatter: function (value, row, index) {
                return '<a href="/book?bookId=' + row.bookId + '" mce_href="#">' + row.bookName + '</a> ';
            },
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
            title: "操作",//标题
            align: 'center',
            field: "bookId",//键名
            formatter: function () {
                return '<button class="btn btn-primary btn-success" id="startButton" href="javascript:void(0)">记录进度</button>'
            },
            events: operateEvents
        }]
    });
}

function operateFormatter(value, row, index) {
    return ['<div class="progress">'+
                '<div style="width: '+row.progressPercent+'%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="'+row.progressPercent+'" role="progressbar" class="red progress-bar">'+
                row.progressPercent+'%'+
                '</div>'+
                '</div>'];
}

window.operateEvents = {
    'click #updateButton': function (e, value, row) {
        var id = row.progressId;
        location.href = "/toUpdateProgress?progressId="+id;
    },
    'click #startButton': function (e, value, row) {
        var id = row.bookId;
        $.ajax({
            url: "/addProgress",
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