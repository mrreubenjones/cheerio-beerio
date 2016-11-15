require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validation' do

    # Product should have a title
    it 'requires a title' do
      p = Product.new FactoryGirl.attributes_for(:product, title: nil) # GIVEN
      p.valid? # WHEN
      expect(p.errors).to have_key(:title) # THEN
    end

    # Product should have a price
    it 'requires a price' do
      p = Product.new FactoryGirl.attributes_for(:product, price: 0) # GIVEN
      p.valid? # WHEN
      expect(p.errors).to have_key(:price) # THEN
    end

    # Product should have a unique title
    it 'requires a unique title' do
      #GIVEN
      FactoryGirl.create(:product, title: 'BOOM', price: 10)
      p = FactoryGirl.build(:product, title: 'BOOM')
      # WHEN
      p.valid?
      # THEN
      expect(p.errors).to have_key(:title)
    end

    # Product should have a default sale price (equals the price by default)
    it 'requires a sale price' do
      #GIVEN
      p = FactoryGirl.build(:product, sale_price: nil)
      p.save
      # WHEN

      # THEN
      expect(p.sale_price).to eq(p.price)
    end

    # Product sale price should be equal to or less than the price
    it 'requires the sale price to be less than or equal to the price' do
      #GIVEN
      p = Product.new title: 'BOOM', price: 10, sale_price: 20
      # WHEN
      p.valid?
      # THEN
      expect(p.errors).to have_key(:sale_price)
    end

    # Method on_sale? returns true or false
    it 'requires on_sale? method to return true or false' do
      #GIVEN
      p = FactoryGirl.build(:product, price: 10, sale_price: 7)
      # WHEN
      a = p.on_sale?
      # THEN
      expect(a).to be(true)
    end

  end
end
