require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'validates required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_presence_of(:description)
  end
end
