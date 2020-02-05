module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price, id)
          @rooms = Room.where("ST_DWithin(room_lnglat, ST_SetSRID(ST_MakePoint(lng, lat), 4326), 1.60934)", lng, lat).where("#{price} <= price and price <= #{price} and id != '#{id}'").limit(3)
          # @rooms = Room.near([lat, lng], 1, units: :km).where("#{price} <= price and price <= #{price} and id != '#{id}'").limit(3)
        end
      end
    end
  end
end
