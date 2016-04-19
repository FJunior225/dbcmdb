$(document).ready(function() {
  $('.form-container').on('submit', '.comment-form', function(event) {
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    })
    .done(function(response) {
      debugger;
    })
    .fail(function(response) {
      debugger;
      alert("Please contact support!");
    })

  });
});