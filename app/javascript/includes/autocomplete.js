import $ from "jquery";
function createAutocomplete(className, placeholder, url, processResults) {
  $(className).select2({
    width: "100%",
    placeholder: placeholder,
    minimumInputLength: 2,
    ajax: {
      url: url,
      dataType: "json",
      delay: 250,
      data: function (params) {
        return {
          q: params.term,
        };
      },
      processResults: processResults,
      cache: true,
    },
  });
  $('.navbar-redirection').on('change', function() {
    let value = $(this).val();
    window.location = '/r/'+value
  });
}

function processResultsName(data, params) {
  return {
    results: data.map(function (item) {
      return {
        id: item.id,
        text: item.name,
      };
    }),
  };
}

function processResultsUsername(data, params) {
  return {
    results: data.map(function (item) {
      return {
        id: item.id,
        text: item.username,
      };
    }),
  };
}

$(document).on("turbolinks:load", () => {
  createAutocomplete(".search-input", "Search by username", "/username_search", processResultsUsername);
  createAutocomplete(".search-input-navbar", "Search Community", "/search_suggestions", processResultsName);
});
