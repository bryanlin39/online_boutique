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

var popupRating = function() {
  $('.disabled-rating').popup();
}

var executeRatingsFunctions = function() {
  setMaxRating();
  displayRating();
  getRating();
  popupRating();
}

$(document).ready(function() {
  executeRatingsFunctions();
});

$(document).on('turbolinks:load', function() {
  executeRatingsFunctions();
});
