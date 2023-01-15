$(document).on('turbolinks:load', function () {
  $(".vote").on("click", ".upvote, .downvote", function () {
    let post_id = $(this).parent().data("id"),
      is_upvote = $(this).hasClass("upvote");

    $.ajax({
      url: "/p/vote",
      method: "POST",
      data: {
        post_id: post_id,
        upvote: is_upvote
      },
      success: function () {
        console.log("success..");
      }
    });
  });

  $(".vote").on("click", ".login", function () {
    window.location = "/accounts/sign_in"
  });
});
