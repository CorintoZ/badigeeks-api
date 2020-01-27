# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new
  it { should have_many(:rooms) }
  it 'validates required fields' do
    should validate_presence_of(:name)
    expect(user).to validate_inclusion_of(:gender).in_array(%w(male female))
  end
end
