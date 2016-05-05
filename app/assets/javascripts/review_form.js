$(document).ready(function(){
	$('.movie-review-container').on('submit', 'form', function(event){
		event.preventDefault();
		$.ajax ({
			method:'post',
			url: $(this).attr('action'),
			data:$(this).serialize()
		})
		.done(function(response){
			$('.recent-reviews-container').prepend(response);
		})
		.fail()
	});

})