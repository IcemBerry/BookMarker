// /**
//  * Created by cacri on 2017/3/29.
//  */
// $(document).ready(function () {
//     $("#noteEditBtn").click(function () {
//         editNote();
//     })
// })
//
// function editNote() {
//     var options=$("#bookName option:selected");
//     var noteId = options.val();
//     var bookNote = $('#bookNote').val();
//
//     $.ajax({
//         type: 'POST',
//         url: '/editNote',
//         data: {"noteId":noteId,"bookNote":bookNote},
//         dataType: 'json',
//         success: function (json) {
//             if (json.status) {
//                 alert('success!');
//                 location.href = "/note"
//             }
//             else {
//                 alert('异常!');
//                 alert(json.errorMsg);
//             }
//         },
//         error: function (XMLHttpRequest, textStatus, errorThrown) {
//             alert('XMLHttpRequest:' + XMLHttpRequest.status + '     textStatus:' + XMLHttpRequest.readyState + '     textStatus:' + textStatus);
//         }
//     })
// }