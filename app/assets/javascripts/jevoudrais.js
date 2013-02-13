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
	
	
	$('#dLabel').click(function() {
	  $('#dropdown-menu li').each(function() {
		  $.ajax({
			  url: '/notifications/' + this.id,
			  type: 'PUT',
			  data: "seen=true",
			  success: function(data) {
					setTimeout(
					  function() 
					  {
					    $('#dropdown-div').hide();
					  }, 5000);			    
			  }
			});  
		});
	});
	
	$('#datepicker').datepicker({format: "dd-mm-yyyy"});
});