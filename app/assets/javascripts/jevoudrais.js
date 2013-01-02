$(document).ready(function() {	
$('#sign-in-form').hide(); //Initially form wil be hidden.
 $('#show-sign-in-form').click(function() {
  	$('#show-sign-in-form').hide();//Hides the button
		$('#show-sign-up-form').hide();
		$('#sign-in-form').show(500);//Form shows on button click	
  });
});

$(document).ready(function() {	
$('#sign-up-form').hide(); //Initially form wil be hidden.
 $('#show-sign-up-form').click(function() {
  	$('#show-sign-up-form').hide();//Hides the button
		$('#show-sign-in-form').hide();
		$('#sign-up-form').show(500);//Form shows on button click	
  });
});