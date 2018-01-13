var executeDimmer = function() {
  $('.dimmer').dimmer({on: 'hover'});
}

$(document).ready(function() {
  executeDimmer();
});

$(document).on('turbolinks:load', function() {
  executeDimmer();
});
