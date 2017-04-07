/**
 * Created by cacri on 2017/3/24.
 */
$(document).ready(function () {
    getData();
})

function getData() {
    $.ajax({
        url: "/note",
        type: 'POST',
        dataType: 'json',
        success: function (json) {
            var noteDTOList = json.noteDTOList;
            initNoteTable(noteDTOList);

            document.getElementById("noteNum").innerHTML = noteDTOList.length;
        }
    });
}

function initNoteTable(noteDTOList) {
    $('#noteTable').bootstrapTable('destroy');
    $('#noteTable').bootstrapTable({
        data: noteDTOList,
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
            sortable: true,
            formatter: function (value, row, index) {
                return '<a href="/book?bookId=' + row.bookId + '" mce_href="#">' + row.bookName + '</a> ';
            },
            order: "desc"
        }, {
            title: "位置",
            field: "notePage",
            sortable: true,
            order: "desc"
        }, {
            title: "笔记",
            field: "note",
            sortable: false,
            order: "desc"
        }, {
            title: "操作",
            align: 'center',
            formatter: function () {
                return '<button class="btn btn-primary btn-default" id="editButton" href="javascript:void(0)">编辑</button> ' +
                    '<button class="btn btn-danger btn-default" id="delButton" href="javascript:void(0)">删除</button>'
            },
            events: operateEvents
        }]
    });
}


window.operateEvents = {
    'click #editButton': function (e, value, row) {
        var id = row.noteId;
        location.href = "/toEditNote?noteId="+id;
    },
    'click #delButton': function (e, value, row) {
        var id = row.noteId;
        $.ajax({
            url: "/deleteNote",
            type: 'POST',
            dataType: 'json',
            data: {"noteId": id},
            success: function (json) {
                if (json.status) {
                    getData();
                }
            }
        });
    }
}