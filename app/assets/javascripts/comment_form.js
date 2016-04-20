$(document).ready(function() {
  $('.form-container').on('submit', 'form', function(event) {
    event.preventDefault();
    // debugger;
    $target = $(event.target);
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    })
    .done(function(response) {
      debugger;
    })
    .fail(function(response) {

      alert("Please contact support!");
    })

  });
});