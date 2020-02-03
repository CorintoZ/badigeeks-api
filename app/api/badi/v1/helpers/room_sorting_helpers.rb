module Badi
  module V1
    module Helpers
      module RoomSortingHelpers
        extend Grape::API::Helpers

        def sorting(type, order)
          "#{type} #{order}"
        end
      end
    end
  end
end
