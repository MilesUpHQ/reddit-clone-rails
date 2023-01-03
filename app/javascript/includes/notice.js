
$(document).on('turbolinks:load', function () {
  setTimeout(function () {
     document.getElementById('notice').style.display = 'none';
    }, 3000); 
     document.getElementById('notice-close').onclick = function () {
     document.getElementById('notice').style.display = 'none';
  }
});  