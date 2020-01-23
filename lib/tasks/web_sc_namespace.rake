require "nokogiri"
require "open-uri"

namespace :web_sc_namespace do
  desc "TODO"
  task web_scrapping: :environment do
    habitaciones = [505304, 501874, 446492, 500465, 506728, 527305, 85490, 464710, 59800, 526807]

    habitaciones.each do |habitacion|

      # Fetch and parse HTML document
      doc = Nokogiri::HTML(open("https://badi.com/es/room/#{habitacion}"))

      doc.css("h1.room__title").each do |link|
        @title = link.content
      end

      doc.css("div.styled-components__FlexChild-jzrolq-0 h4").each do |link|
        @price = link.content.gsub ".", ""
      end

      doc.css("div.form__fieldset p").each do |link|
        @description = link.content
      end

      doc.css("h1.Heading__StyledHeading-cuu5h0-0").each do |link|
        @owner = link.content
      end

      req_payload = {
        :title => @title, :price => @price, :description => @description,
      }

      Room.create!(req_payload)
    end
  end
end
