/**
 * Created by cacri on 2017/3/27.
 */
$(document).ready(function () {
    getBookList();
    $("#noteAddBtn").click(function () {
        addNote();
    })
})

function getBookList() {
    $.ajax({
        url: '/index',
        type: 'POST',
        dataType: 'json',
        success: function (json) {
            var bookList = json.bookList;
            var optionstring = "";
            for (var j = 0; j < bookList.length; j++) {
                optionstring += "<option value=\"" + bookList[j].bookId + "\" >" + bookList[j].bookName + "</option>";
            }
            $("#bookName").html(optionstring);
        }
    })
}

function addNote() {
    var options=$("#bookName option:selected");
    var bookId = options.val();
    var bookPage = $('#bookPage').val();
    var bookNote = $('#bookNote').val();

    $.ajax({
        type: 'POST',
        url: '/addNote',
        data: {"bookId":bookId,"bookPage":bookPage,"bookNote":bookNote}
    })
}