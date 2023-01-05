$(document).on('turbolinks:load', function () {
  setTimeout(function () {
    $('#notice').css('display', 'none');
  }, 3000);

  $('#notice-close').on('click', function () {
    $('#notice').css('display', 'none');
  });
});
