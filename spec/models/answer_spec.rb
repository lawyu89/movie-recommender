require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "Check Question and Genre Associations" do
    it {should belong_to :question}
    it {should belong_to :genre}
  end
end
