var setMaxRating = function() {
  $('.ui.rating').rating({maxRating: 5});
}

var displayRating = function() {
  $('.disabled-rating').rating('disable');
}

var getRating = function() {
  var currentRating = $('.review-rating').rating('get rating');
  $('#hidden-rating').val(currentRating);
}

var executeRatingsFunctions = function() {
  setMaxRating();
  displayRating();
  getRating();
}

$(document).ready(function() {
  executeRatingsFunctions();
});

$(document).on('turbolinks:load', function() {
  executeRatingsFunctions();
});
