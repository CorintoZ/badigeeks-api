require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'validates required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_presence_of(:description)
    should validate_length_of(:title)
    should validate_length_of(:description)
    should validate_length_of(:price)
    should validate_numericality_of(:price).is_greater_than(0).is_less_than(10000)
  end
end
