$(function() {
  $( "#gift-name" ).autocomplete({
    source: "/search/",
    minLength: 2,
    select: function( event, ui ) {
			$('#gift-name').val(ui.item.value);
      $('#hidden-gift-template').val(ui.item.id);
			$('#gift-form').submit();
			$('#gift-form')[0].reset();
    }
  });
});