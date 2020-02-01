# frozen_string_literal: true

require "rails_helper"
RSpec.describe "room API", type: :request do
  describe "GET /rooms" do
    let!(:owner) { create(:user) }
    let!(:rooms) { create_list(:room, 5, user_id: owner.id) }

    before { get "/api/v1/rooms?bounds=2.021484,41.319591,2.283096,41.477204&page=1&size=5" }
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    it "return not empty" do
      expect(json).not_to be_empty
    end

    it "return 5 rooms" do
      expect(json.size).to eq(5)
    end
  end

  describe "GET /api/v1/rooms?bounds=2.021484,41.319591,2.283096,41.477204&page=1&size=5" do
    before { get "/api/v1/rooms?bounds=2.021484,41.319591,2.283096,41.477204&page=1&size=5" }

    it "returns status code 204 when no results" do
      expect(response).to have_http_status(204)
    end

    it "return empty" do
      expect(response.body).to be_empty
    end
  end

  describe "GET /rooms/:id" do
    let!(:owner) { create(:user) }
    let!(:room) { create(:room, user_id: owner.id) }
    let!(:photo) { create(:photo, room_id: room.id) }

    before { get "/api/v1/rooms/#{room.id}" }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    it "return not empty" do
      expect(json).not_to be_empty
    end

    it "should return a room" do
      expect(json["id"]).to eq(room.id)
      expect(json["title"]).to eq(room.title)
      expect(json["price"]).to eq(room.price)
      expect(json["description"]).to eq(room.description)
      expect(json["kind"]).to eq(room.kind)
      expect(json["lat"].to_f).to eq(room.lat.to_f)
      expect(json["lng"].to_f).to eq(room.lng.to_f)
      expect(json["room_size"]).to eq(room.room_size)
      expect(json["flat_size"]).to eq(room.flat_size)
      expect(json["owner"]["name"]).to eq(owner.name)
      expect(json["owner"]["age"]).to eq(calculate_age(owner.date_of_birth))
      expect(json["owner"]["gender"]).to eq(owner.gender)
      expect(json["photos"][0]["position"]).to eq(photo.position.to_i)
      expect(json["photos"][0]["url_big_photo"]).to eq(photo.url_big_photo)

      expect(response).to have_http_status(200)
    end

    context "when room no exists" do
      before { get "/api/v1/rooms/1000" }
      it "return statuscode = 404" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
