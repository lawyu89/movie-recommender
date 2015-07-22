require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET movie#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
