class Genre < ActiveRecord::Base
  has_many :movies
  has_many :answers
end
