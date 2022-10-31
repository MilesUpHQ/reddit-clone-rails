// import { $ } from "@rails/ujs";

$(function () {
  // console.log('jquery is loaded..');
  $(".vote").on("click", ".upvote , .downvote", function () {
    var discussion_id = $(this).parent().data("id");
    is_upvote = $(this).hasClass("upvote");
    $.ajax({
      url: "/votes",
      method: "POST",
      data: { discussion_id: discussion_id, upvote: is_upvote },
      success: function () {
        console.log("success..");
      }
    });
  });
});

