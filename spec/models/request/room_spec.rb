require "rails_helper"
RSpec.describe "room API", type: :request do
  describe "GET /rooms" do
    before { get "/api/v1/rooms" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
