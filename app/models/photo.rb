class Photo < ApplicationRecord
  belongs_to :room
  validates :position, presence: true, numericality: { only_integer: true }
  validates :url_small, presence: true
  validates :url_big, presence: true
end
