class MoviesController < ApplicationController
  def index
    @flights = Flight.all
    @questions = Question.all
  end

  def view
    #grab all movies from related genres picked by user
    flight = Flight.where(path_name: params[:flight]).first
    flight_time = flight.travel_time
    p flight_time
    matched_movies = []
    genre_counter = Hash.new(0)
    params.each do |k,v|
      #each radio button set is grouped by their question id. To grab params related to questions, convert key to integer and see if its greater than 0 since strings.to_i is equal to 0
      if k.to_i > 0
        genre_counter[Answer.where(content: v).first.genre] +=1
        matched_movies << Answer.where(content: v).first.genre.movies
      end
    end
    best_match = Hash.new(0)
    #calculate best movie match by comparing each unique movie based on matching genres, number of times genre was picked, and the movie's rating
    matched_movies.flatten.uniq.each do |movie|
      score = 0
      movie.genres.each do |genre|
        score += genre_counter[genre]*10
      end
      score += (movie.rating*10).to_i
      best_match[movie] = score
    end
    best_match = best_match.sort_by {|k,v| v}.reverse
    i = 0
    results = []
    while i < best_match.length - 1
      p best_match[i][0]
      if flight_time - best_match[i][0].movie_length > 0
        results << best_match[i][0]
        flight_time -= best_match[i][0].movie_length
      end
      i+=1
    end
    render json: results.to_json
  end
end
