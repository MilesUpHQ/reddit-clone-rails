$( document ).on('turbolinks:load', function() {
$(document).ready(function() {
    var searchInput = $('#search-input');
    searchInput.select2({
      width: '100%',
      placeholder: 'Search',
      minimumInputLength: 2,
      ajax: {
        url: '/search_suggestions',
        dataType: 'json',
        delay: 250,
        data: function(params) {
          return {
            q: params.term,
          };
        },
        processResults: function(data, params) {
          return {
            results: data.map(function(community) {
              return {
                id: community.id,
                text: community.name
              };
            })
          };
        },
        cache: true
      }
    });
  });
});