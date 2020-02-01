# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new
  it { should have_many(:rooms) }
  it 'validates required fields' do
    should validate_presence_of(:name)
    expect(user).to validate_inclusion_of(:gender).in_array(%w(male female))
  end

  it 'validate lenght min/max name' do
    should validate_length_of(:name).is_at_least(1)
    should validate_length_of(:name).is_at_most(100)
  end

  it 'validate lenght min/max bio' do
    should validate_length_of(:bio).is_at_least(5)
    should validate_length_of(:bio).is_at_most(200)
  end
  
end
