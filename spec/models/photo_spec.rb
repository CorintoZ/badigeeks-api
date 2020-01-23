require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should belong_to(:room) }
  it 'validates required fields' do
    should validate_presence_of(:position)
  end
end
