$(document).ready(function() {
	$(window).bind("load", function() { 
       
	       var footerHeight = 0,
	           footerTop = 0,
	           $footer = $("#footer"),
						 container = $("#container");
           
	       positionFooter();
       
	       function positionFooter() {
       
	                footerHeight = $footer.height();
									footerWidth = $footer.width();
									containerWidth = container.width();
									
									leftMargin = ($(window).width() - containerWidth)/2;								
									
	                footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";
									footerLeft = leftMargin + containerWidth - footerWidth;
	               	if ( ($(document.body).height()+footerHeight) < $(window).height()) {
	                   $footer.css({
	                        position: "absolute",
													top: footerTop,
													left:footerLeft													
	                   })
	               	} else {
	                   $footer.css({
	                        position: "static"
	                   })
	               	}
               
	       }

	       $(window)
	               .scroll(positionFooter)
	               .resize(positionFooter)
               
	});
});