var popupRating = function() {
  $('.disabled-rating').popup();
}

var popupCart = function() {
  $('.cart-popup').popup();
}

var executePopups = function() {
  popupRating();
  popupCart();
}

$(document).ready(function() {
  executePopups();
});

$(document).on('turbolinks:load', function() {
  executePopups();
});
