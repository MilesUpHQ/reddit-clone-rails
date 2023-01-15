$(document).on('turbolinks:load', function () {
  $("#disclaimer").hide();
  $('#close-link').click(function (event) {
    $("#disclaimer").show();
    $("#comment-hide").hide();
    $("#close-link").hide();
    alert('The discussion is closed.No one able to comment on your discussion');
    event.preventDefault();
  });
});
