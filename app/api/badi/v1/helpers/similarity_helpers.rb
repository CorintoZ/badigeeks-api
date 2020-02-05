module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price)
          @rooms = Room.where("#{price} <= price and price <= #{price}")
        end
      end
    end
  end
end
