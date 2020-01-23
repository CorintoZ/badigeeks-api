require "rails_helper"
RSpec.describe "room API", type: :request do
  describe "GET /rooms" do
    before { get "/api/v1/rooms?city=barcelona&lat=-123.3&lon=332.3" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /rooms/:id" do
    before { get "/api/v1/rooms/1" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
