require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "Check Movie and Answer Associations" do
    it {should have_many :movie_genres}
    it {should have_many :movies}
    it {should have_many :answers}
  end
end
