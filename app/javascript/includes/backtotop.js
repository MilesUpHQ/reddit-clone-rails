$( document ).on('turbolinks:load', function() {
  var mybutton = $('#myBtn');

  $(window).scroll(function() {
    scrollFunction();
  });

  function scrollFunction() {
    if ($(document).scrollTop() > 20) {
      mybutton.show();
    } else {
      mybutton.hide();
    }
  }

  // When the user clicks on the button, scroll to the top of the document
  function topFunction() {
    $('html, body').animate({scrollTop: 0}, 'slow');
  }
 });
});
