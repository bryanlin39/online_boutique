var activateModal = function() {
  $('.ui.modal').modal('show');
  $('.contact-form-input').val("");
}

$(document).ready(function() {
  $('#submit-contact').click(function() {
    activateModal();
  });
});

$(document).on('turbolinks:load', function() {
  $('#submit-contact').click(function() {
    activateModal();
  });
});
