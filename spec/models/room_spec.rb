require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'validates required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_presence_of(:description)
    should validate_presence_of(:lat)
    should validate_presence_of(:lng)
    should validate_presence_of(:kint)
    should validate_presence_of(:visits)
  end
end
