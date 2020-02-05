module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price, id)
          if !rooms_query(lng, lat, price, id, 1).empty?
            @rooms
          elsif !rooms_query(lng, lat, price, id, 2).empty?
            @rooms
          elsif !rooms_query(lng, lat, price, id, 5).empty?
            @rooms
          end
        end

        def rooms_query(lng, lat, price, id, distance)
          @rooms = Room.where("ST_DWithin(room_lnglat, ST_SetSRID(ST_MakePoint(lng, lat), 4326), #{distance})", lng, lat).where("price <= #{price + 50}and id != '#{id}'").limit(3)
        end
      end
    end
  end
end
