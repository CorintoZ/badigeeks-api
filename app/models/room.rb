class Room < ApplicationRecord
  validates :title, :price, :description, presence: true
  validates :title, length: { minimum: 5, maximum: 80 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 10000 }
end
