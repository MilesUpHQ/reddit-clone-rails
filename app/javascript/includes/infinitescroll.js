$(window).scroll(function () {
    console.log("welcome");
    var next_url = $("#infinite-scrolling a[rel='next']").attr('href');
    if ((next_url) && ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight)) {
        console.log("scrolling");
        $('#infinity').show();
        $.getScript(next_url);
        return;
    }
});
