var executeDropdown = function() {
  $('.dropdown').dropdown();
}

$(document).ready(function() {
  executeDropdown();
});

$(document).on('turbolinks:load', function() {
  executeDropdown();
});
