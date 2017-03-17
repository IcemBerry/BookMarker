/**
 * Created by cacri on 2017/3/10.
 */
$(document).ready(function () {
    $.ajax({
        type:'post',
        url:'/index',
        dataType: 'json',
        success: function(json) {
            initTable(json);
        }
    });
});

function initTable(json) {
    // $('#indexBookTable').bootstrapTable('refresh');
    $('#indexBookTable').bootstrapTable({
        // url: "/index",
        // method: 'post',
        // dataField: 'bookList',
        // dataType: 'json',
        // classes:'col-md-10',
        data:json.bookList,
        search:true,
        // toolbar: '#toolbar',
        // silentSort:false,
        cache: false,
        pagination: true,
        sidePagination: 'server',
        pageList:[2,5,10],
        minimumCountColumns:2,
        pageSize:2,
        formatDetailPagination:'显示 %s 行'
    });
}