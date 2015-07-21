$(document).on('ready', function(){
  $('.question-container').first().toggleClass('active');
  $('.question-container').last().append('<input type="submit" value="See Results">');
  $('.question-container').last().find('button').remove();
  $('.container').on('click', '.next-item', function(e){
    e.preventDefault();
    if ($(this).closest('.question-container').find('select').length > 0) {
      $(this).closest('.question-container').toggleClass('active');
      var nextQuestion = $(this).closest('.question-container').next();
      nextQuestion.toggleClass('active');
    } else if ($(this).closest('.question-container').find('input:checked').length == 0){
      $('.error').remove();
      $('ul').append("<p class='error'>Please Choose One</p>");
    } else {
      $('.error').remove();
      $(this).closest('.question-container').toggleClass('active');
      var nextQuestion = $(this).closest('.question-container').next();
      nextQuestion.toggleClass('active');
    }
  });
  $('.container').on('submit', '.questionaire', function(e){
    e.preventDefault();
    if ($(this).find('.question-container').last().find('input:checked').length == 0){
      $('.error').remove();
      $('ul').append("<p class='error'>Please Choose One</p>");
    } else {
      $('.error').remove();
      $(this).closest('.question-container').toggleClass('active');
      var path = $(this).attr('action');
      $.ajax({
        url: path,
        type: 'GET',
        data: $(this).serialize(),
        dataType: 'JSON'
      }).done(function(response){
        response
      })
      //AJAX Stuff
    }
  });
});
