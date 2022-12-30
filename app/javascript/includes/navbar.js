$(document).on('turbolinks:load', function () {
    $(".myInput_mycommunities").keydown(function () {
        input = $('.myInput_mycommunities');
        var input, filter, ul, li, a, i;
        filter = input.val().toUpperCase();
        div = $('.myDropdown');
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

    const tab_link = $('.tab-nav-link')

    function link_tab() {
        if (tab_link.length) {
            tab_link.removeClass('active')
            $(this).addClass('active')
        }
    }
    const community_link = $('.community-nav-link')

    function link_community() {
        if (community_link.length) {
            community_link.removeClass('active')
            $(this).addClass('active')
        }
    }
    $('.warning-nav-link').click(function (event) {
        $(this).children(".fa-solid").toggleClass('fa-plus fa-check ');
        $(this).toggleClass(' active');
        $(this).children("#check").prop('checked', !$(this).children("#check").prop('checked'));
    });

    tab_link.click(link_tab)
    community_link.click(link_community)
    // warning_link.click(link_warning)
});
