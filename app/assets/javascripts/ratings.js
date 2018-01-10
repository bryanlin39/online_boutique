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

var executeRatings = function() {
  setMaxRating();
  displayRating();
  getRating();
}

$(document).ready(function() {
  executeRatings();
});

$(document).on('turbolinks:load', function() {
  executeRatings();
});
