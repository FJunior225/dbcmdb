$(document).ready(function(){

	$(".nav-tabs").on('click','.trusted', function(event) {
		event.preventDefault();
		$('.trusted-partial').show();
		$('.recent-partial').hide();
	});

	$(".nav-tabs").on('click','.recent', function(event) {
		event.preventDefault();
		$('.recent-partial').show();
		$('.trusted-partial').hide();
	})


});