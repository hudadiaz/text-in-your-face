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
    } else {
      $('#content').css('webkitTransform', '');
      $('#content').css('mozTransform', '');
      $('#content').css('msTransform', '');
      $('#content').css('oTransform', '');
      $('#content').css('transform', '');

      $('#content').css('width', '90vw');
      $('#content').css('height', '90vh');
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

  if (screenfull.enabled) {
    screenfull.exit();

    $('#phrase-show #content').on('click', function() {
      screenfull.toggle();
    })
  }
});
