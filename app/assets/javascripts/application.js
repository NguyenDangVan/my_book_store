//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).ready(function() {
  if ($('#backtoTop').length) {
    var scrollTrigger = 100,
    backToTop = function () {
      var scrollTop = $(window).scrollTop();
      if (scrollTop > scrollTrigger) {
        $('#backtoTop').addClass('show');
      } else {
        $('#backtoTop').removeClass('show');
      }
    };
    backToTop();
    $(window).on('scroll', function () {
      backToTop();
    });
    $('#backtoTop').on('click', function (e) {
      e.preventDefault();
      $('html,body').animate({scrollTop: 0}, 700);
    });
  }
});
