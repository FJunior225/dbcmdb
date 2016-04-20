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
      $(".comments-box").append(response)
    })
    .fail(function(response) {
      // debugger;
      alert("Please contact support!");
    })

  });
});