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
	  console.log('closed');
	});
	
	$('#datepicker').datepicker({format: "dd-mm-yyyy"});
});