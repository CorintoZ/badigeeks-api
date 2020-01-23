class Room < ApplicationRecord
  validates :title, :price, :description, :lat, :lng, :kind, presence: true
end
