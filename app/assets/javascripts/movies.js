$(document).on('ready', function(){
  showFirstQuestion();
  toggleQuestion();
  submitForm();
  showMoreInfoFront();
  showMoreInfoback();
});

function showFirstQuestion(){
  $('.question-container').first().toggle();
  $('.question-container').last().find('.col-sm-6').append('<input class="btn btn-danger center" type="submit" value="See Results">');
  $('.question-container').last().find('button').remove();
}

function toggleQuestion(){
  $('.container').on('click', '.next-item', function(e){
    e.preventDefault();
    if ($(this).closest('.question-container').find('select').length > 0) {
      $(this).closest('.question-container').toggle();
      var nextQuestion = $(this).closest('.question-container').next();
      nextQuestion.toggle();
    } else if ($(this).closest('.question-container').find('input:checked').length == 0){
      $('.error').remove();
      $('ul').append("<p class='error center'>Please Choose One Option</p>");
    } else {
      $('.error').remove();
      $(this).closest('.question-container').toggle();
      var nextQuestion = $(this).closest('.question-container').next();
      nextQuestion.toggle();
    }
  });
}

function submitForm() {
  $('.container').on('submit', '.questionaire', function(e){
    e.preventDefault();
    if ($(this).find('.question-container').last().find('input:checked').length == 0){
      $('.error').remove();
      $('ul').append("<p class='error'>Please Choose One</p>");
    } else {
      $('.error').remove();
      $(this).find('.question-container').last().toggle();
      var path = $(this).attr('action');
      $.ajax({
        url: path,
        type: 'GET',
        data: $(this).serialize(),
        dataType: 'JSON'
      }).done(function(response){
        var time = response.flight.travel_time;
        var travel_time_hr = Math.floor(time/3600);
        var travel_time_min = Math.floor(time%3600/60);
        $('.travel-time').text(travel_time_hr+'hr '+ travel_time_min+'min')
        $('.movie-result-container').show();
        for (var i=0; i<response.results.length; i++){
          var temp = movieItemTemplate(response.results[i], i+1);
          $('.movie-result-container').append(temp);
        }
      });
    };
  });
}

function movieItemTemplate(obj, index) {
  debugger
  var template = $('.movie-list-template').clone().children();
  template.find('.title').text(index + ') ' + obj.movie.name + ' (' + obj.movie.released_year + ')');
  template.find('img').attr('src', obj.movie.thumbnail_url);
  template.find('.description').text(obj.movie.description);
  template.find('.rating').text(obj.movie.rating);
  var time = obj.movie.movie_length;
  var movie_time_hr = Math.floor(time/3600);
  var movie_time_min = Math.floor(time%3600/60);
  template.find('.movie-length').text(movie_time_hr + 'hr ' + movie_time_min + 'min');
  var genres = ''
  for (var i=0;i<obj.genre.length;i++){
    if (i === obj.genre.length - 1){
      genres += obj.genre[i].name;
    } else {
      genres += obj.genre[i].name+', ';
    }
  };
  template.find('.more-info').append('<p>'+genres+'</p>');
  return template;
}

function showMoreInfoFront(){
  $('.movie-result-container').on('click', '.front', function(){
    $(this).hide();
    $(this).siblings('.back').show();
  })
}

function showMoreInfoback(){
  $('.movie-result-container').on('click', '.back', function(){
    $(this).hide();
    $(this).siblings('.front').show();
  })
}