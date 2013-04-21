$(document).ready(function () {
  var finished = true;
  $('#gift-name').typeahead({
      source: function(query, process){
          if(!finished) {
              return;
          }
          finished = false;
          $.getJSON('/search?'+query,{}, function(response){
              var data = new Array();
              for(var i in response) {
                  data.push(response[i].id + '_#_' + response[i].name + '_#_' + response[i].photo);
              }
              process(data);
              finished = true;
          });
      },
      highlighter: function(item) {
          var parts = item.split('_#_');
          var photo_str = 'https://lh5.googleusercontent.com/-JLUNdv3PhDY/UXQRF5KKDsI/AAAAAAAAAsA/tJqJkHBJqKY/s100/nophoto.png';
          if (parts[2] != "") {
            photo_str = parts[2];
          }
          var itm = ''
                   + "<div class='typeahead_wrapper'>"
                   + "<img class='typeahead_photo' src='" + photo_str + "' />"
                   + "<div class='typeahead_labels'>"
                   + "<div class='typeahead_primary'>" + parts[1] + "</div>"
                   + "</div>"
                   + "</div>";
          return itm;
      },
      updater: function(item) {
          var parts = item.split('_#_');
          $('#hidden-gift-template').val(parts.shift());
          return parts.join('_#_');
      },
      minLength: 2
  });
});
