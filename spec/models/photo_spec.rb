require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should belong_to(:room) }
  it 'validates required fields' do
    should validate_presence_of(:position)
    should validate_presence_of(:url_small_photo)
    should validate_presence_of(:url_big_photo)
  end

  it 'validate greate && less position' do
    should validate_numericality_of(:position).is_greater_than_or_equal_to(10)
  end
end
