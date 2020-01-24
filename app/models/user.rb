# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :name, :date_of_birth, presence: true
  validates :name, length: { minimum: 2, maximum: 10 }
end
