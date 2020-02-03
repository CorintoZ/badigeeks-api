module Badi
  module V1
    module Helpers
      module FilteringHelpers
        extend Grape::API::Helpers

        def filtering(minPrice, maxPrice)
          "#{minPrice} <= price and price <= #{maxPrice}"
        end
      end
    end
  end
  end
