class Photo < ApplicationRecord
  belongs_to :room
  validates :position, presence: true
end
