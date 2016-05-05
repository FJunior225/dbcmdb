$(document).ready(function() {
  $('.form-container').on('submit', 'form', function(event) {
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr("action"),
      method: $target.attr("method"),
      data: $target.serialize()
    })
    .done(function(response) {
      $(".comments-box").prepend(response)
      $(".form-group").attr("text-area").val('')
    })
    .fail(function(response) {
      alert("Please contact support!");
    })

  });
});