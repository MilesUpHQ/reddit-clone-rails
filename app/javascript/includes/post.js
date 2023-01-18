$( document ).on('turbolinks:load', function() {
  $(".community_select").on("change", function(){
    let community_id = $(this).val()
    window.location.href = '/r/'+community_id+'/p/new'
  });
});
