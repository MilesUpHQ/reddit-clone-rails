$(document).on('turbolinks:load', function () {
  $(".saved").on("click", '.save', function () {
    let post_id = $(this).parent().data("id");

    $.ajax({
      url: "/save_post/" + post_id,
      method: "POST",
      data: {
        post_id: post_id
      },
      success: function () {
        console.log("Saved Successfully..");
      }
    });
  });

  $(".saved").on("click", '.login', function () {
    window.location = "/accounts/sign_in"
  });
});
