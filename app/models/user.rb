# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :date_of_birth, presence: true
  validate  :bio
  validates :gender, presence: true, inclusion: { in: %w[male female] }
end
