require "rails_helper"

RSpec.describe "Location API request", type: :request do
  describe "GET /locations?keyword=Bar" do
    before { get "/api/v1/locations?keyword=Bar" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /locations?keyword=Ba" do
    before { get "/api/v1/locations?keyword=Ba" }

    it "returns status code 400 when the query is less than 3" do
      expect(response).to have_http_status(400)
    end
  end
end
