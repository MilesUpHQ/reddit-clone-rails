$(document).ready(function(){
    $("#myInput_mycommunities").keydown(function(){
        input = $('#myInput_mycommunities');
        var input, filter, ul, li, a, i;
        filter = input.val().toUpperCase();
        div = $('#myDropdown');
        a = div.find('a');
        a.each(function (index, element) {
            txtValue = $(element).text().toUpperCase();
            if (txtValue.indexOf(filter) > -1) {
                $(element).css('display', '');
            } else {
                $(element).css('display', 'none');
            }
        });
    });
  });
