module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price, id)
          if !rooms_query(lng, lat, price, id, 1).empty?
            return @rooms
          elsif !rooms_query(lng, lat, price, id, 2).empty?
            return @rooms
          elsif !rooms_query(lng, lat, price, id, 5).empty?
            return @rooms
          end
          # @rooms = Room.near([lat, lng], 1, units: :km).where("#{price} <= price and price <= #{price} and id != '#{id}'").limit(3)
        end

        def rooms_query(lng, lat, price, id, distance)
          @rooms = Room.where("ST_DWithin(room_lnglat, ST_SetSRID(ST_MakePoint(lng, lat), 4326), #{distance})", lng, lat).where("price <= #{price + 50}and id != '#{id}'").limit(4)
        end
      end
    end
  end
end
