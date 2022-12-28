$( document ).on('turbolinks:load', function() {
  let mybutton = $('.top_btn');

  $(window).scroll(function() {
    if ($(document).scrollTop() > 20) {
      mybutton.show();
    } else {
      mybutton.hide();
    }
  });

  mybutton.click(function () {
    $('html, body').animate({scrollTop: 0}, 'slow');
  });
 });
 