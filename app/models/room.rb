class Room < ApplicationRecord
  has_many :photos, dependent: :destroy 
  belongs_to :user
  validates :title, :price, :description, :lat, :lng, :kind, presence: true
end
