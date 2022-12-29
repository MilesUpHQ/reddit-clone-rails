$( document ).on('turbolinks:load', function() {
  $(".saved").on("click", ".save", function(){
    let post_id = $(this).parent().data("id");

    $.ajax({
      url: "p/"+post_id+"/save",
      method: "PATCH",
      data: {},
      success: function(){
        console.log("Saved Successfully..");
      }
    });
  });
});
