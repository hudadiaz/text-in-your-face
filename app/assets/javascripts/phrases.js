$(document).on('turbolinks:load', function() {
  var rotate = function() {
    var height = $(window).height();
    var width = $(window).width();
    var needRotation = width < height;

    if (needRotation) {
      $('#content').css('webkitTransform', 'rotate(90deg)');
      $('#content').css('mozTransform', 'rotate(90deg)');
      $('#content').css('msTransform', 'rotate(90deg)');
      $('#content').css('oTransform', 'rotate(90deg)');
      $('#content').css('transform', 'rotate(90deg)');

      $('#content').css('width', '90vh');
      $('#content').css('height', '90vw');
      $('#content').html('<span>rotated</span>');
    } else {
      $('#content').css('webkitTransform', '');
      $('#content').css('mozTransform', '');
      $('#content').css('msTransform', '');
      $('#content').css('oTransform', '');
      $('#content').css('transform', '');

      $('#content').css('width', '90vw');
      $('#content').css('height', '90vh');
      $('#content').html('<span>normal</span>');
    }
  }

  var drawContent = function() {
    $('#content').textfill({
      maxFontPixels: 160,
    });
  }

  var init = function() {
    rotate();
    drawContent();
  }

  init();
  $(window).resize(function(){
    init();
  });
});