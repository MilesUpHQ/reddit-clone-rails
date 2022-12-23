$(window).scroll(function () {
    var next_url = $("#infinite-scrolling a[rel='next']").attr('href');
    if ((next_url) && ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight)) {
        $('#infinity').show();
        $.getScript(next_url);
        return;
    }
});
