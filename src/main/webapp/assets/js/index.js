/**
 * Created by cacri on 2017/3/10.
 */
$(document).ready(function () {
    // $.ajax({
    //     type:'post',
    //     url:'/index',
    //     dataType: 'json',
    //     success: function(_json) {
    //
    //     }
    // });
    initTable();
});

function initTable() {
    // $('#indexBookTable').bootstrapTable('refresh');
    $('#indexBookTable').bootstrapTable({
        url: "/index",
        method: 'post',
        dataField: 'bookList',
        dataType: 'json',
        columns:[{
            field: 'bookId',
            title: '序号'
        },{
            field: 'bookName',
            title: '书名'
        },{
            field: 'bookAuthor',
            title: '作者'
        },{
            field: 'bookPage',
            title: '页数'
        },{
            field: 'bookNote',
            title: '备注'
        }],
        // toolbar: '#toolbar',
        // striped: true,
        // cache: false,
        // pagination: true,
        // sidePagination: "server",
        // pageNumber: 1,
        // pageSize: 5,
        // pageList: [10, 25, 50, 100]
    });
}