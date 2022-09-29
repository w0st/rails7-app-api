require "rails_helper"

RSpec.describe "Genres", type: :request do
  describe "GET /index" do
    subject(:get_genres) { get "/api/v1/genres" }

    before { create(:genre) }

    it "returns expected status" do
      get_genres
      # debugger
      expect(response.status).to eq(200)
    end
  end
end
