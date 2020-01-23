class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :name, :age, presence: true
end
