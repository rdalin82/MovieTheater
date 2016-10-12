require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index ,:auditorium_id=> 1
      expect(response).to have_http_status(:success)
    end
  end
end
