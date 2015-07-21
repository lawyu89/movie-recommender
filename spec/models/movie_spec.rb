require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "Check Genre Associations" do
    it {should have_many :movie_genres}
    it {should have_many :genres}
  end
end
