$(document).ready(function() {
  $('.form-container').on('submit', '.comment-form', function(event) {
    event.preventDefault();
    $target = $(event.target);

    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    })
    .done(function(response) {

    })
    .fail(function(response) {

      alert("Please contact support!");
    })

  });
});