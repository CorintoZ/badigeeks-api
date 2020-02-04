module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price)
          sql = "SELECT * FROM Rooms WHERE rooms.price BETWEEN #{price-25} AND #{price+25} AND ST_DWithin(ST_SetSRID(ST_Point(#{lng},#{lat}), 0)::geography, rooms.room_lnglat, 1000);"
          ActiveRecord::Base.connection.execute(sql).to_a
        end
      end
    end
  end
end