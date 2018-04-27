$(document).on('turbolinks:load', function() {
  var rotate = function() {
    var height = $(window).height();
    var width = $(window).width();
    var needRotation = width < height;

    if (needRotation) {
      $('#saying-show #content').css('webkitTransform', 'rotate(90deg)');
      $('#saying-show #content').css('mozTransform', 'rotate(90deg)');
      $('#saying-show #content').css('msTransform', 'rotate(90deg)');
      $('#saying-show #content').css('oTransform', 'rotate(90deg)');
      $('#saying-show #content').css('transform', 'rotate(90deg)');
    } else {
      $('#saying-show #content').css('webkitTransform', '');
      $('#saying-show #content').css('mozTransform', '');
      $('#saying-show #content').css('msTransform', '');
      $('#saying-show #content').css('oTransform', '');
      $('#saying-show #content').css('transform', '');
    }
  }

  var drawContent = function() {
    $('#saying-show #content').textfill({
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

    $('#saying-show #content').on('click', function() {
      screenfull.toggle();
    })
  }
});
