class MoviesController < ApplicationController
  def index
    @flights = Flight.all
    @questions = Question.all
  end

  def view
    #grab all movies from related genres picked by user
    flight = Flight.where(path_name: params[:flight]).first
    flight_time = flight.travel_time
    matched_movies = []
    genre_counter = Hash.new(0)
    params.each do |k,v|
      #each radio button set is grouped by their question id. To grab params related to questions, convert key to integer and see if its greater than 0 since strings.to_i is equal to 0
      if k.to_i > 0
        genre_counter[Answer.where(content: v).first.genre] +=1
        matched_movies << Answer.where(content: v).first.genre.movies
      end
    end
    scored_match = Hash.new(0)
    #calculate best movie match by comparing each unique movie based on matching genres, number of times genre was picked, year released relative to current year, and the movie's rating
    matched_movies.flatten.uniq.each do |movie|
      score = 0
      movie.genres.each do |genre|
        score += genre_counter[genre]*5
      end
      score += (movie.rating*8).to_i
      score -= DateTime.now.year - movie.released_year
      scored_match[movie] = score
    end
    #created sorted array of movie objects based on their personalized score
    scored_match = scored_match.sort_by {|k,v| v}.reverse
    #loop through scored_match array and add them to results based on their flight time
    i = 0
    results = []
    while i < scored_match.length
      if flight_time - scored_match[i][0].movie_length > 0 && scored_match[i][0].rating > 4
        results << {movie: scored_match[i][0], genre: scored_match[i][0].genres}
        flight_time -= scored_match[i][0].movie_length
      end
      i+=1
    end
    render json: {results: results, flight: flight}.to_json
  end
end
