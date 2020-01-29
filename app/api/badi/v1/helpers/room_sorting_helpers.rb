module Badi
  module V1
    module Helpers
      module RoomSortingHelpers
        extend Grape::API::Helpers

        def sorting(params)
          case params
          when 2
            "price DESC"
          when 3
            "price ASC"
          else
            ""
          end
        end
      end
    end
  end
end
