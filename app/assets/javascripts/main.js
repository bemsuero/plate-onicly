$( document ).ready(function() {
    $('.popup').hide();
    $('.login').hide();
    $('.signup').hide();
    $('.location').hide();
    $('.pickLocation').hide();
    $('.join').hide();
    $('.pickLocation').slideDown(2000);
    $('.join').slideDown(2000);
    $('.location').fadeIn(1000);

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

});
