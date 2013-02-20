$(document).ready(function() {
	
	$('.dropdown-toggle').dropdown();
	
	var footerHeight = 0,
	footerTop = 0,
	footer = $("#footer"),
	container = $("#container");

	positionFooter();

	function positionFooter() {
		footerHeight = footer.height();
		footerWidth = footer.width();
		containerWidth = container.width();

		leftMargin = ($(window).width() - containerWidth)/2;								

		footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";
		footerLeft = leftMargin + containerWidth - footerWidth + "px";
		
		footer.css({
			position: "absolute",
			top: footerTop,
			left:footerLeft													
		})
	}

	$(window)
	.scroll(positionFooter)
	.resize(positionFooter)
	
	
	$('#notificationModal').on('hidden', function () {
	  //ajax call to update all notifications and then hide notification link
		$('#modal-body p').each(function() {
		 	$.ajax({
		     url: '/notifications/' + this.id,
		     type: 'PUT',
		     data: "seen=true"
		  });  
		});
		
		$('notifications-link').hide();
	});
		
	$('#datepicker').datepicker({format: "dd-mm-yyyy"});
	
	$('#submit-link').click(function() {
		console.log($('#gift-name').val());
		if ($('#gift-name').val() == "") {
			$("#error-text").html('<p class="text-warning">Please fill in a gift name</p>');			
		} else {
			$("#gift-form").submit();
		}
	});
});