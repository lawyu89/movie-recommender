$(document).on('ready', function(){
  $('.question-container').first().toggleClass('active');
  $('.question-container').last().append('<input type="submit" value="See Results">');
  $('.question-container').last().find('button').remove();
  $('.container').on('click', '.next-item', function(e){
    e.preventDefault();
    if ($(this).closest('.question-container').find('input:checked').length == 0){
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
    debugger
    if ($(this).closest('.question-container').find('input:checked').length == 0){
      $('.error').remove();
      $('ul').append("<p class='error'>Please Choose One</p>");
    } else {
      $('.error').remove();
      $(this).closest('.question-container').toggleClass('active');
      var nextQuestion = $(this).closest('.question-container').next();
      nextQuestion.toggleClass('active');
    }
  });
});
