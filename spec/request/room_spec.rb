require "rails_helper"
RSpec.describe "room API", type: :request do
  describe "GET /rooms" do
    before { get "/api/v1/rooms?city=barcelona&lat=-123.3&lon=332.3" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /rooms/:id" do
    let!(:user) { create(:user) }
    let!(:room) { create(:room, user_id: user.id) }
    before { get "/api/v1/rooms/#{room.id}" }
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    it "should return a room" do
      expect(json["title"]).to eq(room.title)
      expect(json["price"]).to eq(room.price)
      expect(json["description"]).to eq(room.description)
      expect(json["kind"]).to eq(room.kind)
      expect(json["room_size"]).to eq(room.room_size)
      expect(json["flat_size"]).to eq(room.flat_size)


      expect(response).to have_http_status(200)
    end
  end
end
