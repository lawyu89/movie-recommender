require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "Check Question and Genre Associations" do
    it {should have_many :answers}
  end
end
