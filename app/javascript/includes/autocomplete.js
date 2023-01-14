import $ from "jquery";

$(document).on("turbolinks:load", () => {
  $(".search-input").select2({
    width: "100%",
    placeholder: "Search Community",
    minimumInputLength: 2,
    ajax: {
      url: "/search_suggestions",
      dataType: "json",
      delay: 250,
      data: function (params) {
        return {
          q: params.term,
        };
      },
      processResults: function (data, params) {
        return {
          results: data.map(function (community) {
            return {
              id: community.id,
              text: community.name,
            };
          }),
        };
      },
      cache: true,
    },
  }).on('change', function() {
    let value = $(this).val();
    window.location = '/r/'+value
  });
});
