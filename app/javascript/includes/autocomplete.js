import $ from "jquery";
function createAutocomplete(className, placeholder, url, processResults) {

  $(document).on('turbolinks:before-cache', function() {     
    $(className).select2('destroy');
  } );

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
  $(".community_select").on('change', function(){
    let community_id = $(this).val()
    window.location.href = '/r/'+community_id+'/p/new'
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
