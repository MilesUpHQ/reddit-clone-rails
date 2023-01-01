$( document ).on('turbolinks:load', function() {
  $(".save").on("click", function(){
    let post_id = $(this).data("id");

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
