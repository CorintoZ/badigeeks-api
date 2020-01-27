require "nokogiri"
require "open-uri"
require "faker"

namespace :badi_api_request do
  desc "Badi API request"
  task request_fill_db: :environment do
    19.times do |i|
      query = { "page": (i + 1), "per": 20, "price_types": [3], "bounds": { "ne": { "lat": 41.4695761, "lng": 2.2280099 }, "sw": { "lat": 41.320004, "lng": 2.0695258 } }, "sort_by": "published_at desc", "new_search_mode": true }
      headers = {
        "authorization" => " Bearer cb01be126a7034f1921f07f8747252cf5c124148dd2dd0b8837378249c43c955",
      }

      response = HTTParty.post(
        "https://api.badiapp.com/v1/search/rooms",
        :query => query,
        :headers => headers,
      )

      loaded_json = JSON.parse(response.body)

      loaded_json.each do |room|
        room["tenants"].each do |tenant|
          if tenant["biological_sex"] == 1
            @gender = "female"
          else
            @gender = "male"
          end

          @new_user = User.create!(name: "#{tenant["first_name"]} #{tenant["last_name"]}", date_of_birth: tenant["birth_date"], bio: tenant["small_bio"], gender: @gender)
        end

        room["prices_attributes"].each do |prices_attributes|
          @price = prices_attributes["price"]
        end

        @new_room = Room.create!(title: room["title"], price: @price, description: room["description"], kind: room["city"], room_size: Faker::Number.between(from: 3, to: 15), flat_size: Faker::Number.between(from: 30, to: 200), lat: room["latitude"], lng: room["longitude"], user: @new_user)

        room["pictures"].each_with_index do |photo, index|
          @photo = Photo.create!(position: (index + 1), url_small_photo: photo["width_500_url"], url_big_photo: photo["width_1080_url"], room: @new_room)
        end
      end
    end
  end
end
