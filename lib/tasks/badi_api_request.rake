require "nokogiri"
require "open-uri"

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
        puts room["id"]
        puts room["title"]
        puts room["description"]
        puts room["latitude"]
        puts room["longitude"]
        room["prices_attributes"].each do |price|
          puts price["price"]
        end

        room["pictures"].each do |photo|
          puts photo["url"]
        end

        room["tenants"].each do |tenant|
          puts tenant["first_name"]
          puts tenant["last_name"]
          puts tenant["birth_date"]
        end

        puts "---------------------------------------------"
        #Room.create!(req_payload)
      end
    end
  end
end
