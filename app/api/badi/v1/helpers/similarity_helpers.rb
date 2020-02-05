module Badi
  module V1
    module Helpers
      module SimilarityHelpers
        extend Grape::API::Helpers

        def similar_rooms(lng, lat, price, id)
          @rooms = Room.near([lat, lng], 1, units: :km).where("#{price} <= price and price <= #{price} and id != '#{id}'").limit(3)
        end
      end
    end
  end
end
