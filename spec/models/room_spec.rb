# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:photos) }
  it 'validates required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_presence_of(:description)
    should validate_presence_of(:kind)
    should validate_presence_of(:room_size)
    should validate_presence_of(:flat_size)
    should validate_presence_of(:lat)
    should validate_presence_of(:lng)
  end
end
