module Badi
  module V1
    module Helpers
      module FilteringHelpers
        extend Grape::API::Helpers

        def filtering(min_price, max_price)
          "#{min_price} <= price and price <= #{max_price}"
        end
      end
    end
  end
end
