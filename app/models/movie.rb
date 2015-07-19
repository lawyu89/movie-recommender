class Movie < ActiveRecord::Base
  has_many :genres
end
