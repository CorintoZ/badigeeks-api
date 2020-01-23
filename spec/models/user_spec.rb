# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:rooms) }
  it 'validates required fields' do
    should validate_presence_of(:name)
    should validate_presence_of(:age)
  end
end
