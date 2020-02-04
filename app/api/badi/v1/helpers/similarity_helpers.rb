module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price)
          sql = "SELECT r.id,r.title,r.price, p.url_small AS photo
          FROM rooms AS r
          JOIN photos AS p ON r.id = p.room_id AND p.position = 1
          WHERE r.price BETWEEN 675.0 AND 725.0 AND ST_DWithin(ST_SetSRID(ST_Point(2.16443829471528,41.3828022141995), 0)::geography, r.room_lnglat, 1000);"

          ActiveRecord::Base.connection.execute(sql)
        end
      end
    end
  end
end