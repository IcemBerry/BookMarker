/**
 * Created by cacri on 2017/3/19.
 */
$(document).ready(function(){
    $("#bookAddBtn").click(function(){
        var data = new FormData();
        data.append('bookISBN',document.getElementById('bookISBN').value);
        data.append('bookName',document.getElementById('bookName').value);
        data.append('bookNote',document.getElementById('bookNote').value);
        data.append('bookPage',document.getElementById('bookPage').value);
        data.append('bookAuthor',document.getElementById('bookAuthor').value);
        data.append('cover', $('#cover')[0].files[0]);
        $.ajax({
            data: data,
            url: '/addBook',
            type: 'POST',
            cache: false,
            contentType: false,
            processData: false,
            dataType:'json'
        })
    })
})