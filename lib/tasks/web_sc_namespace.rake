require "nokogiri"
require "open-uri"

namespace :web_sc_namespace do
  desc "Web scrapper"
  task web_scrapping: :environment do
    data = File.read("./lib/tasks/rooms.json")
    loaded_json = JSON.parse(data)

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
