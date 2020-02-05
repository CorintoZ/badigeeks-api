module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price)
          @rooms = Room.near([lat, lng], 1, units: :km).where("#{price} <= price and price <= #{price}")
        end
      end
    end
  end
end
