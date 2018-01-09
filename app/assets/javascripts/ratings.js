var setMaxRating = function() {
  $('.ui.rating').rating({maxRating: 5});
}

var displayRating = function() {
  $('.disabled-rating').rating('disable');
}

var getRating = function() {
  $('.review-rating')
    .rating('setting', 'onRate', function(value) {
      $('#hidden-rating').val(value);
    });
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
