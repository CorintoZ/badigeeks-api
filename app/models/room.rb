class Room < ApplicationRecord
    validates :title, :price, :description, presence: true
end
