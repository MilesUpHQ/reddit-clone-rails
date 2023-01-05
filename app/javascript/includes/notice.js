$(document).on('turbolinks:load', function () {
  setTimeout(function () {
    $('#notice').hide();
  }, 3000);
  $('#notice-close').click(function () {
    $('#notice').hide();
  });
});