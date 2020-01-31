# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :room
  validates :position, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 10 }
  validates :url_small_photo, presence: true
  validates :url_big_photo, presence: true
end
