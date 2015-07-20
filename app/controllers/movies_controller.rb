class MoviesController < ApplicationController
  def index
    @questions = Question.all
  end

  def view
    genre_counter = Hash.new(0)
    params.each do |k,v|
      #each radio button set is grouped by their question id. To grab params related to questions, convert key to integer and see if its greater than 0 since strings.to_i is equal to 0
      if k.to_i > 0
        genre_counter[Answer.where(content: v).first.genre] +=1
      end
    end
    sorted_genre_count = genre_counter.sort_by {|key, value| value}.reverse
    #Movies
    render json: genre_counter.to_json
  end
end
