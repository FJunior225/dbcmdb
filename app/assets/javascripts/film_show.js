$(document).ready(function(){

	$(".nav-tabs").on('click','.trusted', function(event) {
		event.preventDefault();
		$('.trusted-partial').show();
		$('.trusted').addClass('active');
		$('.recent-partial').removeClass('active').hide();
		$('.recent').removeClass('active')
	});

	$(".nav-tabs").on('click','.recent', function(event) {
		event.preventDefault();
		$('.recent-partial').show();
		$('.recent').addClass('active');
		$('.trusted-partial').hide();
		$('.trusted').removeClass('active');

	})


});