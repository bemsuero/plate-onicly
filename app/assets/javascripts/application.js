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
//= require jquery
//= require main
//= require rails-ujs
//= require activestorage
//= require_tree .


$( document ).ready(function() {
    $('.popup').hide();
    $('.login').hide();
    $('.signup').hide();
    $('.location').hide();
    $('.location').fadeIn(2000);

    $( ".signupNav" ).click(function() {
      $('.signup').fadeToggle(1000);
      $('.popup').toggle(500);
    });
    $( ".loginNav" ).click(function() {
      $('.login').fadeToggle(1000);
      $('.popup').toggle(500);
    });
    $( ".close" ).click(function() {
      $('.popup').fadeOut(500);
      $('.login').fadeOut(1000);
      $('.signup').fadeOut(1000);
    });
    document.getElementById("meet_time").step = "30"
    document.getElementById("meet_time").min = "8:00"
    document.getElementById("meet_time").max = "20:00"
});
