# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :room
  validates :position,presence: true,numericality: { only_integer: true, greater_than: 0 }
end
