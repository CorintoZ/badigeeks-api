require "rails_helper"

RSpec.describe "Location API request", type: :request do
  describe "GET /locations?keyword=Bar" do
    before { get "/api/v1/locations?keyword=Bar" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
