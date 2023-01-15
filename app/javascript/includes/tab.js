$(document).on('turbolinks:load', function () {
  $(".tab-nav-link").on("click", function () {
      let tab = $(this).data("tab");
      window.location.href = "?tab="+tab

      // $.ajax({
      //     url: "/",
      //     method: "GET",
      //     data: {
      //         tab: posts
      //       },
      //     success: function () {
      //       console.log("success..");
      //     }
      //   });
  })
});
