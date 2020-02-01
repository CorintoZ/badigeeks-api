# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:photos) }
  it 'validates required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_presence_of(:kind)
    should validate_presence_of(:room_size)
    should validate_presence_of(:flat_size)
    should validate_presence_of(:lat)
    should validate_presence_of(:lng)
  end

  it 'validate lenght min/max title' do
    should validate_length_of(:title).is_at_least(2)
    should validate_length_of(:title).is_at_most(500)
  end

  it 'validate greate && less price' do
    should validate_numericality_of(:price).is_greater_than_or_equal_to(10)
    should validate_numericality_of(:price).is_less_than_or_equal_to(10000)
  end

  it 'validate description min/max title' do
    should validate_length_of(:description).is_at_least(5)
    should validate_length_of(:description).is_at_most(500)
  end

  it 'validate kind min/max title' do
    should validate_length_of(:kind).is_at_least(2)
    should validate_length_of(:kind).is_at_most(100)
  end

  it 'validate greate && less room_size' do
    should validate_numericality_of(:room_size).is_greater_than_or_equal_to(3)
    should validate_numericality_of(:room_size).is_less_than_or_equal_to(15)
  end

  it 'validate greate && less flat_size' do
    should validate_numericality_of(:flat_size).is_greater_than_or_equal_to(30)
    should validate_numericality_of(:flat_size).is_less_than_or_equal_to(200)
  end

  it 'validate greate && less lat' do
    should validate_numericality_of(:lat).is_greater_than_or_equal_to(-90)
    should validate_numericality_of(:lat).is_less_than_or_equal_to(+90)
  end

  it 'validate greate && less lng' do
    should validate_numericality_of(:lng).is_greater_than_or_equal_to(-180)
    should validate_numericality_of(:lng).is_less_than_or_equal_to(+180)
  end
end
