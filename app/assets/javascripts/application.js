// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .
//
var war_crime = [];
$(function() {
 if ($('.pagination').length) {
    $(window).scroll(function() {
      var url;
      url = $('.pagination .next a');
      if (url.attr('href') && $(window).scrollTop() > $(document).height() - $(window).height() - 1)
       {
         if ( !war_crime.includes(url.attr('href')) ) {
           $('.pagination').hide();
           war_crime.push(url.attr('href'));
           return url[0].click();
         }
       }
    });
    return $(window).scroll();
  }
});
