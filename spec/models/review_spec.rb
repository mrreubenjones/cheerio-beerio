require 'rails_helper'

RSpec.describe Review, type: :model do

describe 'validations' do
  it 'requires a star count between 1 to 5 (inclusive)' do
    c = FactoryGirl.create :category
    p = FactoryGirl.create :product
    u = FactoryGirl.create :user
    new_york_times = FactoryGirl.create :review, star_count: '9'
    newyorktimes.is_valid?
    expect(newyorktimes.errors).to have_key(:star_count)
  end
end

end
